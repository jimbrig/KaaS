# SQL - SQL Server - Search for Text Within Stored Procedures

*Source: [sql-snippets/search-stored-procedures.md at main · count/sql-snippets (github.com)](https://github.com/count/sql-snippets/blob/main/mssql/search-stored-procedures.md)*

## Description

Often you'll want to know which stored procedure is performing an action or contains specific text. Query will match on comments.

## Snippet ✂️

````sql
SELECT name
FROM   sys.procedures
WHERE  Object_definition(object_id) LIKE '%strHell%'
````

## Usage

````sql
SELECT name
FROM   sys.procedures
WHERE  Object_definition(object_id) LIKE '%blitz%'
````

Output:

|name|
|----|
|sp_BlitzFirst|
|sp_BlitzCache|
|sp_BlitzWho|
|sp_Blitz|
|sp_BlitzBackups|
|sp_BlitzLock|
|sp_BlitzIndex|

## Reference

* [Stackoverflow](https://stackoverflow.com/questions/14704105/search-text-in-stored-procedure-in-sql-server)

---

## Appendix: Links

* *Code*
* [SQL](SQL.md)
* [Databases](../../MOCs/Databases.md)
* [SQL Server](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/SQL%20Server.md)
* [T-SQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Procedural%20Languages/T-SQL.md)
* [Stored Procedures - SQL Server](../../../0-Slipbox/Stored%20Procedures%20-%20SQL%20Server.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[SQL - SQL Server - Search Stored Procedures]] AND -"Changelog"
````
