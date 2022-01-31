---
Date: 2022-01-30
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev/DataScience"]
Alias: "ELT Architecture in Azure Cloud"
---


# ELT Architecture in Azure Cloud

*Source: [ELT Architecture in the Azure Cloud | by Greg Marsh | Aptitive](https://blog.aptitive.com/elt-architecture-in-the-azure-cloud-50a90681036b)*

## Overview

Demonstration of two data-flows: one using relational data and the other a semi-structured flat file. The goal is to combined the data into a warehouse and visualize:

![](https://i.imgur.com/z0c7iGq.png)


## Collect

First, in reference to the top flow, we collected structured data. Quick side note:

> Our recommendation is to load structured data like from your ERP into a relational DB via more traditional ETL methods. Although there is a general discussion of dumping **all** data into the data lake, the Big Data structure does not make much sense for data that already has schema and relationships (I’ll have to write a whole post on why).

Moving on, to collect relational data, I introduced the cloud’s data orchestration tool, _Azure Data Factory_. ADF uses JSON scripts to define data sets (eg: Select * From DimDate), link services to access the data (eg: an On-Premise SQL Server), and pipelines of activities to interact with the data (eg: Copy).

![](https://i.imgur.com/RPkTdo4.png)

For example, combined with the JSON defining the data sets and link services, this pipeline will copy the data from DimDate (a date dimension table I generated with a stored procedure) on my local server and load it into the _Azure SQL Database_ (the RDBMS as a service in the Microsoft cloud).

## Transform

We can also use ADF to facilitate data transformation. In this demo, I showed off the ability of ADF to call stored procedures on the Azure SQL Db (similar to using SSIS in an On-Prem system without the nice GUI).

## Ingest



*Backlinks:*

```dataview
list from [[ELT Architecture in Azure Cloud]] AND -"Changelog"
```