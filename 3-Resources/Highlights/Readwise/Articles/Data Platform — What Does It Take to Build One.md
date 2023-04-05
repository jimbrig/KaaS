# Data Platform — What Does It Take to Build One?

## Metadata

* Author: *Manvik Kathuria*
* Full Title: Data Platform — What Does It Take to Build One?
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/c6c4d9e7a05c

## Highlights

* The most popular services/frameworks are Airflow, Azure Data Factory, AWS Data Pipeline, Google Dataflow, Stitch, Talend, Azure Event Hubs, AWS Kinesis and Kafka that provide integration with widely used data sources ranging from SQL, No-SQL based data storage, CRMs, IoT, ERPs and all kinds of product suites.
* I would recommend Airflow for its popularity in the community and availability of connectors/plugins to other systems as data sources/sinks. You can start with one and then add other SaaS/OSS offering to create another ingestion pattern.
* Don’t forget these ingestion pipeline may also be extended to orchestrating your data workloads within the platform, so choose wisely !
* Some of the popular options in this space are AWS Redshift, Azure Synapse, Snowflake, Databricks, Google Big Query, AWS EMR, that offer options to do transformation and store data. For data lake scenarios, the data can be stored in S3 or ADLS Gen2. There are OSS technologies like Apache Spark, Hadoop, Flink, Hudi or Airflow for this purpose.
* Most of the SaaS/PaaS offering including OSS work well with all types of reporting tools. You can choose Power BI, Tableau, Sisense or OSS like Metabase, Redash depending on how complicated/simple you want your reporting and what your users can work with easily and effectively. No matter which one you choose today, its relatively easy to replace it with another in the future due to it being just the presentation layer.
* Data governance would cover data classification, tagging, ownership and other fields to enrich the data quality. Combined with a tool to capture & display metadata would add immense value for the users.
* Data Strategy — Define a data strategy for your organization. This will help with setting the goals of what you want to accomplish
* Start lean — Do not integrate with all sources at once. Do a thin slice of your data platform to validate it end to end before you start inviting everyone to it
* Think long term but deliver in short term — Have your eye on the ultimate long term goal, but focus on building and delivering it in short term to start realizing value sooner
* Go on a data journey — Even with the best data platform you can’t derive value, unless you take the whole organization with you. Create a culture that promotes insightful decision making. Communicate & Collaborate with teams to help empower users to self-serve insights.
