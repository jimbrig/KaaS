# SQL - PostgreSQL - Extensions

*Source: https://gist.github.com/parallelo3301/260435228584f1dc85701e884c4c97c1*

````SQL
-- show active extensions
SELECT * FROM pg_catalog.pg_extension;

-- show available extensions
SELECT * FROM pg_catalog.pg_available_extensions;

-- enable extension
CREATE EXTENSION xy;
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
list from [[SQL - PostgreSQL - Extensions]] AND -"Changelog"
````
