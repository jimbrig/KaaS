---
Date: 2022-09-18
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Idea", "#Topic/Dev/R", "#Topic/Dev/R/PackageDevt", "#Status/Todo"]
Alias: ["RMarkdown Template Idea", "RMarkdown Package Development Template"]
---

# RMarkdown Template for Developing a Package with Best Practices

For every function, create a [[RMarkdown Tabset]] with:

1. Source code of the function:
 
```R 
R> styler::style(<package>::<function>)
```
			
2. Tests for the function:

```R
R> styler::style(readLines("tests/testthat/<function>_tests.R"))
```

3. Function’s Documentation:

```R
R> HTML(readLines("man/<function>.rd"))
```

4. [[Changelog]] for the Function:

*need a way to parse [[Git]] Commit history for a specific file using [[R]].*

```R
# need a way to parse Git Commit history for a specific file using R.
```

***

## Appendix: Links

- 

*Backlinks:*

```dataview
list from [[RMarkdown Template for Developing a Package with Best Practices]] AND -"Changelog"
```

***

- Date: [[2022-09-18]]