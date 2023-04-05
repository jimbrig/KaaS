# R Package - RPostgres

*Source: [r-dbi/RPostgres: A DBI-compliant interface to PostgreSQL (github.com)](https://github.com/r-dbi/RPostgres) | [Rcpp Interface to PostgreSQL • RPostgres (r-dbi.org)](https://rpostgres.r-dbi.org/)*

## Contents

* [Overview](R%20Package%20-%20RPostgreSQL.md#overview)
* [Installation](R%20Package%20-%20RPostgreSQL.md#installation)
* [Basic usage](R%20Package%20-%20RPostgreSQL.md#basic-usage)
* [Connecting to a specific Postgres instance](R%20Package%20-%20RPostgreSQL.md#connecting-to-a-specific-postgres-instance)
* [Design notes](R%20Package%20-%20RPostgreSQL.md#design-notes)
* [Appendix: Links](R%20Package%20-%20RPostgreSQL.md#appendix-links)

## Overview

RPostgres is an DBI-compliant interface to the postgres database. It's a ground-up rewrite using C++ and Rcpp. Compared to RPostgreSQL, it:

* Has full support for parameterised queries via `dbSendQuery()`, and `dbBind()`.
* Automatically cleans up open connections and result sets, ensuring that you don't need to worry about leaking connections or memory.
* Is a little faster, saving ~5 ms per query. (For reference, it takes around 5ms to retrieve a 1000 x 25 result set from a local database, so this is decent speed up for smaller queries.)
* A simplified build process that relies on system `libpq`.

## Installation

````R
# Install the latest RPostgres release from CRAN:
install.packages("RPostgres")

# Or the the development version from GitHub:
# install.packages("remotes")
remotes::install_github("r-dbi/RPostgres")
````

Discussions associated with DBI and related database packages take place on [R-SIG-DB](https://stat.ethz.ch/mailman/listinfo/r-sig-db). 
The website [Databases using R](https://db.rstudio.com/) describes the tools and best practices in this ecosystem.

## Basic usage

````R
library(DBI)
# Connect to the default postgres database
con <- dbConnect(RPostgres::Postgres())

dbListTables(con)
dbWriteTable(con, "mtcars", mtcars)
dbListTables(con)

dbListFields(con, "mtcars")
dbReadTable(con, "mtcars")

# You can fetch all results:
res <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
dbFetch(res)
dbClearResult(res)

# Or a chunk at a time
res <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
while(!dbHasCompleted(res)){
  chunk <- dbFetch(res, n = 5)
  print(nrow(chunk))
}
# Clear the result
dbClearResult(res)

# Disconnect from the database
dbDisconnect(con)
````

## Connecting to a specific Postgres instance

````R
library(DBI)
# Connect to a specific postgres database i.e. Heroku
con <- dbConnect(RPostgres::Postgres(),dbname = 'DATABASE_NAME', 
                 host = 'HOST', # i.e. 'ec2-54-83-201-96.compute-1.amazonaws.com'
                 port = 5432, # or any other port specified by your DBA
                 user = 'USERNAME',
                 password = 'PASSWORD')

````

## Design notes

The original DBI design imagined that each package could instantiate X drivers, with each driver having Y connections and each connection having Z results. This turns out to be too general: a driver has no real state, for PostgreSQL each connection can only have one result set. In the RPostgres package there's only one class on the C side: a connection, which optionally contains a result set. On the R side, the driver class is just a dummy class with no contents (used only for dispatch), and both the connection and result objects point to the same external pointer.

---

## Appendix: Links

* [Development](../../../../../../../2-Areas/MOCs/Development.md)
  \<\<\<\<\<\<\< HEAD:3-Resources/Tools/R/R Packages/Database R Packages/R Package - RPostgreSQL.md
* [R](../../../../../../../2-Areas/Code/R/R.md)
* *3-Resources/Tools/R/R Packages/Database R Packages/R Package - DBI*
  =======
* [2-Areas/MOCs/R](../../../../../../../2-Areas/MOCs/R.md)
* [R Package - DBI](R%20Package%20-%20DBI.md)
  \>>>>>>> develop:3-Resources/Tools/Developer Tools/Languages/R/R Packages/Database R Packages/R Package - RPostgreSQL.md
* [Databases](../../../../../../../2-Areas/MOCs/Databases.md)
* [R - Connect Shiny to PostgreSQL Database](../../../../../../../0-Slipbox/R%20-%20Connect%20Shiny%20to%20PostgreSQL%20Database.md)

*Backlinks:*

````dataview
list from [[R Package - RPostgreSQL]] AND -"Changelog"
````
