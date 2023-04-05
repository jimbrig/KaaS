# Usethis Workflow for Package Development | Emil Hvitfeldt

## Metadata

* Author: 
* Full Title: Usethis Workflow for Package Development | Emil Hvitfeldt
* Category: #Type/Highlight/Article
* URL: https://www.hvitfeldt.me/blog/usethis-workflow-for-package-development/

## Highlights

* The usethis promises to
  … it automates repetitive tasks that arise during project setup and development, both for R packages and non-package projects.
* Before creation
  Before we get started we need to make sure we have the essential packages installed to create a R package development workflow
  library(devtools)
  library(roxygen2)
  library(usethis)
* create_package("~/Desktop/utwf")
  use_git()
  use_github()
* We can check that the package works by pressing “Install and Restart” in the “Build” panel. Alternatively you can use the keyboard shortcut Cmd+Shift+B (Ctrl+Shift+B for Windows).
* DESCRIPTION file and make sure that the Authors@R is populated correctly and modify the Title and Description fields.
  Next we will license the package. This can be done using one of the following functions (we will use MIT for this example)
* use_readme_rmd()
* use_travis()
  use_appveyor()
  use_coverage(type = c("codecov"))
* use_testthat()
* use_spell_check()
* use_data_raw()
* use_news_md()
* Multiple time modifications
* You typical workflow will be repeating the following steps in the order that suits your flow
  Write some code
  Restart R Session Cmd+Shift+F10 (Ctrl+Shift+F10 for Windows)
  Build and Reload Cmd+Shift+B (Ctrl+Shift+B for Windows)
  Test Package Cmd+Shift+T (Ctrl+Shift+T for Windows)
  Check Package Cmd+Shift+E (Ctrl+Shift+E for Windows)
  Document Package Cmd+Shift+D (Ctrl+Shift+D for Windows)
  Writing code most likely includes writing functions, this is helped by the use_r() function by adding and opening a .R file that you write your function in
  use_r("function_name")
* but it will also open the files if they are already created, this makes navigating your R files much easier
  * Note: wow-did not know this!
* Once you have created your function it is time to add some tests! This is done using the use_test() function, and it works much the same way as the use_r().
  use_test("function_name")
* In the creating of your functions, you might need to depend on another package, to add a function to the imports field in the DESCRIPTION file you can use the use_package() function
  use_package("dplyr")
* Special cases function includes use_rcpp(), use_pipe() and use_tibble().
  An vignette provides a nice piece of documentation once you have added a bunch of capabilities to your package.
  use_vignette("How to do this cool analysis")
* Before every commit
  Before you commit, run the following commands one more time to make sure you didn’t break anything.
  Restart R Session Cmd+Shift+F10 (Ctrl+Shift+F10 for Windows)
  Document Package Cmd+Shift+D (Ctrl+Shift+D for Windows)
  Check Package Cmd+Shift+E (Ctrl+Shift+E for Windows)
* update the version number with the use of
  use_version()
