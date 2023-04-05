# Consideration and Concerns Regarding AWS Data Architecture

## Contents

* [Purpose](Consideration%20and%20Concerns%20Regarding%20AWS%20Data%20Architecture.md#purpose)
* [Architectural Decision](Consideration%20and%20Concerns%20Regarding%20AWS%20Data%20Architecture.md#architectural-decision)
* [References](Consideration%20and%20Concerns%20Regarding%20AWS%20Data%20Architecture.md#references)
* [Technology Overview](Consideration%20and%20Concerns%20Regarding%20AWS%20Data%20Architecture.md#technology-overview)
  * [Amazon Redshift](Consideration%20and%20Concerns%20Regarding%20AWS%20Data%20Architecture.md#amazon-redshift)
  * [Amazon Athena](Consideration%20and%20Concerns%20Regarding%20AWS%20Data%20Architecture.md#amazon-athena)
    * [How is Athena Different from a Traditional Database or Data Warehouse?](Consideration%20and%20Concerns%20Regarding%20AWS%20Data%20Architecture.md#how-is-athena-different-from-a-traditional-database-or-data-warehouse)
* [Concerns with Athena Driven Architecture](Consideration%20and%20Concerns%20Regarding%20AWS%20Data%20Architecture.md#concerns-with-athena-driven-architecture)
  * [AWS Recommendations](Consideration%20and%20Concerns%20Regarding%20AWS%20Data%20Architecture.md#aws-recommendations)
  * [Athena Limitations](Consideration%20and%20Concerns%20Regarding%20AWS%20Data%20Architecture.md#athena-limitations)
  * [Considerations and Concerns with Long Term Architecture](Consideration%20and%20Concerns%20Regarding%20AWS%20Data%20Architecture.md#considerations-and-concerns-with-long-term-architecture)
  * [Business Analysis Based Concerns](Consideration%20and%20Concerns%20Regarding%20AWS%20Data%20Architecture.md#business-analysis-based-concerns)
  * [Use Cases](Consideration%20and%20Concerns%20Regarding%20AWS%20Data%20Architecture.md#use-cases)
* [Business Benefits of a Modern Data Warehouse](Consideration%20and%20Concerns%20Regarding%20AWS%20Data%20Architecture.md#business-benefits-of-a-modern-data-warehouse)

## Purpose

The purpose of this document is to walk through the concerns and considerations surrounding an AWS Athena, Glue, and S3 cloud based data storage and compute architecture versus a relational data warehouse based architecture that can be used in conjunction with the "no database" architecture without limiting developers, analysts, and engineers to only AWS Athena/Glue/S3 based tools and skillsets.

*Note: skip ahead to the section on [Concerns with Athena Driven Architecture](Consideration%20and%20Concerns%20Regarding%20AWS%20Data%20Architecture.md#concerns-with-athena-driven-architecture) if you do not need the technological overview*

## Architectural Decision

Decision needed on whether to utilize and provision an AWS RDS instance, AWS Redshift Data Warehouse, or neither and rely on S3, Athena, and Glue based architecture.

## References

* [Amazon Athena FAQs – Serverless Interactive Query Service – Amazon Web Services](https://aws.amazon.com/athena/faqs/)
* [How to Architect Data Quality on the AWS Cloud | AWS for Industries (amazon.com)](https://aws.amazon.com/blogs/industries/how-to-architect-data-quality-on-the-aws-cloud/)
* [AWS Cloud Data Ingestion Patterns and Practices (awsstatic.com)](https://d1.awsstatic.com/whitepapers/aws-cloud-data-ingestion-patterns-practices.pdf?did=wp_card&trk=wp_card)

## Technology Overview

* **Redshift** is faster and more robust (as long as you’re willing to add compute power), but also more expensive and complicated to manage
* **Athena** makes it is easier to get started and is more flexible in the types of data it can query, but performance is not guaranteed without significant data preparation

Use the following table and resources to continue comparing Redshift and Athena on a feature-by-feature basis:

|**Feature**|**Redshift**|**Athena**|
|-------|--------|------|
|**Setup**|Need to initialize and config cluster, and load data|Instant – no need to setup infrastructure|
|**Partitioning**|Does not support table partitioning; CREATE TABLE is used to define distribution and optimize processing|Data partitions on Hive Metastore correspond to folders on S3, with support for custom partitioning|
|**UDFs**|Users can create user-defined functions using an SQL SELECT clause or Python|Does not support UDFs or UDAFs|
|**Pricing** (details below)|– Dense Compute: $0.25 per hour for dc2.large or $4.80 per hour for dc2.8xlarge<br>– Dense Storage: $0.85 per hour for ds2.xlarge or $6.80 per hour for ds2.8xlarge|– Price per query: $5 per terabyte scanned<br>– Minimum 10mb scanned per query<br>– Storage on [Amazon S3](https://aws.amazon.com/s3/pricing/)|
|**Data formats**|AVRO, CSV, JSON, Parquet, ORC, and TXT.|CSV, TSV, JSON or text files; highly recommended to store data in columnar format such as Apache Parquet or Apache ORC|
|**Primary Keys**|No-build in constraint on primary key; needs to be declared at onset|No indexing, as it works on top of S3; no primary keys|
|**Security**|Cluster-level security with support for encryption|Relies on Amazon Identity Management (IAM); access to data based on S3 permissions; can read encrypted data from S3|

### Amazon Redshift

Amazon Redshift is a cloud data warehouse optimized for analytics performance.

* Cloud data warehouse based on PostgreSQL
* Composed of leader nodes and compute nodes. Users can scale by adding compute nodes as needed
* Coupled architecture (storage and compute); serverless functionality available via Redshift Spectrum

There’s a metric ton more that can be said about each of these tools – the AWS website would be a good place to start if you want to further your research ([Redshift](https://aws.amazon.com/redshift/), [Athena](https://aws.amazon.com/athena/)). 

### Amazon Athena

Amazon Athena is an interactive query service based on the open-source Apache Presto, that enables you to directly analyze data stored in Amazon S3 using ANSI SQL. Athena is serverless so there is no infrastructure to manage and maintain, and you only pay for the queries you run.

In order to start using Athena, you need to define the schema of your data stored in Amazon S3 and then you are ready to start querying it using SQL. The schema is defined using Amazon Glue Data Catalog which enables you to create a unified metadata repository across multiple services.

Athena can be used alongside or instead of traditional databases, depending on the specific business and technical scenario. However, it’s important to understand the differences between the two, and why you would choose one over the other.

Amazon Athena is a serverless query engine used to retrieve data from Amazon S3 using SQL.

* Serverless query service – AWS manages all infrastructure aspects
* Works on top of Amazon S3 object storage
* Typically only read-only and does not alter data on S3; however query results can be written to S3
* Uses ANSI SQL and Presto to query data
* Utilizes Amazon Glue as a Hive Metastore

#### How is Athena Different from a Traditional Database or Data Warehouse?

Athena is not a database but rather a **query engine.** This means that:

* Compute and storage are separate: databases both store data in rest, and provision the resources needed in order to perform queries and calculations. Each of these comes with direct and indirect overheads. Athena doesn’t store data – instead, storage is managed entirely on Amazon S3. Athena’s query service is fully managed, so that resources are allocated automatically by AWS as needed in order to perform a query.

* No DML interface – with Athena there is no need to model the data. I/O is a bottleneck in virtually every database, but with Athena this is a non-issue. And since you don’t need to waste I/O bandwidth on modeling the data, you can focus all compute resources on query processing.

## Concerns with Athena Driven Architecture

### AWS Recommendations

Directly from the [AWS Athena FAQ](https://aws.amazon.com/athena/faqs/):

**Redshift is the more natural choice for data warehouse reporting, Athena for ad-hoc queries against S3 storage.**

"Redshift would be the better choice if you have data coming in from diverse sources and you would like to transform that data, enforce consistent schema and formats, and create a single source that feeds a large number of business intelligence and reporting tools across the organization."

"Amazon Redshift provides the fastest query performance for enterprise reporting and business intelligence workloads, particularly those involving extremely complex SQL with multiple joins and sub-queries."

"Amazon Athena provides the easiest way to run interactive queries for data in S3 without the need to setup or manage any servers."

"When should you use a full featured enterprise data warehouse, like Amazon Redshift vs. a query service like Amazon Athena?"

* "A data warehouse like Amazon Redshift is your best choice when you need to pull together data from many different sources – like inventory systems, financial systems, and retail sales systems – into a common format, and store it for long periods of time, to build sophisticated business reports from historical data; then a data warehouse like Amazon Redshift is the best choice."
* "Data warehouses collect data from across the company and act as the “single source of truth” for report generation and analysis. Data warehouses pull data from many sources, format and organize it, store it, and support complex, high speed queries that produce business reports. The query engine in Amazon Redshift has been optimized to perform especially well on this use case - where you need to run complex queries that join large numbers of very large database tables. TPC-DS is a standard benchmark designed to replicate this use case, and Redshift runs these queries up to 20x faster than query services that are optimized for unstructured data. When you need to run queries against highly structured data with lots of joins across lots of very large tables, you should choose Amazon Redshift."
* "By comparison, query services like Amazon Athena make it easy to run interactive queries against data directly in Amazon S3 without worrying about formatting data or managing infrastructure. For example, Athena is great if you just need to run a quick query on some web logs to troubleshoot a performance issue on your site. With query services, you can get started fast. You just define a table for your data and start querying using standard SQL."
* "You can also use both services together. If you stage your data on Amazon S3 before loading it into Amazon Redshift, that data can also be registered with and queried by Amazon Athena."

### Athena Limitations

* **Optimization is limited to queries:** You can optimize your queries, not your data. Your data is already stored in Amazon S3; performing transformations for the sake of using Athena may affect others using the same data for other purposes. This needs to be addressed as part of your ETL process.

* **Multi-tenancy means pooled resources:** All users of Athena receive a similar SLA for queries at any given time. In other words, the entire global user base is “competing” for the same resources – and while AWS provisions more of these as needed, it could mean that [query performance fluctuates](https://www.upsolver.com/blog/benchmarking-aws-athena-bigquery-performance-price) based on other people’s usage.

* **No indexing:**  Indices are built-in to traditional databases, but do not exist in Athena. This makes joins between large tables a heavy operation that increases the load on Athena negatively impacts performance, while running a query by key requires scanning all of the data and then searching for the required key in the list of results.

* **Partitioning:** Efficient queries in Athena require you to [partition your data](https://www.upsolver.com/blog/partitioning-data-s3-improve-performance-athena-presto). It is important to keep the number of partitions in a ballpark that suits your performance needs. As a rule of thumb, every 500 partitions you scan adds 1 second to your query.

* **Requires Additional AWS Services** - Athena is never a stand-alone product but rather always part of a stack that includes:
  
  * [**Amazon S3**](https://aws.amazon.com/s3/): Athena queries run directly on top of Amazon S3, so this is where your data will be stored.
  * [**Glue Data Catalog**](https://docs.aws.amazon.com/glue/latest/dg/components-overview.html): A centralized managed schema that enables you to replace or supplement Athena with additional services as needed (for example with Amazon Redshift Spectrum).
  * **ETL tools**: While Athena can run almost any query out-of-the-box, reducing costs and improving performance requires adherence to a set of performance tuning best practices. 

### Considerations and Concerns with Long Term Architecture

* Have we considered **vendor lock-in**?
  * SQL based architecture is cloud agnostic, portable, reproducible, and future proof

### Business Analysis Based Concerns

* How will end-user client applications, data marts, and BI developers access and query the required reporting level data?
* How are relationships between tables and referential integrity maintained?
* How to setup external connections to important reporting data?
* Have we considered learning curve of Athena and Glue vs. SQL?
* How do we track historical insights and trends?
* Is this architecture as efficient as a SQL based database? Have we tested power/speed diagnostics for analytical processing?
* Can this architecture scale over time?
* Does this architecture limit business intelligence analysts to specific BI tools (i.e. can only use QuickSight to integrate and query data directly, otherwise have to export files for use?) 
* Complexity of internal RLUS workflows
  * Life Valuation Database Pipeline

### Use Cases

1. BI Analysis and Reporting:
   
   * **Redshift is the more natural choice for data warehouse reporting, Athena for ad-hoc queries against S3 storage.**
   Redshift would be the better choice if you have data coming in from diverse sources and you would like to transform that data, enforce consistent schema and formats, and create a single source that feeds a large number of business intelligence and reporting tools across the organization (see the [AWS Athena FAQ](https://aws.amazon.com/athena/faqs/)). 
   
   * If you’re running the same query every hour or day to power a BI dashboard, and the structure of the underlying data stays consistent, Redshift might be the better choice – especially if you’re willing to invest in infrastructure to ensure consistent performance come hell or high water. 
1. Data Ingestion and Structure
   
   * **Redshift is a relational database and best suited for tabular data; Athena is better for semi-structured and unstructured data.**
     
     As an RDBMS, Redshift stores data in tables and enforces schema-on-write. This makes it better suited for structured data that is ingested already in tabular format, which would often be the case with business application sources such as CRM or HR systems. For these sources, the ETL effort is less significant and there are plenty of tools available to help you get the job done.
   
   * RDS is beneficial in cases where data has an inherent structure and there is a constant need to insert, update or process data. This means they are a good fit for being used as a database for your customer-facing applications to store user data. They are a great fit for running transactional workloads. In some cases, they can even be used as a data warehouse in case most of the data is relational in nature.
   
   * Another typical use case is to use S3 as a place where data can be stored for importing to an RDS instance. This happens a lot while executing database migrations.
   
   * S3 is only a storage layer and if you have processing requirements, you will need to pay for another service from Amazon. 

1. Data Processing:
   
   * RDS comes with built-in support for data processing. In other words, the execution engine is tightly coupled to the storage layer in the case of RDS. This means the execution engine can take advantage of all the nuances of the storage layer bringing out the possibility of complex windowing and aggregation functions,
   * S3 on the other hand is a storage layer without an execution engine. AWS provides multiple completely managed execution engines that can operate on data stored in S3. But since the data does not adhere to a specific format or type, data processing over S3 has an additional complication of first parsing the data to a specific format. AWS Athena allows one to run SQL on top of data stored in S3 by defining the metadata first. Another option is the Redshift spectrum that allows one to take advantage of the Redshift querying layer by defining tables on top of S3.
1. Transactional Support
   
   * One of the biggest differences between the two storage systems is in the consistency guarantees in the case of storage operations involving a sequence of tasks. While S3 is strongly consistent, its consistency is limited to single storage operations. 
   * On the other hand, RDS supports transactions that allow one to execute a series of operations while maintaining consistency and even providing an option to roll back the operations in case of the steps go wrong. If S3 is to be used for a requirement like this, an additional layer to handle the transaction aspect will have to be custom-built using AWS lambda functions.

## Business Benefits of a Modern Data Warehouse

Effectively and efficiently mining data is the very center of any modern business’s competitive strategy, and a data warehouse is a core component of this data mining.

The ability to quickly look back at early trends and have the accurate data – properly formatted – is essential to good decision making. By enabling this historical overview, a data warehouse allows decision makers to learn from past trends and challenges. In essence, the benefit of a data warehouse is continuous improvement.

Also important, a data warehouse can scale with a business; a growing business needs more and better data, and data warehouses can (with proper hardware support) grow ever more robust in their ability to handle queries.

This scalability is driven by data warehouses deployments that are on-premise or in the cloud. And in either scenario, a data warehouse can ensure data security by using encryption and specific protection set ups that are intended to guard confidential data.

The true business advantage of having a data warehouse is that it offers a significant increase in competitive strategy by enabling smarter, metric-based decisions on everything from product releases to inventory levels to key sales levels. It’s unlikely that any business can compete in today’s market without an advanced data warehouse.

---

## Appendix: Links

* [Development](../2-Areas/MOCs/Development.md)
* [Cloud Computing](Cloud%20Computing.md)
* *Databases*
* [Data Warehouse](Data%20Warehouse.md)
* [Data Lake](Data%20Lake.md)
* [AWS S3](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20S3.md)
* [AWS RDS](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20RDS.md)
* [AWS Glue](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20Glue.md)
* [Amazon Athena](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/Amazon%20Athena.md)
* *AWS*
* *3-Resources/Highlights/Readwise 1/Articles/What Is Data Modeling*
* [Data Engineers](Data%20Engineers.md)
* [Data Engineering](../2-Areas/MOCs/Data%20Engineering.md)

See Also: [Comparing AWS RDS vs RedShift as Primary Cloud Data Warehouse](Comparing%20AWS%20RDS%20vs%20RedShift%20as%20Primary%20Cloud%20Data%20Warehouse.md)

*Backlinks:*

````dataview
list from [[Consideration and Concerns Regarding AWS Data Architecture]] AND -"Changelog"
````
