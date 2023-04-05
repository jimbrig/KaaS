# SQL - PostgreSQL - Information Schema Queries

\*Source: *

## Retrieve Tables from the `information_schema`

````SQL
SELECT * FROM information_schema.tables;
````

Filter for a specific schema:

````sql
SELECT * FROM information_schema.tables WHERE table_schema = '<schema_name>';
````

---

## Appendix: Links

* *Code*
* [SQL](SQL.md)
* [Databases](../../MOCs/Databases.md)
* [PostgreSQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[SQL - PostgreSQL Information Schema Queries]] AND -"Changelog"
````
