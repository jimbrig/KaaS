# SQL - PostgreSQL - Count NULLs

*Source: [sql-snippets/count-nulls.md at main · count/sql-snippets (github.com)](https://github.com/count/sql-snippets/blob/main/postgres/count-nulls.md)*

Explore this snippet [here](https://count.co/n/YJCjwADi4VY?vm=e).

## Description

Part of the data cleaning process involves understanding the quality of your data. NULL values are usually best avoided, so counting their occurrences is a common operation.
There are several methods that can be used here:

* `count(*) - count(<column>)` - use the different forms of the [`count()`](https://www.postgresql.org/docs/current/functions-aggregate.html) aggregation which include and exclude NULLs.
* `sum(case when x is null then 1 else 0 end)` - create a new column which contains 1 or 0 depending on whether the value is NULL, then aggregate.

````sql
with data as (
  select * from (values (1), (2), (null), (null), (5)) as data (x)
)

select
  count(*) - count(x) with_count,
  sum(case when x is null then 1 else 0 end) with_case
from data
````

|with_count|with_case|
|----------|---------|
|2|2|

---

## Appendix: Links

* *Code*
* [SQL](SQL.md)
* [Databases](../../MOCs/Databases.md)
* [PostgreSQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[SQL - PostgreSQL - Count NULLs]] AND -"Changelog"
````
