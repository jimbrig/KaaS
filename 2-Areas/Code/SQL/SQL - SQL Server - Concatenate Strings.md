# SQL - SQL Server - Concatenate Strings

*Source: [sql-snippets/concatenate-strings.md at main · count/sql-snippets (github.com)](https://github.com/count/sql-snippets/blob/main/mssql/concatenate-strings.md)*

Explore this snippet [here](https://count.co/n/NoziHzLCWJA?vm=e).

## Description

Use the [`STRING_AGG`](https://docs.microsoft.com/en-us/sql/t-sql/functions/string-agg-transact-sql) function to concatenate strings within a group. To specify the ordering, make sure to use the `WITHIN GROUP` clause too.

````sql
with data as (
  select * from (values
    ('A', '1'),
    ('A', '2'),
    ('B', '3'),
    ('B', '4'),
    ('B', '5')
  ) as data(str, num)
)

select
  str,
  string_agg(num, ' < ') within group (order by num asc) as aggregated
from data
group by str
````

Output:

|str|aggregated|
|---|----------|
|A|1 \< 2|
|B|3 \< 4 \< 5|

---

## Appendix: Links

* *Code*
* [SQL](SQL.md)
* [Databases](../../MOCs/Databases.md)
* [SQL Server](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/SQL%20Server.md)
* [T-SQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Procedural%20Languages/T-SQL.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[SQL - SQL Server - Concatenate Strings]] AND -"Changelog"
````
