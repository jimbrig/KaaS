---
Date: 2022-02-05
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool/R", "#Topic/Dev/R", "#Type/Tool", "#Topic/Dev/Database"]
Alias: ["R Package - dbreport", "dbreport"]
---

# R Package - `dbreport`

*Source: [andschar/dbreport: Keep track of your ever-growing database tables (github.com)](https://github.com/andschar/dbreport)*

Keep track of your ever-growing database tables.

## Contents

- [[#Installation|Installation]]
- [[#Quickstart|Quickstart]]
- [[#More options|More options]]
	- [[#Specific columns|Specific columns]]
	- [[#Column entries|Column entries]]
- [[#Appendix: Links|Appendix: Links]]


## Overview

`dbreport` is a R-package that let’s you create automated reports of database tables or R-objects (`data.table`, `data.frame`, `tibble`), by summarising table meta data and counting distinct entries for all (selected) columns. Therefore you can keep track of your ever growing database tables in your project and avoid constantly running queries such as the one below, checking which distinct entries your columns have (at least, this was my motivation for this package).

```SQL
SELECT var1, count(var1) AS n
FROM tab1
GROUP BY var1
ORDER BY n DESC
```

For now [PostgreSQL](https://www.postgresql.org/), [MySQL](https://www.mysql.com/) and [SQLite](https://www.sqlite.org/index.html) databases are supported. Adding methods for additional database libraries are welcomed!

## Installation

``` r
remotes::install_github('andschar/dbreport') # not yet on CRAN
```

## Quickstart

We load dbreport and connect to our database (`con`).

``` r
require(dbreport)
con = DBI::dbConnect(drv = RPostgres::Postgres(),
                     dbname = 'myname',
                     host = 'host',
                     port = 'port',
                     user = 'user',
                     password = 'mysecretpassword')
```

Now we can create a report of any table therein. Let’s just do this for the `information_schema.tables` table which is created by default for any [[PostgreSQL]] or [[MySQL]] database. In doing so, we choose to provide an output directory (`output_dir =`), to provide a super meaningful title (`report_title =`) and to add some introductory text (`report_text =`) to the report. As our output format (`output_format =`) we choose `'html_document'`. We could also take other [rmarkdown formats](https://rmarkdown.rstudio.com/lesson-9.html), such as `'pdf_document'`, `'github_document'`, `'html_vignette'` (for a very lightweight output) etc.

```r
dbreport(con = con,
         schema = 'information_schema',
         tbl = 'tables',
         output_dir = '/home/user/project1',
         report_title = 'Why not create an information_schem.tables report?!',
         report_text = 'Introductory text.', # you can alsp provide a file
         output_format = 'html_document')
```

Done! The report together with a `.csv` file summarising the individual columns is created in the output directory and we can examine it.

## More options

### Specific columns

We can also tweak our report a little more and choose only specific columns (`column =`) to be included in the report and create treemap plot instead of the lollipop plot (`plot_type =`). For this we access the publicly available Read-Only [MySQL](https://www.mysql.com) [RNA-sequence database](https://docs.rfam.org/en/latest/database.html) and run `dbreport()` only on the *ncbi_id* and *species* column of the *taxonomy* table. In doing so we also output the report to a `.pdf` (`output_format =`).

```r
con = DBI::dbConnect(drv = RMySQL::MySQL(),
                     host = 'mysql-rfam-public.ebi.ac.uk',
                     user = 'rfamro',
                     port = 4497,
                     dbname = 'Rfam')
```

```r
dbreport(con,
         schema = 'Rfam',
         tbl = 'taxonomy',
         column = c('ncbi_id', 'species'),
         plot_type = 'treemap',
         output_dir = file.path(tempdir(), 'test_mysql'),
         output_format = 'pdf_document')
```

By default `dbreport()` closes the connection to a database and you would have to reopen it for every new report you want to create. You can turn off this behavior by setting `exit = FALSE`. This can be especially useful if you want to create reports for multiple tables automatically, for instance by using `mapply()`. After having created the reports however, you should run `DBI::dbDisconnect(con)` to close the open database connections.

```r
mapply(dbreport::dbreport,
       tbl = c('table1', 'table2'), # vector of table names
       MoreArgs = list(con = con,
                       schema = 'schema1',
                       output_dir = tempdir(),
                       output_format = 'html_vignette',
                       exit = FALSE)
DBI::dbDisconnect(con)
```

### Column entries

We could as well check how often the entry `versiocolor` occurs (case is ignored) in the *Species* column of the *iris* table by specifying the `entry =` parameter.

```r
dbreport(con = iris,
         entry = 'versicolor',
         output_dir = file.path(tempdir(), 'report_iris'),
         output_format = 'html_vignette',
         report_title = 'Iris report')
```

***

## Appendix: Links

- [[Tools]]
- [[Development]]
<<<<<<< HEAD:3-Resources/Tools/R/R Packages/Database R Packages/R Package - dbreport.md
- [[R]]
- [[R Database Packages]]
=======
- [[2-Areas/MOCs/R]]
- [[R - Database Packages List]]
>>>>>>> develop:3-Resources/Tools/Developer Tools/Languages/R/R Packages/Database R Packages/R Package - dbreport.md


*Backlinks:*

```dataview
list from [[R Package - dbreport]] AND -"Changelog"
```