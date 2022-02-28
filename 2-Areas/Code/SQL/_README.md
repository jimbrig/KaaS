---
Date: 2022-02-09
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Readme", "#Topic/Dev/Database", "#Topic/Dev/Database/SQL", "#Topic/Dev/Database/PostgreSQL", "#Topic/Dev/Database/MSSQL"]
Alias: ["SQL Code", "SQL Snippets"]
---

# SQL Code Snippets

## Contents

- [[#BigQuery|BigQuery]]
- [[#PostgreSQL|PostgreSQL]]
- [[#SQL Server (`MSSQL`)|SQL Server (`MSSQL`)]]
- [[#Appendix: Dataviews and Links|Appendix: Dataviews and Links]]
	- [[#Related Links|Related Links]]
	- [[#Dataviews|Dataviews]]


## BigQuery

Code Snippets for [[Google Cloud BigQuery|BigQuery]]:

#Status/WIP 

## PostgreSQL

Code Snippets for [[PostgreSQL]]:

-   [[SQL - PostgreSQL - Strip Accents from Strings]]
-   [[SQL - PostgreSQL - Simulate `IIF` From SQL Server]]
-   [[SQL - PostgreSQL - Stored Procedure - Merge Tables]]
-   [[SQL - PostgreSQL - Information Schema Queries]]
-   [[SQL - PostgreSQL - Split a Single Column into Separate Rows]]
-   [[SQL - PostgreSQL - Reverse an Array]]
-   [[SQL - PostgreSQL - Replace NULLs]]
-   [[SQL - PostgreSQL - Replace Empty Strings with NULLs]]
-   [[SQL - PostgreSQL - RegEx to Validate an Email Address]]
-   [[SQL - PostgreSQL - RegEx to Parse URL String]]
-   [[SQL - PostgreSQL - Ranking Data]]
-   [[SQL - PostgreSQL - Pivot Query]]
-   [[SQL - PostgreSQL - Moving Average]]
-   [[SQL - PostgreSQL - Human-Readable Timestamps]]
-   [[SQL - PostgreSQL - Histogram Bins]]
-   [[SQL - PostgreSQL - Get the Last Element of an Array]]
-   [[SQL - PostgreSQL - Generate Timeseries of Dates and Times]]
-   [[SQL - PostgreSQL - Formatting Dates and Timestamps]]
-   [[SQL - PostgreSQL - Filter for the Last x Days]]
-   [[SQL - PostgreSQL - Extracting Values from JSON Strings]]
-   [[SQL - PostgreSQL - ETL Function Template]]
-   [[SQL - PostgreSQL - Dynamic Trigger]]
-   [[SQL - PostgreSQL - DataDictionary]]
-   [[SQL - PostgreSQL - Cumulative Distribution]]
-   [[SQL - PostgreSQL - Creating Equal-Sized Buckets using `ntile`]]
-   [[SQL - PostgreSQL - Count NULLs]]
-   [[SQL - PostgreSQL - Clone Schema]]
-   [[SQL - PostgreSQL - Calculating the Median]]
-   [[SQL - PostgreSQL - Audit Trigger]]
-   [[SQL - PostgreSQL - Normalize Whitespace]]
-   [[SQL - PostgreSQL - MONTH() Equivalent]]
-   [[SQL - PostgreSQL - Multi-Replace (plpgsql)]]
-   [[SQL - PostgreSQL - Get Last Day of Month]]
-   [[SQL - PostgreSQL - Find Recent Activity]]

## SQL Server (`MSSQL`)

Code Snippets for Microsoft's [[SQL Server]] or [[SQL Server|MSSQL]]:

-   [[SQL - SQL Server - Useful Queries]]
-   [[SQL - SQL Server - Installation Script for DBA MultiTool]]
-   [[SQL - SQL Server - Retrieve Who is Doing What]]
-   [[SQL - SQL Server - Retrieve Top Slow Requests]]
-   [[SQL - SQL Server - Re-build all Indexes]]
-   [[SQL - SQL Server - Get Number of Open Connections]]
-   [[SQL - SQL Server - Find Unused Indexes]]
-   [[SQL - SQL Server - Create Date Dimension with Fiscal Years]]
-   [[SQL -  SQL Server - Convert Integer (Clarion) Date to SQL Datetime|SQL - SQL Server - Convert Integer (Clarion) Date to SQL Datetime]]
-   [[SQL - SQL Server - Check Size of DB Objects]]
-   [[SQL - SQL Server - Retrieve Stored Procedures and Functions Execution Times Counts and Averages]]
-   [[SQL - SQL Server - POST HTTP API Request]]
-   [[SQL - SQL Server - Monitor Query Plans]]


***

## Appendix: Dataviews and Links

### Related Links

- [[2-Areas/Code/_README|Code]]
- [[Development]]
- [[SQL]]
- [[T-SQL]]
- [[PostgreSQL]]
- [[Google Cloud BigQuery]]
- [[SQLite]]
- [[PLPGSQL]]
- [[PLPERL]]
- [[SQL Server]]
- [[Databases]]
- [[Data Engineering]]

### Dataviews

*Dataview for all notes*

```dataview
list from "2-Areas/Code/SQL" AND !#Type/Readme
```

*Backlinks Dataview*

```dataview
list from [[_README]] AND -"Changelog"
```
