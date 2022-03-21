---
Date: 2022-03-10
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/R", "#Topic/Dev/R"]
Alias: ["R - Excel Helpers"]
---

# R - Excel Helpers

*Source: https://kotamine.github.io/excel_shiny/tips-from-excel-tool-to-shiny.html*

Some [[2-Areas/MOCs/R]] functions related to familiar [[Excel]] functions:

## Net Present Value - NPV

```R
#' Net Present Value
#' 
#' @param rate Rate to use when discounting
#' @param values Vector of numeric values to discount to present value
npv <- function(rate, values) {
    sum(values / (1 + rate) ^ seq_along(values))
}
```

## Internal Rate of Return

```R


***

## Appendix: Links

- [[Code]]
- [[R]]
- [[Development]]

*Backlinks:*

```dataview
list from [[R - Excel Helpers]] AND -"Changelog"
```