# SQL - PostgreSQL - Get Last Day of Month

*Source: https://wiki.postgresql.org/wiki/Date_LastDay*

````SQL
CREATE OR REPLACE FUNCTION last_day(date)
RETURNS date AS
$$
  SELECT (date_trunc('MONTH', $1) + INTERVAL '1 MONTH - 1 day')::date;
$$ LANGUAGE 'sql' IMMUTABLE STRICT;
````

*Note: for [PostgreSQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md) only*

---

## Appendix: Links

* *Code*
* [SQL](SQL.md)
* [Databases](../../MOCs/Databases.md)
* [PostgreSQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[SQL - Get Last Dat of Month]] AND -"Changelog"
````
