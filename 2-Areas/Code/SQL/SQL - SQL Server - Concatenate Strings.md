---
Date: 2022-02-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - SQL Server - Concatenate Strings"]
---

# SQL - SQL Server - Concatenate Strings

*Source: [sql-snippets/concatenate-strings.md at main · count/sql-snippets (github.com)](https://github.com/count/sql-snippets/blob/main/mssql/concatenate-strings.md)*

Explore this snippet [here](https://count.co/n/NoziHzLCWJA?vm=e).

## Description

Use the [`STRING_AGG`](https://docs.microsoft.com/en-us/sql/t-sql/functions/string-agg-transact-sql) function to concatenate strings within a group. To specify the ordering, make sure to use the `WITHIN GROUP` clause too.

```sql
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
```

Output:

| str | aggregated |
| --- | ---------- |
| A   | 1 < 2      |
| B   | 3 < 4 < 5  |


***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[SQL Server]]
- [[T-SQL]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - SQL Server - Concatenate Strings]] AND -"Changelog"
```