---
Date: 2022-06-10
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev/R"]
Alias: "R - Packages for Viewing and Editing Data"
---

# R - Packages for Viewing and Editing Data

## Overview

### DataEditR

- [DataEditR]()

```R
install.packages("DataEditR")
library(DataEditR)
data_edit(iris)
```

![](https://miro.medium.com/max/700/1*D6T9pdO5k7YPYf6iXJ-R9w.png)

### editData

- [editData]()


```R
remotes::install_github(“cardiomoon/editData”)
require(editData)
editData(iris)
```

![](https://miro.medium.com/max/700/1*ln0M50NXO-hp_3GizN00JQ.png)

editData comes with the capacity to _add rows right from the viewer_

![](https://miro.medium.com/max/700/1*KSpZu2Oa_-Y-JT65pm_5bw.png)

***

#### Related

- [[Development]]
- [[2-Areas/MOCs/R]]


*Backlinks:*

```dataview
list from [[R - Packages for Viewing and Editing Data]] AND -"Changelog"
```