# R - Useful Basic R Housekeeping Commands

## Contents

* [Package Management](R%20-%20Useful%20Basic%20R%20Housekeeping%20Commands.md#package-management)
  * [Update Packages](R%20-%20Useful%20Basic%20R%20Housekeeping%20Commands.md#update-packages)
  * [List Outdated Packages](R%20-%20Useful%20Basic%20R%20Housekeeping%20Commands.md#list-outdated-packages)
  * [Package Version](R%20-%20Useful%20Basic%20R%20Housekeeping%20Commands.md#package-version)
  * [Unload Packages](R%20-%20Useful%20Basic%20R%20Housekeeping%20Commands.md#unload-packages)
* [R Administration](R%20-%20Useful%20Basic%20R%20Housekeeping%20Commands.md#r-administration)
  * [Update R](R%20-%20Useful%20Basic%20R%20Housekeeping%20Commands.md#update-r)
* [Miscellaneous](R%20-%20Useful%20Basic%20R%20Housekeeping%20Commands.md#miscellaneous)
  * [Check size of object in memory](R%20-%20Useful%20Basic%20R%20Housekeeping%20Commands.md#check-size-of-object-in-memory)
  * [Restart RStudio](R%20-%20Useful%20Basic%20R%20Housekeeping%20Commands.md#restart-rstudio)
    * [Related](R%20-%20Useful%20Basic%20R%20Housekeeping%20Commands.md#related)

## Package Management

### Update Packages

````R
update.packages()
````

### List Outdated Packages

````R
old.packages()
````

### Package Version

````R
packageVersion("dplyr")
````

### Unload Packages

````R
detach("package:dplyr", unload = TRUE)
````

## R Administration

### Update R

* Use [`installR`]() - *WINDOWS ONLY*

````R
library(installR)
updateR()
````

* Use [`updateR`](https://github.com/AndreaCirilloAC/updateR)

````R
remotes::install_github("AndreaCirilloAC/updateR")
library(updateR)
updateR(auto = TRUE, .Rprofile = NULL)
````

## Miscellaneous

### Check size of object in memory

````R
pryr::object_size(df)
````

### Restart RStudio

````R
.rs.restartR()
````

---

#### Related

* [Development](../2-Areas/MOCs/Development.md)
* [2-Areas/MOCs/R](../2-Areas/MOCs/R.md)

*Backlinks:*

````dataview
list from [[R - Useful Basic R Housekeeping Commands]] AND -"Changelog"
````
