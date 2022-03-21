---
Date: 2022-03-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/R", "#Topic/Dev/R"]
Alias: ["R - Upgrade R and Migrate Packages"]
---

# R - Upgrade R and Migrate Packages

*Source: https://gist.github.com/1717f5d6b10a6885461c54415562e5b1#file-update_migrate-r*

```R
#From https://stackoverflow.com/questions/1401904/painless-way-to-install-a-new-version-of-r

# Run in the old version of R (or via RStudio)
setwd("C:/Temp/") 
packages <- installed.packages()[,"Package"] 
save(packages, file="Rpackages") 

# INSTALL NEW R VERSION
if(!require(installr)) { install.packages("installr"); require(installr)} #load / install+load installr
# See here for more on installr: https://www.r-statistics.com/2013/03/updating-r-from-r-on-windows-using-the-installr-package/  

# step by step functions:
check.for.updates.R() # tells you if there is a new version of R or not.
install.R() # download and run the latest R installer

# Install library - run in the new version of R. This calls package names and installs them from repos, thus all packages should be correct to the most recent version
setwd("C:/Temp/") 
load("Rpackages") 
for (p in setdiff(packages, installed.packages()[,"Package"])) 
install.packages(p) 

# Installr includes a package migration tool but this simply copies packages, it does not update them
copy.packages.between.libraries() # copy your packages to the newest R installation from the one version before it (if ask=T, it will ask you between which two versions to perform the copying)

```

***

## Appendix: Links

- [[Code]]
- [[2-Areas/MOCs/R]]
- [[Development]]

*Backlinks:*

```dataview
list from [[R - Upgrade R and Migrate Packages]] AND -"Changelog"
```