---
Date: 2022-02-05
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool/R", "#Topic/Dev/R", "#Type/Tool"]
Alias: ["R Package - RODBC", "RODBC"]
---

*Source: [RODBC — ODBC Database Access - cran/RODBC - (github.com)](https://github.com/cran/RODBC)*

*Source: [The RODBC package - IBM Documentation](https://www.ibm.com/docs/en/db2woc?topic=packages-rodbc-package)*

## Overview

The `RODBC` package provides functions that you can use to access the data in your database.

The RODBC package provides functions that you can use to access the data in your database.

In the RODBC package:

-   Functions with names that begin with `odbc` invoke the ODBC functions that have similar names.
-   Functions with names that begin with `sql` can be used to read, save, copy, and manipulate data between data frames and SQL tables.

To load the RODBC library, add the following line to your R script:

The following script illustrates how to use the **`odbcConnect()`** method to establish a database connection. The specified data source name (DSN) is **`IDADB`**, and the **`believeNRows`** parameter is set to FALSE to avoid any initial connection issues.

```
# Load the RODBC package
library(RODBC)
library(ggplot2)

# Connect to a local DSN called IDADB
con <- odbcConnect("IDADB",believeNRows=FALSE)

# Create query of previously loaded table data - ensure your schema is set
query <- paste("select * from ida09098.school where bname in ('Toronto DSB', 'York Region DSB')")

# Create a data frame based on the query - do not map strings to factors
df <- sqlQuery(con, query, stringsAsFactors=FALSE )

# Display the number of rows, columns, and the structure of the data frame
nrow(df)
ncol(df)
str(df)

# Define the type of file to generate for the plot
jpeg(type='cairo',"school_boxplot.jpg",width=650,height=600) 
sink('/dev/null') 

# Generate the boxplot for comparisons
sp <- ggplot(df, aes(LEVEL, SIZE)) + geom_boxplot(aes(fill = BNAME)) + ggtitle("Comparing School Boards")
print (sp)

dev.off() 
odbcClose(con)
```


***

## Appendix: Links

- [[Tools]]
- [[Development]]
<<<<<<< HEAD:3-Resources/Tools/R/R Packages/Database R Packages/R Package - RODBC.md
- [[R]]
- [[3-Resources/Tools/R/R Packages/R Packages]]
- [[R Database Packages]]
=======
- [[2-Areas/MOCs/R]]
- [[3-Resources/Tools/Developer Tools/Programming Languages/R/R Packages/R Packages]]
- [[R - Database Packages List]]
>>>>>>> develop:3-Resources/Tools/Developer Tools/Languages/R/R Packages/Database R Packages/R Package - RODBC.md


*Backlinks:*

```dataview
list from [[R Package - RODBC]] AND -"Changelog"
```