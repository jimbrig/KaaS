# Data Warehouse

## What is Data Warehouse?

*Source: [What is a Data Warehouse? | Key Concepts | Amazon Web Services](https://aws.amazon.com/data-warehouse/)*

A data warehouse is a central repository of information that can be analyzed to make more informed decisions. Data flows into a data warehouse from transactional systems, [relational databases](https://aws.amazon.com/relational-database/), and other sources, typically on a regular cadence. Business analysts, data engineers, data scientists, and decision makers access the data through [business intelligence (BI) tools](https://aws.amazon.com/quicksight/), SQL clients, and other analytics applications.

Data and analytics have become indispensable to businesses to stay competitive. Business users rely on reports, dashboards, and analytics tools to extract insights from their data, monitor business performance, and support decision making. Data warehouses power these reports, dashboards, and analytics tools by storing data efficiently to minimize the input and output (I/O) of data and deliver query results quickly to hundreds and thousands of users concurrently.

## How is a data warehouse architected?

A data warehouse architecture is made up of tiers. The top tier is the front-end client that presents results through reporting, analysis, and data mining tools. The middle tier consists of the analytics engine that is used to access and analyze the data. The bottom tier of the architecture is the database server, where data is loaded and stored. Data is stored in two different types of ways: 1) data that is accessed frequently is stored in very fast storage (like SSD drives) and 2) data that is infrequently accessed is stored in a cheap object store, like Amazon S3. The data warehouse will automatically make sure that frequently accessed data is moved into the “fast” storage so query speed is optimized.

## How does a data warehouse work?

A data warehouse may contain multiple databases. Within each database, data is organized into tables and columns. Within each column, you can define a description of the data, such as integer, data field, or string. Tables can be organized inside of schemas, which you can think of as folders. When data is ingested, it is stored in various tables described by the schema. Query tools use the schema to determine which data tables to access and analyze.

## What are the benefits of using a data warehouse?

Benefits of a data warehouse include the following:

* Informed decision making
* Consolidated data from many sources
* Historical data analysis
* Data quality, consistency, and accuracy
* Separation of analytics processing from transactional databases, which improves performance of both systems

## How do data warehouses, databases, and data lakes work together?

Typically, businesses use a combination of a database, a data lake, and a data warehouse to store and analyze data. Amazon Redshift’s [lake house architecture](https://aws.amazon.com/redshift/lake-house-architecture/) makes such an integration easy.

As the volume and variety of data increases, it’s advantageous to follow one or more common patterns for working with data across your database, data lake, and data warehouse:

![Land data in a database or datalake, prepare the data, move selected data into a data warehouse, then perform reporting](https://d1.awsstatic.com/diagrams/product-page-diagrams/database-seo-1.270cb06b819915c5f763a0b9f88255e044c4dac5.png "Land data in a database or datalake, prepare the data, move selected data into a data warehouse, then perform reporting")

Image (above): Land data in a database or datalake, prepare the data, move selected data into a data warehouse, then perform reporting.

![Land data in a data warehouse, analyze the data, then share data to use with other AWS Analytics products](https://d1.awsstatic.com/diagrams/product-page-diagrams/product-page-diagram_Data-Warehousing_Use-Case-2.ab2ec085dd9c5f03b1d6a0732ec31d487c4f3e8f.png "Land data in a data warehouse, analyze the data, then share data to use with other AWS Analytics products")

Image (above): Land data in a data warehouse, analyze the data, then share data to use with other analytics and machine learning services.

A data warehouse is specially designed for data analytics, which involves reading large amounts of data to understand relationships and trends across the data. A database is used to capture and store data, such as recording details of a transaction.

Unlike a data warehouse, a data lake is a centralized repository for all data, including structured, semi-structured, and unstructured. A data warehouse requires that the data be organized in a tabular format, which is where the schema comes into play. The tabular format is needed so that SQL can be used to query the data. But not all applications require data to be in tabular format. Some applications, like big data analytics, full text search, and machine learning, can access data even if it is 'semi-structured' or completely unstructured.

### Data Warehouse vs. Data Lake

|Characteristics|Data Warehouse|Data Lake|
|---------------|--------------|---------|
|Data|Relational data from transactional systems, operational databases, and line of business applications|All data, including structured, semi-structured, and unstructured|
|Schema|Often designed prior to the data warehouse implementation but also can be written at the time of analysis (schema-on-write or schema-on-read)|Written at the time of analysis (schema-on-read)|
|Price/Performance|Fastest query results using local storage|Query results getting faster using low-cost storage and decoupling of compute and storage|
|Data quality|Highly curated data that serves as the central version of the truth|Any data that may or may not be curated (i.e. raw data)|
|Users|Business analysts, data scientists, and data developers|Business analysts (using curated data), data scientists, data developers, data engineers, and data architects|
|Analytics|Batch reporting, BI, and visualizations|Machine learning, exploratory analytics, data discovery, streaming, operational analytics, big data, and profiling|

### Data Warehouse vs Database

|Characteristics|Data Warehouse|Transactional Database|
|---------------|--------------|----------------------|
|Suitable workloads|Analytics, reporting, big data|Transaction processing|
|Data source|Data collected and normalized from many sources|Data captured as-is from a single source, such as a transactional system|
|Data capture|Bulk write operations typically on a predetermined batch schedule|Optimized for continuous write operations as new data is available to maximize transaction throughput|
|Data normalization|Denormalized schemas, such as the Star schema or Snowflake schema|Highly normalized, static schemas|
|Data storage|Optimized for simplicity of access and high-speed query performance using columnar storage|Optimized for high throughout write operations to a single row-oriented physical block|
|Data access|Optimized to minimize I/O and maximize data throughput|High volumes of small read operations|

### Data Warehouse vs Data Mart

* [Data Mart](Data%20Mart.md)

A data mart is a data warehouse that serves the needs of a specific team or business unit, like finance, marketing, or sales. It is smaller, more focused, and may contain summaries of data that best serve its community of users. A data mart might be a portion of a data warehouse, too.

|Characteristics|Data Warehouse|Data Mart|
|---------------|--------------|---------|
|Scope|Centralized, multiple subject areas integrated together|Decentralized, specific subject area|
|Users|Organization-wide|A single community or department|
|Data source|Many sources|A single or a few sources, or a portion of data already collected in a data warehouse|
|Size|Large, can be 100's of gigabytes to petabytes|Small, generally up to 10's of gigabytes|
|Design|Top-down|Bottom-up|
|Data detail|Complete, detailed data|May hold summarized data|

## Use Cases

*Source: [A Comprehensible Guide to Building a Data Warehouse in 2022](https://www.scnsoft.com/analytics/data-warehouse/building)*

![](https://i.imgur.com/5GJJeCn.png)

---

### Appendix: Related

* [Data Lake](Data%20Lake.md)
* [Data Mart](Data%20Mart.md)
* [Databases](../2-Areas/MOCs/Databases.md)
* [AWS Redshift](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20Redshift.md)
* [AWS Athena](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20Athena.md)
* [AWS QuickSight](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20QuickSight.md)
* [AWS Glue](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20Glue.md)
* [Features of a Data Warehouse](Features%20of%20a%20Data%20Warehouse.md)
