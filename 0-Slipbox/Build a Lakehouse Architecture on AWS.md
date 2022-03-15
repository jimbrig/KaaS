---
Date: 2022-03-15
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev"]
Alias: "Build a Lakehouse Architecture on AWS"
---

# Build a Lakehouse Architecture on AWS
*Source: [Build a Lake House Architecture on AWS | AWS Big Data Blog](https://aws.amazon.com/blogs/big-data/build-a-lake-house-architecture-on-aws/)*

*See Also: [[Modern Data Architecture on AWS]]*

## Contents

- [[#Overview|Overview]]
- [[#Lake House Approach|Lake House Approach]]
	- [[#Data sources|Data sources]]
	- [[#Data ingestion layer|Data ingestion layer]]
	- [[#Data storage layer|Data storage layer]]
		- [[#Structured data storage in the data warehouse|Structured data storage in the data warehouse]]
		- [[#Structured and unstructured data storage in a Lake House Architecture|Structured and unstructured data storage in a Lake House Architecture]]
	- [[#Catalog layer|Catalog layer]]
	- [[#Lake House interface|Lake House interface]]
	- [[#Data processing layer|Data processing layer]]
	- [[#Data consumption layer|Data consumption layer]]
- [[#Lake House reference architecture on AWS|Lake House reference architecture on AWS]]
	- [[#Data ingestion layer|Data ingestion layer]]
		- [[#Operational database sources (OLTP, ERP, CRM)|Operational database sources (OLTP, ERP, CRM)]]
		- [[#SaaS applications|SaaS applications]]
		- [[#File shares|File shares]]
		- [[#Streaming data sources|Streaming data sources]]
	- [[#Lake House storage layer|Lake House storage layer]]
	- [[#Data processing layer|Data processing layer]]
		- [[#SQL based ELT|SQL based ELT]]
		- [[#Big data processing|Big data processing]]
		- [[#Near-real-time ETL|Near-real-time ETL]]
- [[#Data consumption layer|Data consumption layer]]
		- [[#Interactive SQL|Interactive SQL]]
		- [[#Machine learning|Machine learning]]
		- [[#Business intelligence|Business intelligence]]
- [[#Conclusion|Conclusion]]
- [[#Appendix: Links|Appendix: Links]]


## Overview

Organizations can gain deeper and richer insights when they bring together all their relevant data of all structures and types and from all sources to analyze. In order to analyze these vast amounts of data, they are taking all their data from various silos and aggregating all of that data in one location, what many call a data lake, to do analytics and ML directly on top of that data. At other times, they are storing other data in purpose-built data stores, like a data warehouse to get quick results for complex queries on structured data, or in a search service to quickly search and analyze log data to monitor the health of production systems. To get the best insights from all of their data, these organizations need to move data between their data lakes and these purpose-built stores easily. As data in these systems continues to grow it becomes harder to move all of this data around. To overcome this data gravity issue and easily move their data around to get the most from all of their data, a [Lake House approach](https://aws.amazon.com/blogs/big-data/harness-the-power-of-your-data-with-aws-analytics/) on AWS was introduced.

In this post, we present how to build this Lake House approach on AWS that enables you to get insights from exponentially growing data volumes and help you make decisions with speed and agility. This Lake House approach provides capabilities that you need to embrace data gravity by using both a central data lake, a ring of purpose-built data services around that data lake, and the ability to easily move the data you need between these data stores.

## Lake House Approach

As a modern data architecture, the Lake House approach is not just about integrating your data lake and your data warehouse, but it’s about connecting your data lake, your data warehouse, and all your other purpose-built services into a coherent whole. The data lake allows you to have a single place you can run analytics across most of your data while the purpose-built analytics services provide the speed you need for specific use cases like real-time dashboards and log analytics.

This Lake House approach consists of following key elements:

-   Scalable Data Lakes
-   Purpose-built Data Services
-   Seamless Data Movement
-   Unified Governance
-   Performant and Cost-effective

Following diagram illustrates this Lake House approach in terms of customer data in the real world and data movement required between all of the data analytics services and data stores, [inside-out, outside-in, and around the perimeter](https://aws.amazon.com/blogs/big-data/harness-the-power-of-your-data-with-aws-analytics/).

![](https://i.imgur.com/XSQOfFP.png)

A layered and componentized data analytics architecture enables you to use the right tool for the right job, and provides the agility to iteratively and incrementally build out the architecture. You gain the flexibility to evolve your componentized Lake House to meet current and future needs as you add new data sources, discover new use cases and their requirements, and develop newer analytics methods.

For this Lake House Architecture, you can organize it as a stack of five logical layers, where each layer is composed of multiple purpose-built components that address specific requirements.

![](https://i.imgur.com/B2VgzMF.png)

We describe these five layers in this section, but let’s first talk about the sources that feed the Lake House Architecture.

### Data sources

The Lake House Architecture enables you to ingest and analyze data from a variety of sources. Many of these sources such as line of business (LOB) applications, ERP applications, and CRM applications generate highly structured batches of data at fixed intervals. In addition to internal structured sources, you can receive data from modern sources such as web applications, mobile devices, sensors, video streams, and social media. These modern sources typically generate semi-structured and unstructured data, often as continuous streams.

### Data ingestion layer

The ingestion layer in the Lake House Architecture is responsible for ingesting data into the Lake House storage layer. It provides the ability to connect to internal and external data sources over a variety of protocols. It can ingest and deliver batch as well as real-time streaming data into a data warehouse as well as data lake components of the Lake House storage layer.

### Data storage layer

The data storage layer of the Lake House Architecture is responsible for providing durable, scalable, and cost-effective components to store and manage vast quantities of data. In a Lake House Architecture, the data warehouse and data lake natively integrate to provide an integrated cost-effective storage layer that supports unstructured as well as highly structured and modeled data. The storage layer can store data in different states of consumption readiness, including raw, trusted-conformed, enriched, and modeled.

#### Structured data storage in the data warehouse

The data warehouse stores conformed, highly trusted data, structured into traditional star, snowflake, data vault, or highly denormalized schemas. Data stored in a warehouse is typically sourced from highly structured internal and external sources such as transactional systems, relational databases, and other structured operational sources, typically on a regular cadence. Modern cloud-native data warehouses can typically store petabytes scale data in built-in high-performance storage volumes in a compressed, columnar format. Through MPP engines and fast attached storage, a modern cloud-native data warehouse provides low latency turnaround of complex SQL queries.

To provide highly curated, conformed, and trusted data, prior to storing data in a warehouse, you need to put the source data through a significant amount of preprocessing, validation, and transformation using extract, transform, load (ETL) or extract, load, transform (ELT) pipelines. All changes to data warehouse data and schemas are tightly governed and validated to provide a highly trusted source of truth datasets across business domains.

#### Structured and unstructured data storage in a Lake House Architecture

A data lake is the centralized data repository that stores all of an organization’s data. It supports storage of data in structured, semi-structured, and unstructured formats. It provides highly cost-optimized tiered storage and can automatically scale to store exabytes of data. Typically, a data lake is segmented into landing, raw, trusted, and curated zones to store data depending on its consumption readiness. Typically, data is ingested and stored as is in the data lake (without having to first define schema) to accelerate ingestion and reduce time needed for preparation before data can be explored. The data lake enables analysis of diverse datasets using diverse methods, including big data processing and ML. Native integration between a data lake and data warehouse also reduces storage costs by allowing you to offload a large quantity of colder historical data from warehouse storage.

### Catalog layer

The catalog layer is responsible for storing business and technical metadata about datasets hosted in the Lake House storage layer. In a Lake House Architecture, the catalog is shared by both the data lake and data warehouse, and enables writing queries that incorporate data stored in the data lake as well as the data warehouse in the same SQL. It allows you to track versioned schemas and granular partitioning information of datasets. As the number of datasets grows, this layer makes datasets in the Lake House discoverable by providing search capabilities.

### Lake House interface

In the Lake House Architecture, the data warehouse and data lake are natively integrated at the storage as well as common catalog layers to present unified a Lake House interface to processing and consumption layers. The Lake House processing and consumption layer components can then consume all the data stored in the Lake House storage layer (stored in both the data warehouse and data lake) thorough a single unified Lake House interface such as SQL or Spark. You don’t need to move data between the data warehouse and data lake in either direction to enable access to all the data in the Lake House storage.

Native integration between the data warehouse and data lake provides you with the flexibility to do the following:

-   Store exabytes of structured and unstructured data in highly cost-efficient data lake storage as highly curated, modeled, and conformed structured data in hot data warehouse storage
-   Leverage a single processing framework such as Spark that can combine and analyze all the data in a single pipeline, whether it’s unstructured data in the data lake or structured data in the data warehouse
-   Build a SQL-based data warehouse native ETL or ELT pipeline that can combine flat relational data in the warehouse with complex, hierarchical structured data in the data lake

### Data processing layer

Components in the data processing layer of the Lake House Architecture are responsible for transforming data into a consumable state through data validation, cleanup, normalization, transformation, and enrichment. The processing layer provides purpose-built components to perform a variety of transformations, including data warehouse style SQL, big data processing, and near-real-time ETL.

The processing layer provides the quickest time to market by providing purpose-built components that match the right dataset characteristics (size, format, schema, speed), processing task at hand, and available skillsets (SQL, Spark). The processing layer can cost-effectively scale to handle large data volumes and provide components to support schema-on-write, schema-on-read, partitioned datasets, and diverse data formats. The processing layer can access the unified Lake House storage interfaces and common catalog, thereby accessing all the data and metadata in the Lake House. This has the following benefits:

-   Avoids data redundancies, unnecessary data movement, and duplication of ETL code that may result when dealing with a data lake and data warehouse separately
-   Reduces time to market

### Data consumption layer

The data consumption layer of the Lake house Architecture is responsible for providing scalable and performant components that use unified Lake House interfaces to access all the data stored in Lake House storage and all the metadata stored in the Lake House catalog. It democratizes analytics to enable all personas across an organization by providing purpose-built components that enable analysis methods, including interactive SQL queries, warehouse style analytics, BI dashboards, and ML.

Components in the consumption layer support the following:

-   Writing queries as well as analytics and ML jobs that access and combine data from traditional data warehouse dimensional schemas as well as data lake hosted tables (that require schema-on-read)
-   Handling data lake hosted datasets that are stored using a variety of open file formats such as Avro, Parquet, or ORC
-   Optimizing performance and costs through partition pruning when reading large, partitioned datasets hosted in the data lake

In the rest of this post, we introduce a reference architecture that uses AWS services to compose each layer described in our Lake House logical architecture. In this approach, AWS services take over the heavy lifting of the following:

-   Providing and managing scalable, resilient, secure, and cost-effective infrastructural components
-   Ensuring infrastructural components natively integrate with each other

This approach allows you to focus more time on the following tasks:

-   Rapidly building data and analytics pipelines
-   Significantly accelerating new data onboarding and driving insights from your data
-   Supporting multiple user personas

## Lake House reference architecture on AWS

The following diagram illustrates our Lake House reference architecture on AWS.

![](https://i.imgur.com/DSDCikj.png)

In the following sections, we provide more information about each layer.

### Data ingestion layer

The ingestion layer in our Lake House reference architecture is composed of a set of purpose-built AWS services to enable data ingestion from a variety of sources into the Lake House storage layer. Most of the ingestion services can deliver data directly to both the data lake and data warehouse storage. Individual purpose-built AWS services match the unique connectivity, data format, data structure, and data velocity requirements of the following sources:

-   Operational database sources
-   Software as a service (SaaS) applications
-   File shares
-   Streaming data sources

#### Operational database sources (OLTP, ERP, CRM)

The [AWS Data Migration Service](https://aws.amazon.com/dms/) (AWS DMS) component in the ingestion layer can connect to several operational RDBMS and NoSQL databases and ingest their data into [Amazon Simple Storage Service](http://aws.amazon.com/s3) (Amazon S3) buckets in the data lake or directly into staging tables in an [Amazon Redshift](http://aws.amazon.com/redshift) data warehouse. With AWS DMS, you can perform a one-time import of source data and then replicate ongoing changes happening in the source database.

#### SaaS applications

The ingestion layer uses [Amazon AppFlow](https://aws.amazon.com/appflow/) to easily ingest SaaS applications data into your data lake. With a few clicks, you can set up serverless data ingestion flows in Amazon AppFlow. Your flows can connect to SaaS applications such as Salesforce, Marketo, and Google Analytics, ingest data, and deliver it to the Lake House storage layer, either to S3 buckets in the data lake or directly to staging tables in the Amazon Redshift data warehouse. You can schedule Amazon AppFlow data ingestion flows or trigger them by events in the SaaS application. Ingested data can be validated, filtered, mapped, and masked before delivering it to Lake House storage.

#### File shares

Many applications store structured and unstructured data in files that are hosted on network attached storage (NAS) arrays. [AWS DataSync](https://aws.amazon.com/datasync/) can ingest hundreds of terabytes and millions of files from NFS and SMB enabled NAS devices into the data lake landing zone. DataSync automatically handles scripting of copy jobs, scheduling and monitoring transfers, validating data integrity, and optimizing network utilization. DataSync can perform a one-time transfer of files and then monitor and sync changed files into the Lake House. DataSync is fully managed and can be set up in minutes.

#### Streaming data sources

The ingestion layer uses [Amazon Kinesis Data Firehose](https://aws.amazon.com/kinesis/data-firehose/) to receive streaming data from internal or external sources and deliver it to the Lake House storage layer. With a few clicks, you can configure a Kinesis Data Firehose API endpoint where sources can send streaming data such as clickstreams, application and infrastructure logs and monitoring metrics, and IoT data such as devices telemetry and sensor readings. Kinesis Data Firehose performs the following actions:

-   Buffers incoming streams
-   Batches, compresses, transforms, partitions, and encrypts the data
-   Delivers the data as S3 objects to the data lake or as rows into staging tables in the Amazon Redshift data warehouse

Kinesis Data Firehose is serverless, requires no administration, and has a cost model where you pay only for the volume of data you transmit and process through the service. Kinesis Data Firehose automatically scales to adjust to the volume and throughput of incoming data. For building real-time streaming analytics pipelines, the ingestion layer provides [Amazon Kinesis Data Streams](https://aws.amazon.com/kinesis/data-streams/).

### Lake House storage layer

Amazon Redshift and Amazon S3 provide a unified, natively integrated storage layer of our Lake House reference architecture. Typically, Amazon Redshift stores highly curated, conformed, trusted data that’s structured into standard dimensional schemas, whereas Amazon S3 provides exabyte scale data lake storage for structured, semi-structured, and unstructured data. With [semi-structured data support in Amazon Redshift](https://docs.aws.amazon.com/redshift/latest/dg/super-overview.html), you can also ingest and store semi-structured data in your Amazon Redshift data warehouses. Amazon S3 offers industry-leading scalability, data availability, security, and performance. Organizations typically store data in Amazon S3 using open file formats. Open file formats enable analysis of the same Amazon S3 data using multiple processing and consumption layer components. The common catalog layer stores the schemas of structured or semi-structured datasets in Amazon S3. Components that consume the S3 dataset typically apply this schema to the dataset as they read it (aka schema-on-read).

[Amazon Redshift Spectrum](https://aws.amazon.com/blogs/big-data/amazon-redshift-spectrum-extends-data-warehousing-out-to-exabytes-no-loading-required/) is one of the centerpieces of the natively integrated Lake House storage layer. Redshift Spectrum enables Amazon Redshift to present a unified SQL interface that can accept and process SQL statements where the same query can reference and combine datasets hosted in the data lake as well as data warehouse storage. Amazon Redshift can query petabytes of data stored in Amazon S3 by using a layer of up to thousands of transient Redshift Spectrum nodes and applying the sophisticated query optimizations of Amazon Redshift. Redshift Spectrum can query partitioned data in the S3 data lake. It can read data that is compressed using open-source codec and is stored in open-source row or columnar formats including JSON, CSV, Avro, Parquet, ORC, and [Apache Hudi](https://docs.aws.amazon.com/redshift/latest/dg/c-spectrum-external-tables.html#c-spectrum-column-mapping-hudi). For more information, see [Creating data files for queries in Amazon Redshift Spectrum](https://docs.aws.amazon.com/redshift/latest/dg/c-spectrum-data-files.html).

As Redshift Spectrum reads datasets stored in Amazon S3, it applies the corresponding schema from the common [AWS Lake Formation](https://aws.amazon.com/lake-formation/) catalog to the data (schema-on-read). With Redshift Spectrum, you can build Amazon Redshift native pipelines that perform the following actions:

-   Keep large volumes historical data in the data lake and ingest a few months of hot data into the data warehouse using Redshift Spectrum
-   Produce enriched datasets by processing both hot data in the attached storage and historical data in the data lake, all without moving data in either direction
-   Insert rows of enriched datasets in either a table stored on attached storage or directly into the data lake hosted external table
-   Easily offload volumes of large colder historical data from the data warehouse into cheaper data lake storage and still easily query it as part of Amazon Redshift queries

Highly structured data in Amazon Redshift typically powers interactive queries and highly trusted, fast BI dashboards, whereas structured, unstructured, and semi-structure data in Amazon S3 typically drives ML, data science, and big data processing use cases.

AWS DMS and Amazon AppFlow in the ingestion layer can deliver data from structured sources directly to either the S3 data lake or Amazon Redshift data warehouse to meet use case requirements. In case of data files ingestion, DataSync brings data into Amazon S3. The processing layer components can access data in the unified Lake House storage layer through a single unified interface such as Amazon Redshift SQL, which can combine data stored in the Amazon Redshift cluster with data in Amazon S3 using Redshift Spectrum.

In the S3 data lake, both structured and unstructured data is stored as S3 objects. S3 objects in the data lake are organized into buckets or prefixes representing landing, raw, trusted, and curated zones. For pipelines that store data in the S3 data lake, data is ingested from the source into the landing zone as is. The processing layer then validates the landing zone data and stores it in the raw zone bucket or prefix for permanent storage. Then the processing layer applies the schema, partitioning, and other transformations to the raw zone data to bring it to a conformed state and stores it in trusted zone. As a last step, the processing layer curates a trusted zone dataset by modeling it and joining it with other datasets, and stores it in curated layer. Typically, datasets from the curated layer are partly or fully ingested into Amazon Redshift data warehouse storage to serve use cases that need very low latency access or need to run complex SQL queries.

The dataset in each zone is typically partitioned along a key that matches a consumption pattern specific to the respective zone (raw, trusted, or curated). S3 objects corresponding to datasets are compressed, using open-source codecs such as GZIP, BZIP, and Snappy, to reduce storage costs and the amount of read time for components in the processing and consumption layers. Datasets are typically stored in open-source columnar formats such as Parquet and ORC to further reduce the amount of data read when the processing and consumption layer components query only a subset of columns. Amazon S3 offers a range of storage classes designed for different use cases. The Amazon S3 intelligent-tiering storage class is designed to optimize costs by automatically moving data to the most cost-effective access tier, without performance impact or operational overhead.

Amazon Redshift provides petabyte scale data warehouse storage for highly structured data that’s typically modelled into dimensional or denormalized schemas. On Amazon Redshift, data is stored in highly compressed, columnar format and stored in a distributed fashion on a cluster of high-performance nodes. Each node provides up to 64 TB of highly performant managed storage. Amazon Redshift enables high data quality and consistency by enforcing schema-on-write, ACID transactions, and workload isolation. Organizations typically store structured data that’s highly conformed, harmonized, trusted, and governed datasets on Amazon Redshift to serve use cases requiring very high throughput, very low latency, and high concurrency. You can also use the incrementally refreshing [materialized views in Amazon Redshift to significantly increase performance and throughput of complex queries generated by BI dashboards](https://aws.amazon.com/blogs/big-data/speed-up-your-elt-and-bi-queries-with-amazon-redshift-materialized-views/).

As you build out your Lake House by ingesting data from a variety of sources, you can typically start hosting hundreds to thousands of datasets across your data lake and data warehouse. A central data catalog to provide metadata for all datasets in Lake House storage (the data warehouse as well as data lake) in a single place and make it easily searchable is crucial to self-service discovery of data in a Lake House. Additionally, separating metadata from data lake hosted data into a central schema enables schema-on-read for processing and consumption layer components as well as Redshift Spectrum.

In our Lake House reference architecture, Lake Formation provides the central catalog to store metadata for all datasets hosted in the Lake House (whether stored in Amazon S3 or Amazon Redshift). Organizations store both technical metadata (such as versioned table schemas, partitioning information, physical data location, and update timestamps) and business attributes (such as data owner, data steward, column business definition, and column information sensitivity) of all their datasets in Lake Formation.

Many data lake hosted datasets typically have constantly evolving schema and increasing data partitions, whereas schemas of data warehouse hosted datasets evolve in a governed fashion. [AWS Glue](https://aws.amazon.com/glue) [ crawlers](https://docs.aws.amazon.com/glue/latest/dg/add-crawler.html) track evolving schemas and newly added partitions of data hosted in data lake hosted datasets as well as data warehouse hosted datasets, and adds new versions of corresponding schemas in the Lake Formation catalog. Additionally, Lake Formation provides APIs to enable metadata registration and management using custom scripts and third-party products.

Lake Formation provides the data lake administrator a central place to set up granular table- and column-level permissions for databases and tables hosted in the data lake. After you set up Lake Formation permissions, users and groups can only access authorized tables and columns using multiple processing and consumption layer services such as AWS Glue, [Amazon EMR](https://aws.amazon.com/emr/), [Amazon Athena](https://aws.amazon.com/athena/), and Redshift Spectrum.

### Data processing layer

The processing layer of our Lake House Architecture provides multiple purpose-built components to enable a variety of data processing use cases. To match the unique structure (flat tabular, hierarchical, or unstructured) and velocity (batch or streaming) of a dataset in the Lake House, we can pick a matching purpose-built processing component. Each component can read and write data to both Amazon S3 and Amazon Redshift (collectively, Lake House storage).

We can use processing layer components to build data processing jobs that can read and write data stored in both the data warehouse and data lake storage using the following interfaces:

-   Amazon Redshift SQL (with Redshift Spectrum). For more information, see [Amazon Redshift Spectrum Extends Data Warehousing Out to Exabytes—No Loading Required](https://aws.amazon.com/blogs/big-data/amazon-redshift-spectrum-extends-data-warehousing-out-to-exabytes-no-loading-required/).
-   Apache Spark jobs running Amazon EMR. For more information, see the following:
    -   Spark documentation entries for [DataFrameReader](https://spark.apache.org/docs/2.2.0/api/python/pyspark.sql.html#pyspark.sql.DataFrameReader) and [DataFrameWriter](https://spark.apache.org/docs/2.2.0/api/python/pyspark.sql.html#pyspark.sql.DataFrameWriter)
    -   [Performant Redshift Data Source for Apache Spark – Community Edition](https://github.com/spark-redshift-community/spark-redshift) on GitHub
-   Apache Spark jobs running on AWS Glue. For more information, see the following:
    -   [DynamicFrameReader Class](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-crawler-pyspark-extensions-dynamic-frame-reader.html)
    -   [DynamicFrameWriter Class](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-crawler-pyspark-extensions-dynamic-frame-writer.html)
    -   [Moving Data to and from Amazon Redshift](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-redshift.html)

You can add metadata from the resulting datasets to the central Lake Formation catalog using AWS Glue crawlers or Lake Formation APIs.

You can use purpose-built components to build data transformation pipelines that implement the following:

-   SQL-based ELT using Amazon Redshift (with Redshift Spectrum)
-   Big data processing using AWS Glue or Amazon EMR
-   Near-real-time streaming data processing using [Amazon Kinesis](https://aws.amazon.com/kinesis/). For more information, see the following:
    -   [Writing SQL on Streaming Data with Amazon Kinesis Analytics – Part 1](https://aws.amazon.com/blogs/big-data/writing-sql-on-streaming-data-with-amazon-kinesis-analytics-part-1/)
    -   [Writing SQL on Streaming Data with Amazon Kinesis Analytics – Part 2](https://aws.amazon.com/blogs/big-data/writing-sql-on-streaming-data-with-amazon-kinesis-analytics-part-2/)
    -   [Serverless Stream-Based Processing for Real-Time Insights](https://aws.amazon.com/blogs/architecture/serverless-stream-based-processing-for-real-time-insights/)
    -   [Streaming ETL with Apache Flink and Amazon Kinesis Data Analytics](https://aws.amazon.com/blogs/big-data/streaming-etl-with-apache-flink-and-amazon-kinesis-data-analytics/)
-   Near-real-time streaming data processing using Spark streaming on AWS Glue. For more information, see [New – Serverless Streaming ETL with AWS Glue](https://aws.amazon.com/blogs/aws/new-serverless-streaming-etl-with-aws-glue/).
-   Near-real-time streaming data processing using Spark streaming on Amazon EMR. For more information, see the following:
    -   [Optimize Spark-Streaming to Efficiently Process Amazon Kinesis Streams](https://aws.amazon.com/blogs/big-data/optimize-spark-streaming-to-efficiently-process-amazon-kinesis-streams/)
    -   [Real-Time Analytics with Spark Streaming](https://aws.amazon.com/solutions/implementations/real-time-analytics-spark-streaming/)
    -   [Querying Amazon Kinesis Streams Directly with SQL and Spark Streaming](https://aws.amazon.com/blogs/big-data/querying-amazon-kinesis-streams-directly-with-sql-and-spark-streaming/)
    -   [Real-time Stream Processing Using Apache Spark Streaming and Apache Kafka on AWS](https://aws.amazon.com/blogs/big-data/real-time-stream-processing-using-apache-spark-streaming-and-apache-kafka-on-aws/)

#### SQL based ELT

To transform structured data in the Lake House storage layer, you can build powerful ELT pipelines using familiar SQL semantics. These ELT pipelines can use the massively parallel processing (MPP) capability in Amazon Redshift and the ability in Redshift Spectrum to spin up thousands of transient nodes to scale processing to petabytes of data. The same stored procedure-based [ELT pipelines on Amazon Redshift](https://aws.amazon.com/blogs/big-data/etl-and-elt-design-patterns-for-lake-house-architecture-using-amazon-redshift-part-2/) can transform the following:

-   Flat structured data delivered by AWS DMS or Amazon AppFlow directly into Amazon Redshift staging tables
-   Data hosted in the data lake using open-source file formats such as JSON, Avro, Parquet, and ORC

For data enrichment steps, these pipelines can include SQL statements that join internal dimension tables with large fact tables hosted in the S3 data lake (using the Redshift Spectrum layer). As final step, data processing pipelines can insert curated, enriched, and modeled data into either an Amazon Redshift internal table or an [external table stored in Amazon S3](https://docs.aws.amazon.com/redshift/latest/dg/r_INSERT_external_table.html).

#### Big data processing

For integrated processing of large volumes of semi-structured, unstructured, or highly structured data hosted on the Lake House storage layer (Amazon S3 and Amazon Redshift), you can build big data processing jobs using Apache Spark and run them on AWS Glue or Amazon EMR. These jobs can use Spark’s native as well as open-source connectors to access and combine relational data stored in Amazon Redshift with complex flat or hierarchical structured data stored in Amazon S3. These same jobs can store processed datasets back into the S3 data lake, Amazon Redshift data warehouse, or both in the Lake House storage layer.

AWS Glue provides serverless, [pay-per-use](https://aws.amazon.com/glue/pricing/), ETL capabilities to enable ETL pipelines that can process tens of terabytes of data, all without having to stand up and manage servers or clusters. To speed up ETL development, AWS Glue [automatically generates ETL code](https://aws.amazon.com/blogs/big-data/simplify-data-pipelines-with-aws-glue-automatic-code-generation-and-workflows/) and provides commonly used [data structures as well ETL transformations](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-crawler-pyspark-extensions-dynamic-frame.html) (to validate, clean, transform, and flatten data). AWS Glue provides the built-in capability to process [data stored in Amazon Redshift](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-redshift.html) as well an S3 data lake. In the same job, AWS Glue can load and process Amazon Redshift data stored using flat table format as well S3 data lake hosted datasets stored using common open-source formats such as CSV, JSON, Parquet, and Avro. AWS Glue ETL jobs can reference both Amazon Redshift and Amazon S3 hosted tables in a unified way by accessing them through the common Lake Formation catalog (which AWS Glue crawlers populate by crawling Amazon S3 as well as Amazon Redshift). AWS Glue ETL provides capabilities to [incrementally process partitioned data](https://aws.amazon.com/blogs/big-data/load-data-incrementally-and-optimized-parquet-writer-with-aws-glue/). Additionally, AWS Glue provides [triggers](https://docs.aws.amazon.com/glue/latest/dg/about-triggers.html) and [workflow capabilities](https://docs.aws.amazon.com/glue/latest/dg/workflows_overview.html) that you can use to build multi-step end-to-end data processing pipelines that include job dependencies as well as running parallel steps.

You can [automatically scale EMR clusters](https://aws.amazon.com/blogs/big-data/introducing-amazon-emr-managed-scaling-automatically-resize-clusters-to-lower-cost/) to meet varying resource demands of big data processing pipelines that can process up to petabytes of data. These pipelines can use fleets of different [Amazon Elastic Compute Cloud](http://aws.amazon.com/ec2) (Amazon EC2) Spot Instances to scale in a highly [cost-optimized](https://aws.amazon.com/blogs/big-data/best-practices-for-running-apache-spark-applications-using-amazon-ec2-spot-instances-with-amazon-emr/) manner. For more information about instances, see [Supported Instance Types](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-supported-instance-types.html).

Spark based data processing pipelines running on Amazon EMR can use the following:

-   Spark’s built-in [readers](https://spark.apache.org/docs/2.2.0/api/python/pyspark.sql.html#pyspark.sql.DataFrameReader) and [writers](https://spark.apache.org/docs/2.2.0/api/python/pyspark.sql.html#pyspark.sql.DataFrameWriter) to handle data lake hosted datasets in a variety of open-source formats
-   The open-source [Spark-Amazon Redshift connector](https://github.com/spark-redshift-community/spark-redshift) to directly read and write data in the Amazon Redshift data warehouse

To read the schema of data lake hosted complex structured datasets, Spark ETL jobs on Amazon EMR can connect to the Lake Formation catalog. This is [set up with AWS Glue compatibility](https://docs.aws.amazon.com/lake-formation/latest/dg/change-settings.html) and [AWS Identity and Access Management](http://aws.amazon.com/iam) (IAM) policies set up to separately authorize access to [AWS Glue tables](https://docs.aws.amazon.com/glue/latest/dg/glue-policy-examples-iam.html) and underlying [S3 objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/example-bucket-policies.html). The same Spark jobs can use the Spark-Amazon Redshift connector to read both data and schemas of Amazon Redshift hosted datasets. You can use Spark and [Apache Hudi](https://www.youtube.com/watch?v=_ckNyL_Nr1A) to [build highly performant incremental data processing pipelines Amazon EMR](https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-hudi.html).

#### Near-real-time ETL

To enable several modern analytics use cases, you need to perform the following actions, all in near-real time:

-   Ingest large volumes of high-frequency or streaming data
-   Validate, clean, and enrich it
-   Make it available for consumption in Lake House storage

You can build pipelines that can easily scale to process large volumes of data in near-real time using one of the following:

-   [Amazon Kinesis Data Analytics](https://aws.amazon.com/kinesis/data-analytics/) for SQL/Flink
-   Spark streaming on either AWS Glue or Amazon EMR
-   Kinesis Data Firehose integrated with [AWS Lambda](http://aws.amazon.com/lambda)

Kinesis Data Analytics, AWS Glue, and Kinesis Data Firehose enable you to build near-real-time data processing pipelines without having to create or manage compute infrastructure. Kinesis Data Firehose and Kinesis Data Analytics pipelines elastically scale to match the throughput of the source, whereas Amazon EMR and AWS Glue based Spark streaming jobs can be scaled in minutes by just specifying scaling parameters.

Kinesis Data Analytics for Flink/SQL based streaming pipelines typically read records from [Amazon Kinesis Data Streams](https://aws.amazon.com/kinesis/data-streams/) (in the ingestion layer of our Lake House Architecture), apply transformations to them, and write processed data to Kinesis Data Firehose. Spark streaming pipelines typically read records from Kinesis Data Streams (in the ingestion layer of our Lake House Architecture), apply transformations to them, and write processed data to another Kinesis data stream, which is chained to a Kinesis Data Firehose delivery stream. The Firehose delivery stream can deliver processed data to Amazon S3 or Amazon Redshift in the Lake House storage layer. To build simpler near-real-time pipelines that require simple, stateless transformations, you can ingest data directly into Kinesis Data Firehose and transform micro-batches of incoming records using the Lambda function that’s invoked by Kinesis Data Firehose. Kinesis Data Firehose delivers the transformed micro-batches of records to Amazon S3 or Amazon Redshift in the Lake House storage layer.

With its ability to deliver data to Amazon S3 as well as Amazon Redshift, Kinesis Data Firehose provides a unified Lake House storage writer interface to near-real-time ETL pipelines in the processing layer. On Amazon S3, Kinesis Data Firehose can store data in efficient Parquet or ORC files that are compressed using open-source codecs such as ZIP, GZIP, and Snappy.

## Data consumption layer

Our Lake House reference architecture democratizes data consumption across different persona types by providing purpose-built AWS services that enable a variety of analytics use cases, such as interactive SQL queries, BI, and ML. These services use unified Lake House interfaces to access all the data and metadata stored across Amazon S3, Amazon Redshift, and the Lake Formation catalog. They can consume flat relational data stored in Amazon Redshift tables as well as flat or complex structured or unstructured data stored in S3 objects using open file formats such as JSON, Avro, Parquet, and ORC.

#### Interactive SQL

To explore all data stored in Lake House storage using interactive SQL, business analysts and data scientists can use Amazon Redshift (with Redshift Spectrum) or Athena. You can run SQL queries that join flat, relational, structured dimensions data, hosted in an Amazon Redshift cluster, with terabytes of flat or complex structured historical facts data in Amazon S3, stored using open file formats such as JSON, Avro, Parquet, and ORC. When querying a dataset in Amazon S3, both Athena and Redshift Spectrum fetch the schema stored in the Lake Formation catalog and apply it on read (schema-on-read). You can run Athena or Amazon Redshift queries on their respective consoles or can submit them to JDBC or ODBC endpoints. For more information, see [Connecting to Amazon Athena with ODBC and JDBC Drivers](https://docs.aws.amazon.com/athena/latest/ug/athena-bi-tools-jdbc-odbc.html) and [Configuring connections in Amazon Redshift](https://docs.aws.amazon.com/redshift/latest/mgmt/configuring-connections.html).

Athena can run complex ANSI SQL against terabytes of data stored in Amazon S3 without requiring you to first load it into a database. Athena is serverless, so there is no infrastructure to set up or manage, and you pay only for the amount of data scanned by the queries you run. The federated query capability in Athena enables SQL queries that can [join fact data hosted in Amazon S3 with dimension tables hosted in an Amazon Redshift cluster](https://aws.amazon.com/blogs/big-data/configure-and-optimize-performance-of-amazon-athena-federation-with-amazon-redshift/), without having to move data in either direction. You can also [include live data in operational databases in the same SQL statement](https://aws.amazon.com/blogs/big-data/query-any-data-source-with-amazon-athenas-new-federated-query/) using Athena federated queries. Athena provides faster results and lower costs by reducing the amount of data it scans by [leveraging dataset partitioning information](https://docs.aws.amazon.com/athena/latest/ug/partitions.html) stored in the Lake Formation catalog. You can further reduce costs by storing the results of a repeating query using Athena [CTAS statements](https://aws.amazon.com/blogs/big-data/using-ctas-statements-with-amazon-athena-to-reduce-cost-and-improve-performance/).

Amazon Redshift provides a powerful SQL capability designed for blazing fast online analytical processing (OLAP) of very large datasets that are stored in Lake House storage (across the Amazon Redshift MPP cluster as well as S3 data lake). The powerful query optimizer in Amazon Redshift can take complex user queries written in PostgreSQL-like syntax and generate high-performance query plans that run on the Amazon Redshift MPP cluster as well as a fleet of Redshift Spectrum nodes (to query data in Amazon S3). Amazon Redshift provides results caching capabilities to reduce query runtime for repeat runs of the same query by orders of magnitude. With materialized views in Amazon Redshift, you can pre-compute complex joins one time (and incrementally refresh them) to significantly simplify and accelerate downstream queries that users need to write. Amazon Redshift provides concurrency scaling, which spins up additional transient clusters within seconds, to support a virtually unlimited number of concurrent queries. You can write results of your queries back to either Amazon Redshift native tables or into external tables hosted on the S3 data lake (using Redshift Spectrum).

#### Machine learning

Data scientists typically need to explore, wrangle, and feature engineer a variety of structured and unstructured datasets to prepare for training ML models. Lake House interfaces (an interactive SQL interface using Amazon Redshift with an Athena and Spark interface) significantly simplify and accelerate these data preparation steps by providing data scientists with the following:

-   A unified Lake Formation catalog to search and discover all data hosted in Lake House storage
-   Amazon Redshift SQL and Athena based interactive SQL capability to access, explore, and transform all data in Lake House storage
-   Unified Spark based access to wrangle and transform all Lake House storage hosted datasets (structured as well as unstructured) and turn them into feature sets

Data scientists then develop, train, and deploy ML models by connecting [Amazon SageMaker](https://aws.amazon.com/sagemaker/) to the Lake House storage layer and accessing training feature sets.

SageMaker is a fully managed service that provides components to build, train, and deploy ML models using an interactive development environment (IDE) called [SageMaker Studio](https://aws.amazon.com/sagemaker/studio/). In Studio, you can upload data, create new notebooks, train and tune models, move back and forth between steps to adjust experiments, compare results, and deploy models to production all in one place using a unified visual interface. For more information, see [Amazon SageMaker Studio: The First Fully Integrated Development Environment For Machine Learning](https://aws.amazon.com/blogs/aws/amazon-sagemaker-studio-the-first-fully-integrated-development-environment-for-machine-learning/).

SageMaker also provides [managed Jupyter notebooks](https://docs.aws.amazon.com/sagemaker/latest/dg/nbi.html) that you can spin up with a few clicks. SageMaker notebooks provide elastic compute resources, git integration, easy sharing, preconfigured ML algorithms, dozens of out-of-the-box ML examples, and AWS Marketplace integration that enables easy deployment of hundreds of pretrained algorithms. SageMaker notebooks are preconfigured with all major deep learning frameworks including TensorFlow, PyTorch, Apache MXNet, Chainer, Keras, Gluon, Horovod, Scikit-learn, and Deep Graph Library.

ML models are trained on SageMaker managed compute instances, including highly cost-effective EC2 Spot Instances. You can organize multiple training jobs using [SageMaker Experiments](https://aws.amazon.com/blogs/aws/amazon-sagemaker-experiments-organize-track-and-compare-your-machine-learning-trainings/). You can build training jobs using SageMaker built-in algorithms, your custom algorithms, or hundreds of algorithms you can deploy from AWS Marketplace. [SageMaker Debugger](https://aws.amazon.com/blogs/aws/amazon-sagemaker-debugger-debug-your-machine-learning-models/) provides full visibility into model training jobs. SageMaker also provides [automatic hyperparameter tuning](https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-how-it-works.html) for ML training jobs.

You can [deploy SageMaker trained models](https://docs.aws.amazon.com/sagemaker/latest/dg/deploy-model.html) into production with a few clicks and easily scale them across a fleet of fully managed EC2 instances. You can choose from multiple EC2 instance types and attach cost-effective [GPU-powered inference acceleration](https://docs.aws.amazon.com/sagemaker/latest/dg/ei.html). After you deploy the models, SageMaker can [monitor key model metrics](https://docs.aws.amazon.com/sagemaker/latest/dg/monitoring-overview.html) for inference accuracy and detect any concept drift.

#### Business intelligence

[Amazon QuickSight](https://aws.amazon.com/quicksight/) provides serverless capability to easily create and publish rich interactive BI dashboards. Business analysts can use the Athena or Amazon Redshift interactive SQL interface to power QuickSight dashboards with data in Lake House storage. Additionally, you can source data by connecting QuickSight directly to operational databases such as MS SQL, Postgres, and SaaS applications such as Salesforce, Square, and ServiceNow. To achieve blazing fast performance for dashboards, QuickSight provides an in-memory caching and calculation engine called SPICE. SPICE automatically replicates data for high availability and enables thousands of users to simultaneously perform fast, interactive analysis while shielding your underlying data infrastructure.

QuickSight enriches dashboards and visuals with out-of-the-box, automatically generated ML insights such as forecasting, anomaly detection, and narrative highlights. QuickSight natively [integrates with SageMaker](https://aws.amazon.com/blogs/machine-learning/making-machine-learning-predictions-in-amazon-quicksight-and-amazon-sagemaker/) to enable additional custom ML model-based insights to your BI dashboards. You can access QuickSight dashboards from any device using a QuickSight app or [embed the dashboards into web applications, portals, and websites](https://docs.aws.amazon.com/quicksight/latest/user/embedding-dashboards.html). QuickSight automatically scales to tens of thousands of users and provide a cost-effective pay-per-session pricing model.

## Conclusion

A Lake House architecture, built on a portfolio of purpose-built services, will help you quickly get insight from all of your data to all of your users and will allow you to build for the future so you can easily add new analytic approaches and technologies as they become available.

In this post, we described several purpose-built AWS services that you can use to compose the five layers of a Lake House Architecture. We introduced multiple options to demonstrate flexibility and rich capabilities afforded by the right AWS service for the right job.

For detailed architectural patterns, walkthroughs, and sample code for building the layers of the Lake House Architecture, see the following resources:

-   ETL and ELT design patterns for Lake House Architecture using Amazon Redshift: [Part 1](https://aws.amazon.com/blogs/big-data/etl-and-elt-design-patterns-for-lake-house-architecture-using-amazon-redshift-part-1/) and [Part 2](https://aws.amazon.com/blogs/big-data/etl-and-elt-design-patterns-for-lake-house-architecture-using-amazon-redshift-part-2/)
-   [Creating a source to Lakehouse data replication pipe using Apache Hudi, AWS Glue, AWS DMS, and Amazon Redshift](https://aws.amazon.com/blogs/big-data/creating-a-source-to-lakehouse-data-replication-pipe-using-apache-hudi-aws-glue-aws-dms-and-amazon-redshift/)
-   [Manage and control your cost with Amazon Redshift Concurrency Scaling and Spectrum](https://aws.amazon.com/blogs/big-data/manage-and-control-your-cost-with-amazon-redshift-concurrency-scaling-and-spectrum/)
-   [Powering Amazon Redshift Analytics with Apache Spark and Amazon Machine Learning](https://aws.amazon.com/blogs/big-data/powering-amazon-redshift-analytics-with-apache-spark-and-amazon-machine-learning/)
-   [Using the Amazon Redshift Data API to interact with Amazon Redshift clusters](https://aws.amazon.com/blogs/big-data/using-the-amazon-redshift-data-api-to-interact-with-amazon-redshift-clusters/)
-   [Speed up your ELT and BI queries with Amazon Redshift materialized views](https://aws.amazon.com/blogs/big-data/speed-up-your-elt-and-bi-queries-with-amazon-redshift-materialized-views/)
-   [Build a Simplified ETL and Live Data Query Solution using Redshift Federated Query](https://aws.amazon.com/blogs/big-data/build-a-simplified-etl-and-live-data-query-solution-using-redshift-federated-query/)

***

## Appendix: Links

- [[Modern Data Architecture on AWS]]
- [[3-Resources/Tools/AWS/_README|Amazon Web Services]]
- [[AWS S3]]
- [[Data Lake]]
- [[Data Engineering]]
- [[Cloud Computing]]
- [[ELT Cloud Based Pipeline Architecture]]
- [[ETL Pipeline Notes]]
- [[ETL]]
- [[ELT]]
- [[SQL]]
- [[Databases]]
- [[Data Warehouse]]
- [[Dimensional Modeling]]
- [[ETL Data Warehousing Best Practices]]

*Backlinks:*

```dataview
list from [[Build a Lakehouse Architecture on AWS]] AND -"Changelog"
```