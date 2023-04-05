# SQL - PostgreSQL - Set Default UTF8 Encoding

*Source: https://gist.github.com/katylava/765188*

````SQL
UPDATE pg_database SET datistemplate=FALSE WHERE datname='template1';
DROP DATABASE template1;
CREATE DATABASE template1 WITH owner=postgres template=template0 encoding='UTF8';
UPDATE pg_database SET datistemplate=TRUE WHERE datname='template1';
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
list from [[SQL - PostgreSQL - Set Default UTF8 Encoding]] AND -"Changelog"
````
