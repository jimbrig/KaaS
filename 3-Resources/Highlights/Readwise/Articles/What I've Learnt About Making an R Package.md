# What I've Learnt About Making an R Package

## Metadata

* Author: 
* Full Title: What I've Learnt About Making an R Package
* Category: #Type/Highlight/Article
* URL: https://mdneuzerling.com/post/what-ive-learnt-about-making-an-r-package/

## Highlights

* General hints
  There’s a difference between attaching and loading a package. Attaching a package also loads it, and this is what happens when you run the library function.
  I’ve heard it claimed before that it’s inefficient to use double colons like readr::read_csv() because R “loads the package every time”. That’s not true. R loads the package on the first use of a double colon function, but doesn’t attach it. For every call afterwards, that package has already been loaded.
  * Note: Document this!
* Running devtools::check() (as opposed to R CMD CHECK) will automatically run devtools::document() before the package check if devtools can see that you’re using Roxygen. This isn’t always obvious for a brand new package, so I found that I had to run devtools::document() initially. After that first command, however, devtools::check() started documenting.
* Use the @keywords internal Roxygen tag for documented internal functions, that is, functions without an @export tag. This partially hides the documentation from regular users, while still allowing interested users and developers to access it.
* If you want to skip the portion of a package check where R connects to CRAN (because you’re behind a proxy or you don’t have an internet connection) run rcmdcheck::rcmdcheck(repos = FALSE). This lets you continue package development on planes.
  * Tags: *favorite* 
* When you use a function like:
  "mutate(mtcars, kph = 0.425144 * mpg)",
  the package check will complain because it’s expecting to see mtcars and mpg as global variables.
  Add
  "utils::globalVariables(c("mtcars", "mpg"))"
  to a globals.R file in my R folder.
  If there’s a chance someone else will be looking at your source code, you should add a (non-Roxygen) comment explaining why so they don’t get confused.
  * Tags: *favorite* 
  * Note: Use utils::globalVariables(c("var1",...)) for assigning global variables to avoid check notes during R package development.
* If you’re creating a custom package for a specific data set, I recommend creating a download_data function that creates the inst/extdata folder and downloads the external data only if it doesn’t already exist. You can add inst/extdata to your .gitignore. This means that you can host your source code but not your data (which may be quite large) on git, without having to worry about doing multiple redundant downloads. This will also let you delete your R Markdown cache without deleting your local data.
* Imports” in the DESCRIPTION file is not the same as “Imports” in the NAMESPACE file. The DESCRIPTION file doesn’t really “import” anything in the namespace sense — it just tells R that those packages should be installed.
* Use a double colon like dplyr::mutate. This is the preferred option since it doesn’t change the namespace of your package.
* Add a Roxygen tag @ImportFrom, such as #' @ImportFrom dplyr mutate. This adds the mutate function to the namespace available to your package functions without anything else from the dplyr package. This allows you to use mutate by itself in your package functions. Because this only adds a single function at a time, you’re unlikely to encounter a namespace collision (two objects with the same name in the namespace).
* Add a Roxygen tag @Import, such as #' @Import dplyr. This adds every function in the dplyr package to the namespace available to your package functions. This isn’t recommended because it makes it very easy to run into a namespace collision.
  Something Hadley said: it’s okay to do this if you’re running a package that’s been explicitly designed to be imported in this manner. For example, tidyverse functions import the entire rlang namespace. It’s also more acceptable to do this if you’re only importing the entire namespace of a single package, since that’s unlikely to lead to conflicts.
* You can use the same @Import or @ImportFrom multiple times, and Roxygen will only add it once to the NAMESPACE. I like to keep my dependencies close to the functions that use them, so if I need a pipe in many functions I’ll put @ImportFrom magrittr %>% in each file. That’s just my personal preference, though.
* Once you’ve added either an @ImportFrom or @Import tag, you need to devtools::document() for the change to take effect. This will add the relevant lines to your NAMESPACE file. devtools::check() will usually do this for you.
  This often catches me out if I change the NAMESPACE through a Roxygen tag and then re-install the package without running devtools::check(). I get frustrated that my changes aren’t taking effect, until I realise my mistake!
* You do need to explicitly refer to functions and objects from the utils and stats packages, eg. stats::var(c(2, 3, 3, 3, 4)), and put them in your DESCRIPTION file.
  * Tags: *favorite* 
* Packages used in your vignettes that are not used in your package itself should go in the “Suggests” portion of your namespace, eg. usethis::use_package("ggplot2", type = "Suggests").
* Suppose that one of your dependencies uses an S3 method for a generic. For example, the randomForest package has an (unexported) predict.randomForest S3 method that allows you to make predictions with new data using the predict generic. How do you deal with that dependency without importing the whole randomForest namespace?
  I created a quick package to test this out. You can find it on GitHub.
  The option I went with here is to call on the internal function directly: randomForest:::predict.randomForest(). This works, but you’ll get a note because you’re generally not supposed to use ::: in functions. If you’re submitting to CRAN, this could be an issue.
* Similarly, @importMethodsFrom randomForest predict.randomForest seems to work, even though R throws a warning that it couldn’t find the method.
