---
Date: 2022-02-27
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL - Replace NULLs"]
---

# SQL - PostgreSQL - Replace NULLs

*Source: [sql-snippets/replace-null.md at main · count/sql-snippets (github.com)](https://github.com/count/sql-snippets/blob/main/postgres/replace-null.md)*

Explore this snippet [here](https://count.co/n/hpKKsv0U2Rv?vm=e).

## Description

An essential part of cleaning a new data source is deciding how to treat `NULL` values. 

The [[PostgreSQL]] function [COALESCE](https://www.postgresql.org/docs/current/functions-conditional.html) can help with replacing NULL values with something else:

```sql
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
```

Output:

| num | str       |
| --- | --------- |
| 1   | a         |
| -1  | b         |
| 3   | I AM NULL |


***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[PostgreSQL]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - PostgreSQL - Replace NULLs]] AND -"Changelog"
```