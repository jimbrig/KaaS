---
Date: 2022-02-05
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool/R", "#Topic/Dev/R", "#Type/Tool", "#Topic/Dev/Database"]
Alias: ["R Package - ibmdbR", "ibmdbR"]
---

# The ibmdbR package

*Source: [The ibmdbR package - IBM Documentation](https://www.ibm.com/docs/en/db2woc?topic=packages-ibmdbr-package)*

## Contents

- [[#Overview|Overview]]
- [[#In-database analytic functions|In-database analytic functions]]
- [[#General methods, functions, and operators|General methods, functions, and operators]]
- [[#Functions for interacting with data in the database|Functions for interacting with data in the database]]
- [[#Storing R objects in the database|Storing R objects in the database]]
- [[#Appendix: Links|Appendix: Links]]


## Overview

The `ibmdbR` package provides methods to read data from, write data to, and sample data from a Db2® database. It also provides access methods for in-database analytic functions and functions for storing R objects in the database.

For more information about a particular function in this package:

-   See [https://cran.r-project.org/web/packages/ibmdbR/ibmdbR.pdf](https://www.ibm.com/links?url=https%3A%2F%2Fcran.r-project.org%2Fweb%2Fpackages%2FibmdbR%2FibmdbR.pdf "(Opens a PDF file)")
-   Enter, at the R prompt, a question mark (?) followed by the function name (for example, `?idaShowTables`)

## In-database analytic functions

The following table lists the in-database analytic functions that are provided by ibmdbR. For more information, see [In-database analytics using R](https://www.ibm.com/docs/en/SS6NHC/com.ibm.swg.im.dashdb.analytics.doc/doc/explorer_in_db_analytics.html "To process data, most native R functions require that the data first is extracted from a database to working memory. Such a function is called an in-application function. A different type of function, called an in-database function, operates directly on data in a database, without requiring the data to be extracted. Consequently, you can use an in-database function to analyze large amounts of data that would be impractical or impossible to extract.").

| In-database analytic function | Corresponding in-application analytic functions | Description                                                            |
| ----------------------------- | ----------------------------------------------- | ---------------------------------------------------------------------- |
| idaArule                      | arules                                          | Discover relationships among items in transactional data.              |
| idaKMeans                     | kmeans                                          | Create a k-means model to analyze data clustering.                     |
| idaLm                         | lm                                              | Create a linear regression model.                                      |
| idaNaiveBayes                 | naiveBayes                                      | Create a naive Bayes model for predictive analysis.                    |
| idaTree                       | rpart                                           | Create a decision tree (classification tree or regression tree) model. |

Each model is stored in your database in a set of tables. Each of the tables in this set has a name that contains the name of the model. Deleting or modifying one of these tables would corrupt the entire model. Therefore, it is recommended that you simply ignore these tables and do not work with them directly. Instead, use the In-Database Analytic Models page of the web console to manage your models.

Some in-database analytic functions generate models into which you can feed new data to make predictions based on that new data. For example, you might generate a naive Bayes model based on the height, shoe size, and gender of a particular population. You could then feed new height and shoe-size data into that model to make predictions about the gender of each person in the new data set.

## General methods, functions, and operators

The following table lists the general methods, functions, and operators that can be applied to an IDA data frame and, for each, the corresponding data frame method, function, or operator.

| For use with an IDA data frame                                                        | For use with a data frame                                                             | Description                                              |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| as.data.frame                                                                         | as.data.frame                                                                         | Load data from an IDA data frame into a data frame       |
| colnames, cor, cov, dim, head, length, max, mean, min, names, print, sd, summary, var | colnames, cor, cov, dim, head, length, max, mean, min, names, print, sd, summary, var | Same for both data frame and IDA data frame              |
| idaCreateView                                                                         | \-                                                                                    | Create a view that is based on an IDA data frame         |
| idaMerge                                                                              | merge                                                                                 | Merge (join) two tables                                  |
| idaSample                                                                             | sample                                                                                | Draw a random sample                                     |

## Functions for interacting with data in the database

The `ibmdbR` package provides additional functions for interacting with data in the database. The following table contains a summary.

| Function                    | Description                                                                      |
| --------------------------- | -------------------------------------------------------------------------------- |
| idaShowTables               | Show all tables and views in the current schema                                  |
| idaExistTable, idaIsView    | Check whether table or view exists and check its type                            |
| idaDeleteTable, idaDropView | Delete a table or view                                                           |
| idaQuery, idaScalarQuery    | Query the database                                                               |
| as.ida.data.frame           | Load a data frame into a database and return an IDA data frame that points to it |

## Storing R objects in the database

Storing R objects in the database (as opposed to in local memory or in a local file system) makes it easier to share them among users. Each user is assigned two tables for R object storage:

-   A private table, to which only that user has access
-   A public table, which can be read by other users

Use a data structure called an IDA list to generate a pointer to either of these tables, and use the pointer to list, store, or retrieve R objects. For more information, enter `?ida.list` at the R prompt.



***

## Appendix: Links

- [[Tools]]
- [[Development]]
- [[R]]
- [[R Database Packages]]


*Backlinks:*

```dataview
list from [[R Package - ibmdbR]] AND -"Changelog"
```