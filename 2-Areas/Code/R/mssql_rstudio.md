---
Date: 2022-02-05
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/R", "#Topic/Dev/R", "#Topic/Dev/Data/Databases"]
Alias: ["R Code - mssql_rstudio", "mssql_rstudio"]
---

# R Code - `mssql_rstudio`

*Source: [czammar/mssql_rstudio: Having fun with mssql and Rstudio (github.com)](https://github.com/czammar/mssql_rstudio)*

## Overview

Having fun with mssql and Rstudio.

## Docker

Let's build the `Dockerfile` based in rocker/verse:3.6.1 ([https://hub.docker.com/r/rocker/verse](https://hub.docker.com/r/rocker/verse))

```bash
docker build -t my_image .
```

Please note that default user is `rstudio` and instances run in `localhost:8787`

```bash
docker run -d -p 8787:8787 -e ROOT=TRUE -e PASSWORD=yourpasswordhere my_image
```

## Querying MSSQL

```R
# Install packages if missing
list.of.packages <- c("DBI", "odbc")
new.packages <- list.of.packages[!(
  list.of.packages %in% installed.packages()[,"Package"]
  )]
if(length(new.packages)){
  install.packages(new.packages)
}

# Checking that we have the driver "ODBC Driver 17 for SQL Server"
library(odbc)
sort(unique(odbcListDrivers()[[1]]))

# Connection
library(DBI)

con <- dbConnect(odbc::odbc(),
                 driver = "ODBC Driver 17 for SQL Server",
                 database = "",
                 uid = "",
                 pwd = "",
                 server = "XX.XXX.XX.XXX,1433"
                 )

# Dummy query with previous connection
dbGetQuery(con,'
  select *
  from dbo.my_table
  limit 100
')
```

***

## Appendix: Links

- [[Code]]
- [[Development]]
- [[R]]
- [[R Database Packages]]


*Backlinks:*

```dataview
list from [[R Package - mssql_rstudio]] AND -"Changelog"
```