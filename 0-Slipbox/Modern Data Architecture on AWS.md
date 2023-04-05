# Modern Data Architecture on AWS

*Source: [Modern Data Architecture on AWS | Amazon Web Services](https://aws.amazon.com/big-data/datalakes-and-analytics/modern-data-architecture/)*

## Overview

A modern data architecture acknowledges the idea that taking a one-size-fits-all approach to analytics eventually leads to compromises. It is not simply about integrating a data lake with a data warehouse, but rather about integrating a data lake, a data warehouse, and purpose-built stores, enabling unified governance and easy data movement. With a modern data architecture on AWS, customers can rapidly build scalable data lakes, use a broad and deep collection of purpose-built  data services, ensure compliance via a unified  data access, security, and governance, scale their systems at a low cost without compromising performance, and easily share data across organizational boundaries, allowing them to make decisions with speed and agility at scale.

![](https://i.imgur.com/KUbdRCa.png)

## Modern Architecture

### Inside-out data movement

Customers storing data in a data lake and then moving a portion of that data to a purpose-built data store to do additional machine learning or analytics.

*Example:* Clickstream data from web applications can be collected directly in a data lake, and a portion of that data can be moved out to a data warehouse for daily reporting. We think of this concept as inside-out data movement.

![](https://i.imgur.com/xC2IjdV.png)

### Outside-in data movement

Customers are storing data in purpose-built data stores such as a data warehouse or a database and are moving that data to a data lake to run analysis on that data. 

*Example*: They copy query results for sales of products in a given region from their data warehouse into their data lake to run product recommendation algorithms against a larger dataset using ML.

![](https://i.imgur.com/XEcSQRv.png)

### Around the perimeter data movement

Seamlessly integrate your data lake, data warehouse, and purpose-built data stores. 

*Example*: They may copy the product catalog data stored in their database to their search service to make it easier to look through their product catalog and offload the search queries from the database.

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
1. Purpose Built Analytic Services
1. Unified Data Access
1. Unified Governance
1. Performant and Cost-Effective

### Scalable Data Lakes

Setting up and managing data lakes today involves a lot of manual and time-consuming tasks. AWS Lake Formation automates these tasks so you can build and secure your data lake in days instead of months. For your data lake storage, Amazon S3 is the best place to build a data lake because it has unmatched 11 nines of durability and 99.99% availability; the best security, compliance, and audit capabilities with object-level audit logging and access control; the most flexibility with five storage tiers; and the lowest cost with pricing that starts at less than $1 per TB per month.

* [AWS S3](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20S3.md): Object storage built to store and retrieve any amount of data from anywhere
* [AWS Lake Formation](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20Lake%20Formation.md): Makes it easy to set up a secure data lake in days
* [Amazon Athena](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/Amazon%20Athena.md): Query and analyze data stored in a data lake using standard [SQL](../2-Areas/Code/SQL/SQL.md)
* [AWS Glue](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20Glue.md): Serverless data integration service for analytics, machine learning, and application development.

### Purpose Built Analytic Services

These services are all designed to be the best-in-class, which means you never have to compromise on performance, scale, or cost when using them. For example, Amazon Redshift is 3x faster and at least 50 percent less expensive than other cloud data warehouses. Spark on Amazon EMR runs 1.7x faster than standard Apache Spark 3.0, and you can run petabyte-scale analysis at less than half of the cost of traditional on-premises solutions.

* [Amazon Athena](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/Amazon%20Athena.md): Query and analyze data stored in a data lake using standard [SQL](../2-Areas/Code/SQL/SQL.md)
* [Amazon EMR](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/Amazon%20EMR.md): Industry leading big-cloud platform for big data processing using open source tools like *Apache Spark*, *Hive*, *Presto*, and other frameworks.
* [Amazon OpenSearch Service](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/Amazon%20OpenSearch%20Service.md): Perform interactive log analytics, real-time application monitoring, website search, and more
* [Amazon Kinesis](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/Amazon%20Kinesis.md): Collect, Process, and Analyze Data Streams in real time
* [Amazon Redshift](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/Amazon%20Redshift.md): Fastest growing cloud data warehouse with ability to run complex analytic queries against petabytes of structured data

### Unified Data Access

AWS makes it easy for you to combine, move, and replicate data across multiple data stores and your data lake. For example, AWS Glue provides comprehensive data integration capabilities that make it easy to discover, prepare, and combine data for analytics, machine learning, and application development, while Amazon Redshift can easily query data in your S3 data lake. No other analytics provider makes it as easy for you to move your data, at scale, to where you need it the most.

* [AWS Glue](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20Glue.md): Serverless data integration service for analytics, machine learning, and application development.
* [Amazon Kinesis Data Firehose](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/Amazon%20Kinesis%20Data%20Firehose.md): Prepare and load real-time data streams into data-stores and analytic services

### Unified Governance

This can be challenging because managing security, access control, and audit trails across all of the data stores in your organization is complex, time- consuming, and error-prone. AWS gives you the governance capability to manage access to all your data across your data lake and purpose-built data stores from a single place. AWS Lake Formation allows you to centrally define and manage security, governance, and auditing policies, resulting in uniform access control for enterprise-wide data sharing.

* [AWS Lake Formation](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20Lake%20Formation.md): Makes it easy to set up a secure data lake in days

### Performant and Cost Effective

In addition to industry-leading price performance for analytics services, S3 intelligent tiering saves customers up to 70 percent on storage cost for data stored in your data lake, and Amazon EC2 provides access to an industry-leading choice of over 200 instance types, up to 100 Gbps network bandwidth, and the ability to choose between on-demand, reserved, and spot instances.

* [AWS S3](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20S3.md): Object storage built to store and retrieve any amount of data from anywhere
* [Amazon EC2](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/Amazon%20EC2.md): Secure and resizable compute capacity to support virtually any workload.
* [Amazon EMR](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/Amazon%20EMR.md): Industry leading big-cloud platform for big data processing using open source tools like *Apache Spark*, *Hive*, *Presto*, and other frameworks.

---

## Appendix: Links

* [Build a Lakehouse Architecture on AWS](Build%20a%20Lakehouse%20Architecture%20on%20AWS.md)
* *Amazon Web Services*
* [AWS S3](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20S3.md)
* [Data Lake](Data%20Lake.md)
* [Data Engineering](../2-Areas/MOCs/Data%20Engineering.md)
* [Cloud Computing](Cloud%20Computing.md)
* [ELT Cloud Based Pipeline Architecture](ELT%20Cloud%20Based%20Pipeline%20Architecture.md)
* [ETL Pipeline Notes](ETL%20Pipeline%20Notes.md)
* [ETL](ETL.md)
* [ELT](ELT.md)
* [SQL](../2-Areas/Code/SQL/SQL.md)
* [Databases](../2-Areas/MOCs/Databases.md)
* [Data Warehouse](Data%20Warehouse.md)
* [Dimensional Modeling](Dimensional%20Modeling.md)
* [ETL Data Warehousing Best Practices](ETL%20Data%20Warehousing%20Best%20Practices.md)

*Backlinks:*

````dataview
list from [[Modern Data Architecture on AWS]] AND -"Changelog"
````
