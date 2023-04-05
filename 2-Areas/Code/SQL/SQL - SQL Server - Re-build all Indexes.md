# SQL - Re-build all Indexes

*Source: [Rebuild all indexes online | thiscodeWorks](https://www.thiscodeworks.com/61faf2fab783be0015bbaf82)*

````SQL
-- rebuild all indexes online
ALTER INDEX ALL ON Table1
REBUILD WITH (ONLINE = ON);   
GO  
-- rebuild single index online
ALTER INDEX IX_IndexName ON Table1
REBUILD WITH (ONLINE = ON);   
GO  
````

---

## Appendix: Links

* *Code*
* [SQL](SQL.md)
* [Databases](../../MOCs/Databases.md)
* [SQL Server](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/SQL%20Server.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[SQL - Re-build all Indexes]] AND -"Changelog"
````
