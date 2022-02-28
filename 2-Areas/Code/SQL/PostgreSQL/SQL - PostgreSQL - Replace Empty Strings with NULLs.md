---
Date: 2022-02-27
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL - Replace Empty Strings with NULLs"]
---

# SQL - PostgreSQL - Replace Empty Strings with NULLs

*Source: [sql-snippets/replace-empty-strings-null.md at main · count/sql-snippets (github.com)](https://github.com/count/sql-snippets/blob/main/postgres/replace-empty-strings-null.md)*

Explore this snippet [here](https://count.co/n/Fzyv9i4SP2B?vm=e).

## Description

An essential part of cleaning a new data source is deciding how to treat missing values. The [`CASE`](https://www.postgresql.org/docs/current/functions-conditional.html#FUNCTIONS-CASE) statement can help with replacing empty values with something else:

```sql
WITH data AS (
  SELECT *
  FROM (VALUES ('a'), ('b'), (''), ('d')) AS data (str)
)

SELECT
  CASE WHEN LENGTH(str) != 0 THEN str END AS str
FROM data;
```

Output:

| str  |
| ---- |
| a    |
| b    |
| NULL |
| d    |


***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[PostgreSQL]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - PostgreSQL - Replace Empty Strings with NULLs]] AND -"Changelog"
```