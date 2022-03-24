---
Date: 2022-03-15
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev/Cloud/AWS"]
Alias: "Modern Data Architecture on AWS"
---

# Modern Data Architecture on AWS
*Source: [Modern Data Architecture on AWS | Amazon Web Services](https://aws.amazon.com/big-data/datalakes-and-analytics/modern-data-architecture/)*

## Overview

A modern data architecture acknowledges the idea that taking a one-size-fits-all approach to analytics eventually leads to compromises. It is not simply about integrating a data lake with a data warehouse, but rather about integrating a data lake, a data warehouse, and purpose-built stores, enabling unified governance and easy data movement. With a modern data architecture on AWS, customers can rapidly build scalable data lakes, use a broad and deep collection of purpose-built  data services, ensure compliance via a unified  data access, security, and governance, scale their systems at a low cost without compromising performance, and easily share data across organizational boundaries, allowing them to make decisions with speed and agility at scale.

![](https://i.imgur.com/KUbdRCa.png)

## Modern Architecture

### Inside-out data movement

Customers storing data in a data lake and then moving a portion of that data to a purpose-built data store to do additional machine learning or analytics.  
  
_Example:_ Clickstream data from web applications can be collected directly in a data lake, and a portion of that data can be moved out to a data warehouse for daily reporting. We think of this concept as inside-out data movement.

![](https://i.imgur.com/xC2IjdV.png)

### Outside-in data movement

Customers are storing data in purpose-built data stores such as a data warehouse or a database and are moving that data to a data lake to run analysis on that data. 

_Example_: They copy query results for sales of products in a given region from their data warehouse into their data lake to run product recommendation algorithms against a larger dataset using ML.

![](https://i.imgur.com/XEcSQRv.png)


### Around the perimeter data movement

Seamlessly integrate your data lake, data warehouse, and purpose-built data stores. 

_Example_: They may copy the product catalog data stored in their database to their search service to make it easier to look through their product catalog and offload the search queries from the database.

![](https://i.imgur.com/b9eO6my.png)

### Sharing across data movement

Customers are using a modern data architecture to facilitate governance and data sharing across logical or physical governance boundaries to create Data Domains aligned to lines of business

![](https://i.imgur.com/TGsGmZV.png)
### Data gravity

As data in these data lakes and purpose-built stores continues to grow, it becomes harder to move all this data around because data has gravity. It’s equally important to ensure that data can easily get to wherever it’s needed, with the right controls, to enable analysis and insights.

![](https://i.imgur.com/dwZIFux.png)
## Modern Data Architecture Pillars

Organizations are taking their data from various silos and aggregating all that data in one location to do analytics and machine learning on top of that data. To get the most value from it, they need to leverage a modern data architecture that allows them to move data between data lakes and purpose-built data stores easily. This modern way of architecting requires:

1. Scalable Data Lakes
2. Purpose Built Analytic Services
3. Unified Data Access
4. Unified Governance
5. Performant and Cost-Effective

### Scalable Data Lakes

Setting up and managing data lakes today involves a lot of manual and time-consuming tasks. AWS Lake Formation automates these tasks so you can build and secure your data lake in days instead of months. For your data lake storage, Amazon S3 is the best place to build a data lake because it has unmatched 11 nines of durability and 99.99% availability; the best security, compliance, and audit capabilities with object-level audit logging and access control; the most flexibility with five storage tiers; and the lowest cost with pricing that starts at less than $1 per TB per month.

- [[AWS S3]]: Object storage built to store and retrieve any amount of data from anywhere
- [[AWS Lake Formation]]: Makes it easy to set up a secure data lake in days
- [[Amazon Athena]]: Query and analyze data stored in a data lake using standard [[SQL]]
- [[AWS Glue]]: Serverless data integration service for analytics, machine learning, and application development.

### Purpose Built Analytic Services

These services are all designed to be the best-in-class, which means you never have to compromise on performance, scale, or cost when using them. For example, Amazon Redshift is 3x faster and at least 50 percent less expensive than other cloud data warehouses. Spark on Amazon EMR runs 1.7x faster than standard Apache Spark 3.0, and you can run petabyte-scale analysis at less than half of the cost of traditional on-premises solutions.

- [[Amazon Athena]]: Query and analyze data stored in a data lake using standard [[SQL]]
- [[Amazon EMR]]: Industry leading big-cloud platform for big data processing using open source tools like [[Apache Spark]], [[Hive]], [[Presto]], and other frameworks.
- [[Amazon OpenSearch Service]]: Perform interactive log analytics, real-time application monitoring, website search, and more
- [[Amazon Kinesis]]: Collect, Process, and Analyze Data Streams in real time
- [[Amazon Redshift]]: Fastest growing cloud data warehouse with ability to run complex analytic queries against petabytes of structured data

### Unified Data Access

AWS makes it easy for you to combine, move, and replicate data across multiple data stores and your data lake. For example, AWS Glue provides comprehensive data integration capabilities that make it easy to discover, prepare, and combine data for analytics, machine learning, and application development, while Amazon Redshift can easily query data in your S3 data lake. No other analytics provider makes it as easy for you to move your data, at scale, to where you need it the most.

- [[AWS Glue]]: Serverless data integration service for analytics, machine learning, and application development.
- [[Amazon Kinesis Data Firehose]]: Prepare and load real-time data streams into data-stores and analytic services

### Unified Governance

This can be challenging because managing security, access control, and audit trails across all of the data stores in your organization is complex, time- consuming, and error-prone. AWS gives you the governance capability to manage access to all your data across your data lake and purpose-built data stores from a single place. AWS Lake Formation allows you to centrally define and manage security, governance, and auditing policies, resulting in uniform access control for enterprise-wide data sharing.

- [[AWS Lake Formation]]: Makes it easy to set up a secure data lake in days

### Performant and Cost Effective

In addition to industry-leading price performance for analytics services, S3 intelligent tiering saves customers up to 70 percent on storage cost for data stored in your data lake, and Amazon EC2 provides access to an industry-leading choice of over 200 instance types, up to 100 Gbps network bandwidth, and the ability to choose between on-demand, reserved, and spot instances.

- [[AWS S3]]: Object storage built to store and retrieve any amount of data from anywhere
- [[Amazon EC2]]: Secure and resizable compute capacity to support virtually any workload.
- [[Amazon EMR]]: Industry leading big-cloud platform for big data processing using open source tools like [[Apache Spark]], [[Hive]], [[Presto]], and other frameworks.

***

## Appendix: Links

- [[Build a Lakehouse Architecture on AWS]]
- [[3-Resources/Tools/Developer Tools/Cloud Services/AWS/_README|Amazon Web Services]]
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
list from [[Modern Data Architecture on AWS]] AND -"Changelog"
```