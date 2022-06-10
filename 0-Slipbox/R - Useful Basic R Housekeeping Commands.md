---
Date: 2022-06-10
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev/R"]
Alias: "R - Useful Basic R Housekeeping Commands"
---

# R - Useful Basic R Housekeeping Commands

## Contents

- [[#Package Management|Package Management]]
	- [[#Update Packages|Update Packages]]
	- [[#List Outdated Packages|List Outdated Packages]]
	- [[#Package Version|Package Version]]
	- [[#Unload Packages|Unload Packages]]
- [[#R Administration|R Administration]]
	- [[#Update R|Update R]]
- [[#Miscellaneous|Miscellaneous]]
	- [[#Check size of object in memory|Check size of object in memory]]
	- [[#Restart RStudio|Restart RStudio]]
		- [[#Related|Related]]


## Package Management

### Update Packages

```R
update.packages()
```

### List Outdated Packages

```R
old.packages()
```

### Package Version

```R
packageVersion("dplyr")
```

### Unload Packages

```R
detach("package:dplyr", unload = TRUE)
```

## R Administration

### Update R

- Use [`installR`]() - *WINDOWS ONLY*

```R
library(installR)
updateR()
```

- Use [`updateR`](https://github.com/AndreaCirilloAC/updateR)

```R
remotes::install_github("AndreaCirilloAC/updateR")
library(updateR)
updateR(auto = TRUE, .Rprofile = NULL)
```

## Miscellaneous

### Check size of object in memory

```R
pryr::object_size(df)
```

### Restart RStudio

```R
.rs.restartR()
```



***

#### Related

- [[Development]]
- [[2-Areas/MOCs/R]]


*Backlinks:*

```dataview
list from [[R - Useful Basic R Housekeeping Commands]] AND -"Changelog"
```