# The R Code Optimizer • Rco

## Metadata

* Author: 
* Full Title: The R Code Optimizer • Rco
* Category: #Type/Highlight/Article
* URL: https://jcrodriguez1989.github.io/rco/

## Highlights

* rco analyzes your code and applies different optimization strategies that return an R code that runs faster.
* Using the RStudio Addins
  Optimize active file: Optimizes the file currently open in RStudio. It will apply the optimizers present in all_optimizers.
  Optimize selection: Optimizes the code currently highlited in the RStudio Source Pane. It will apply the optimizers present in all_optimizers.
* Using the shiny GUIs
  rco_gui("code_optimizer") opens a shiny interface in a browser. This GUI allows to easily optimize chunks of code.
  rco_gui("pkg_optimizer") opens a shiny interface in a browser. This GUI allows to easily optimize R packages that are hosted at CRAN or GitHub.
* Using the R functions
  Optimize some .R code files
  optimize_files(c("file_to_optimize_1.R", "file_to_optimize_2.R"))
  Optimize some code in a character vector
  code \<- paste(
  "code_to_optimize \<- 8 ^ 8 * 1918",
  "cto \<- code_to_optimize * 2",
  sep = "\n"
  )
  optimize_text(code)
  Optimize all .R code files into a folder
  optimize_folder("~/myfolder_to_optimize", recursive = FALSE)
