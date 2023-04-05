## Metadata
* URL: [https://docs.aws.amazon.com/athena/latest/ug/other-notable-limitations.html](https://docs.aws.amazon.com/athena/latest/ug/other-notable-limitations.html)
* Publisher: aws.amazon.com
* Note: Listing all columns for all tables

You can list all columns for all tables in AwsDataCatalog or for all tables in a specific database in AwsDataCatalog.

To list all columns for all databases in AwsDataCatalog, use the query SELECT * FROM information_schema.columns.
To restrict the results to a specific database, use table_schema='database_name' in the WHERE clause.
Example – Listing all columns for all tables in a specific database

The following example query lists all columns for all tables in the database webdata.
* Tags: 

## Highlights
* information_schema – Querying information\_schema is most performant if you have a small to moderate amount of AWS Glue metadata. If you have a large amount of metadata, errors can occur. For information about querying the information\_schema database for AWS Glue metadata, see Querying AWS Glue Data Catalog.
