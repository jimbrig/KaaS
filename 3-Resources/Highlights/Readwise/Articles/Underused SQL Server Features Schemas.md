# Underused SQL Server Features: Schemas

## Metadata

* Author: *Spark Digital*
* Full Title: Underused SQL Server Features: Schemas
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/7d4362ca8ec0

## Highlights

* A schema is a named container for database objects, which allows you to group objects into separate namespaces.
* So the main intent of schemas is to provide a means of grouping related objects together.
* In addition, as a secondary advantage, schemas provide a way of managing security rules for all objects contained within them. Whatever security rule you apply to a given schema, it will be automatically inherited by the child objects, unless you specifically change a given rule in one of the objects, thus overriding the inherited rules.
* In this case, we can begin by creating two new schemas, called Administration and Club, respectively. For that end, we can use the CREATE SCHEMA T-SQL statement. Note that, during this article, all T-SQL commands are shown as issued in an instance of sqlcmd. If you would like to know more about sqlcmd, visit the documentation page.
* Now that the schemas exist, we can transfer existing tables to them using ALTER SCHEMA.
* 2> ALTER SCHEMA Administration TRANSFER Administration_Offices;
* Now that the tables are in their corresponding schemas, the prefix has become redundant, so we should rename the tables to remove the prefixes. For that purpose, we can make use of the sp_rename stored procedure, included as part of the base functionality of SQL Server
* EXEC sp_rename ‘Administration.Administration_Employees’, ‘Employees’;
* Suppose a new application is written which is meant to manage the administration part of the house, without regard to any of the data related to the operations of the club (for example, an application that managers can use to coordinate employees efforts across the different office buildings).
* Without schemas, instead of one single GRANT you should have executed one GRANT for each object related to administration. With schemas, you can manage all administration-related objects as a whole.
