---
Date: 2022-01-12
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/List", "#Type/Tool/R", "#Type/Tool/Database", "#Topic/Dev/R", "#Topic/Dev/R", "#Topic/Dev/Database"]
Alias: R Database Packages
---

# R Database Packages

> Curated list of R Database Packages.

<center><image src="https://i.imgur.com/tD8izA1.png"/></center>

## Contents

- [[#Overview|Overview]]
- [[#Relational Databases|Relational Databases]]
	- [[#Relational Database Packages|Relational Database Packages]]
- [[#Non-Relational Databases|Non-Relational Databases]]
	- [[#Non-Relational Database Packages|Non-Relational Database Packages]]
- [[#Database Tools|Database Tools]]
- [[#Resources|Resources]]
- [[#Index: All R Database Packages|Index: All R Database Packages]]
	- [[#Core Packages|Core Packages]]
	- [[#PostgreSQL|PostgreSQL]]
	- [[#SQL Server|SQL Server]]
	- [[#MySQL|MySQL]]
	- [[#SQLite|SQLite]]
	- [[#Others|Others]]
	- [[#Utility Packages|Utility Packages]]
	- [[#Testing and Validation|Testing and Validation]]
	- [[#Configuration and Connections|Configuration and Connections]]
- [[#Appendix: Links|Appendix: Links]]



## Overview

As datasets become larger and larger, it is impossible for people to save them in traditional file formats such as spreadsheet, raw text file, etc., which could not fit on devices with limited storage and could not be easily shared across collaborators. Instead, people nowadays tend to store data in databases for more scalable and reliable data management.

Database systems are often classified based on the [database models](https://en.wikipedia.org/wiki/Database_model) that they support. 

## Relational Databases

- [Relational databases](https://en.wikipedia.org/wiki/Relational_database) became dominant in the 1980s. The data in relational databases is modeled as rows and columns in a series of tables with the use of [SQL](https://en.wikipedia.org/wiki/SQL) to express the logic for writing and querying data. 
    - The tables are relational, e.g. you have a user who users your software and those software have creators and contributors. 

This section includes packages that provides access to relational databases within R.

### Relational Database Packages

- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - DBI|DBI]] - The `r pkg("DBI", priority = "core")` package provides a database interface definition for communication between R and relational database management systems. It's worth noting that some packages try to follow this interface definition (DBI-compliant) but many existing packages don't.
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RODBC|RODBC]] -  The `r pkg("RODBC")` package provides access to databases through an `ODBC` interface.
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RMariaDB|RMariaDB]] -  The `r pkg("RMariaDB")` package provides a DBI-compliant interface to [MariaDB](https://mariadb.org/) and [MySQL](https://www.mysql.com/).
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RMySQL|RMySQL]] - The `r pkg("RMySQL")` package provides the interface to [[MySQL]]. Note that this is the legacy DBI interface to MySQL and MariaDB based on old code ported from S-PLUS. A modern MySQL client based on `Rcpp` is available from the RMariaDB package we listed above.

- Packages for [PostgreSQL](https://www.postgresql.org/), an open-source relational database:
    - [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RPostgreSQL|RPostgreSQL]] and [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RPostgres|RPostgres]] - The `r pkg("RPostgreSQL")` package and `r pkg("RPostgres")` package both provide fully DBI-compliant, Rcpp-backed interfaces to [[PostgreSQL]].
    - [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - rpostgis|rpostgis]] - The `r pkg("rpostgis")` package provides the interface to its spatial extension [PostGIS](http://postgis.net/).
    - [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RGreenplum|RGreenplum]] - The `r pkg("RGreenplum")` provides a fully DBI-compliant interface to [Greenplum](https://greenplum.org/), an open-source parallel database on top of [[PostgreSQL]].
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - ROracle|ROracle]] - The `r pkg("ROracle")` package is a DBI-compliant [Oracle database](https://www.oracle.com/database/) driver based on the OCI. 
    - The `r pkg("ora")` package provides convenience functions to query and browse a database through the `r pkg("ROracle")` connection.

- Packages for [SQLite](http://www.sqlite.org/), a self-contained, high-reliability, embedded, full-featured, public-domain, SQL database engine:
    - [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RSQLite|RSQLite]] - The `r pkg("RSQLite")` package embeds the [[SQLite]] database engine in R and provides an interface compliant with the [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - DBI|DBI]] package.
    - [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - filehashSQLite|filehashSQLite]] - The `r pkg("filehashSQLite")` package is a simple key-value database using [[SQLite]] as the backend.
    - [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - liteq|liteq]] - The `r pkg("liteq")` package provides temporary and permanent message queues for R, built on top of [[SQLite]].

- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - bigrquery|bigrquery]] - The `r pkg("bigrquery")` package provides the interface to [Google BigQuery](https://developers.google.com/bigquery/), Google's fully managed, petabyte scale, low cost analytics [[Data Warehouse]].
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RDruid|RDruid]] - The `r github("druid-io/RDruid")` package on [[GitHub]] provides the interface to [Apache Druid](https://druid.apache.org/), a high performance analytics data store for event-driven data.
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RH2|RH2]] - The `r pkg("RH2")` package provides the interface to [H2 Database Engine](http://www.h2database.com/), the Java SQL database.
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - influxdbr|influxdbr]] - The `r pkg("influxdbr")` package provides the interface to [InfluxDB](https://docs.influxdata.com/influxdb), a time series database designed to handle high write and query loads.
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - odbc|odbc]] - The `r pkg("odbc", priority = "core")` package provides a DBI-compliant interface to drivers of [Open Database Connectivity (ODBC)](https://msdn.microsoft.com/en-us/library/ms710252(v=vs.85).aspx), which is a low-level, high-performance interface that is designed specifically for relational data stores.
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RPresto|RPresto]] - The `r pkg("RPresto")` package implements a DBI-compliant interface to [Presto](https://prestodb.io/), an open source distributed SQL query engine for running interactive analytic queries against data sources of all sizes ranging from gigabytes to petabytes.
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RJDBC|RJDBC]] - The `r pkg("RJDBC")` package is an implementation of R's DBI interface using `JDBC` as a back-end. This allows R to connect to any [[Database Management System (DBMS)]] that has a `JDBC` driver.
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - implyr|implyr]] - The `r pkg("implyr")` package provides the back-end for [Apache Impala](https://impala.apache.org), which enables low-latency SQL queries on data stored in the [[Hadoop]] Distributed File System (`HDFS`), Apache HBase, Apache Kudu, Amazon Simple Storage Service ([[AWS S3|S3]]), [[Microsoft Azure Data Lake Store]] (`ADLS`), and Dell EMC Isilon.
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - dbx|dbx]] - The `r pkg("dbx")` package provides intuitive functions for high performance batch operations and safe inserts/updates/deletes without writing SQL on top of `r pkg("DBI")`. It is designed for both research and production environments and supports multiple database backends such as [[PostgreSQL]], [[MySQL]], [[MariaDB]], and [[SQLite]].
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - sparklyr|sparklyr]] - The `r pkg("sparklyr")` package provides provides a `r pkg("dplyr")` interface to [Apache Spark](https://spark.apache.org/) DataFrames s well as an R interface to Spark's distributed machine learning pipelines.
- [[3-Resources/Tools/R/R Packages/General R Packages/R Package - Hmisc|Hmisc]] - The `r pkg("Hmisc")` provides a wrapper function `Hmisc::mdb.get()` that uses the [mdbtools](https://github.com/mdbtools/mdbtools) utility to read from [[Microsoft Access]] database on Unix-alike systems.


## Non-Relational Databases

Non-relational databases became popular in recent years due to huge demand in storing unstructured data with the use of [NoSQL](https://en.wikipedia.org/wiki/NoSQL) as the query language.
    - Users generally don't need to define the data schema up front. If there are changing requirements in the applications, non-relational databases can be much easier to use and manage.

### Non-Relational Database Packages

- Packages for [Redis](https://redis.io/), an open-source, in-memory data structure store that can be used as a database, cache and message broker:
    - [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RcppRedis|RcppRedis]] - The `r pkg("RcppRedis")` package provides interface to Redis using `r github("redis/hiredis")`.
    - [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - redux|redux]] - The `r pkg("redux")` package provides a low-level interface to Redis, allowing execution of arbitrary Redis commands with almost no interface, and a high-level generated interface to more than 200 redis commands.

- Packages for [Elasticsearch](http://elasticsearch.org/), an open-source, RESTful, distributed search and analytics engine:
    - [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - elastic|elastic]] - The `r pkg("elastic")` package provides a general purpose interface to Elasticsearch.
    - [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - uptasticsearch|uptasticsearch]] - The `r pkg("uptasticsearch")` package is a Elasticsearch client tailored to data science workflows.

- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - mongolite|mongolite]] - The `r pkg("mongolite")` package provides a high-level, high-performance [MongoDB](https://www.mongodb.com/) client based on `r github("mongodb/mongo-c-driver")`, including support for aggregation, indexing, map-reduce, streaming, SSL encryption and SASL authentication.
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - R4CouchDB|R4CouchDB]] - The `r pkg("R4CouchDB")` package provides a collection of functions for basic database and document management operations in [CouchDB](http://couchdb.apache.org/).
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RCassandra|RCassandra]] - The `r pkg("RCassandra")` package provides a direct interface (without the use of Java) to the most basic functionality of [Apache Cassanda](http://cassandra.apache.org/) such as login, updates and queries.
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - aws.dynamodb|aws.dynamodb]] - The `r github("cloudyr/aws.dynamodb")` package on GitHub provides access to [Amazon DynamoDB](https://aws.amazon.com/dynamodb/).
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - rrocksdb|rrocksdb]] - The `r github("mrcsparker/rrocksdb")` package on GitHub provides access to [RocksDB](http://rocksdb.org/).

## Database Tools

This section includes packages that provides tools for working and testing with databases, databases table manipulations, etc.

- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - pool|pool]] - The `r pkg("pool")` package enables the creation of object pools, which make it less computationally expensive to fetch a new object.
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - DBITest|DBITest]] - The `r pkg("DBItest")` package is a helper that tests DBI back ends for conformity to the interface.
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - dbplyr|dbplyr]] - The `r pkg("dbplyr")` package is a `r pkg("dplyr")` back-end for databases that allows you to work with remote database tables as if they are in-memory data frames. Basic features works with any database that has a DBI back-end; more advanced features require SQL translation to be provided by the package author.
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - sqldf|sqldf]] - The `r pkg("sqldf")` package provides functionalities to manipulate R Data Frames Using SQL.
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - pointblank|pointblank]] - The `r pkg("pointblank")` package provides tools to validate data tables in databases such as [[PostgreSQL]] and [[MySQL]].
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - TScompare|TScompare]] - The `r pkg("TScompare")` package provides utilities for comparing the equality of series on two databases.
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - dittodb|dittodb]] - The `r pkg("dittodb")` package provides functionality to test database interactions with any `r pkg("DBI")` compliant database backend. It includes functionality to use fixtures instead of direct database calls during testing as well as functionality to record those fixtures when interacting with a real database for later use in tests.
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - tfio|tfio]] - The `r pkg("tfio")` package provides the ability to use [Apache Ignite](https://ignite.apache.org/), which handles distributed database management for high-performance computing with in-memory speed.
- [[R Package dbr|dbr]] - The `r github("daroczig/dbr")` package on GitHub provides convenient database connections and queries from R using YAML configuration files and templates.
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - rocker 1|rocker]] - The `r pkg("rocker")` package provides a `r pkg("R6")` class interface for handling relational database connections using `r pkg("DBI")` as backend. The purpose is having an intuitive object allowing straightforward handling of SQL databases.

## Resources

- [CRAN Task View: Databases with R (r-project.org)](https://cran.r-project.org/web/views/Databases.html)
- [Databases/Databases.md at main · cran-task-views/Databases (github.com)](https://github.com/cran-task-views/Databases/blob/main/Databases.md)
- [Databases using R (rstudio.com)](https://db.rstudio.com/)
- [DBI package web page](https://dbi.r-dbi.org/)
- [RStudio: Databases using R](https://db.rstudio.com/)


## Index: All R Database Packages

### Core Packages

- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - DBI|DBI]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RODBC|RODBC]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - odbc|odbc]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RJDBC|RJDBC]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - pool|pool]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - dbplyr|dbplyr]]
- [[3-Resources/Tools/R/R Packages/Data Manipulation Packages/R Package - dplyr|dplyr]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - sqldf|sqldf]]

### PostgreSQL

- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RPostgres|RPostgres]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RPostgreSQL|RPostgreSQL]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - rpostgis|rpostgis]]

### SQL Server

- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - MSSQL|MSSQL]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - importTablesMSSQL|importTablesMSSQL]]

*Code:*

- [[mssql_rstudio|mssql_rstudio]]
- [[docker_shiny_mssql|docker_shiny_mssql]]

*Outdated:*

- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - MsSqlTools|MsSqlTools]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - mssqlR|mssqlR]]

### MySQL

- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RMySQL|RMySQL]]

### SQLite

- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RSQLite|RSQLite]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - liteq|liteq]]

### Others

**Redis:**

- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - redux]]
- [[R Package - Redis]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RcppRedis]]

**BigQuery:**

- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - bigrquery]]

**MariaDB:**

- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RMariaDB]]

**Oracle:**

- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - ROracle]]

**Miscellaneous:**

- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - elastic|elastic]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - sparklyr|sparklyr]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - RGreenplum|RGreenplum]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - influxdb|influxdb]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - SciDB|SciDB]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - ibmdbR|ibmdbR]]: provides methods to read data from, write data to, and sample data from a Db2 database. It also provides access methods for in-database analytic functions and functions for storing R objects in the database.

### Utility Packages

- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - dbx|dbx]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - dbr|dbr]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - arkdb|arkdb]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - dbcooper|dbcooper]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - sqlpetr|sqlpetr]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - dbreport|dbreport]]

### Testing and Validation

- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - implyr|implyr]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - validate|validate]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - validatedb|validatedb]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - DBITest|DBITest]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - pointblank|pointblank]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - dittodb|dittdb]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - TScompare|TSCompare]]


### Configuration and Connections

- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - DatabaseConnector|DatabaseConnector]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - DBconnectR|DBconnectR]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - connections|connections]]
- [[3-Resources/Tools/R/R Packages/Database R Packages/R Package - rscontract|rscontract]]
- [[3-Resources/Tools/R/R Packages/General R Packages/R Package - config|config]]
- [[3-Resources/Tools/R/R Packages/General R Packages/R Package - keyring|keyring]]

***

## Appendix: Links

*Related Notes:*

- [[R - Connect Shiny to PostgreSQL Database]]

*Parent Notes:*

- [[Development]]
- [[Databases]]
- [[Data Science]]
- [[Data Engineering]]
- [[Tools]]
- [[R]]
- [[3-Resources/Tools/R/R Packages/R Package Tools/RStudio Package Manager]]

*Backlinks:*

```dataview
list from [[R Database Packages]] AND -"Changelog"
```