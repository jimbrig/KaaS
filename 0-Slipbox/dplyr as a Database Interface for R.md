# dplyr as a Database Interface for R

*Source: [Overview (rstudio.com)](https://db.rstudio.com/getting-started/overview)*

## Overview

The [dplyr](../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Data%20Manipulation%20Packages/R%20Package%20-%20dplyr.md) package simplifies data transformation. It provides a consistent set of functions, called verbs, that can be used in succession and interchangeably to gain understanding of the data interactively.

### **dplyr** as a database interface

*Source: [dplyr as a database interface - (rstudio.com)](https://db.rstudio.com/getting-started/overview#dplyr-as-a-database-interface)*

The `dplyr` package simplifies data transformation. It provides a consistent set of functions, called verbs, that can be used in succession and interchangeably to gain understanding of the data iteratively.

`dplyr` is able to **interact with databases directly** by translating the `dplyr` verbs into SQL queries. This convenient feature allows you to ‘speak’ directly with the database from R. Other advantages of this approach are:

![](https://db.rstudio.com/homepage/interact.png)

1. **Run data exploration routines over all of the data**, instead of importing part of the data into R.

1. **Use the SQL Engine to run the data transformations.** In effect, computation is being pushed to the database.

1. **Collect into R only a targeted dataset.**

1. **All of your code is in R.** Because`dplyr` is used to communicate with the database, there is no need to alternate between languages or tools to perform the data exploration.

## **Connect to a database**

![](https://db.rstudio.com/homepage/open-source.png)

**At the center of this approach is the `DBI` package.** This package acts as *‘middle-ware’* between packages to allow connectivity with the database from the user or other packages. It provides a consistent set of functions regardless of the database type being accessed. The `dplyr` package depends on the `DBI` package for communication with databases.

There are packages that enables a direct connection between the an open-source database and R. Currently, such packages exist for the following databases: *MySQL, SQLite, PostgreSQL, and bigquery*.

![](https://db.rstudio.com/homepage/commercial.png)

Most commercial databases, like Oracle and Microsoft SQL Server, offer ODBC drivers that allow you to connect your tool to the database. Even though there are R packages that allow you to use ODBC drivers, the connection will most likely not be compatible with `DBI`. The new `odbc` package solves that problem by providing a `DBI` backend to any ODBC driver connection.

If you are interested in creating your own package that connects `DBI` to a database, please review the article [DBI Backend](https://db.rstudio.com/getting-started/backend).

## SQL Translations for `dplyr`

A complementary package called `dbplyr` contains the translations of the vendor-specific SQL for `dplyr` to use. A list of known supported databases are available in our [Databases](https://db.rstudio.com/databases) page.

Is the database you are interested in not listed here? You can still use `DBI` and `odbc` to connect and send SQL queries. If you would like to contribute a translation, please see the [SQL Translation](https://db.rstudio.com/getting-started/translation) page in this website.

### Example

The same dplyr syntax used with data in R will also work with data in a database. In the example below, data from the `nycflights13` package are loaded into a SQLite database then queried from R. The results from the query are then collected into R and visualized with ggplot2. The process is the same if you are using an enterprise data warehouse — like Microsoft SQL Server or Snowflake’s data cloud.

````
library(DBI)
library(dplyr)
library(ggplot2)


con <- dbConnect(RSQLite::SQLite(), ":memory:")
copy_to(con, nycflights13::flights, "FLIGHTS")

tbl(con, "FLIGHTS") %>%
  filter(distance > 75) %>%
  group_by(origin, hour) %>%
  summarise(delay = mean(dep_delay, na.rm = TRUE)) %>%
  collect() %>%
  ggplot(aes(hour, delay, color = origin)) + geom_line()
````

![](https://db.rstudio.com/homepage/snowflake-flights.png)

---

## Appendix: Links

* [R - Database Packages List](../2-Areas/Lists/R%20-%20Database%20Packages%20List.md)
* [R Package - dplyr](../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Data%20Manipulation%20Packages/R%20Package%20-%20dplyr.md)
* [R Package - dbplyr](../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20dbplyr.md)
* [Development](../2-Areas/MOCs/Development.md)
* [2-Areas/MOCs/R](../2-Areas/MOCs/R.md)

*Backlinks:*

````dataview
list from [[dplyr as a Database Interface for R]] AND -"Changelog"
````
