## Metadata

\<\<\<\<\<\<\< HEAD

* URL: [https://aws.amazon.com/blogs/big-data/identify-source-schema-changes-using-aws-glue/](https://aws.amazon.com/blogs/big-data/identify-source-schema-changes-using-aws-glue/)

* Author: *Narendra Gupta*

* Publisher: *aws.amazon.com*

* Published Date: 2022-09-14

* Tags: #Article, #Cloud_Architecture, #Cloud:\_AWS, #Data_Engineering, #Data_Pipelines, #Development
  =======

* URL: [https://aws.amazon.com/blogs/big-data/identify-source-schema-changes-using-aws-glue/](https://aws.amazon.com/blogs/big-data/identify-source-schema-changes-using-aws-glue/)

* Author: *Narendra Gupta*

* Publisher: <https://aws.amazon.com>

* Published Date: *2022-09-14*

* Tags: #Type/Source/Article, #Topic/Dev/Architecture, #Topic/Dev/Cloud: #Topic/Dev/Data-Engineering, #Topic/Dev

* Links:
  
  * [AWS](../../Tools/Developer%20Tools/Cloud%20Services/AWS/AWS.md)
  * *Data_Pipelines*
    \>>>>>>> origin/develop

## Highlights

* To extract information from the data, it’s usually stored in a data lake built on Amazon Simple Storage Service (S3). The data lake provides an important characteristic called schema on read, which allows you to bring data in the data lake without worrying about the schema or changes in the schema on the data source. This enables faster ingestion of data or building data pipelines.
* However, you may be reading and consuming this data for other use cases, such as pointing to applications, building business intelligence (BI) dashboards in services like Amazon QuickSight, or doing data discovery using a serverless query engine like Amazon Athena. Additionally, you may have built an extract, transform, and load (ETL) data pipeline to populate your data store like a relational database, non-relational database, or data warehouse for further operational and analytical needs. In these cases, you need to define the schema upfront or even keep an account of the changes in the schema, such as adding new columns, deleting existing columns, changing the data type of existing columns, or renaming existing columns, to avoid any failures in your application or issues with your dashboard or reporting.
* In many use cases, we have found that the data teams responsible for building the data pipeline don’t have any control of the source schema, and they need to build a solution to identify changes in the source schema in order to be able to build the process or automation around it. This might include sending notifications of changes to the teams dependent on the source schema, building an auditing solution to log all the schema changes, or building an automation or change request process to propagate the change in the source schema to downstream applications such as an ETL tool or BI dashboard. Sometimes, to control the number of schema versions, you may want to delete the older version of the schema when there are no changes detected between it and the newer schema.
* For example, assume you’re receiving claim files from different external partners in the form of flat files, and you’ve built a solution to process claims based on these files. However, because these files were sent by external partners, you don’t have much control over the schema and data format. For example, columns such as customer_id and claim_id were changed to customerid and claimid by one partner, and another partner added new columns such as customer_age and earning and kept the rest of the columns the same. You need to identify such changes in advance so you can edit the ETL job to accommodate the changes, such as changing the column name or adding the new columns to process the claims.
* In this solution, we showcase a mechanism that simplifies the capture of the schema changes in your data source using an AWS Glue crawler.
* An AWS Glue data crawler is built to sync metadata based on existing data. After we identify the changes, we use Amazon CloudWatch to log the changes and Amazon Simple Notification Service (Amazon SNS) to notify the changes to the application team over email. You can expand this solution to solve for other use cases such as building an automation to propagate the changes to downstream applications or pipelines, which is out of scope for this post, to avoid any failures in downstream applications because of schema changes. We also show a way to delete older versions of the schema if there are no changes between the compared schema versions.
* If you want to capture the change in an event-driven manner, you can do so by using Amazon EventBridge. However, if you want to capture the schema changes on multiple tables at the same time, based on a specific schedule, you can use the solution in this post.
* In our scenario, we have two files, each with different schemas, simulating data that has undergone a schema change. We use an AWS Glue crawler to extract the metadata from data in an S3 bucket. Then we use an AWS Glue ETL job to extract the changes in the schema to the AWS Glue Data Catalog.
* AWS Glue provides a serverless environment to extract, transform, and load a large number of datasets from several sources for analytic purposes. The Data Catalog is a feature within AWS Glue that lets you create a centralized data catalog of metadata by storing and annotating data from different data stores. Examples include object stores like Amazon S3, relational databases like Amazon Aurora PostgreSQL-Compatible Edition, and data warehouses like Amazon Redshift. You can then use that metadata to query and transform the underlying data. You use a crawler to populate the Data Catalog with tables. It can automatically discover new data, extract schema definitions, detect schema changes, and version tables. It can also detect Hive-style partitions on Amazon S3 (for example year=YYYY, month=MM, day=DD).
* Amazon S3 serves as the storage for our data lake. Amazon S3 is an object storage service that offers industry-leading scalability, data availability, security, and performance.
* The workflow includes the following steps: 1. Copy the first data file to the data folder of the S3 bucket and run the AWS Glue crawler to create a new table in the Data Catalog. 2. Move the existing file from the data folder to the archived folder. 3. Copy the second data file with the updated schema to the data folder, then rerun the crawler to create new version of table schema. 4. Run the AWS Glue ETL job to check if there is a new version of the table schema. 5. The AWS Glue job lists the changes in the schema with the previous version of the schema in CloudWatch Logs. If there are no changes in the schema and the flag to delete older versions is set to true, the job also deletes the older schema versions. 6. The AWS Glue job notifies all changes in the schema to the application team over email using Amazon SNS.
* To build the solution, complete the following steps: 1. Create an S3 bucket with the data and archived folders to store the new and processed data files. 2. Create an AWS Glue database and an AWS Glue crawler that crawls the data file in the data folder to create an AWS Glue table in the database. 3. Create an SNS topic and add an email subscription. 4. Create an AWS Glue ETL job to compare the two versions of the table schema, list the changes in the schema with the older version of schema, and delete older versions of schema if the flag to delete older versions is set to true. The job also publishes an event in Amazon SNS to notify the changes in the schema to the data teams.
* Depending on your application needs, you can automate and orchestrate this process through AWS Glue workflows.
* Let’s set up the infrastructure required to go through the solution to compare an AWS Glue table version to a version updated with recent schema changes.
* Create an AWS Glue database and crawler
* Create an SNS topic
* Create an AWS Glue ETL job Now you create an AWS Glue ETL job to compare two schema versions of a table and list the changes in schemas. If there are no changes in the schema and the flag to delete older versions is set to true, the job also deletes any older versions. If there are changes in schema, the job lists changes in the CloudWatch logs and publishes an event in Amazon SNS to notify changes to the data team.
* Test the solution
* In this post, we showed you how to use AWS services together to detect schema changes in your source data, which you can then use to change your downstream data stores and run ETL jobs to avoid any failures in your data pipeline. We used AWS Glue to understand and catalog the source data schema, AWS Glue APIs to identify schema changes, and Amazon SNS to notify the team about the changes. We also showed you how to delete the older versions of your source data schema using AWS Glue APIs. We used Amazon S3 as our data lake storage tier. Here you can learn more about AWS Glue.
