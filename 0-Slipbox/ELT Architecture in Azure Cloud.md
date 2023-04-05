# ELT Architecture in Azure Cloud

*Source: [ELT Architecture in the Azure Cloud | by Greg Marsh | Aptitive](https://blog.aptitive.com/elt-architecture-in-the-azure-cloud-50a90681036b)*

## Contents

* [Overview](ELT%20Architecture%20in%20Azure%20Cloud.md#overview)
* [Collect](ELT%20Architecture%20in%20Azure%20Cloud.md#collect)
* [Transform](ELT%20Architecture%20in%20Azure%20Cloud.md#transform)
* [Ingest](ELT%20Architecture%20in%20Azure%20Cloud.md#ingest)
* [Catalog](ELT%20Architecture%20in%20Azure%20Cloud.md#catalog)
* [Use](ELT%20Architecture%20in%20Azure%20Cloud.md#use)
* [Conclusion](ELT%20Architecture%20in%20Azure%20Cloud.md#conclusion)

## Overview

Demonstration of two data-flows: one using relational data and the other a semi-structured flat file. The goal is to combined the data into a warehouse and visualize:

![](https://i.imgur.com/z0c7iGq.png)

## Collect

First, in reference to the top flow, we collected structured data. Quick side note:

 > 
 > Our recommendation is to load structured data like from your ERP into a relational DB via more traditional ETL methods. Although there is a general discussion of dumping **all** data into the data lake, the Big Data structure does not make much sense for data that already has schema and relationships (I’ll have to write a whole post on why).

Moving on, to collect relational data, I introduced the cloud’s data orchestration tool, *Azure Data Factory*. ADF uses JSON scripts to define data sets (eg: Select * From DimDate), link services to access the data (eg: an On-Premise SQL Server), and pipelines of activities to interact with the data (eg: Copy).

![](https://i.imgur.com/RPkTdo4.png)

For example, combined with the JSON defining the data sets and link services, this pipeline will copy the data from DimDate (a date dimension table I generated with a stored procedure) on my local server and load it into the *Azure SQL Database* (the RDBMS as a service in the Microsoft cloud).

## Transform

We can also use ADF to facilitate data transformation. In this demo, I showed off the ability of ADF to call stored procedures on the Azure SQL Db (similar to using SSIS in an On-Prem system without the nice GUI).

## Ingest

Next, we discussed the bottom half of the architecture graphic. As mentioned before, the data lake is best used for large sets of semi- or unstructured data that your organization collects. You can ingest that data using a variety of methods:

![](https://i.imgur.com/WfPVIFo.png)

## Catalog

So now let’s manipulate the big data! For this, I introduced *Azure Data Lake Analytics* which uses U-SQL (think if T-SQL and C# had a baby). Using the underlying C# libraries, I was able to define a “schema-on-read” for our crime data, use extension methods (like .ToString) to create a new value called \[DateKey\], and catalog the data into a familiar schema-table fashion in the lake (note, this is not the same as inserting it into a SQL Db). The data is now “load-ready” in the sense that I can effectively join my "Big Data" with the DimDate table in my SQL database.

## Use

Finally, we combined and analyzed the data. Here I introduced *Azure SQL Data Warehouse;* a premium storage service that allows you to use Polybase to load from the Data Lake and ADF to load from Azure SQL DB. Using the DW, we can stage our “load ready” data for visualization and dynamically scale performance based on usage (imagine the ability to 10x the speed of your dashboards from 8–10 AM on weekdays and then save money by pausing them at night…very cool). I then pointed a *PowerBI* model to the DW and created a mini-star:

![](https://i.imgur.com/eUGEDxY.png)

To finish the demo, I created an interesting dashboard by dragging attributes from both the crime data and the date dimension into different visualizations:

![](https://i.imgur.com/lcohDey.png)

## Conclusion

To wrap up, implementing an ELT Framework in the cloud is absolutely viable and could have great benefits to your organization. Azure may still have some work (GUI on ADF, SSIS as a service, better documentation), but considering the potential cost savings and performance scalability, it should be on the road map.

---

## Appendix: Links

* [ELT Architecture in Azure Cloud](ELT%20Architecture%20in%20Azure%20Cloud.md)
* [Data Warehouse for Insurance](Data%20Warehouse%20for%20Insurance.md)
* [Data Engineering](../2-Areas/MOCs/Data%20Engineering.md)
* [Data Warehouse](Data%20Warehouse.md)
* [Databases](../2-Areas/MOCs/Databases.md)
* [Microsoft Azure](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/Azure/Microsoft%20Azure.md)
