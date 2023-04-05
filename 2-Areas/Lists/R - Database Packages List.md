# R Database Packages

 > 
 > Curated list of R Database Packages.

<center><image src="https://i.imgur.com/tD8izA1.png"/></center>

## Contents

* [Overview](R%20-%20Database%20Packages%20List.md#overview)
* [Relational Databases](R%20-%20Database%20Packages%20List.md#relational-databases)
  * [Relational Database Packages](R%20-%20Database%20Packages%20List.md#relational-database-packages)
* [Non-Relational Databases](R%20-%20Database%20Packages%20List.md#non-relational-databases)
  * [Non-Relational Database Packages](R%20-%20Database%20Packages%20List.md#non-relational-database-packages)
* [Database Tools](R%20-%20Database%20Packages%20List.md#database-tools)
* [Resources](R%20-%20Database%20Packages%20List.md#resources)
* [Index: All R Database Packages](R%20-%20Database%20Packages%20List.md#index-all-r-database-packages)
  * [Core Packages](R%20-%20Database%20Packages%20List.md#core-packages)
  * [PostgreSQL](R%20-%20Database%20Packages%20List.md#postgresql)
  * [SQL Server](R%20-%20Database%20Packages%20List.md#sql-server)
  * [MySQL](R%20-%20Database%20Packages%20List.md#mysql)
  * [SQLite](R%20-%20Database%20Packages%20List.md#sqlite)
  * [Others](R%20-%20Database%20Packages%20List.md#others)
  * [Utility Packages](R%20-%20Database%20Packages%20List.md#utility-packages)
  * [Testing and Validation](R%20-%20Database%20Packages%20List.md#testing-and-validation)
  * [Configuration and Connections](R%20-%20Database%20Packages%20List.md#configuration-and-connections)
* [Appendix: Links](R%20-%20Database%20Packages%20List.md#appendix-links)

## Overview

As datasets become larger and larger, it is impossible for people to save them in traditional file formats such as spreadsheet, raw text file, etc., which could not fit on devices with limited storage and could not be easily shared across collaborators. Instead, people nowadays tend to store data in databases for more scalable and reliable data management.

Database systems are often classified based on the [database models](https://en.wikipedia.org/wiki/Database_model) that they support. 

## Relational Databases

* [Relational databases](https://en.wikipedia.org/wiki/Relational_database) became dominant in the 1980s. The data in relational databases is modeled as rows and columns in a series of tables with the use of [SQL](https://en.wikipedia.org/wiki/SQL) to express the logic for writing and querying data. 
  * The tables are relational, e.g. you have a user who users your software and those software have creators and contributors. 

This section includes packages that provides access to relational databases within R.

### Relational Database Packages

* [DBI](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20DBI.md) - The `r pkg("DBI", priority = "core")` package provides a database interface definition for communication between R and relational database management systems. It's worth noting that some packages try to follow this interface definition (DBI-compliant) but many existing packages don't.

* [RODBC](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RODBC.md) -  The `r pkg("RODBC")` package provides access to databases through an `ODBC` interface.

* [RMariaDB](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RMariaDB.md) -  The `r pkg("RMariaDB")` package provides a DBI-compliant interface to [MariaDB](https://mariadb.org/) and [MySQL](https://www.mysql.com/).

* [RMySQL](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RMySQL.md) - The `r pkg("RMySQL")` package provides the interface to *MySQL*. Note that this is the legacy DBI interface to MySQL and MariaDB based on old code ported from S-PLUS. A modern MySQL client based on `Rcpp` is available from the RMariaDB package we listed above.

* Packages for [PostgreSQL](https://www.postgresql.org/), an open-source relational database:
  
  * [RPostgreSQL](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RPostgreSQL.md) and [RPostgres](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RPostgres.md) - The `r pkg("RPostgreSQL")` package and `r pkg("RPostgres")` package both provide fully DBI-compliant, Rcpp-backed interfaces to [PostgreSQL](../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md).
  * [rpostgis](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20rpostgis.md) - The `r pkg("rpostgis")` package provides the interface to its spatial extension [PostGIS](http://postgis.net/).
  * [RGreenplum](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RGreenplum.md) - The `r pkg("RGreenplum")` provides a fully DBI-compliant interface to [Greenplum](https://greenplum.org/), an open-source parallel database on top of [PostgreSQL](../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md).
* [ROracle](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20ROracle.md) - The `r pkg("ROracle")` package is a DBI-compliant [Oracle database](https://www.oracle.com/database/) driver based on the OCI. 
  
  * The `r pkg("ora")` package provides convenience functions to query and browse a database through the `r pkg("ROracle")` connection.
* Packages for [SQLite](http://www.sqlite.org/), a self-contained, high-reliability, embedded, full-featured, public-domain, SQL database engine:
  
  * [RSQLite](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RSQLite.md) - The `r pkg("RSQLite")` package embeds the [SQLite](../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/SQLite.md) database engine in R and provides an interface compliant with the [DBI](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20DBI.md) package.
  * [filehashSQLite](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20filehashSQLite.md) - The `r pkg("filehashSQLite")` package is a simple key-value database using [SQLite](../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/SQLite.md) as the backend.
  * [liteq](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20liteq.md) - The `r pkg("liteq")` package provides temporary and permanent message queues for R, built on top of [SQLite](../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/SQLite.md).
* [bigrquery](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20bigrquery.md) - The `r pkg("bigrquery")` package provides the interface to [Google BigQuery](https://developers.google.com/bigquery/), Google's fully managed, petabyte scale, low cost analytics [Data Warehouse](../../0-Slipbox/Data%20Warehouse.md).

* [RDruid](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RDruid.md) - The `r github("druid-io/RDruid")` package on [GitHub](../../3-Resources/Tools/Developer%20Tools/Version%20Control/GitHub.md) provides the interface to [Apache Druid](https://druid.apache.org/), a high performance analytics data store for event-driven data.

* [RH2](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RH2.md) - The `r pkg("RH2")` package provides the interface to [H2 Database Engine](http://www.h2database.com/), the Java SQL database.

* [influxdbr](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20influxdbr.md) - The `r pkg("influxdbr")` package provides the interface to [InfluxDB](https://docs.influxdata.com/influxdb), a time series database designed to handle high write and query loads.

* [odbc](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20odbc.md) - The `r pkg("odbc", priority = "core")` package provides a DBI-compliant interface to drivers of [Open Database Connectivity (ODBC)](https://msdn.microsoft.com/en-us/library/ms710252(v=vs.85).aspx), which is a low-level, high-performance interface that is designed specifically for relational data stores.

* [RPresto](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RPresto.md) - The `r pkg("RPresto")` package implements a DBI-compliant interface to [Presto](https://prestodb.io/), an open source distributed SQL query engine for running interactive analytic queries against data sources of all sizes ranging from gigabytes to petabytes.

* [RJDBC](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RJDBC.md) - The `r pkg("RJDBC")` package is an implementation of R's DBI interface using `JDBC` as a back-end. This allows R to connect to any [Database Management System (DBMS)](../../0-Slipbox/Database%20Management%20System%20%28DBMS%29.md) that has a `JDBC` driver.

* [implyr](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20implyr.md) - The `r pkg("implyr")` package provides the back-end for [Apache Impala](https://impala.apache.org), which enables low-latency SQL queries on data stored in the [Hadoop](../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/Hadoop.md) Distributed File System (`HDFS`), Apache HBase, Apache Kudu, Amazon Simple Storage Service ([S3](../../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20S3.md)), *Microsoft Azure Data Lake Store 2* (`ADLS`), and Dell EMC Isilon.

* [dbx](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20dbx.md) - The `r pkg("dbx")` package provides intuitive functions for high performance batch operations and safe inserts/updates/deletes without writing SQL on top of `r pkg("DBI")`. It is designed for both research and production environments and supports multiple database backends such as [PostgreSQL](../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md), *MySQL*, [MariaDB](../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/MariaDB.md), and [SQLite](../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/SQLite.md).

* [sparklyr](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20sparklyr.md) - The `r pkg("sparklyr")` package provides provides a `r pkg("dplyr")` interface to [Apache Spark](https://spark.apache.org/) DataFrames s well as an R interface to Spark's distributed machine learning pipelines.

* [Hmisc](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/General%20R%20Packages/R%20Package%20-%20Hmisc.md) - The `r pkg("Hmisc")` provides a wrapper function `Hmisc::mdb.get()` that uses the [mdbtools](https://github.com/mdbtools/mdbtools) utility to read from [Microsoft Access](../../3-Resources/Tools/Microsoft%20Office/Microsoft%20Access.md) database on Unix-alike systems.

## Non-Relational Databases

Non-relational databases became popular in recent years due to huge demand in storing unstructured data with the use of [NoSQL](https://en.wikipedia.org/wiki/NoSQL) as the query language.
- Users generally don't need to define the data schema up front. If there are changing requirements in the applications, non-relational databases can be much easier to use and manage.

### Non-Relational Database Packages

* Packages for [Redis](https://redis.io/), an open-source, in-memory data structure store that can be used as a database, cache and message broker:
  
  * [RcppRedis](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RcppRedis.md) - The `r pkg("RcppRedis")` package provides interface to Redis using `r github("redis/hiredis")`.
  * [redux](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20redux.md) - The `r pkg("redux")` package provides a low-level interface to Redis, allowing execution of arbitrary Redis commands with almost no interface, and a high-level generated interface to more than 200 redis commands.
* Packages for [Elasticsearch](http://elasticsearch.org/), an open-source, RESTful, distributed search and analytics engine:
  
  * [elastic](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20elastic.md) - The `r pkg("elastic")` package provides a general purpose interface to Elasticsearch.
  * [uptasticsearch](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20uptasticsearch.md) - The `r pkg("uptasticsearch")` package is a Elasticsearch client tailored to data science workflows.
* [mongolite](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20mongolite.md) - The `r pkg("mongolite")` package provides a high-level, high-performance [MongoDB](https://www.mongodb.com/) client based on `r github("mongodb/mongo-c-driver")`, including support for aggregation, indexing, map-reduce, streaming, SSL encryption and SASL authentication.

* [R4CouchDB](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20R4CouchDB.md) - The `r pkg("R4CouchDB")` package provides a collection of functions for basic database and document management operations in [CouchDB](http://couchdb.apache.org/).

* [RCassandra](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RCassandra.md) - The `r pkg("RCassandra")` package provides a direct interface (without the use of Java) to the most basic functionality of [Apache Cassanda](http://cassandra.apache.org/) such as login, updates and queries.

* [aws.dynamodb](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20aws.dynamodb.md) - The `r github("cloudyr/aws.dynamodb")` package on GitHub provides access to [Amazon DynamoDB](https://aws.amazon.com/dynamodb/).

* [rrocksdb](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20rrocksdb.md) - The `r github("mrcsparker/rrocksdb")` package on GitHub provides access to [RocksDB](http://rocksdb.org/).

## Database Tools

This section includes packages that provides tools for working and testing with databases, databases table manipulations, etc.

* [pool](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20pool.md) - The `r pkg("pool")` package enables the creation of object pools, which make it less computationally expensive to fetch a new object.
* [DBITest](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20DBITest.md) - The `r pkg("DBItest")` package is a helper that tests DBI back ends for conformity to the interface.
* [dbplyr](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20dbplyr.md) - The `r pkg("dbplyr")` package is a `r pkg("dplyr")` back-end for databases that allows you to work with remote database tables as if they are in-memory data frames. Basic features works with any database that has a DBI back-end; more advanced features require SQL translation to be provided by the package author.
* [sqldf](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20sqldf.md) - The `r pkg("sqldf")` package provides functionalities to manipulate R Data Frames Using SQL.
* [pointblank](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20pointblank.md) - The `r pkg("pointblank")` package provides tools to validate data tables in databases such as [PostgreSQL](../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md) and *MySQL*.
* [TScompare](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20TScompare.md) - The `r pkg("TScompare")` package provides utilities for comparing the equality of series on two databases.
* [dittodb](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20dittodb.md) - The `r pkg("dittodb")` package provides functionality to test database interactions with any `r pkg("DBI")` compliant database backend. It includes functionality to use fixtures instead of direct database calls during testing as well as functionality to record those fixtures when interacting with a real database for later use in tests.
* [tfio](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20tfio.md) - The `r pkg("tfio")` package provides the ability to use [Apache Ignite](https://ignite.apache.org/), which handles distributed database management for high-performance computing with in-memory speed.
* *dbr* - The `r github("daroczig/dbr")` package on GitHub provides convenient database connections and queries from R using YAML configuration files and templates.
* [rocker](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20rocker%201.md) - The `r pkg("rocker")` package provides a `r pkg("R6")` class interface for handling relational database connections using `r pkg("DBI")` as backend. The purpose is having an intuitive object allowing straightforward handling of SQL databases.

## Resources

* [CRAN Task View: Databases with R (r-project.org)](https://cran.r-project.org/web/views/Databases.html)
* [Databases/Databases.md at main · cran-task-views/Databases (github.com)](https://github.com/cran-task-views/Databases/blob/main/Databases.md)
* [Databases using R (rstudio.com)](https://db.rstudio.com/)
* [DBI package web page](https://dbi.r-dbi.org/)
* [RStudio: Databases using R](https://db.rstudio.com/)

## Index: All R Database Packages

### Core Packages

* [DBI](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20DBI.md)
* [RODBC](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RODBC.md)
* [odbc](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20odbc.md)
* [RJDBC](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RJDBC.md)
* [pool](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20pool.md)
* [dbplyr](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20dbplyr.md)
* [dplyr](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Data%20Manipulation%20Packages/R%20Package%20-%20dplyr.md)
* [sqldf](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20sqldf.md)

### PostgreSQL

* [RPostgres](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RPostgres.md)
* [RPostgreSQL](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RPostgreSQL.md)
* [rpostgis](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20rpostgis.md)

### SQL Server

* [MSSQL](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20MSSQL.md)
* [importTablesMSSQL](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20importTablesMSSQL.md)

*Code:*

* [mssql_rstudio](../Code/R/R%20-%20mssql_rstudio.md)
* [docker_shiny_mssql](../Code/R/R%20-%20docker_shiny_mssql.md)

*Outdated:*

* [MsSqlTools](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20MsSqlTools.md)
* [mssqlR](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20mssqlR.md)

### MySQL

* [RMySQL](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RMySQL.md)

### SQLite

* [RSQLite](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RSQLite.md)
* [liteq](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20liteq.md)

### Others

**Redis:**

* [R Package - redux](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20redux.md)
* *R Package - Redis*
* [R Package - RcppRedis](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RcppRedis.md)

**BigQuery:**

* [R Package - bigrquery](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20bigrquery.md)

**MariaDB:**

* [R Package - RMariaDB](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RMariaDB.md)

**Oracle:**

* [R Package - ROracle](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20ROracle.md)

**Miscellaneous:**

* [elastic](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20elastic.md)
* [sparklyr](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20sparklyr.md)
* [RGreenplum](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RGreenplum.md)
* [influxdb](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20influxdb.md)
* [SciDB](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20SciDB.md)
* [ibmdbR](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20ibmdbR.md): provides methods to read data from, write data to, and sample data from a Db2 database. It also provides access methods for in-database analytic functions and functions for storing R objects in the database.

### Utility Packages

* [dbx](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20dbx.md)
* [dbr](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20dbr.md)
* [arkdb](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20arkdb.md)
* [dbcooper](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20dbcooper.md)
* [sqlpetr](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20sqlpetr.md)
* [dbreport](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20dbreport.md)

### Testing and Validation

* [implyr](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20implyr.md)
* [validate](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20validate.md)
* [validatedb](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20validatedb.md)
* [DBITest](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20DBITest.md)
* [pointblank](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20pointblank.md)
* [dittdb](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20dittodb.md)
* [TSCompare](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20TScompare.md)

### Configuration and Connections

* [DatabaseConnector](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20DatabaseConnector.md)
* [DBconnectR](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20DBconnectR.md)
* [connections](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20connections.md)
* [rscontract](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20rscontract.md)
* [config](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/General%20R%20Packages/R%20Package%20-%20config.md)
* [keyring](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/General%20R%20Packages/R%20Package%20-%20keyring.md)

---

## Appendix: Links

*Related Notes:*

* [R - Connect Shiny to PostgreSQL Database](../../0-Slipbox/R%20-%20Connect%20Shiny%20to%20PostgreSQL%20Database.md)

*Parent Notes:*

* [Development](../MOCs/Development.md)
* [Databases](../MOCs/Databases.md)
* [Data Science](../MOCs/Data%20Science.md)
* [Data Engineering](../MOCs/Data%20Engineering.md)
* [Tools](../../3-Resources/Tools/Tools.md)
* [2-Areas/MOCs/R](../MOCs/R.md)
* [RStudio Package Manager](../../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/R%20Package%20Tools/RStudio%20Package%20Manager.md)

*Backlinks:*

````dataview
list from [[R Database Packages]] AND -"Changelog"
````
