# RMarkdown Tabset

## Contents

* [Overview](RMarkdown%20Tabset.md#overview)
* [Code](RMarkdown%20Tabset.md#code)
* [Example](RMarkdown%20Tabset.md#example)
* [Appendix: Links](RMarkdown%20Tabset.md#appendix-links)

*Source: [7.6 Put content in tabs | R Markdown Cookbook (bookdown.org)](https://bookdown.org/yihui/rmarkdown-cookbook/html-tabs.html)*

## Overview

One natural way of organizing parallel sections in an [HTML](../../3-Resources/Tools/Developer%20Tools/Languages/HTML/HTML.md) report is to use *tabsets*. This allows readers to view the content of different sections by clicking the tab titles instead of scrolling back and forth on the page.

To turn sections into tabs, you can add a class attribute `.tabset` to the section header that is one level higher than the headers to be converted to tabs, e.g., adding the `.tabset` attribute to a level-2 header will convert all subsequent level-3 headers to tabs. Below is a full example.

## Code

To create an *HTML* *Tabset* in [RMarkdown](RMarkdown.md) (*.Rmd*) - use the following syntax:

````R
---
title: Use tabs to organize content
output: html_document
---

You can turn parallel sections to tabs in `html_document` output.

## Results {.tabset}

### Plots

We show a scatter plot in this section.

```{r, fig.dim=c(5, 3)}
par(mar = c(4, 4, .5, .1))
plot(mpg ~ hp, data = mtcars, pch = 19)
```

### Tables

We show the data in this tab.

```{r}
head(mtcars)
```
````

## Example

![Pasted image 20220918212253.png](../../_assets/Pasted%20image%2020220918212253.png)

---

## Appendix: Links

* *Code*
* [R](../../2-Areas/MOCs/R.md)
* [Development](../../2-Areas/MOCs/Development.md)

*Backlinks:*

* [RMarkdown Tabset](RMarkdown%20Tabset.md)
* [RMarkdown Template for Developing a Package with Best Practices](../../2-Areas/Content/Ideas/RMarkdown%20Template%20for%20Developing%20a%20Package%20with%20Best%20Practices.md)

---

*Dataview:*

````dataview
list from [[RMarkdown Tabset]] AND -"Changelog"
````

---

* Date: [2022-09-18](../../2-Areas/Daily-Notes/2022-09-18.md)
