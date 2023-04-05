# Comparing AWS RDS vs RedShift as Primary Cloud Data Warehouse

## Contents

* [Key Features](Comparing%20AWS%20RDS%20vs%20RedShift%20as%20Primary%20Cloud%20Data%20Warehouse.md#key-features)
  * [Key Features of AWS RDS](Comparing%20AWS%20RDS%20vs%20RedShift%20as%20Primary%20Cloud%20Data%20Warehouse.md#key-features-of-aws-rds)
  * [Key Features of AWS Redshift](Comparing%20AWS%20RDS%20vs%20RedShift%20as%20Primary%20Cloud%20Data%20Warehouse.md#key-features-of-aws-redshift)
* [Comparisons](Comparing%20AWS%20RDS%20vs%20RedShift%20as%20Primary%20Cloud%20Data%20Warehouse.md#comparisons)
  * [Scaling](Comparing%20AWS%20RDS%20vs%20RedShift%20as%20Primary%20Cloud%20Data%20Warehouse.md#scaling)
* [Storage Capacity](Comparing%20AWS%20RDS%20vs%20RedShift%20as%20Primary%20Cloud%20Data%20Warehouse.md#storage-capacity)
* [Use Cases](Comparing%20AWS%20RDS%20vs%20RedShift%20as%20Primary%20Cloud%20Data%20Warehouse.md#use-cases)
  * [When to use Redshift?](Comparing%20AWS%20RDS%20vs%20RedShift%20as%20Primary%20Cloud%20Data%20Warehouse.md#when-to-use-redshift)
  * [When to use RDS?](Comparing%20AWS%20RDS%20vs%20RedShift%20as%20Primary%20Cloud%20Data%20Warehouse.md#when-to-use-rds)
* [Considerations and Concerns](Comparing%20AWS%20RDS%20vs%20RedShift%20as%20Primary%20Cloud%20Data%20Warehouse.md#considerations-and-concerns)
  * [Concerns for No-SQL (RDS) Architecture](Comparing%20AWS%20RDS%20vs%20RedShift%20as%20Primary%20Cloud%20Data%20Warehouse.md#concerns-for-no-sql-rds-architecture)
  * [Benefits of SQL Based Architecture](Comparing%20AWS%20RDS%20vs%20RedShift%20as%20Primary%20Cloud%20Data%20Warehouse.md#benefits-of-sql-based-architecture)
  * [Concerns for a Migration to RedShift from RDS](Comparing%20AWS%20RDS%20vs%20RedShift%20as%20Primary%20Cloud%20Data%20Warehouse.md#concerns-for-a-migration-to-redshift-from-rds)
    \[TOC\]

## Key Features

### Key Features of AWS RDS

AWS RDS offers a fully managed relational database as a service. It allows a customer to choose from six different database engines – MySQL, MariaDB, PostgreSQL, AWS Aurora, Oracle Database, and SQL Server. Customers can also choose between different types of hardware through AWS instance types – optimized for performance, memory or IO. All the typical administrative tasks related to running a database – Hardware provisioning, database setup, patching updates, backing up data, etc. are completely automated and the customers can focus only on their mission-critical business logic. 

The full suite of security and compliance comes built-in with RDS along with encryption. AWS also offers a high availability option in the form of multiAZ deployment. This means a replica of your database is automatically maintained in another region and AWS will manage a completely seamless switch in the unfortunate case of something going wrong with your database.

Architecturally, RDS works on top of virtualized instances. There is no concept of cluster or nodes when it comes to RDS and these individual virtualized instances can be scaled for performance or storage with just a few clicks. The scaling normally takes a few minutes and it can go up to a maximum capacity of 32 vCPUs and 244GB of RAM. Storage scaling will depend on the type of database engine that is being used and the maximum it can go up is up to 64 TB for AWS Aurora database engine.

### Key Features of AWS Redshift

Redshift is a completely managed data warehouse as a service and can scale up to petabytes of data while offering lightning-fast querying performance. The querying engine is PostgreSQL complaint with small differences in data types and the data structure is columnar. Redshift allows the customers to choose from different types of instances optimized for performance or storage. Scaling in the case of newer generation instances can happen in a matter of minutes using the elastic resize feature. While for older generation instances that do not support elastic resize, scaling can only happen in a few hours. Nevertheless, all the administrative tasks are automated here as well and customers can focus only on their core business logic.

Redshift manages this optimum mix of scalability and performance through a cluster-based architecture with multiple nodes. Scaling is accomplished by upgrading the nodes, adding more nodes or both. Among the nodes, one of the nodes is designated as a leader node and this node is responsible for client communication, query optimization, execution plan creation, and sending tasks to individual nodes for execution. Except for some administration queries, nothing gets executed on the leader node and the real work is delegated to member nodes. 

Like RDS, Redshift pricing is also including storage and compute resources and customers can choose to pay only for what they use. Redshift is mainly optimized for large complex analytical workloads spanning across millions of rows, but can also support OLTP workloads if necessary; though it is not the recommended practice.

## Comparisons

### Scaling

The ability to scale is one of the most critical factors to consider when making a choice between different databases. Both Redshift and RDS allows the customers to scale as per their budget and performance requirements. Since RDS is based on virtualized instances, its scaling is done by reconfiguring the virtual instance capabilities. Scaling takes only a few minutes and can be done in a few clicks in the AWS console.

Redshift is based on a more complex architecture and it means scaling is not as seamless as it is in RDS. Redshift instances with support for elastic resize can do it in a few minutes, but the database unavailable time window is certainly higher than that of RDS. That said, the limit of scaling is higher for Redshift when it comes to storage. Redshift also has an option called concurrency scaling which can be used to support a virtually unlimited number of concurrent users without a drop in querying performance.

## Storage Capacity

The biggest differentiator between Redshift and RDS is the storage capacity and the limit to which it can be scaled. With Redshift, the storage can be scaled up to petabytes of data. The limit of AWS Redshift is 2 PB with its ds2.8xlarge type instance. With RDS, since it works with individual virtualized instances, the storage limit is in the range of TBs and will vary according to the chosen database engine. For SQL server the storage capacity is limited at 16 TB, while the aurora engine can scale up to 64 TB. All the other engine types can scale up to 32 TB of data.

## Use Cases

### When to use Redshift?

* You want a petabyte-scale data warehouse and is not happy with traditional database engines
* Your analytical and reporting workload is heavy and can interfere with your OLTP database.
* Your queries span across millions of rows and you anticipate even more complex queries
* You anticipate a constant query workload and your cluster will be running for the most part of the day.
* You are ready to manage the uniqueness of your insertion keys yourselves and do not expect the database to ensure it.
* You have a willing team to put their head into DIST KEYS and SORT KEYS and structure data so that best performance is extracted.

### When to use RDS?

* You want to use traditional databases in the cloud and the only requirement is to offload the database management. 
* Your data volume is in TBs and you do not anticipate a large increase in the near future. RDS hits its storage limits at 64 TB.
* You have an online transaction processing use case and want instant results with lesser data.
* You don’t have queries that span across millions of rows and the query complexity is limited. 
* Your reporting and analytical workloads are minimal and do not interfere with your OLTP workloads.
* Your budget is tighter and you have no intention to spend money anticipating future astronomical workloads.

## Considerations and Concerns

### Concerns for No-SQL (RDS) Architecture

* How will end-user client applications, data marts, and BI developers access and query the required reporting level data?

* How are relationships between tables and referential integrity maintained?

* Have we considered vendor lock-in?
  
  * SQL based architecture is cloud agnostic, portable, reproducible, and future proof
* How to setup external connections to important reporting data?

* Have we considered learning curve of Athena and Glue vs. SQL?

* How do we track historical insights and trends?

* Is this architecture as efficient as a SQL based database? Have we tested power/speed diagnostics for analytical processing?

* Can this architecture scale over time?

* Does this architecture limit business intelligence analysts to specific BI tools (i.e. can only use QuickSight to integrate and query data directly, otherwise have to export files for use?) 

* Complexity of internal RLUS workflows

### Benefits of SQL Based Architecture

* SQL Data Warehouse separates storage and compute, which allows each to scale independently. SQL Data Warehouse can quickly and simply scale to add additional compute resources at a moment's notice
* etc.

### Concerns for a Migration to RedShift from RDS

* PostgreSQL Extensions:
  * `aws_s3`
  * `aws_common`
* Triggers, UDFs, and Procedures
  * Entire workflow relies on a suite of PostgreSQL table based triggers and their corresponding trigger functions

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

See Also: [Consideration and Concerns Regarding AWS Data Architecture](Consideration%20and%20Concerns%20Regarding%20AWS%20Data%20Architecture.md)

*Backlinks:*

````dataview
list from [[Comparing AWS RDS vs RedShift as Primary Cloud Data Warehouse]] AND -"Changelog"
````
