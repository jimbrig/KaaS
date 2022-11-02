---
Date: 2022-11-02
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/AWS", "#Topic/Dev/Cloud/AWS"]
Alias: ["AWS - DynamoDB Queries"]
---

# AWS - DynamoDB Queries

*Source: https://dynobase.dev/dynamodb-cli-query-examples*

See Also [[PowerShell - Install AWS CLI]], [[PowerShell - AWS Wrapper Functions]]

## Overview

## Create Table

```powershell
aws dynamodb wizard new-table
```

Table is the very basic data container in [[AWS DynamoDB]], so if you want to save some data in DynamoDB, first you need to create a table. You can do that in [[AWS CLI]] like this:

```powershell
aws dynamodb create-table `
    --table-name MyTableName `
    --attribute-definitions AttributeName=id,AttributeType=S AttributeName=createdAt,AttributeType=S `
    --key-schema AttributeName=id,KeyType=HASH AttributeName=createdAt,KeyType=RANGE `
    --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1
```

This call will create a DynamoDB table called `MyTable` with [composite primary key](https://dynobase.dev/dynamodb-keys/) where attribute `id` is the Hash Key, and `createdAt` is the Range Key. It means that items with the same `id` will be assigned to the same partition, and they will be sorted on the date of their creation.

Moreover, we're specifying `--provisioned-throughput` argument which will create a table in [provisioned capacity mode](https://dynobase.dev/dynamodb-capacity-modes/#provisioned-capacity) with just one [Write Capacity Unit (WCU)](https://dynobase.dev/dynamodb-capacity-modes/#write-capacity) and one [Read Capacity Unit (RCU)](https://dynobase.dev/dynamodb-capacity-modes/#read-capacity).

If you don't like the "shorthand syntax" where input parameters are specified in comma-separated fashion, you can also use JSON format like this:

```powershell
aws dynamodb create-table `
    --table-name MyTableName `
    --attribute-definitions '[{"AttributeName":"id", "AttributeType":"S"}, {"AttributeName":"createdAt", "AttributeType":"S"}]' `
    --key-schema '[{"AttributeName":"id", "KeyType":"HASH"}, {"AttributeName":"createdAt", "KeyType":"RANGE"}]' `
    --provisioned-throughput '{"ReadCapacityUnits": 1, "WriteCapacityUnits": 1}'
```



***

## Appendix: Links

- [[Code]]
- [[Development]]

*Backlinks:*

```dataview
list from [[AWS - DynamoDB Queries]] AND -"Changelog"
```