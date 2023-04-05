# Multi-Process Task Queue in R

*Source: [Multi Process Task Queue in 100 Lines of R Code (tidyverse.org)](https://www.tidyverse.org/blog/2019/09/callr-task-q/)*

See Also: [R Package - callr](../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/General%20R%20Packages/R%20Package%20-%20callr.md)

## Contents

* [Introduction](Multi-Process%20Task%20Queue%20in%20R.md#introduction)
* [API design](Multi-Process%20Task%20Queue%20in%20R.md#api-design)
* [Data structure](Multi-Process%20Task%20Queue%20in%20R.md#data-structure)
* [Implementation](Multi-Process%20Task%20Queue%20in%20R.md#implementation)
* [Try it out](Multi-Process%20Task%20Queue%20in%20R.md#try-it-out)
* [How about process cleanup?](Multi-Process%20Task%20Queue%20in%20R.md#how-about-process-cleanup)
* [Possible improvements](Multi-Process%20Task%20Queue%20in%20R.md#possible-improvements)
* [Complete code](Multi-Process%20Task%20Queue%20in%20R.md#complete-code)
* [Appendix: Links](Multi-Process%20Task%20Queue%20in%20R.md#appendix-links)

## Introduction

*We use `callr::r_session` to implement a worker pool and task queue in 100 lines of R code.*

This post is a demo of `callr::r_session`, a persistent R session you can use to run R code asynchronously. I set out to build a task queue, which runs tasks in subprocesses, concurrently, in a mere 100 lines of R code.

Here is a short teaser for how the queue will work. `task_q$new()` creates a new R6 object, which represents the queue. Its `push()` method adds a task, which is a function and its arguments, similar to `callr::r()`. The `pop()` method gets the results of the first task that has finished. `pop()` has a timeout argument, which lets you wait for a task to finish, if all pushed tasks are still running. It returns `NULL` if no task has finished before the timeout was over. The timeout can be `0` or `Inf`, meaning no wait at all, or wait indefinitely. The default timeout is `0`.

````R
q <- task_q$new()
q$push(function() { Sys.getpid() })
q$push(function() { Sys.sleep(.5); Sys.getpid() })
q$pop()
#> NULL
````

This `pop()` call returned `NULL`, as none of the tasks are done yet. Even though running `Sys.getpid()` is fast, the worker processes also need 200-500 ms time start up, when the queue is created. If you are willing to wait a bit, at least one task should be done in less than half a second (500 ms), but usually not the second one yet:

````R
q$pop(500)$result
#> [1] 18383
q$pop()
#> NULL
````

The `poll()` method checks for finished tasks without removing their results from the queue. It also has a timeout parameter, which works the same way as `pop()`’s timeout. `poll()` returns the identifiers of all tasks that are done.

````R
q$poll(Inf)
#> [1] ".2"
q$pop()$result
#> [1] 18385
````

If the queue is empty, i.e. no tasks are running and no tasks are waiting, then `pop()` always returns `NULL`, immediately, because there is nothing to wait for:

````R
q$pop()
#> NULL
````

## API design

The task queue will be an R6 class, with `push()`, `pop()`, `poll()` methods like above, and some other query methods:

````
task_q <- R6::R6Class(
  "task_q",
  public = list(
    initialize      = function(num_workers = 4L) { },
    get_num_waiting = function() { },
    get_num_running = function() { },
    get_num_done    = function() { },
    is_idle         = function() { },
    list_tasks      = function() { },

    push = function(fun, args = list(), id = NULL) { },
    poll = function(timeout = 0) { },
    pop = function(timeout = 0) { }
  )
)
````

`initialize()` has an argument to set the number of workers. The size of the worker pool remains fixed for the lifetime of the queue.

The `get_num_*()` methods return the number of waiting, running and completed tasks. `get_num_done()` includes tasks that haven’t been `pop()`-d yet. Once a task is `pop()`-d, it is removed completely from the queue.

`is_idle()` returns `TRUE` if the queue does not have any tasks (in any state). `list_tasks()` returns a data frame (`tibble`) with data about the tasks. This is especially useful for debugging.

`push()` adds a task to the queue. `poll()` returns the ids of all tasks that are done. `pop()` returns the result of the oldest task that is done.

## Data structure

Before writing the methods, I’ll design the data structure that will store all information about the tasks and the worker processes. The standard data structure for a list of records is a data frame in R.

A logical choice would be to have two data frames, one for the tasks, and another one for the workers. Then we could assign unique identifiers to both tasks and processes and cross-reference them in the two data frames, to mark which task a worker is running, and which worker a task is running on.

I’ll go a step further here, and store both the tasks and the workers *in the same* data frame. This will simplify the implementation considerably. The queue will create a dummy *idle* task for each worker. Each worker will (pretend to) run its dummy task if there are no other, real tasks waiting in the queue. So the task list will always contain at least as many tasks as the number of workers in the queue.

An example for a task data frame:

````R
q$list_tasks()
#> # A tibble: 9 x 7
#>   id      idle  state   fun    args       worker     result
#>   <chr>   <lgl> <chr>   <list> <list>     <list>     <list>
#> 1 .11     FALSE running <fn>   <list [1]> <r_sessin> <NULL>
#> 2 .12     FALSE running <fn>   <list [1]> <r_sessin> <NULL>
#> 3 .13     FALSE running <fn>   <list [1]> <r_sessin> <NULL>
#> 4 .14     FALSE running <fn>   <list [1]> <r_sessin> <NULL>
#> 5 .15     FALSE waiting <fn>   <list [1]> <NULL>     <NULL>
#> 6 .idle-1 TRUE  waiting <NULL> <NULL>     <NULL>     <NULL>
#> 7 .idle-2 TRUE  waiting <NULL> <NULL>     <NULL>     <NULL>
#> 8 .idle-3 TRUE  waiting <NULL> <NULL>     <NULL>     <NULL>
#> 9 .idle-4 TRUE  waiting <NULL> <NULL>     <NULL>     <NULL>
````

The columns are:

* `id`: a character id, which can be user-supplied or auto-assigned (if the user did not supply it). This is useful to identify tasks.
* `idle`: a logical flag, whether this is a dummy idle task or not.
* `state`: current state of the task. More about this shortly.
* `fun`: the function the task needs to run. This is a list column.
* `args`: arguments to pass to the function. This is a list itself, so the column is a list column.
* `worker`: the `callr::r_session` object, the R session that is running the task, or `NULL` if the task is not running.
* `result`: another list column, the result of the run, if the task is already done, `NULL` otherwise.

The possible task states are: *waiting*, *running*, *ready* and *done*. The first two are not very surprising. The distinction between the last two is somewhat technical. A task is *ready* if the background R session has finished running it. The queue hasn’t read out its result yet, and the R session is still assigned to it. (I.e. the task’s `worker` column is not `NULL`.) A task is *done* if the queue has already read out the result of the function call, and has reassigned the R session to another task, so its `worker` column is `NULL`.

Tasks that are *running* and *ready* always have an R session assigned to them. Since all R sessions are always assigned to tasks (dummy idle tasks, if there is nothing else), this means the that the sum of the *running* and *ready* tasks always equals the number of workers.

The idle tasks are somewhat special, because they are never *done*. If an idle task is *ready* and its worker is reassigned, it will be *waiting* again. They are also almost never in the *running* state. When the queue assigns a worker to an idle task, the task will immediately go into the *ready* state, since the queue is immediately allowed to re-assign the worker, should a real task be *waiting*.

However, when a worker is starting up, its idle task is *running*, until their background R process has started up. After this initial *running* state the idle tasks are always either *waiting* or *ready*.

## Implementation

I am ready to start the implementation now. I’ll focus on the individual methods here, and show the complete code of the R6 class at the end. Let’s start with the internal data. `tasks` contains the task data frame, `initialize()` will create it. `next_id` and `get_next_id` will provide us unique task ids. I prefix these with a dot, to increase the probability that they won’t interfere with user supplied task ids. So they’ll be `".1"`, `".2"`, etc.

````R
  private = list(
    tasks = NULL,
    next_id = 1L,
    get_next_id = function() {
      id <- private$next_id
      private$next_id <- id + 1L
      paste0(".", id)
    }
  )
````

The `initialize()` method will just defer the work to a private method.

````R
    initialize = function(num_workers = 4L) {
      private$start_workers(num_workers)
      invisible(self)
    }
````

The private `start_workers()` method that actually starts the workers and creates the `tasks` data frame:

````R
    start_workers = function(num_workers) {
      private$tasks <- tibble::tibble(
        id = character(), idle = logical(),
        state = c("waiting", "running", "ready", "done")[0],
        fun = list(), args = list(), worker = list(), result = list())
      for (i in seq_len(num_workers)) {
        rs <- callr::r_session$new(wait = FALSE)
        private$tasks <- tibble::add_row(private$tasks,
          id = paste0(".idle-", i), idle = TRUE, state = "running",
          fun = list(NULL), args = list(NULL), worker = list(rs),
          result = list(NULL))
      }
    }
````

The starting values of the empty task data frame are mostly straightforward. If you are wondering about the indexing with zero here, it is a simple way to list all possible task states in the code, in one place, as a note for the code reader.

`callr::r_session$new()` starts a background R process. The `wait = FALSE` argument tells callr *not* to wait until the process is ready to run R code. This way the R processes start up in parallel, which is worth the trouble of making our dummy tasks a bit more complicated. The idle tasks are named `.idle-*`. After initialization, the workers are started, and the *running* idle tasks are added to the data frame.

The query methods are next:

````R
    list_tasks = function() private$tasks,
    get_num_waiting = function()
      sum(!private$tasks$idle & private$tasks$state == "waiting"),
    get_num_running = function() sum(private$tasks$state == "running"),
    get_num_done = function() sum(private$tasks$state == "done"),
    is_idle = function() sum(!private$tasks$idle) == 0
````

`list_tasks()` will just return the task data frame, for simplicity. If not all data is needed, the `get_num_*()` functions are simpler. For the first two, we need to exclude the dummy idle tasks, because they can be in the *waiting* and *running* state as well. They cannot be in the *done* state.

We still need to write the `push()`, `pop()` and `poll()` public methods. As the reader might suspect, these are more involved. Let’s start with `push()`.

````R
    push = function(fun, args = list(), id = NULL) {
      if (is.null(id)) id <- private$get_next_id()
      if (id %in% private$tasks$id) stop("Duplicate task id")
      before <- which(private$tasks$idle)[1]
      private$tasks <- tibble::add_row(private$tasks, .before = before,
        id = id, idle = FALSE, state = "waiting", fun = list(fun),
        args = list(args), worker = list(NULL), result = list(NULL))
      private$schedule()
      invisible(id)
    }
````

The queue needs to run the tasks in the same order as they were added. The data frame will keep the correct order, with the additional tweak that the idle tasks are always at the end. Indeed, these should only run if there is no other task waiting. So `push()` adds the new task right before the idle tasks.

The `schedule()` private method is the core of the queue. It starts the tasks on the selected background R workers, and it also reads out the results after they are done. I.e. it performs the *waiting* to *running* and *ready* to *done* task state transitions. We will show it later.

`push()` returns the id of the newly added task, this can be helpful to follow the task and match it to the results of a `pop()` call.

`pop()` uses `poll()` to get a list of tasks that are *done*, and returns the result of the oldest one, which is always the first, thanks to the ordering of the task data frame.

````R
    pop = function(timeout = 0) {
      if (is.na(done <- self$poll(timeout)[1])) return(NULL)
      row <- match(done, private$tasks$id)
      result <- private$tasks$result[[row]]
      private$tasks <- private$tasks[-row, ]
      c(result, list(task_id = done))
    }
````

If no task is *done*, then it returns `NULL`. The returned task is removed from the task data frame, and from the queue in general, for good. `pop()` adds the id of the task to the returned result as `task_id`, for easier matching of tasks to results.

`poll()` is the only method that checks on the running workers. This is important to remember, and unfortunately easy to forget. If the user does not call `poll()`, either directly or via `pop()`, the state of a *running* task cannot change, even if the background R session itself has finished. In other words, one cannot check the status of the tasks by listing the task data frame with `list_tasks()` periodically. This will never change if `poll()` is not called.

I start with an initial version of `poll()`, which will need changes later, but this is hopefully easier to understand first:

````R
    poll = function(timeout = 0) {
      as_ms <- function(x) if (x == Inf) -1L else as.integer(x)
      topoll <- which(private$tasks$state == "running")
      conns <- lapply(
        private$tasks$worker[topoll],
        function(x) x$get_poll_connection())
      pr <- processx::poll(conns, as_ms(timeout))
      private$tasks$state[topoll][pr == "ready"] <- "ready"
      private$schedule()
      private$tasks$id[private$tasks$state == "done"]
    }
````

We only need to check on tasks that are *running*. `poll()` uses the `processx::poll()` function that can wait on several `callr::r_session`s at once. More precisely, I extract the *poll connections* of the `r_session` objects and call `processx::poll()` on these. An `r_session` may have multiple pollable connections, one for its standard output stream, one for its standard error stream. These are not used by default in `r_session`s, and I only want to check on the poll connection, which signals if the R session has finished with the computation (or encountered an error while working on it). `processx::poll()` returns a list of character vectors, one entry for each (*running*) task. This is `"ready"` if the session is ready with the task. (Or it is `"silent"` if it is not ready, or `"timeout"` if the time limit expired and no workers are ready.)

All tasks that returned `"ready"` are indeed set to the *ready* state. After this `poll()` calls `schedule()` to read out the results of the *ready* tasks and reassign their workers to *waiting* ones.

`poll()` returns the ids of all tasks that are *done*.

This version of `poll()` has a small issue when the R sessions are starting up: it might return without any results, before the specified timeout value is over. At startup the idle tasks are *running,* and they are polled by `processx::poll()`. If any of the R sessions start up before the timeout is over, `processx::poll()` returns with `"ready"` for them. But `schedule()` cannot mark these tasks as *done*, because they are idle tasks, they’ll be *waiting*, and with no task *done*, `poll()` will return an empty vector. This is problematic, because `poll()` promises to either wait until the specified timeout *or* return a task that is *done*. So we need to wrap the simplified `poll()` into a loop, and keep calling `processx::poll()` until either the timeout expires or a task is *done*. The final `poll()` looks like this:

````R
    poll = function(timeout = 0) {
      limit <- Sys.time() + timeout
      as_ms <- function(x) if (x == Inf) -1L else as.integer(x)
      repeat{
        topoll <- which(private$tasks$state == "running")
        conns <- lapply(
          private$tasks$worker[topoll],
          function(x) x$get_poll_connection())
        pr <- processx::poll(conns, as_ms(timeout))
        private$tasks$state[topoll][pr == "ready"] <- "ready"
        private$schedule()
        ret <- private$tasks$id[private$tasks$state == "done"]
        if (is.finite(timeout)) timeout <- limit - Sys.time()
        if (length(ret) || timeout < 0) break;
      }
      ret
    }
````

Only the private `schedule()` method is missing now:

````R
    schedule = function() {
      ready <- which(private$tasks$state == "ready")
      if (!length(ready)) return()
      rss <- private$tasks$worker[ready]

      private$tasks$result[ready] <- lapply(rss, function(x) x$read())
      private$tasks$worker[ready] <- replicate(length(ready), NULL)
      private$tasks$state[ready] <-
        ifelse(private$tasks$idle[ready], "waiting", "done")

      waiting <- which(private$tasks$state == "waiting")[1:length(ready)]
      private$tasks$worker[waiting] <- rss
      private$tasks$state[waiting] <-
        ifelse(private$tasks$idle[waiting], "ready", "running")
      lapply(waiting, function(i) {
        if (! private$tasks$idle[i]) {
          private$tasks$worker[[i]]$call(private$tasks$fun[[i]],
                                         private$tasks$args[[i]])
        }
      })
    }
````

`schedule()`’s job is to perform the *ready* to *done* and the *waiting* to *running* state transitions. The first involves reading out the results of the *ready* tasks and the second involves starting new computation on the workers.

For every *ready* task, `schedule()` perform three steps:

1. Reads out and stores its result. (It can do this for the idle tasks as well, for these `r_session$read()` will return `NULL`.)
1. Removes its worker, i.e. sets it to `NULL`.
1. Updates its state to *done*. (Or to *waiting* if it is an idle task.)

Then it deals with the *waiting* tasks, but not more than the number of *ready* tasks the queue had. For these *waiting* tasks `schedule()` performs three steps:

1. Assigns a just removed worker to it.
1. Sets state to *running*. (Or to *ready* for idle tasks.)
1. Calls `fun(args)` in the background session.

When selecting the waiting tasks to run, the ordering of the task table makes sure that the oldest task is selected first, and that idle tasks are only selected if there is nothing else to run. The idle tasks make sure that `schedule()` always has at least as many waiting tasks as ready.

It is possible that `schedule()` first sets an idle task to *waiting* and then selects it and (re-)assigns a worker to it. This is perfectly fine.

## Try it out

As a simple example, we add a bunch of fake tasks to a queue, and then run a simple event loop to completion. (To run this code, first you need to run the complete code at the end of the post.)

````R
q <- task_q$new()
for (i in 1:10) {
  q$push(function(i) { Sys.sleep(runif(1)); paste(i, "done") }, list(i = i))
}
````

This is how the queue looks after adding all these tasks:

````R
q$list_tasks()
````

````R
#> # A tibble: 14 x 7
#>    id      idle  state   fun    args             worker     result
#>    <chr>   <lgl> <chr>   <list> <list>           <list>     <list>
#>  1 .1      FALSE waiting <fn>   <named list [1]> <NULL>     <NULL>
#>  2 .2      FALSE waiting <fn>   <named list [1]> <NULL>     <NULL>
#>  3 .3      FALSE waiting <fn>   <named list [1]> <NULL>     <NULL>
#>  4 .4      FALSE waiting <fn>   <named list [1]> <NULL>     <NULL>
#>  5 .5      FALSE waiting <fn>   <named list [1]> <NULL>     <NULL>
#>  6 .6      FALSE waiting <fn>   <named list [1]> <NULL>     <NULL>
#>  7 .7      FALSE waiting <fn>   <named list [1]> <NULL>     <NULL>
#>  8 .8      FALSE waiting <fn>   <named list [1]> <NULL>     <NULL>
#>  9 .9      FALSE waiting <fn>   <named list [1]> <NULL>     <NULL>
#> 10 .10     FALSE waiting <fn>   <named list [1]> <NULL>     <NULL>
#> 11 .idle-1 TRUE  running <NULL> <NULL>           <r_sessin> <NULL>
#> 12 .idle-2 TRUE  running <NULL> <NULL>           <r_sessin> <NULL>
#> 13 .idle-3 TRUE  running <NULL> <NULL>           <r_sessin> <NULL>
#> 14 .idle-4 TRUE  running <NULL> <NULL>           <r_sessin> <NULL>
````

Probably no tasks are running just yet. The queue only has the chance to change its state when you `push()`, `pop()` or `poll()`. When pushing the tasks to the queue, the workers were still starting up (i.e. the idle tasks are *running*), so `push()` could not start any real tasks. Never mind, as soon as you try to `pop()` or `poll()`, they’ll start running:

````R
q$poll(1000L)
#> [1] ".2"
q$list_tasks()
````

````R
#> # A tibble: 14 x 7
#>    id      idle  state   fun    args             worker     result    
#>    <chr>   <lgl> <chr>   <list> <list>           <list>     <list>    
#>  1 .1      FALSE running <fn>   <named list [1]> <r_sessin> <NULL>    
#>  2 .2      FALSE done    <fn>   <named list [1]> <NULL>     <cllr_ss_>
#>  3 .3      FALSE running <fn>   <named list [1]> <r_sessin> <NULL>    
#>  4 .4      FALSE running <fn>   <named list [1]> <r_sessin> <NULL>    
#>  5 .5      FALSE running <fn>   <named list [1]> <r_sessin> <NULL>    
#>  6 .6      FALSE waiting <fn>   <named list [1]> <NULL>     <NULL>    
#>  7 .7      FALSE waiting <fn>   <named list [1]> <NULL>     <NULL>    
#>  8 .8      FALSE waiting <fn>   <named list [1]> <NULL>     <NULL>    
#>  9 .9      FALSE waiting <fn>   <named list [1]> <NULL>     <NULL>    
#> 10 .10     FALSE waiting <fn>   <named list [1]> <NULL>     <NULL>    
#> 11 .idle-1 TRUE  waiting <NULL> <NULL>           <NULL>     <cllr_ss_>
#> 12 .idle-2 TRUE  waiting <NULL> <NULL>           <NULL>     <cllr_ss_>
#> 13 .idle-3 TRUE  waiting <NULL> <NULL>           <NULL>     <cllr_ss_>
#> 14 .idle-4 TRUE  waiting <NULL> <NULL>           <NULL>     <cllr_ss_>
````

````R
while (!q$is_idle()) {
  task_result <- q$pop(Inf)
  print(task_result$result)
}
#> [1] "1 done"
#> [1] "2 done"
#> [1] "3 done"
#> [1] "4 done"
#> [1] "6 done"
#> [1] "5 done"
#> [1] "7 done"
#> [1] "8 done"
#> [1] "9 done"
#> [1] "10 done"
````

`pop()` just returns whatever `r_session$read()` returns. Here is the last result from the loop:

````R
task_result
#> $code
#> [1] 200
#> 
#> $message
#> [1] "done file47c57a1f62b5"
#> 
#> $result
#> [1] "10 done"
#> 
#> $stdout
#> [1] ""
#> 
#> $stderr
#> [1] ""
#> 
#> $error
#> NULL
#> 
#> $task_id
#> [1] ".10"
````

The important fields are:

* `result`: the R object returned from the function. This is `NULL` on error.
* `stdout`: the standard output of the background session, while running the function.
* `stderr`: the standard error.
* `error`: error object if the function failed. `NULL` otherwise.
* `task_id`: the user supplied or auto-generated task id.

Let’s see a task that errors.

````R
q$push(function() stop("This failed, sorry"))
res <- q$pop(Inf)
res$error
#> <callr_status_error: callr subprocess failed: This failed, sorry>
#>  in process 
#> -->
#> <callr_remote_error in (function () stop("This failed, sorry"))(): This failed, sorry>
````

The error has two parts, the first refers to the main process, and the second is the original error, thrown in the background process. To help with debugging, the error from the background process includes a stack trace:

````R
res$error$parent$trace
````

````R
#> 
#>  ERROR TRACE for simpleError
#> 
#>  12. (function ()  ...
#>  13. base:::stop("This failed, sorry")
#>     R/<text>:1:8
#>  14. base:::.handleSimpleError(function (e)  ...
#>  15. h(simpleError(msg, call))
#> 
#>  x This failed, sorry 
````

For this simple function that just calls `stop()`, the trace is not very exciting, but it can be very helpful in general.

## How about process cleanup?

Luckily we don’t have to do anything extra to clean up the R processes. `callr::r_session` objects kill their background R session in their finalizer, i.e. when they are garbage collected. As soon as the workers have no references, because e.g. the queue object itself has no references, the garbage collector will clean them up. An explicit `kill()` method would be still useful sometimes, but we leave that as an exercise to the reader.

## Possible improvements

To use this task queue in real code, you would need to make it a bit more robust and flexible.

1. Most importantly, you would need to handle crashes and freezes in the worker tasks. `callr::r_session` does handle crashes properly, i.e. `poll()` returns immediately if the session crashes, and then `read()` returns an informative error result. But the task queue should also do something sensible in this case, e.g. return the error result, and restart the worker.
1. To handle freezing worker tasks, the queue could support task timeouts, and then kill the tasks that don’t finish before their timeout expires. This can be probably implemented using the `r_session$interrupt()` and `r_session$kill()` methods.
1. Make the queue interrupt-safe. All operations of the queue (e.g. `poll()`, `pop()`, etc.) are interruptible by the user, but they don’t always leave the task data frame and the background sessions in a consistent state. E.g. if `schedule()` is interrupted and you are unlucky, you might lose all worker processes. This is a very hard issue to solve, the relatively new `suspendInterrupts()` function probably helps a lot.
1. It would be great to be able to change the number of worker tasks of the queue dynamically, i.e. add and remove worker processes.
1. The whole queue could be implemented in a background process, so that the scheduler runs concurrently with the main R process. This is far from being trivial, especially if one wants to avoid copying data (the function arguments) twice for every task.

## Complete code

It is also available [on GitHub](https://github.com/r-lib/callr/blob/811a02f604de2cf03264f6b35ce9ec8a412f2581/vignettes/taskq.R).

````R
task_q <- R6::R6Class(
  "task_q",
  public = list(
    initialize = function(concurrency = 4L) {
      private$start_workers(concurrency)
      invisible(self)
    },
    list_tasks = function() private$tasks,
    get_num_waiting = function()
      sum(!private$tasks$idle & private$tasks$state == "waiting"),
    get_num_running = function()
      sum(!private$tasks$idle & private$tasks$state == "running"),
    get_num_done = function() sum(private$tasks$state == "done"),
    is_idle = function() sum(!private$tasks$idle) == 0,

    push = function(fun, args = list(), id = NULL) {
      if (is.null(id)) id <- private$get_next_id()
      if (id %in% private$tasks$id) stop("Duplicate task id")
      before <- which(private$tasks$idle)[1]
      private$tasks <- tibble::add_row(private$tasks, .before = before,
        id = id, idle = FALSE, state = "waiting", fun = list(fun),
        args = list(args), worker = list(NULL), result = list(NULL))
      private$schedule()
      invisible(id)
    },

    poll = function(timeout = 0) {
      limit <- Sys.time() + timeout
      as_ms <- function(x) if (x == Inf) -1L else as.integer(x)
      repeat{
        topoll <- which(private$tasks$state == "running")
        conns <- lapply(
          private$tasks$worker[topoll],
          function(x) x$get_poll_connection())
        pr <- processx::poll(conns, as_ms(timeout))
        private$tasks$state[topoll][pr == "ready"] <- "ready"
        private$schedule()
        ret <- private$tasks$id[private$tasks$state == "done"]
        if (is.finite(timeout)) timeout <- limit - Sys.time()
        if (length(ret) || timeout < 0) break;
      }
      ret
    },

    pop = function(timeout = 0) {
      if (is.na(done <- self$poll(timeout)[1])) return(NULL)
      row <- match(done, private$tasks$id)
      result <- private$tasks$result[[row]]
      private$tasks <- private$tasks[-row, ]
      c(result, list(task_id = done))
    }
  ),

  private = list(
    tasks = NULL,
    next_id = 1L,
    get_next_id = function() {
      id <- private$next_id
      private$next_id <- id + 1L
      paste0(".", id)
    },

    start_workers = function(concurrency) {
      private$tasks <- tibble::tibble(
        id = character(), idle = logical(),
        state = c("waiting", "running", "ready", "done")[NULL],
        fun = list(), args = list(), worker = list(), result = list())
      for (i in seq_len(concurrency)) {
        rs <- callr::r_session$new(wait = FALSE)
        private$tasks <- tibble::add_row(private$tasks,
          id = paste0(".idle-", i), idle = TRUE, state = "running",
          fun = list(NULL), args = list(NULL), worker = list(rs),
          result = list(NULL))
      }
    },

    schedule = function() {
      ready <- which(private$tasks$state == "ready")
      if (!length(ready)) return()
      rss <- private$tasks$worker[ready]

      private$tasks$result[ready] <- lapply(rss, function(x) x$read())
      private$tasks$worker[ready] <- replicate(length(ready), NULL)
      private$tasks$state[ready] <-
        ifelse(private$tasks$idle[ready], "waiting", "done")

      waiting <- which(private$tasks$state == "waiting")[1:length(ready)]
      private$tasks$worker[waiting] <- rss
      private$tasks$state[waiting] <-
        ifelse(private$tasks$idle[waiting], "ready", "running")
      lapply(waiting, function(i) {
        if (! private$tasks$idle[i]) {
          private$tasks$worker[[i]]$call(private$tasks$fun[[i]],
                                         private$tasks$args[[i]])
        }
      })
    }
  )
)
````

---

## Appendix: Links

Callback: [R Package - callr](../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/General%20R%20Packages/R%20Package%20-%20callr.md)

* [Development](../2-Areas/MOCs/Development.md)
* [2-Areas/MOCs/R](../2-Areas/MOCs/R.md)

*Backlinks:*

````dataview
list from [[Multi-Process Task Queue in R]] AND -"Changelog"
````
