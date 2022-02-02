---
Date: 2022-02-02
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool", "#Topic/Dev/DataScience", "#Topic/Dev/Databases"]
Alias: ["Snowflake"]
---

# Snowflake

*Source: [▷ Snowflake Tutorial | What is Snowflake Data Warehouse](https://mindmajix.com/snowflake-tutorial)*

Snowflake is a cloud-based data warehousing platform that is built on top of [[Amazon Web Services]] and is a true [[SaaS]] offering. 

In contrast with traditional [[Data Warehouse]] solutions, Snowflake provides a [data warehouse](../Data%20Science/Data%20Warehouse.md) which is faster, easy to set up, and far more flexible. 

With its unique features, it soon became a leader in data management solutions for analytics.

## Contents

* [What is a Snowflake Data Warehouse?](Snowflake.md#what-is-a-snowflake-data-warehouse)
* [Snowflake Architecture](Snowflake.md#snowflake-architecture)
  * [Snowflake Architectural Layers](Snowflake.md#snowflake-architectural-layers)
    * [1) Database storage in Snowflake](Snowflake.md#1-database-storage-in-snowflake)
    * [2) Query Processing in Snowflake](Snowflake.md#2-query-processing-in-snowflake)
    * [3) Cloud services in Snowflake](Snowflake.md#3-cloud-services-in-snowflake)
* [Connecting to Snowflake](Snowflake.md#connecting-to-snowflake)
* [Loading Data into Snowflake](Snowflake.md#loading-data-into-snowflake)
  * [SnowSQL for Build Loading](Snowflake.md#snowsql-for-build-loading)
  * [Snowpipe](Snowflake.md#snowpipe)
  * [Third-party tools - ETL/ELT](Snowflake.md#third-party-tools-etl-elt)
  * [Web Interface](Snowflake.md#web-interface)
* [Snowflake Cloud Data Warehouse Benefits](Snowflake.md#snowflake-cloud-data-warehouse-benefits)
  * [1) Effortless use](Snowflake.md#1-effortless-use)
  * [2) Performance and speed](Snowflake.md#2-performance-and-speed)
  * [3) Available tools](Snowflake.md#3-available-tools)
  * [4 Seamless data sharing](Snowflake.md#4-seamless-data-sharing)
  * [5 Cost-effective](Snowflake.md#5-cost-effective)
  * [6 Elasticity and flexibility](Snowflake.md#6-elasticity-and-flexibility)
  * [7 Supports multiple data formats](Snowflake.md#7-supports-multiple-data-formats)
  * [8 Scalability](Snowflake.md#8-scalability)
* [Appendix: Related](Snowflake.md#appendix-related)

## What is a Snowflake Data Warehouse?

Snowflake is the first analytics database built with the cloud and delivered as a data warehouse as a service. It can run on popular providers like AWS, Azure, and Google cloud platforms. There is no hardware (virtual or physical) or software needed to install, configure, and manage, entirely runs on public cloud infrastructure. It's ideal for [data warehousing](https://mindmajix.com/data-warehousing/what-is-data-warehousing "What is Data Warehousing?"), data engineering, data lakes, data science, and developing data applications. But what makes it unbeatable is its architecture and data sharing capabilities.

## Snowflake Architecture

[Snowflake architecture](https://mindmajix.com/snowflake-architecture "Learn more about Snowflake Architecture") is built for the cloud. Its unique multi-cluster shared data architecture delivers the performance, concurrency, and elasticity that organizations require. It handles all aspects of authentication, resource management, optimization, data protection, configuration, availability, and more. Snowflake features compute, storage, and global service layers which are physically separated but logically integrated. 

**Let's understand how Snowflake differs from other traditional architectures.**

Shared disk architectures use multiple nodes for accessing shared data on a single storage system, and the Shared nothing architectures store a part of data in each node of the data warehouse. Snowflake combines the benefits of both platforms in an innovative and new design. Snowflake processes the queries using MPP (massively parallel processing) compute clusters, where each node in the cluster stores part of the entire dataset locally. 

Architecturally, the snowflake data warehouse consists of three key layers:

* Database Storage
* Query Processing
* Cloud Services

### Snowflake Architectural Layers

#### 1) Database storage in Snowflake

Snowflake stores all data in databases. A database is a logical grouping of objects, consisting primarily of tables and views, classified into one or more schemas. We can store any kind of structured or semi-structured data in Snowflake, and all the tasks related to data are handled through SQL query operations. The underlying filesystem in Snowflake is managed by S3 in Snowflake's account, where data is encrypted, compressed, and distributed to optimize the performance. 

#### 2) Query Processing in Snowflake

Snowflake processes the queries using cs, where each virtual warehouse(or cluster) can obtain all the data in the storage layer, then run separately, so the warehouses do not share or compete for compute resources. Virtual Warehouses are actually used for the purpose of data loading or running queries and are capable of doing both of these tasks simultaneously. A virtual warehouse can be scaled up or down without any downtime or destruction.

#### 3) Cloud services in Snowflake

The services layer coordinates and handles all other services in Snowflake, including sessions, encryption, SQL compilation, and more. It eliminates the manual data warehousing and tuning requirement. Services in this layer include:

* Authentication
* Infrastructure management
* Metadata management
* Query parsing and optimization
* Access control

By design, all these layers are independently scaled and are redundant.

To know how the different layers work together, let's understand the lifecycle of a query.

After connecting the Snowflake through one of the supported clients and starting a session, the first virtual warehouse submits a query and services layer verifies the authorized access data in the database, and later executes the operations defined in the query, and then creates an optimized query plan. Next, the services layer sends query execution instructions to the virtual warehouse, which allocates resources because any needed data from the storage layer can execute the query. The results are returned to the user.

## Connecting to Snowflake

Snowflake can be connected with other services in many ways:

* web-based User Interface
* ODBC and [JDBC drivers](https://mindmajix.com/jboss/installing-the-jdbc-driver "Installing Jdbc drivers")
* command-line clients
* native connectors 
* Third-party connectors such as [ETL tools](https://mindmajix.com/open-source-etl-tools "Open Source ETL Tools") and BI tools.

## Loading Data into Snowflake

**This section will familiarize you with the fundamentals of loading data into Snowflake. Basically, Snowflake supports four options for data loading.**

1. SnowSQL for bulk loading
1. Snowpipe to automate bulk loading of data
1. WebUI for limited data
1. Third-party tools to bulk load data from external sources.

First, let's see with SnowSQL.

### SnowSQL for Build Loading

Bulk loading of data is performed in two phases, phase 1 is staging files, and phase 2 is loading data. Here we'll focus on loading data from CSV files.

Staging the files - Staging files means uploading data files to a location where Snowflake can access it. Next, load your data from stage files into tables. Snowflake allows you to stage files on internal locations called stages. Internal stages provide secure storage of data files without depending on any external locations.

Loading the data - A virtual warehouse is needed to load data to a snowflake. The warehouse extracts data from each file and inserts it as rows in the table.

We'll see a SnowSQL SQL client loading CSV files from a local machine into a table called Contacts in the demo database demo_db. CSV files. We'll use the name in the internal staging to store the files before loading.

* Use the demo_db database.

````sql
Last login: Sat Sep 19 14:20:05 on ttys011
Superuser-MacBook-Pro: Documents xyzdata$ snowsql -a bulk_data_load
User: peter
Password:
* SnowSQL * V1.1.65
Type SQL statements or !help
* SnowSQL * V1.1.65
Type SQL statements or !help
johndoe#(no warehouse)@(no database).(no schema)>USE DATABASE demo_db;
+----------------------------------------------------+
| status                                             |
|----------------------------------------------------|
| Statement executed successfully.                   |
+----------------------------------------------------+
1 Row(s) produced. Time Elapsed: 0.219s
````

* The tables were created using the following SQL

````sql
peter#(no warehouse)@(DEMO_DB.PUBLIC)>CREATE OR REPLACE TABLE        contacts 
(     
id NUMBER   (38, 0)  
first_name STRING,  
last_name STRING,  
company STRING,  
email STRING,  
workphone STRING,  
cellphone STRING,  
streetaddress STRING,  
city STRING,  
postalcode NUMBER   (38, 0)
);
+----------------------------------------------------+
| status                                             |
|----------------------------------------------------|
| Table CONTACTS successfully created.               |
+----------------------------------------------------+
1 Row(s) produced. Time Elapsed: 0.335s
````

* Next, create an internal stage called csvfiles.

````sql
peter#(no warehouse)@(DEMO_DB.PUBLIC)>CREATE STAGE csvfiles;
        
+----------------------------------------------------+
| status                                             |
|----------------------------------------------------|
| Stage area CSVFILES successfully created.          |
+----------------------------------------------------+
1 Row(s) produced. Time Elapsed: 0.311s
````

* PUT command to stage the records in csvfiles. This command uses a wildcard contacts0\*.csv to load multiple files, @ symbol defines where to stage the files – in this case, @csvfiles.

````sql
peter#(no warehouse)@(DEMO_DB.PUBLIC)>PUT file:///tmp/load/contacts0*.csv @csvfiles;
contacts01.csv_c.gz(0.00MB): [##########] 100.00% Done (0.417s, 0.00MB/s),
contacts02.csv_c.gz(0.00MB): [##########] 100.00% Done (0.377s, 0.00MB/s),
contacts03.csv_c.gz(0.00MB): [##########] 100.00% Done (0.391s, 0.00MB/s),
contacts04.csv_c.gz(0.00MB): [##########] 100.00% Done (0.396s, 0.00MB/s),
contacts05.csv_c.gz(0.00MB): [##########] 100.00% Done (0.399s, 0.00MB/s),

        
+----------------+-------------------+-------------+------------------------+
| source | target | source_size | target_size | status |               
|---------------------------------------------------------------------------|
| contacts01.csv | contacts01.csv.gz | 554 | 412 | UPLOADED |
| contacts02.csv | contacts02.csv.gz | 524 | 400 | UPLOADED |
| contacts03.csv | contacts03.csv.gz | 491 | 399 | UPLOADED |
| contacts04.csv | contacts04.csv.gz | 481 | 388 | UPLOADED |
| contacts05.csv | contacts05.csv.gz | 489 | 376 | UPLOADED |
+------------------+-------------------+-------------+----------------------+
5 Row(s) produced. Time Elapsed: 2.111s
````

* To confirm that the CSV files have been staged, use the LIST command.

````sql
peter#(no warehouse)@(DEMO_DB.PUBLIC)>LIST @csvfiles; 
````

* To load the files from the staged files into the CONTACTS table, specify a virtual warehouse to use.

````sql
peter#(no warehouse)@(DEMO_DB.PUBLIC)>USE WAREHOUSE dataload; 

+----------------------------------------------------+
| status |
|----------------------------------------------------|
| Statement executed successfully. |
+----------------------------------------------------+
1 Row(s) produced. Time Elapsed: 0.203s
````

* Load the staged files into a Snowflake table

````sql
peter#(DATALOAD)@(DEMO_DB.PUBLIC)>COPY INTO contacts;
                    FROM @csvfiles
                    PATTERN = '.*contacts0[1-4].csv.gz'
                    ON_ERROR = 'skip_file';
````

INTO defines where the table data to be loaded, PATTERN specifies the data files to load, and ON_ERROR informs the command when it encounters the errors.

* If the load was successful, you can now query your table using SQL

````sql
peter#(DATALOAD)@(DEMO_DB.PUBLIC)>SELECT * FROM contacts LIMIT 10;
````

### Snowpipe

As we discussed earlier in the post, for bulk loading data in Snowflake, we can also use `Snowpipe` specifically from files staged in external locations. Snowpipe uses COPY command with additional features that let you automate the process. It uses external compute resources to continuously load the data and eliminates the need for a virtual warehouse. 

### Third-party tools - ETL/ELT

For bulk loading of data, third-party tools like ETL/ELT can also be used. Snowflake supports an ever-expanding scope of the ecosystem of applications and services for loading data from a wide range of external sources.

### Web Interface

The final option for loading data is the web Interface. In this, simply select the table you want to choose and click the load button, by this, you can load a limited amount of data into Snowflake. It simplifies loading by combining both the staging and loading data into a single operation and automatically deletes staged files after loading.

## Snowflake Cloud Data Warehouse Benefits

### 1) Effortless use

Snowflake is an overall simple and intuitive interface, which allows you to load and process the data quickly. It solves issues using its exceptional multi-cluster architecture.

### 2) Performance and speed

Cloud's elastic nature enables you to load data faster or run high volumes of queries sometimes. You can up or scale down the virtual warehouse to take advantage of extra compute resources and pay for the only time used. The snowflake platform ensures that the query is processed at an optimal rate with competitive deals.

### 3) Available tools

Using a variety of tools like tableau, [Power BI](../Tools/Business%20Intelligence/Power%20BI.md), etc., can help you run queries against large datasets.

### 4 Seamless data sharing

Snowflake's architecture allows seamless data sharing for any data customer.

### 5 Cost-effective

The Snowflake interface cuts off idle time and only considers the usage time. Both the computing and storage cost has to be paid separately in this cost-optimized platform. Through the compressing and partitioning process, you can save a high price.

### 6 Elasticity and flexibility

It offers higher flexibility, accessibility, elasticity, and value. The user can use both the warehouse and the query services in the same data lake. In terms of usage, the Snowflake is more flexible, as it can be used only when it is needed. 

### 7 Supports multiple data formats

Snowflake supports various formats like XML, JSON, and more. It runs with any kind of structured, semi-structured, and unstructured data to address common issues of handling incongruent data types which exist in a single data warehouse.

### 8 Scalability

Snowflake supports instant data warehouse scaling for handling concurrency bottlenecks during high-demand periods. It scales without the need to redistribute data which can be a significant disruption to end-users.

---

## Appendix: Related

* [Databricks](Databricks.md)
* [Amazon Web Services](../../MOCs/Amazon%20Web%20Services.md)

*Backlinks:*

````dataview
list from [[Snowflake]] AND -"Meta/Changelog"
````


***

## Appendix: Related

- [[Tools]]

*Backlinks:*

```dataview
list from [[Tool-Template]] AND -"Changelog"
```