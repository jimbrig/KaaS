# SQL - Get Number of Open Connections

*Source: [Retrieve Number of Open Connections | thiscodeWorks](https://www.thiscodeworks.com/61faf143b783be0015bbaf71)*

````SQL
SELECT DB_NAME(dbid) as "Database", COUNT(dbid) as "Number Of Open Connections",
loginame as LoginName
FROM sys.sysprocesses
WHERE dbid > 0
GROUP BY dbid, loginame;
````

For [SQL Server](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/SQL%20Server.md).

---

## Appendix: Links

* *Code*
* [SQL](SQL.md)
* [Databases](../../MOCs/Databases.md)
* [SQL Server](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/SQL%20Server.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[SQL - Get Number of Open Connections]] AND -"Changelog"
````
