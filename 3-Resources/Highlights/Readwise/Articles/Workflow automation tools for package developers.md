---
Date: 2022-08-18
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: Matter
Link: https://blog.r-hub.io/2020/04/29/maintenance/
Tags: ["#Type/Highlight/Article"]
Aliases: ["Workflow automation tools for package developers", "Workflow automation tools for package developers"]
---
# Workflow automation tools for package developers

## Metadata
- Author: [[Maëlle Salmon]]
- Full Title: Workflow automation tools for package developers
- Category: #Type/Highlight/Article
- URL: https://blog.r-hub.io/2020/04/29/maintenance/

## Highlights
- R CMD check or devtools::check\(\) will check your package for adherence to some standards (e.g., what folders can there be) and run the tests and examples. It’s a useful command to run even if your package isn’t intended to go on CRAN.
    - Tags: [[r]] 
    - Note: :Favorites
- goodpractice and lintr both provide you with useful static analyses of your package.
    - Tags: [[r]] 
    - Note: :Favorites
- * covr::package\_coverage\(\) calculates test coverage for your package. Having a good coverage also means R CMD check is more informative, since it means it’s testing your code. 😉 covr::package\_coverage\(\) can also provide you with the code coverage of the vignettes and examples!
    - Tags: [[r]] 
    - Note: :Favorites
- devtools::spell\_check\(\), wrapping spelling::spell\_check\_package\(\), runs a spell check on your package and lets you store white-listed words.
    - Tags: [[r]] 
    - Note: :Favorites
- styler can help you re-style your code. Of course, you should check the changes before putting them in your production codebase. It’s better paired with version control.
    - Tags: [[r]] 
    - Note: :Favorites
- Using roxygen2 is generally handy, starting with your no longer needing to edit the NAMESPACE by hand. If your package doesn’t use roxygen2 yet, you could use Rd2roxygen to convert the documentation.
    - Tags: [[r]] 
    - Note: :Favorites
- One could argue that using pkgdown is a way to improve your R package documentation for very little effort. If you only tweak one thing, please introduce grouping in the reference page.
    - Tags: [[r]] 
    - Note: :Favorites
- Even when having to write some things by hand like inventing new tests, usethis provides useful functions to help (e.g., create test files with usethis::use\_test\(\)).
    - Tags: [[r]] 
    - Note: :Favorites
- To take things further, the precommit R package provides two sets of utilities around the precommit framework: hooks that are useful for R packages or projects, and usethis-like functionalities to set them up.
    - Tags: [[r]] 
    - Note: :Favorites
- CRAN has a submission checklist, and you could either roll your own or rely on usethis::use_release_issue() creating a GitHub issue with important items. If you don’t develop your package on GitHub you could still have a look at the items for inspiration. The devtools::release() function will ask you whether you ran a spell check.
    - Tags: [[r]] 
    - Note: :Favorites
