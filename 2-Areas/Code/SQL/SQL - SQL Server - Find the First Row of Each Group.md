# SQL - SQL Server - Find the First Row of Each Group

*Source: [sql-snippets/first-row-of-group.md at main · count/sql-snippets (github.com)](https://github.com/count/sql-snippets/blob/main/mssql/first-row-of-group.md)*

Explore this snippet [here](https://count.co/n/3eWfeZ0n2a8?vm=e).

## Description

Finding the first value in a column partitioned by some other column is simple in [SQL](SQL.md), using the `GROUP BY` clause. Returning the rest of the columns corresponding to that value is a little trickier. Here's one method, which relies on the `RANK` [SQL - Window Functions](../../../0-Slipbox/SQL%20-%20Window%20Functions.md):

````sql
with and_ranking as (
  select
    *,
    rank() over (partition by <partition> order by <ordering>) ranking
  from <table>
)
select * from and_ranking where ranking = 1
````

where:

* `partition` - the column(s) to partition by
* `ordering` - the column(s) which determine the ordering defining 'first'
* `table` - the source table

The [CTE](../../../0-Slipbox/SQL%20-%20Common%20Table%20Expressions%20or%20CTEs.md) or [Common Table Expression](../../../0-Slipbox/SQL%20-%20Common%20Table%20Expressions%20or%20CTEs.md) `and_ranking` adds a column to the original table called `ranking`, which is the order of that row within the groups defined by `partition`. Filtering for `ranking = 1` picks out those 'first' rows.

## Example

Using product sales as an example data source, we can pick the rows of the table corresponding to the most-recent order per city. Filling in the template above:

* `partition` - this is just `City`
* `ordering` - this is `Order_Date desc`
* `table` - this is `Sales`

````sql
with and_ranking as (
  select
    *,
    rank() over (partition by City order by Order_Date desc) as ranking
  from Sales
)

select * from and_ranking where ranking = 1
````

---

## Appendix: Links

* *Code*
* [SQL](SQL.md)
* [Databases](../../MOCs/Databases.md)
* [SQL Server](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/SQL%20Server.md)
* [T-SQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Procedural%20Languages/T-SQL.md)
* [SQL - Common Table Expressions or CTEs](../../../0-Slipbox/SQL%20-%20Common%20Table%20Expressions%20or%20CTEs.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[SQL - SQL Server - First Row of Group]] AND -"Changelog"
````
