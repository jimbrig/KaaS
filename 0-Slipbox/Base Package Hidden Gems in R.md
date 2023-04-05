# Base Package Hidden Gems in R 💎

## `autoload` Family

 > 
 > Related: `delayedAssign` and `library`

These are amazingly underutilized functions from `base` R. 

### Description:

`autoload` creates a promise-to-evaluate `autoloader` and stores it with name `name` in the `.AutoloadEnv` environment. 

When R attempts to evaluate `name`, `autoloader` is run, the package is loaded and `name` is *re-evaluated in the new package's environment*!

The result is that R behaves as if package was loaded but it does not occupy memory.

`.Autoloaded` contains the names of the packages for which autoloading has been promised.

### Usage

* `autoload`:  `autoload(name, package, reset = FALSE, ...)`
* `autoloader`:  `autoloader(name, package, ...)`
* `.AutoloadEnv`: see below
* `.Autoloaded` : see below

### Arguments

`name`    - string giving the name of an object
`package` - string giving the name of a package containing the object
`reset` - logical: for internal use by `autoloader`
`...` - other arguments to `library`

### Examples

````
require(stats)
autoload("interpSpline", "splines")
search()
ls("Autoloads")
.Autoloaded

x <- sort(stats::rnorm(12))
y <- x^2
is <- interpSpline(x, y)
search() ## now has splines
detach("package:splines")
search()
is2 <- interpSpline(x, y+x)
search() ## and again
detach("package:splines")
````

### My Take

I find `autoload` extremely useful for incorporating functions from packages in my \[\[.Rprofile|`Rprofile`\]\].  For example, I like to utilized magrittr's `%>%` pipe and usually do not want to have to library it in for ad-hoc analysis on the fly; therefore by including `autoload("%>%", "magrittr")` in my `.Rprofile`, I have complete access to `%>%` without `magrittr` cluttering up my search path or namespaced environment (especially useful on Windows).

With that snippet included in my `.Rprofile` I can use `%>%` later on in the same R session and `magrittr` will not get attached until I use it.

Other ideas for `autoload` useful functions would be:

* `dplyr`'s suite: `mutate`, `filter`, `select`, etc.
* `lubdridate`'s `ymd` and other date utility functions
* `fs`'s file navigation functions.
* ...

## `Reduce`

**Reduce** function (note the capital “R”). **Reduce** takes a list or vector as input, and reduces it down to a single element. 

It works by applying a function to the first two elements of the vector or list, and then applying the same function to that result with the third element. 

This new result gets passed with the fourth element into the function and so on until a single object remains. If the input is a vector, the result will be a single number or character. 

On the other hand, inputting a *list* can have interesting results. A list of data frames can be reduced down to a single data frame, a list of vectors can be collapsed into a matrix, and so on.

A simple, though not entirely useful, example of how this works is like so:

````
test <- 1:10 
result <- Reduce(sum, test)
````

Here, *result* will equal **55**, which happens to be the sum of the vector *test* i.e. the sum of the integers 1 through 10. **Reduce** solves for this by first applying the **sum** function to 1 and 2 (the first two elements in test). This equals 3, which then gets summed with the next element in the vector, 3. This total of 6 gets added to 4, which equals 10, and so on. The process can be seen below.

$1 + 2 = 3$
$3 + 3 = 6$
$6 + 4 = 10$
$10 + 5 = 15$
$15 + 6 = 21$
$21 + 7 = 28$
$28 + 8 = 36$
$36 + 9 = 45$
$45 + 10 = 55$

---

Now, how about something a little more useful? What if you had a list of vectors and you wanted to combine them into a matrix?

````
test <- list(1:3, 4:6, 7:9, 10:12, 13:15, 16:18) 
matrix_result <- Reduce(rbind, test)
````

In this case, we have a list of six three-element vectors. **Reduce** applies **rbind** to the first two vectors, 1:3 and 4:6 initially. This creates a 2 x 3 matrix, where the first row is 1:3, and the second row is 4:6.

**1 2 3  
4 5 6**

Then, the above result is combined (via **rbind**) to the next vector in the list, 7:9.

**1 2 3  
4 5 6  
7 8 9**

This process continues, as you can see below:

**1 2 3  
4 5 6  
7 8 9  
10 11 12**

Next:

**1 2 3  
4 5 6  
7 8 9  
10 11 12  
13 14 15**

Finally:

**1 2 3  
4 5 6  
7 8 9  
10 11 12  
13 14 15  
16 17 18**

Thus, the final result is a single object — but in this case, is a 6 x 3 matrix because **rbind** collapsed all of the vectors of the list, test, into a single matrix.

Similarly, you could run this example using **cbind** instead of **rbind** and that would collapse the vectors column-wise, rather than row-wise.

Another example where **Reduce** comes in handy might be if you want to combine a collection of data frames into a single one.

````
state_data <- list(
  FL = data.frame(state = c("FL","FL","FL"), city = c("Miami","Jacksonville","Saint Augustine")),
  NY = data.frame(state = c("NY","NY","NY"), city = c("NYC","Buffalo","Rochester")),
  MD = data.frame(state = c("MD","MD","MD"), city = c("Baltimore","Annapolis","Ocean City"))
)


combined <- data.frame(Reduce(rbind, state_data))
````

## `Filter`

The Filter function does basically what it sounds like — it applies a filter to a vector, list, or data frame (which is actually a type of list). It takes two main inputs, a function that applies the filter, and the object for which the filter applies.

Here’s a simple example:

````
test <- 1:10

less_than_5 <- Filter(function(x) x < 5, test)
````

This, once again, creates a vector of the first 10 positive integers. The **Filter** function applies *function(x) x \< 5* to each element, *x*, in the vector, *test*. In other words, it checks each element, *x*, for the Boolean expression, *x \< 5*. If an element is not less than 5, it gets filtered out.

So you might be thinking…can’t this be done like this?

`less_than_5 <- test[test < 5]`

…and the answer is…yes. It can be done that way. **Filter** is more useful as a function in cases involving data frames or lists. Suppose, for instance, you want to remove all constant columns from a data frame. This is something that may be done when preprocessing data prior to modeling, as a constant attribute isn’t particular useful.

This is can be done in one line using **Filter**

````
df <- data.frame(a = c(2,2,2), b = c(1,2,3), c = c(1,1,1), d = c(3,4,5))

without_constants <- Filter(function(x) length(unique(x)) > 1, df)
````

Alternatively, using dplyr’s *n\_distinct* function, which counts the number of distinct elements in a vector, you could do this:

````
library(dplyr)

df <- data.frame(a = c(2,2,2), b = c(1,2,3), c = c(1,1,1), d = c(3,4,5))

without_constants <- Filter(function(x) n_distinct(x) > 1, df)
````

In the example, we create a data frame with four columns — two of them are constant. **Filter** tests whether there is more than one unique value in each column. If there is only one unique value, then we know the column is constant, and it gets filtered out. Each element *x* is a vector, or column, in the data frame.

If you wanted to just drop all columns that are all NAs, you could make a minor tweak like this:

````
df <- data.frame(a = c(2,2,2), b = c(1,2,3), c = c(1,1,1), d = c(NA, NA, NA))

without_nas <- Filter(function(x) !all(is.na(x)), df)
````

**Filter** can also be used on a regular list as well. Suppose you have a list of vectors, where some of the vectors are characters, while others are numeric. If want to filter out all of the non-numeric vectors, you could call **Filter**:

````
sample_list <- list(a = c(1,2,3), b = c("is","a","character"), c = c(4,5,6), d = c("is","another","character"))

only_numeric <- Filter(function(x) is.numeric(x), sample_list)
````

## `rapply`

The **rapply** function is part of the apply family of functions in R. It has a few different uses, but one of my favorite applications for it is to apply a function to columns of a data frame that belong to a specific class, or have a particular data type.

Let’s say you want to get the sum of all of the numeric columns.

````
df <- data.frame(a = c(2,2,2), b = c(1,2,3), c = c("r","is","awesome"), d = c(3,4,5), e=c("some","other","character"))

summed_columns <- rapply(df, sum, class = "numeric")
````

Similar to *sapply* or *lapply*, **rapply** takes a list / vector / data frame as input, along with a function to be applied. However, it can also take a “class” parameter, which allows us to specify what class of object we want our function to be used for.

**rapply** can also be used to recursively apply functions to nested lists (see examples from its documentation [here](https://stat.ethz.ch/R-manual/R-devel/library/base/html/rapply.html)).

## `rep`

The last function I want to mention for this post is the **rep** function. This can be used to repeat a value as many times as you want. So if you want to create a vector of 1000 5’s, it could be done like this:

````
rep(5, 1000)
````

Here’s a couple other examples:

````
rep("a", 500)

rep("repeat this", 100)
````

If you pass a vector with more than one element to **rep**, the entire vector gets repeated the number of times you specify.

````
rep(c(1,2,3), 100)
````

The above code will create a vector with 300 elements — the number of elements in c(1,2,3) times 100, repeating 1, 2, 3 over and over.

---

Links: 
Source:

*Backlinks:*

````dataview
list from [[Base Package Hidden Gems in R]] AND -"Changelog"
````
