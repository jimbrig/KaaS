---
Date: 2022-02-22
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool", "#Topic/Dev/Cloud/AWS", "#Topic/Dev/Data/Databases"]
Alias: ["AWS Aurora"]
---

# AWS Aurora

*Source: [What is Amazon Aurora? - Amazon Aurora](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)*

See Also: [[AWS RDS]]

## Contents

- [[#What is Amazon Aurora?|What is Amazon Aurora?]]
- [[#Further Reading Topics|Further Reading Topics]]
- [[#Integrating with AWS Services|Integrating with AWS Services]]
	- [[#Import from S3|Import from S3]]
	- [[#Setting up access to an Amazon S3 bucket|Setting up access to an Amazon S3 bucket]]
		- [[#Using an IAM role to access an Amazon S3 bucket|Using an IAM role to access an Amazon S3 bucket]]
		- [[#Using security credentials to access an Amazon S3 bucket|Using security credentials to access an Amazon S3 bucket]]
		- [[#Troubleshooting access to Amazon S3|Troubleshooting access to Amazon S3]]
	- [[#Using the `aws_s3.table_import_from_s3` function to import Amazon S3 data|Using the `aws_s3.table_import_from_s3` function to import Amazon S3 data]]
		- [[#Importing an Amazon S3 file that uses a custom delimiter|Importing an Amazon S3 file that uses a custom delimiter]]
		- [[#Importing an Amazon S3 compressed (gzip) file|Importing an Amazon S3 compressed (gzip) file]]
		- [[#Importing an encoded Amazon S3 file|Importing an encoded Amazon S3 file]]
	- [[#Function reference|Function reference]]
		- [[#`aws_s3.table_import_from_s3`|`aws_s3.table_import_from_s3`]]
			- [[#Syntax|Syntax]]
			- [[#Parameters|Parameters]]
			- [[#Alternate syntax|Alternate syntax]]
			- [[#Alternate parameters|Alternate parameters]]
		- [[#`aws_commons.create_s3_uri`|`aws_commons.create_s3_uri`]]
			- [[#Syntax|Syntax]]
			- [[#Parameters|Parameters]]
		- [[#`aws_commons.create_aws_credentials`|`aws_commons.create_aws_credentials`]]
			- [[#Syntax|Syntax]]
			- [[#Parameters|Parameters]]
- [[#Best Practices - PostgreSQL|Best Practices - PostgreSQL]]
	- [[#Fast Failover with Amazon Aurora PostgreSQL|Fast Failover with Amazon Aurora PostgreSQL]]
	- [[#Setting up TCP Keepalive Parameters|Setting up TCP Keepalive Parameters]]
	- [[#Reduce DNS Cache Timeouts|Reduce DNS Cache Timeouts]]
	- [[#Setting an Aurora PostgreSQL connection string for fast failover|Setting an Aurora PostgreSQL connection string for fast failover]]
- [[#Appendix: Links|Appendix: Links]]


## What is Amazon Aurora?

Amazon Aurora (Aurora) is a fully managed relational database engine that's compatible with [[MySQL]] and [[PostgreSQL]]. You already know how [[MySQL]] and [[PostgreSQL]] combine the speed and reliability of high-end commercial databases with the simplicity and cost-effectiveness of open-source databases. The code, tools, and applications you use today with your existing MySQL and PostgreSQL databases can be used with Aurora. With some workloads, **Aurora can deliver up to five times the throughput of MySQL and up to three times the throughput of PostgreSQL without requiring changes to most of your existing applications**.

**Aurora includes a high-performance storage subsystem**. Its MySQL- and PostgreSQL-compatible database engines are customized to take advantage of that fast distributed storage. The underlying storage grows automatically as needed. An Aurora cluster volume can grow to a maximum size of 128 tebibytes (TiB). Aurora also automates and standardizes database clustering and replication, which are typically among the most challenging aspects of database configuration and administration.

Aurora is part of the managed database service [[AWS RDS|Amazon Relational Database Service]] (Amazon RDS). [[AWS RDS|Amazon RDS]] is a web service that makes it easier to set up, operate, and scale a relational database in the cloud. If you are not already familiar with Amazon RDS, see the [_Amazon Relational Database Service User Guide_](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html).

The following points illustrate how Aurora relates to the standard [[MySQL]] and [[PostgreSQL]] engines available in [[AWS RDS|Amazon RDS]]:

-   You choose Aurora as the DB engine option when setting up new database servers through Amazon RDS.
    
-   Aurora takes advantage of the familiar Amazon Relational Database Service (Amazon RDS) features for management and administration. Aurora uses the Amazon RDS AWS Management Console interface, [[AWS CLI]] commands, and API operations to handle routine database tasks such as provisioning, patching, backup, recovery, failure detection, and repair.
    
-   Aurora management operations typically involve entire clusters of database servers that are synchronized through replication, instead of individual database instances. The automatic clustering, replication, and storage allocation make it simple and cost-effective to set up, operate, and scale your largest MySQL and PostgreSQL deployments.
    
-   You can bring data from Amazon RDS for MySQL and Amazon RDS for PostgreSQL into Aurora by creating and restoring snapshots, or by setting up one-way replication. You can use push-button migration tools to convert your existing Amazon RDS for MySQL and Amazon RDS for PostgreSQL applications to Aurora.
    

Before using Amazon Aurora, you should complete the steps in [Setting up your environment for Amazon Aurora](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_SettingUp_Aurora.html), and then review the concepts and features of Aurora in [Amazon Aurora DB clusters](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Overview.html).

## Further Reading Topics

-   [Amazon Aurora DB clusters](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Overview.html)
-   [Amazon Aurora versions](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.VersionPolicy.html)
-   [Regions and Availability Zones](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.RegionsAndAvailabilityZones.html)
-   [Supported features in Amazon Aurora by AWS Region and Aurora DB engine](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.AuroraFeaturesRegionsDBEngines.grids.html)
-   [Amazon Aurora connection management](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Overview.Endpoints.html)
-   [Aurora DB instance classes](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.DBInstanceClass.html)
-   [Amazon Aurora storage and reliability](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Overview.StorageReliability.html)
-   [Amazon Aurora security](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Overview.Security.html)
-   [High availability for Amazon Aurora](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.AuroraHighAvailability.html)
-   [Replication with Amazon Aurora](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Replication.html)
-   [DB instance billing for Aurora](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/User_DBInstanceBilling.html)

## Integrating with AWS Services

Amazon Aurora integrates with other AWS services so that you can extend your Aurora PostgreSQL DB cluster to use additional capabilities in the AWS Cloud. Your Aurora PostgreSQL DB cluster can use AWS services to do the following:

-   Quickly collect, view, and assess performance for your Aurora PostgreSQL DB instances with Amazon RDS Performance Insights. Performance Insights expands on existing Amazon RDS monitoring features to illustrate your database's performance and help you analyze any issues that affect it. With the Performance Insights dashboard, you can visualize the database load and filter the load by waits, SQL statements, hosts, or users. For more information about Performance Insights, see [Monitoring DB load with Performance Insights on Amazon Aurora](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_PerfInsights.html).
    
-   Automatically add or remove Aurora Replicas with Aurora Auto Scaling. For more information, see [Using Amazon Aurora Auto Scaling with Aurora replicas](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Integrating.AutoScaling.html).
    
-   Configure your Aurora PostgreSQL DB cluster to publish log data to Amazon CloudWatch Logs. CloudWatch Logs provide highly durable storage for your log records. With CloudWatch Logs, you can perform real-time analysis of the log data, and use CloudWatch to create alarms and view metrics. For more information, see [Publishing Aurora PostgreSQL logs to Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.CloudWatch.html).
    
-   Import data from an Amazon S3 bucket to an Aurora PostgreSQL DB cluster, or export data from an Aurora PostgreSQL DB cluster to an Amazon S3 bucket. For more information, see [Importing Amazon S3 data into an Aurora PostgreSQL DB cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_PostgreSQL.S3Import.html) and [Exporting data from an Aurora PostgreSQL DB cluster to Amazon S3](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/postgresql-s3-export.html).
    
-   Add machine learning-based predictions to database applications using the SQL language. Aurora machine learning uses a highly optimized integration between the Aurora database and the AWS machine learning (ML) services SageMaker and Amazon Comprehend. For more information, see [Using machine learning (ML) with Aurora PostgreSQL](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/postgresql-ml.html).
    
-   Invoke AWS Lambda functions from an Aurora PostgreSQL DB cluster. To do this, use the `aws_lambda` PostgreSQL extension provided with Aurora PostgreSQL. For more information, see [Invoking an AWS Lambda function from an Aurora PostgreSQL DB cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/PostgreSQL-Lambda.html).
    
-   For easy and efficient access to Oracle databases for Aurora PostgreSQL, you can use the PostgreSQL `oracle_fdw` extension, which provides a foreign data wrapper. For more information, see [Using the oracle_fdw extension to access foreign data in Aurora PostgreSQL](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Appendix.PostgreSQL.CommonDBATasks.html).
    
-   Integrate queries from Amazon Redshift and Aurora PostgreSQL. For more information, see [Getting started with using federated queries to PostgreSQL](https://docs.aws.amazon.com/redshift/latest/dg/getting-started-federated.html) in the _Amazon Redshift Database Developer Guide_.

### Import from S3

You can import data from [[AWS S3|Amazon S3]] into a table belonging to an Aurora PostgreSQL DB cluster. To do this, you use the `aws_s3` PostgreSQL extension that Aurora PostgreSQL provides. Your database must be running PostgreSQL version 10.7 or higher to import from Amazon S3 into Aurora PostgreSQL.

If you are using encryption, the Amazon S3 bucket must be encrypted with an AWS managed key. Currently, you can't import data from a bucket that is encrypted with a customer managed key.

For more information on storing data with Amazon S3, see [Create a bucket](https://docs.aws.amazon.com/AmazonS3/latest/gsg/CreatingABucket.html) in the _Amazon Simple Storage Service User Guide_. For instructions on how to upload a file to an Amazon S3 bucket, see [Add an object to a bucket](https://docs.aws.amazon.com/AmazonS3/latest/gsg/PuttingAnObjectInABucket.html) in the _Amazon Simple Storage Service User Guide_.

**To import S3 data into Aurora PostgreSQL**

1.  Install the required PostgreSQL extensions. These include the `aws_s3` and `aws_commons` extensions. To do so, start psql and use the following command.
    

-   ```
    psql=> CREATE EXTENSION aws_s3 CASCADE;
    NOTICE: installing required extension "aws_commons"
    ```
    
    The `aws_s3` extension provides the [aws_s3.table_import_from_s3](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#aws_s3.table_import_from_s3) function that you use to import Amazon S3 data. The `aws_commons` extension provides additional helper functions.
    
-   Identify the database table and Amazon S3 file to use.
    
    The [aws_s3.table_import_from_s3](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#aws_s3.table_import_from_s3) function requires the name of the PostgreSQL database table that you want to import data into. The function also requires that you identify the Amazon S3 file to import. To provide this information, take the following steps.
    
    1.  Identify the PostgreSQL database table to put the data in. For example, the following is a sample `t1` database table used in the examples for this topic.
        
-   ```
    psql=> CREATE TABLE t1 (col1 varchar(80), col2 varchar(80), col3 varchar(80));
    ```
    
-   Get the following information to identify the Amazon S3 file that you want to import:
    
    -   Bucket name – A _bucket_ is a container for Amazon S3 objects or files.
        
    -   File path – The file path locates the file in the Amazon S3 bucket.
        
    -   AWS Region – The AWS Region is the location of the Amazon S3 bucket. For example, if the S3 bucket is in the US East (N. Virginia) Region, use `us-east-1`. For a listing of AWS Region names and associated values, see [Regions and Availability Zones](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.RegionsAndAvailabilityZones.html).
        
    
    To find how to get this information, see [View an object](https://docs.aws.amazon.com/AmazonS3/latest/gsg/OpeningAnObject.html) in the _Amazon Simple Storage Service User Guide_. You can confirm the information by using the AWS CLI command `aws s3 cp`. If the information is correct, this command downloads a copy of the Amazon S3 file.
    
-   ```
    aws s3 cp s3://sample_s3_bucket/sample_file_path ./ 
    ```
    
-   Use the [aws_commons.create_s3_uri](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#USER_PostgreSQL.S3Import.create_s3_uri) function to create an `aws_commons._s3_uri_1` structure to hold the Amazon S3 file information. You provide this `aws_commons._s3_uri_1` structure as a parameter in the call to the [aws_s3.table_import_from_s3](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#aws_s3.table_import_from_s3) function.
    
    For a psql example, see the following.
    

1.  1.  ```
        psql=> SELECT aws_commons.create_s3_uri(
           'sample_s3_bucket',
           'sample.csv',
           'us-east-1'
        ) AS s3_uri \gset
        ```
        
2.  Provide permission to access the Amazon S3 file.
    
    To import data from an Amazon S3 file, give the Aurora PostgreSQL DB cluster permission to access the Amazon S3 bucket the file is in. To do this, you use either an AWS Identity and Access Management (IAM) role or security credentials. For more information, see [Setting up access to an Amazon S3 bucket](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#USER_PostgreSQL.S3Import.AccessPermission).
    
3.  Import the Amazon S3 data by calling the `aws_s3.table_import_from_s3` function.
    
    After you complete the previous preparation tasks, use the [aws_s3.table_import_from_s3](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#aws_s3.table_import_from_s3) function to import the Amazon S3 data. For more information, see [Using the aws_s3.table_import_from_s3 function to import Amazon S3 data](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#USER_PostgreSQL.S3Import.FileFormats).
    

### Setting up access to an Amazon S3 bucket

To import data from an Amazon S3 file, give the Aurora PostgreSQL DB cluster permission to access the Amazon S3 bucket containing the file. You provide access to an Amazon S3 bucket in one of two ways, as described in the following topics.

**Topics**

-   [Using an IAM role to access an Amazon S3 bucket](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#USER_PostgreSQL.S3Import.ARNRole)
-   [Using security credentials to access an Amazon S3 bucket](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#USER_PostgreSQL.S3Import.Credentials)
-   [Troubleshooting access to Amazon S3](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#USER_PostgreSQL.S3Import.troubleshooting)

#### Using an IAM role to access an Amazon S3 bucket

Before you load data from an Amazon S3 file, give your Aurora PostgreSQL DB cluster permission to access the Amazon S3 bucket the file is in. This way, you don't have to manage additional credential information or provide it in the [aws_s3.table_import_from_s3](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#aws_s3.table_import_from_s3) function call.

To do this, create an IAM policy that provides access to the Amazon S3 bucket. Create an IAM role and attach the policy to the role. Then assign the IAM role to your DB cluster.

**To give an Aurora PostgreSQL DB cluster access to Amazon S3 through an IAM role**

1.  Create an IAM policy.
    
    This policy provides the bucket and object permissions that allow your Aurora PostgreSQL DB cluster to access Amazon S3.
    
    Include in the policy the following required actions to allow the transfer of files from an Amazon S3 bucket to Aurora PostgreSQL:
    
    -   `s3:GetObject`
        
    -   `s3:ListBucket`
        
    
    Include in the policy the following resources to identify the Amazon S3 bucket and objects in the bucket. This shows the Amazon Resource Name (ARN) format for accessing Amazon S3.
    
    -   arn:aws:s3:::`your-s3-bucket`
        
    -   arn:aws:s3:::`your-s3-bucket`/*
        
    
    For more information on creating an IAM policy for Aurora PostgreSQL, see [Creating and using an IAM policy for IAM database access](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.IAMPolicy.html). See also [Tutorial: Create and attach your first customer managed policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_managed-policies.html) in the _IAM User Guide_.
    
    The following AWS CLI command creates an IAM policy named `rds-s3-import-policy` with these options. It grants access to a bucket named `your-s3-bucket`.
    

Note

Note the Amazon Resource Name (ARN) of the policy returned by this command. You need the ARN when you attach the policy to an IAM role, in a subsequent step.

**Example**

For Linux, macOS, or Unix:

```
aws iam create-policy \
   --policy-name rds-s3-import-policy \
   --policy-document '{
     "Version": "2012-10-17",
     "Statement": [
       {
         "Sid": "s3import",
         "Action": [
           "s3:GetObject",
           "s3:ListBucket"
         ],
         "Effect": "Allow",
         "Resource": [
           "arn:aws:s3:::your-s3-bucket", 
           "arn:aws:s3:::your-s3-bucket/*"
         ] 
       }
     ] 
   }'                     
```

For Windows:

-   ```
    aws iam create-policy ^
       --policy-name rds-s3-import-policy ^
       --policy-document '{
         "Version": "2012-10-17",
         "Statement": [
           {
             "Sid": "s3import",
             "Action": [
               "s3:GetObject",
               "s3:ListBucket"
             ], 
             "Effect": "Allow",
             "Resource": [
               "arn:aws:s3:::your-s3-bucket", 
               "arn:aws:s3:::your-s3-bucket/*"
             ] 
           }
         ] 
       }'             
    ```
    
-   Create an IAM role.
    
    You do this so Aurora PostgreSQL can assume this IAM role to access your Amazon S3 buckets. For more information, see [Creating a role to delegate permissions to an IAM user](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user.html) in the _IAM User Guide_.
    
    We recommend using the `[aws:SourceArn](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#condition-keys-sourcearn)` and `[aws:SourceAccount](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#condition-keys-sourceaccount)` global condition context keys in resource-based policies to limit the service's permissions to a specific resource. This is the most effective way to protect against the [confused deputy problem](https://docs.aws.amazon.com/IAM/latest/UserGuide/confused-deputy.html).
    
    If you use both global condition context keys and the `aws:SourceArn` value contains the account ID, the `aws:SourceAccount` value and the account in the `aws:SourceArn` value must use the same account ID when used in the same policy statement.
    
    -   Use `aws:SourceArn` if you want cross-service access for a single resource.
        
    -   Use `aws:SourceAccount` if you want to allow any resource in that account to be associated with the cross-service use.
        
    
    In the policy, be sure to use the `aws:SourceArn` global condition context key with the full ARN of the resource. The following example shows how to do so using the AWS CLI command to create a role named `rds-s3-import-role`.
    
    **Example**
    
    For Linux, macOS, or Unix:
    

```
aws iam create-role \
   --role-name rds-s3-import-role \
   --assume-role-policy-document '{
     "Version": "2012-10-17",
     "Statement": [
       {
         "Effect": "Allow",
         "Principal": {
            "Service": "rds.amazonaws.com"
          },
         "Action": "sts:AssumeRole",
         "Condition": {
             "StringEquals": {
                "aws:SourceAccount": "111122223333",
                "aws:SourceArn": "arn:aws:rds:us-east-1:111122223333:db:dbname"
                }
             }
       }
     ] 
   }'
```

For Windows:

-   ```
    aws iam create-role ^
       --role-name rds-s3-import-role ^
       --assume-role-policy-document '{
         "Version": "2012-10-17",
         "Statement": [
           {
             "Effect": "Allow",
             "Principal": {
                "Service": "rds.amazonaws.com"
              },
             "Action": "sts:AssumeRole",
             "Condition": {
                 "StringEquals": {
                    "aws:SourceAccount": "111122223333",
                    "aws:SourceArn": "arn:aws:rds:us-east-1:111122223333:db:dbname"
                    }
                 }
           }
         ] 
       }'
    ```
    
-   Attach the IAM policy that you created to the IAM role that you created.
    
    The following AWS CLI command attaches the policy created in the previous step to the role named `rds-s3-import-role` Replace `` `your-policy-arn` `` with the policy ARN that you noted in an earlier step.
    
    **Example**
    
    For Linux, macOS, or Unix:
    

```
aws iam attach-role-policy \
   --policy-arn your-policy-arn \
   --role-name rds-s3-import-role                    
```

For Windows:

-   ```
    aws iam attach-role-policy ^
       --policy-arn your-policy-arn ^
       --role-name rds-s3-import-role    
    ```
    
-   Add the IAM role to the DB cluster.
    
    You do so by using the AWS Management Console or AWS CLI, as described following.
    

1.  Note
    
    You can't associate an IAM role with an Aurora Serverless DB cluster. For more information, see [Using Amazon Aurora Serverless v1](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html).
    
    Also, be sure the database you use doesn't have any restrictions noted in [Importing Amazon S3 data into an Aurora PostgreSQL DB cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_PostgreSQL.S3Import.html).
    

Console

**To add an IAM role for a PostgreSQL DB cluster using the console**

1.  Sign in to the AWS Management Console and open the Amazon RDS console at [https://console.aws.amazon.com/rds/](https://console.aws.amazon.com/rds/)
    

1.  .
    
2.  Choose the PostgreSQL DB cluster name to display its details.
    
3.  On the **Connectivity & security** tab, in the **Manage IAM roles** section, choose the role to add under **Add IAM roles to this cluster** .
    
4.  Under **Feature**, choose **s3Import**.
    
5.  Choose **Add role**.
    

#### Using security credentials to access an Amazon S3 bucket

If you prefer, you can use security credentials to provide access to an Amazon S3 bucket instead of providing access with an IAM role. To do this, use the `credentials` parameter in the [aws_s3.table_import_from_s3](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#aws_s3.table_import_from_s3) function call.

The `credentials` parameter is a structure of type `aws_commons._aws_credentials_1`, which contains AWS credentials. Use the [aws_commons.create_aws_credentials](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#USER_PostgreSQL.S3Import.create_aws_credentials) function to set the access key and secret key in an `aws_commons._aws_credentials_1` structure, as shown following.

```
psql=> SELECT aws_commons.create_aws_credentials(
   'sample_access_key', 'sample_secret_key', '')
AS creds \gset
```

After creating the `aws_commons._aws_credentials_1` structure, use the [aws_s3.table_import_from_s3](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#aws_s3.table_import_from_s3) function with the `credentials` parameter to import the data, as shown following.

```
psql=> SELECT aws_s3.table_import_from_s3(
   't', '', '(format csv)',
   :'s3_uri', 
   :'creds'
);
```

Or you can include the [aws_commons.create_aws_credentials](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#USER_PostgreSQL.S3Import.create_aws_credentials) function call inline within the `aws_s3.table_import_from_s3` function call.

```
psql=> SELECT aws_s3.table_import_from_s3(
   't', '', '(format csv)',
   :'s3_uri', 
   aws_commons.create_aws_credentials('sample_access_key', 'sample_secret_key', '')
);
```

#### Troubleshooting access to Amazon S3

If you encounter connection problems when attempting to import Amazon S3 file data, see the following for recommendations:

-   [Troubleshooting Amazon Aurora identity and access](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/security_iam_troubleshoot.html)
    
-   [Troubleshooting Amazon S3](https://docs.aws.amazon.com/AmazonS3/latest/dev/troubleshooting.html) in the _Amazon Simple Storage Service User Guide_
    
-   [Troubleshooting Amazon S3 and IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_iam-s3.html) in the _IAM User Guide_
    

### Using the `aws_s3.table_import_from_s3` function to import Amazon S3 data

Import your Amazon S3 data by calling the [aws_s3.table_import_from_s3](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#aws_s3.table_import_from_s3) function.

The following examples use the IAM role method for providing access to the Amazon S3 bucket. Thus, the `aws_s3.table_import_from_s3` function calls don't include credential parameters.

The following shows a typical PostgreSQL example using `psql`.

```
psql=> SELECT aws_s3.table_import_from_s3(
   't1',
   '', 
   '(format csv)',
   :'s3_uri'
);
```

The parameters are the following:

-   `t1` – The name for the table in the PostgreSQL DB cluster to copy the data into.
    
-   `''` – An optional list of columns in the database table. You can use this parameter to indicate which columns of the S3 data go in which table columns. If no columns are specified, all the columns are copied to the table. For an example of using a column list, see [Importing an Amazon S3 file that uses a custom delimiter](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#USER_PostgreSQL.S3Import.FileFormats.CustomDelimiter).
    
-   `(format csv)` – PostgreSQL COPY arguments. The copy process uses the arguments and format of the [PostgreSQL COPY](https://www.postgresql.org/docs/current/sql-copy.html)
    

-   command. In the preceding example, the `COPY` command uses the comma-separated value (CSV) file format to copy the data.
    
-   `s3_uri` – A structure that contains the information identifying the Amazon S3 file. For an example of using the [aws_commons.create_s3_uri](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#USER_PostgreSQL.S3Import.create_s3_uri) function to create an `s3_uri` structure, see [Overview of importing Amazon S3 data](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#USER_PostgreSQL.S3Import.Overview).
    

For more information about this function, see [aws_s3.table_import_from_s3](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#aws_s3.table_import_from_s3).

The `aws_s3.table_import_from_s3` function returns text. To specify other kinds of files for import from an Amazon S3 bucket, see one of the following examples.

**Topics**

-   [Importing an Amazon S3 file that uses a custom delimiter](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#USER_PostgreSQL.S3Import.FileFormats.CustomDelimiter)
-   [Importing an Amazon S3 compressed (gzip) file](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#USER_PostgreSQL.S3Import.FileFormats.gzip)
-   [Importing an encoded Amazon S3 file](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#USER_PostgreSQL.S3Import.FileFormats.Encoded)

#### Importing an Amazon S3 file that uses a custom delimiter

The following example shows how to import a file that uses a custom delimiter. It also shows how to control where to put the data in the database table using the `column_list` parameter of the [aws_s3.table_import_from_s3](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#aws_s3.table_import_from_s3) function.

For this example, assume that the following information is organized into pipe-delimited columns in the Amazon S3 file.

```
1|foo1|bar1|elephant1
2|foo2|bar2|elephant2
3|foo3|bar3|elephant3
4|foo4|bar4|elephant4
...
```

**To import a file that uses a custom delimiter**

1.  Create a table in the database for the imported data.
    

-   ```
    psql=> CREATE TABLE test (a text, b text, c text, d text, e text);
    ```
    
-   Use the following form of the [aws_s3.table_import_from_s3](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#aws_s3.table_import_from_s3) function to import data from the Amazon S3 file.
    
    You can include the [aws_commons.create_s3_uri](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#USER_PostgreSQL.S3Import.create_s3_uri) function call inline within the `aws_s3.table_import_from_s3` function call to specify the file.
    

1.  ```
    psql=> SELECT aws_s3.table_import_from_s3(
       'test',
       'a,b,d,e',
       'DELIMITER ''|''', 
       aws_commons.create_s3_uri('sampleBucket', 'pipeDelimitedSampleFile', 'us-east-2')
    );
    ```
    

The data is now in the table in the following columns.

```
psql=> SELECT * FROM test;
a | b | c | d | e 
---+------+---+---+------+-----------
1 | foo1 | | bar1 | elephant1
2 | foo2 | | bar2 | elephant2
3 | foo3 | | bar3 | elephant3
4 | foo4 | | bar4 | elephant4
```

#### Importing an Amazon S3 compressed (gzip) file

The following example shows how to import a file from Amazon S3 that is compressed with gzip. The file that you import needs to have the following Amazon S3 metadata:

-   Key: `Content-Encoding`
    
-   Value: `gzip`
    

If you upload the file using the AWS Management Console, the metadata is typically applied by the system. For information about uploading files to Amazon S3 using the AWS Management Console, the AWS CLI, or the API, see [Uploading objects](https://docs.aws.amazon.com/AmazonS3/latest/userguide/upload-objects.html) in the _Amazon Simple Storage Service User Guide_.

For more information about Amazon S3 metadata and details about system-provided metadata, see [Editing object metadata in the Amazon S3 console](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/add-object-metadata.html) in the _Amazon Simple Storage Service User Guide_.

Import the gzip file into your Aurora PostgreSQL DB cluster as shown following.

`psql=> CREATE TABLE test_gzip(id int, a text, b text, c text, d text);
psql=> SELECT aws_s3.table_import_from_s3(
 'test_gzip', '', '(format csv)',
 'myS3Bucket', 'test-data.gz', 'us-east-2'
);`

#### Importing an encoded Amazon S3 file

The following example shows how to import a file from Amazon S3 that has Windows-1252 encoding.

`psql=> SELECT aws_s3.table_import_from_s3(
 'test_table', '', 'encoding ''WIN1252''',
 aws_commons.create_s3_uri('sampleBucket', 'SampleFile', 'us-east-2')
);`

### Function reference

**Functions**

-   [aws_s3.table_import_from_s3](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#aws_s3.table_import_from_s3)
-   [aws_commons.create_s3_uri](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#USER_PostgreSQL.S3Import.create_s3_uri)
-   [aws_commons.create_aws_credentials](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#USER_PostgreSQL.S3Import.create_aws_credentials)

#### `aws_s3.table_import_from_s3`

Imports Amazon S3 data into an Aurora PostgreSQL table. The `aws_s3` extension provides the `aws_s3.table_import_from_s3` function. The return value is text.

##### Syntax

The required parameters are `table_name`, `column_list` and `options`. These identify the database table and specify how the data is copied into the table.

You can also use the following parameters:

-   The `s3_info` parameter specifies the Amazon S3 file to import. When you use this parameter, access to Amazon S3 is provided by an IAM role for the PostgreSQL DB cluster.
    

```
    aws_s3.table_import_from_s3 (
       table_name text, 
       column_list text, 
       options text, 
       s3_info aws_commons._s3_uri_1
    ) 
```
    
-   The `credentials` parameter specifies the credentials to access Amazon S3. When you use this parameter, you don't use an IAM role.
    

```
    aws_s3.table_import_from_s3 (
       table_name text, 
       column_list text, 
       options text, 
       s3_info aws_commons._s3_uri_1,
       credentials aws_commons._aws_credentials_1
    )
```
    

##### Parameters

_table_name_

A required text string containing the name of the PostgreSQL database table to import the data into.

_column_list_

A required text string containing an optional list of the PostgreSQL database table columns in which to copy the data. If the string is empty, all columns of the table are used. For an example, see [Importing an Amazon S3 file that uses a custom delimiter](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#USER_PostgreSQL.S3Import.FileFormats.CustomDelimiter).

_options_

A required text string containing arguments for the PostgreSQL `COPY` command. These arguments specify how the data is to be copied into the PostgreSQL table. For more details, see the [PostgreSQL COPY documentation](https://www.postgresql.org/docs/current/sql-copy.html)

.

_s3_info_

An `aws_commons._s3_uri_1` composite type containing the following information about the S3 object:

-   `bucket` – The name of the Amazon S3 bucket containing the file.
    
-   `file_path` – The Amazon S3 file name including the path of the file.
    
-   `region` – The AWS Region that the file is in. For a listing of AWS Region names and associated values, see [Regions and Availability Zones](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.RegionsAndAvailabilityZones.html).
    

_credentials_

An `aws_commons._aws_credentials_1` composite type containing the following credentials to use for the import operation:

-   Access key
    
-   Secret key
    
-   Session token
    

For information about creating an `aws_commons._aws_credentials_1` composite structure, see [aws_commons.create_aws_credentials](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#USER_PostgreSQL.S3Import.create_aws_credentials).

##### Alternate syntax

To help with testing, you can use an expanded set of parameters instead of the `s3_info` and `credentials` parameters. Following are additional syntax variations for the `aws_s3.table_import_from_s3` function:

-   Instead of using the `s3_info` parameter to identify an Amazon S3 file, use the combination of the `bucket`, `file_path`, and `region` parameters. With this form of the function, access to Amazon S3 is provided by an IAM role on the PostgreSQL DB instance.
    

```
    aws_s3.table_import_from_s3 (
       table_name text, 
       column_list text, 
       options text, 
       bucket text, 
       file_path text, 
       region text 
    )
```
    
-   Instead of using the `credentials` parameter to specify Amazon S3 access, use the combination of the `access_key`, `session_key`, and `session_token` parameters.
    

```
    aws_s3.table_import_from_s3 (
       table_name text, 
       column_list text, 
       options text, 
       bucket text, 
       file_path text, 
       region text, 
       access_key text, 
       secret_key text, 
       session_token text 
    ) 
```
    

##### Alternate parameters

_bucket_

A text string containing the name of the Amazon S3 bucket that contains the file.

_file_path_

A text string containing the Amazon S3 file name including the path of the file.

_region_

A text string containing the AWS Region that the file is in. For a listing of AWS Region names and associated values, see [Regions and Availability Zones](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.RegionsAndAvailabilityZones.html).

_access_key_

A text string containing the access key to use for the import operation. The default is NULL.

_secret_key_

A text string containing the secret key to use for the import operation. The default is NULL.

_session_token_

(Optional) A text string containing the session key to use for the import operation. The default is NULL.

#### `aws_commons.create_s3_uri`

Creates an `aws_commons._s3_uri_1` structure to hold Amazon S3 file information. Use the results of the `aws_commons.create_s3_uri` function in the `s3_info` parameter of the [aws_s3.table_import_from_s3](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#aws_s3.table_import_from_s3) function.

##### Syntax

```
aws_commons.create_s3_uri(
   bucket text,
   file_path text,
   region text
)
```

##### Parameters

_bucket_

A required text string containing the Amazon S3 bucket name for the file.

_file_path_

A required text string containing the Amazon S3 file name including the path of the file.

_region_

A required text string containing the AWS Region that the file is in. For a listing of AWS Region names and associated values, see [Regions and Availability Zones](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.RegionsAndAvailabilityZones.html).

#### `aws_commons.create_aws_credentials`

Sets an access key and secret key in an `aws_commons._aws_credentials_1` structure. Use the results of the `aws_commons.create_aws_credentials` function in the `credentials` parameter of the [aws_s3.table_import_from_s3](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html#aws_s3.table_import_from_s3) function.

##### Syntax

```
aws_commons.create_aws_credentials(
   access_key text,
   secret_key text,
   session_token text
)
```

##### Parameters

_access_key_

A required text string containing the access key to use for importing an Amazon S3 file. The default is NULL.

_secret_key_

A required text string containing the secret key to use for importing an Amazon S3 file. The default is NULL.

_session_token_

An optional text string containing the session token to use for importing an Amazon S3 file. The default is NULL. If you provide an optional `session_token`, you can use temporary credentials.

## Best Practices - PostgreSQL

*Source: [Best practices with Amazon Aurora PostgreSQL - Amazon Aurora](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.BestPractices.html)*


This topic includes information on best practices and options for using or migrating data to an Amazon Aurora PostgreSQL DB cluster.

### Fast Failover with Amazon Aurora PostgreSQL

There are several things you can do to make a failover perform faster with Aurora PostgreSQL. This section discusses each of the following ways:

-   Aggressively set TCP keepalives to ensure that longer running queries that are waiting for a server response will be stopped before the read timeout expires in the event of a failure.
    
-   Set the Java DNS caching timeouts aggressively to ensure the Aurora read-only endpoint can properly cycle through read-only nodes on subsequent connection attempts.
    
-   Set the timeout variables used in the JDBC connection string as low as possible. Use separate connection objects for short and long running queries.
    
-   Use the provided read and write Aurora endpoints to establish a connection to the cluster.
    
-   Use RDS APIs to test application response on server side failures and use a packet dropping tool to test application response for client-side failures.
    
-   Use the AWS JDBC Driver for PostgreSQL (preview) to take full advantage of the failover capabilities of Aurora PostgreSQL. For more information about the AWS JDBC Driver for PostgreSQL and complete instructions for using it, see the [AWS JDBC Driver for PostgreSQL GitHub repository](https://awslabs.github.io/aws-postgresql-jdbc/).

### Setting up TCP Keepalive Parameters

The TCP keepalive process is simple: when you set up a TCP connection, you associate a set of timers. When the keepalive timer reaches zero, you send a keepalive probe packet. If you receive a reply to your keepalive probe, you can assume that the connection is still up and running.

Enabling TCP keepalive parameters and setting them aggressively ensures that if your client is no longer able to connect to the database, then any active connections are quickly closed. This action allows the application to react appropriately, such as by picking a new host to connect to.

You need to set the following TCP keepalive parameters:

-   `tcp_keepalive_time` controls the time, in seconds, after which a keepalive packet is sent when no data has been sent by the socket (ACKs are not considered data). We recommend the following setting:
    
    `tcp_keepalive_time = 1`
    
-   `tcp_keepalive_intvl` controls the time, in seconds, between sending subsequent keepalive packets after the initial packet is sent (set using the `tcp_keepalive_time` parameter). We recommend the following setting:
    
    `tcp_keepalive_intvl = 1`
    
-   `tcp_keepalive_probes` is the number of unacknowledged keepalive probes that occur before the application is notified. We recommend the following setting:
    
    `tcp_keepalive_probes = 5`
    
    
### Reduce DNS Cache Timeouts

When your application tries to establish a connection after a failover, the new Aurora PostgreSQL writer will be a previous reader, which can be found using the Aurora **read only** endpoint before DNS updates have fully propagated. Setting the java DNS TTL to a low value helps cycle between reader nodes on subsequent connection attempts.

```
// Sets internal TTL to match the Aurora RO Endpoint TTL
java.security.Security.setProperty("networkaddress.cache.ttl" , "1");
// If the lookup fails, default to something like small to retry
java.security.Security.setProperty("networkaddress.cache.negative.ttl" , "3");
```

### Setting an Aurora PostgreSQL connection string for fast failover

To make use of Aurora PostgreSQL fast failover, your application's connection string should have a list of hosts (highlighted in bold in the following example) instead of just a single host. Here is an example connection string you could use to connect to an Aurora PostgreSQL cluster:

```
jdbc:postgresql://myauroracluster.cluster-c9bfei4hjlrd.us-east-1-beta.rds.amazonaws.com:5432,
myauroracluster.cluster-ro-c9bfei4hjlrd.us-east-1-beta.rds.amazonaws.com:5432
/postgres?user=<primaryuser>&password=<primarypw>&loginTimeout=2
&connectTimeout=2&cancelSignalTimeout=2&socketTimeout=60
&tcpKeepAlive=true&targetServerType=primary
```





***

## Appendix: Links

- [[Tools]]

*Backlinks:*

```dataview
list from [[AWS Aurora]] AND -"Changelog"
```