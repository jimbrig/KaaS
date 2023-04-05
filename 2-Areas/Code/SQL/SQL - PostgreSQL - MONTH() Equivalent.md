# SQL - PostgreSQL - `MONTH()` Equivalent

*Source: https://wiki.postgresql.org/wiki/MONTH()\_equivalent*

Reproduce the [SQL Server](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/SQL%20Server.md) `MONTH()` functionality in [PostgreSQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md).

## Contents

* [Snippets by Data Type](SQL%20-%20PostgreSQL%20-%20MONTH%28%29%20Equivalent.md#snippets-by-data-type)
  * [Timestamp Without Time Zone](SQL%20-%20PostgreSQL%20-%20MONTH%28%29%20Equivalent.md#timestamp-without-time-zone)
  * [Timestamp With Time Zone](SQL%20-%20PostgreSQL%20-%20MONTH%28%29%20Equivalent.md#timestamp-with-time-zone)
  * [Date](SQL%20-%20PostgreSQL%20-%20MONTH%28%29%20Equivalent.md#date)
* [Appendix: Links](SQL%20-%20PostgreSQL%20-%20MONTH%28%29%20Equivalent.md#appendix-links)

## Snippets by Data Type

* *NOTE: All functions are [SQL](SQL.md) and not the [PostgreSQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md) procedural language [PLPGSQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Procedural%20Languages/PLPGSQL.md)*

* *NOTE: All functions return integer data type representing the month of the year (i.e. 1-12 being January - December)*

### Timestamp Without Time Zone

* Derive the month from the `timestamp without time zone` data type:

````SQL
CREATE OR REPLACE FUNCTION month(timestamp without time zone) RETURNS integer
AS $$ 
      SELECT extract(MONTH FROM $1)::integer; 
$$ LANGUAGE sql IMMUTABLE;
````

### Timestamp With Time Zone

* Derive the month from the `timestamp with time zone` data type:

````SQL
CREATE OR REPLACE FUNCTION month(timestamp with time zone) RETURNS integer
AS $$
      SELECT extract(MONTH FROM $1)::integer;
$$ LANGUAGE sql STABLE;
````

### Date

* Derive the month from the `date` data type:

````SQL
CREATE OR REPLACE FUNCTION month(date) RETURNS integer
AS $$
      SELECT extract(MONTH FROM $1)::integer;
$$ LANGUAGE sql IMMUTABLE;
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
list from [[SQL - MONTH() Equivalent]] AND -"Changelog"
````
