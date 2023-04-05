# SQL - PostgreSQL - Replace NULLs

*Source: [sql-snippets/replace-null.md at main · count/sql-snippets (github.com)](https://github.com/count/sql-snippets/blob/main/postgres/replace-null.md)*

Explore this snippet [here](https://count.co/n/hpKKsv0U2Rv?vm=e).

## Description

An essential part of cleaning a new data source is deciding how to treat `NULL` values. 

The [PostgreSQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md) function [COALESCE](https://www.postgresql.org/docs/current/functions-conditional.html) can help with replacing NULL values with something else:

````sql
with data as (
  select * from (values
    (1,    'one'),
    (null, 'two'),
    (3,    null)
  ) as data (num, str)
)

select
  coalesce(num, -1) num,
  coalesce(str, 'I AM NULL') str
from data
````

Output:

|num|str|
|---|---|
|1|a|
|-1|b|
|3|I AM NULL|

---

## Appendix: Links

* *Code*
* [SQL](SQL.md)
* [Databases](../../MOCs/Databases.md)
* [PostgreSQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[SQL - PostgreSQL - Replace NULLs]] AND -"Changelog"
````
