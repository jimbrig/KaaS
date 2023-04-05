# AWS S3 Data Lake Layers and Buckets Best Practices

*Source: [Defining S3 bucket and path names for data lake layers on the AWS Cloud | AWS Prescriptive Guidance](https://docs.aws.amazon.com/prescriptive-guidance/latest/defining-bucket-names-data-lakes/welcome.html)*

*PDF: *defining-bucket-names-data-lakes.pdf** (See [Appendix: PDF](AWS%20S3%20Data%20Lake%20Layers%20and%20Buckets%20Best%20Practices.md#appendix-pdf) for viewing the PDF from this page)

## Contents

* [Overview](AWS%20S3%20Data%20Lake%20Layers%20and%20Buckets%20Best%20Practices.md#overview)
  * [Data Layers](AWS%20S3%20Data%20Lake%20Layers%20and%20Buckets%20Best%20Practices.md#data-layers)
  * [Links](AWS%20S3%20Data%20Lake%20Layers%20and%20Buckets%20Best%20Practices.md#links)
  * [Targeted Business Outcomes](AWS%20S3%20Data%20Lake%20Layers%20and%20Buckets%20Best%20Practices.md#targeted-business-outcomes)
* [Recommended Data Layers](AWS%20S3%20Data%20Lake%20Layers%20and%20Buckets%20Best%20Practices.md#recommended-data-layers)
  * [Naming S3 Buckets for Data Layers](AWS%20S3%20Data%20Lake%20Layers%20and%20Buckets%20Best%20Practices.md#naming-s3-buckets-for-data-layers)
  * [Landing Zone S3 Bucket](AWS%20S3%20Data%20Lake%20Layers%20and%20Buckets%20Best%20Practices.md#landing-zone-s3-bucket)
  * [Raw Layer S3 Bucket](AWS%20S3%20Data%20Lake%20Layers%20and%20Buckets%20Best%20Practices.md#raw-layer-s3-bucket)
  * [Stage Layer S3 Bucket](AWS%20S3%20Data%20Lake%20Layers%20and%20Buckets%20Best%20Practices.md#stage-layer-s3-bucket)
  * [Analytics Layer S3 Bucket](AWS%20S3%20Data%20Lake%20Layers%20and%20Buckets%20Best%20Practices.md#analytics-layer-s3-bucket)
* [Mapping IAM Policies to S3 Buckets in Data Lake](AWS%20S3%20Data%20Lake%20Layers%20and%20Buckets%20Best%20Practices.md#mapping-iam-policies-to-s3-buckets-in-data-lake)
* [Appendix: Links](AWS%20S3%20Data%20Lake%20Layers%20and%20Buckets%20Best%20Practices.md#appendix-links)
* [Appendix: PDF](AWS%20S3%20Data%20Lake%20Layers%20and%20Buckets%20Best%20Practices.md#appendix-pdf)

## Overview

This guide helps you create a consistent naming standard for [Amazon Simple Storage Service](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20S3.md) (Amazon S3) buckets and paths in [data lakes](Data%20Lake.md) hosted on the [Amazon Web Services (AWS) Cloud](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS.md). The guide's naming standard for S3 buckets and paths helps you to improve governance and observability in your data lakes, identify costs by data layer and AWS account, and provides an approach for naming *AWS Identity and Access Management (IAM)* roles and policies.

### Data Layers

We recommend that you use at least three data layers in your data lakes and that each layer uses a **separate S3 bucket**. However, some use cases might require an additional S3 bucket and data layer, depending on the data types that you generate and store. For example, if you store sensitive data, we recommend that you use a landing zone data layer and a separate S3 bucket. The following list describes the three recommended data layers for your data lake:

* **Raw data layer** – Contains raw data and is the layer in which data is initially ingested. If possible, we recommend that you retain the original file format and turn on versioning in the S3 bucket.

* **Stage data layer** – Contains intermediate, processed data that is optimized for consumption (for example CSV to Apache Parquet converted raw files or data transformations). An [AWS Glue](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20Glue.md) job reads the files from the raw layer and validates the data. The AWS Glue job then stores the data in an *Apache Parquet* formatted file and the *metadata is stored in a table in the *AWS Glue Data Catalog**.

* **Analytics data layer** – Contains the aggregated data for your specific use cases in a consumption-ready format (for example, *Apache Parquet*).

This guide's recommendations are based on the authors' experience in implementing data lakes with the [serverless data lake framework (SDLF)](https://sdlf.workshop.aws/en/) and are intended for data architects, [data engineers](Data%20Engineers.md), or solutions architects who want to set up a [data lake](Data%20Lake.md) on the AWS Cloud. However, you must make sure that you adapt this guide's approach to meet your organization's policies and requirements.

### Links

The guide contains the following sections:

* [Recommended data layers](https://docs.aws.amazon.com/prescriptive-guidance/latest/defining-bucket-names-data-lakes/data-layer-definitions.html)

* [Naming S3 buckets in your data layers](https://docs.aws.amazon.com/prescriptive-guidance/latest/defining-bucket-names-data-lakes/naming-structure-data-layers.html)

* [Mapping S3 buckets to IAM policies in your data lake](https://docs.aws.amazon.com/prescriptive-guidance/latest/defining-bucket-names-data-lakes/iam-policies-data-lakes.html)

* [Handling sensitive data](https://docs.aws.amazon.com/prescriptive-guidance/latest/defining-bucket-names-data-lakes/handling-sensitive-data.html)

### Targeted Business Outcomes

You should expect the following five outcomes after implementing a naming standard for S3 buckets and paths in data lakes on the AWS Cloud:

* Improved governance and observability in your data lake.

* Increased visibility into your overall costs for individual AWS accounts by using the relevant AWS account ID in the S3 bucket name and for data layers by using [cost allocation tags](https://docs.aws.amazon.com/AmazonS3/latest/userguide/CostAllocTagging.html) for the S3 buckets.

* More cost-effective data storage by using layer-based versioning and path-based lifecycle policies.

* Meet security requirements for data masking and data encryption.

* Simplify data source tracing by enhancing developer visibility to the AWS Region and AWS account of the underlying data storage.

## Recommended Data Layers

If you work with non-sensitive data, such as non-personally identifiable information (PII) data, we recommend that you use at least three different data layers in a data lake on the AWS Cloud.

However, you might require additional layers depending on the data’s complexity and use cases. For example, if you work with sensitive data (for example, PII data), we recommend that you use an additional Amazon Simple Storage Service (Amazon S3) bucket as a landing zone and then mask the data before it is moved into the raw data layer. For more information about this, see the [Handling sensitive data](https://docs.aws.amazon.com/prescriptive-guidance/latest/defining-bucket-names-data-lakes/handling-sensitive-data.html) section of this guide.

Each data layer must have an individual S3 bucket; the following table describes our recommended data layers:

|Layer|Description|Sample lifecycle policy strategy|
|:---:|-----------|--------------------------------|
|**Raw**|Contains the raw, unprocessed data and is the layer in which data is ingested into the data lake. If possible, you should keep the original file format and turn on versioning in the S3 bucket.|After one year, move files into the Amazon S3 infrequent access (IA) storage class. After two years in Amazon S3 IA, archive them to Amazon S3 Glacier.|
|**Stage**|Contains intermediate, processed data that is optimized for consumption (for example CSV to Apache Parquet converted raw files or data transformations). An AWS Glue job reads the files from the raw layer and validates the data. The AWS Glue job then stores the data in an Apache Parquet-formatted file and the metadata is stored in a table in the AWS Glue Data Catalog.|Data can be deleted after a defined time period or according to your organization's requirements. Some data derivatives (for example, an Apache Avro transform of an original JSON format) can be removed from the data lake after a shorter amount of time (for example, after 90 days).|
|**Analytics**|Contains the aggregated data for your specific use cases in a consumption-ready format (for example, Apache Parquet).|Data can be moved to Amazon S3 IA and then deleted after a defined time period or according to your organization's requirements.|

### Naming S3 Buckets for Data Layers

We recommend that you create separate S3 buckets for each individual layer because archiving, versioning, access, and encryption requirements can vary for each layer.

The following diagram shows the recommended naming structure for S3 buckets in the three recommended data lake layers, including separating multiple business units, file formats, and partitions. You can adapt data partitions according to your organization's requirements, but you should use lowercase and key-value pairs (For example, `year=yyyy`, not `yyyy`) so that you can update the catalog with the `MSCK REPAIR TABLE` command.

![](https://i.imgur.com/8EZnGIv.png)

````ad-important

S3 buckets must follow the naming guidelines from Bucket naming rules in the Amazon S3 documentation.

````

### Landing Zone S3 Bucket

You require an Amazon Simple Storage Service (Amazon S3) bucket for your landing zone if sensitive datasets contain elements that must be masked before data is moved to the raw bucket.

The following table provides the naming structure, a description of the naming structure, and a name example for the S3 bucket in your landing zone layer.

|Naming Format|Example|
|-------------|-------|
|`s3://companyname-landingzone-awsregion-awsaccount\|uniqid-env/source/source_region/table/year=yyyy/month=mm/day=dd/table_<yearmonthday>.avro\|csv`|`s3://anycompany-landingzone-useast1-12345-dev/socialmedia/us/tb_products/year=2021/month=03/day=01/products_20210301.csv`|

Where,

* `companyname` – The organization’s name (optional).

* `awsregion` – The AWS Region (for example, `us-east-1`, or `sa-east-1`).

* `awsaccount|uniqid` – The unique identifier or AWS account ID.

* `env` – The deployment environment (for example, `dev`, `test`, or `prod`).

* `source` – The source or content (for example, MySQL database, ecommerce, or SAP).

* `source_region` – For example, `us` or `asia`.

* `table` – `tb_customer`, `tb_transactions`, or `tb_products`.

### Raw Layer S3 Bucket

The raw data layer contains ingested data that has not been transformed and is in its original file format (for example, JSON or CSV). This data is typically organized by data source and the date that it was ingested into the raw data layer's Amazon Simple Storage Service (Amazon S3) bucket.

The following table provides the naming structure, a description of the naming structure, and a name example for the S3 bucket in your raw data layer.

|Naming Format|Example|
|-------------|-------|
|`s3://companyname-raw-awsregion-awsaccount\|uniqid-env/source/source_region/table/year=yyyy/month=mm/day=dd/table_<yearmonthday>.avro\|csv`|`s3://anycompany-raw-useast1-12345-dev/socialmedia/us/tb_products/year=2021/month=03/day=01/products_20210301.csv`|

Where,

* `companyname` – The organization’s name (optional).

* `awsregion` – The AWS Region (for example, `us-east-1`, or `sa-east-1`).

* `awsaccount|uniqid` – The unique identifier or AWS account ID.

* `env` – The deployment environment (for example, `dev`, `test`, or `prod`).

* `source` – The source or content (for example, MySQL database, ecommerce, or SAP).

* `source_region` – For example, `us` or `asia`.

* `table` – `tb_customer`, `tb_transactions`, or `tb_products`.

### Stage Layer S3 Bucket

Data in the stage layer is read and transformed from the raw layer (for example, by using an AWS Glue or Amazon EMR job). This process validates the data (for example, by checking data types and headers) and then stores it in a consumption-ready file format such as Apache Parquet. The metadata is stored in a table in the [AWS Glue Data Catalog](https://docs.aws.amazon.com/glue/latest/dg/components-overview.html).

The following table provides the naming structure, a description of the naming structure, and a name example for the S3 bucket in your stage data layer.

|Naming Format|Example|
|-------------|-------|
|`s3://companyname-stage-awsregion-awsaccount\|uniqid-env/source/source_region/business_unit/table/<partitions>/table_<table_name>_<yearmonthday>.snappy.parquet`|`s3://anycompany-stage-saeast1-12345-dev/sap/br/customers/validated/dt=2021-03-01/table_customers_20210301.snappy.parquet`|

Where,

* `companyname` – The organization’s name (optional).

* `awsregion` – The AWS Region (for example, `us-east-1`, or `sa-east-1`).

* `awsaccount|uniqid` – The unique identifier or AWS account ID.

* `env` – The deployment environment (for example, `dev`, `test`, or `prod`).

* `source` – The source or content (for example, MySQL database, ecommerce, or SAP).

* `source_region` – For example, `us` or `asia`.

* `business_unit` – The business unit that the data is processed for.

* `table` – `tb_customer`, `tb_transactions`, or `tb_products`.

* `partitions` – Partitions that provide the best performance for the consumer, allowing the query engine to avoid full data scans.

### Analytics Layer S3 Bucket

The analytics layer is similar to the stage layer because the data is in a processed file format, but the data is then aggregated according to your organization's requirements.

The following table provides the naming structure, a description of the naming structure, and a name example for the S3 bucket in your analytics data layer.

|Naming Format|Example|
|-------------|-------|
|`s3://companyname-analytics-awsregion-awsaccount\|uniqid-env/source_region/business_unit/tb_<region>_<table_name>_<file_format>/<partition_0>/<partition_1>/.../<partition_n>/xxxxx.<compression>.<file_format>`|`s3://anycompany-analytics-useast1-12345-dev/us/sales/tb_us_customers_parquet/<partitions>/part-000001-20218c886790.c000.snappy.parquet`|

Where,

* `companyname` – The organization’s name (optional).

* `awsregion` – The AWS Region (for example, `us-east-1`, or `sa-east-1`).

* `awsaccount|uniqid` – The unique identifier or AWS account ID.

* `env` – The deployment environment (for example, `dev`, `test`, or `prod`).

* `source` – The source or content (for example, MySQL database, ecommerce, or SAP).

* `source_region` – For example, `us` or `asia`.

* `business_unit` – The business unit that the data is processed for.

* `table` – `tb_customer`, `tb_transactions`, or `tb_products`.

* `partitions` – Partitions that provide the best performance for the consumer, allowing the query engine to avoid full data scans.

## Mapping IAM Policies to S3 Buckets in Data Lake

We recommend that you map the data lake’s Amazon Simple Storage Service (Amazon S3) buckets and paths to AWS Identity and Access Management (IAM) policies and roles by using the bucket names or paths in the IAM policy or role name. The following table shows a sample S3 bucket name and a sample IAM policy that is used to access this S3 bucket.

````JSON
{
      “Version” : “2012-10-17",
      “Statement” : [
      {
      “Sid” : “s3-nosql-us-customers-get-list",
      “Effect” : “Allow”,
      “Principal” : “*”,
      “Action” : [
      “s3:GetObject”,
      “s3:ListBucket”
      ],
      “Resource” : [
      “arn:aws:s3:::<companyname>-raw-<aws_region>-<aws_accountid>-dev/*”
      ]
      }
      ]
      }
     
````

---

## Appendix: Links

* [Development](../2-Areas/MOCs/Development.md)
* [Cloud Computing](Cloud%20Computing.md)
* [AWS](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS.md)
* [AWS S3](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20S3.md)
* [Data Lake](Data%20Lake.md)
* [Cloud Computing](Cloud%20Computing.md)
* [Data Science](../2-Areas/MOCs/Data%20Science.md)
* [Data Engineers](Data%20Engineers.md)
* [Data Engineering](../2-Areas/MOCs/Data%20Engineering.md)
* [Data Pipelines](Data%20Pipelines.md)
* [AWS Glue](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20Glue.md)
* *AWS IAM*

## Appendix: PDF



*Backlinks:*

````dataview
list from [[AWS S3 Data Lake Layers and Buckets Best Practices]] AND -"Changelog"
````
