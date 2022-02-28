---
Date: 2022-02-27
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL - Split a Single Column into Separate Rows"]
---

# SQL - PostgreSQL - Split a Single Column into Separate Rows

*Source: [sql-snippets/split-column-to-rows.md at main · count/sql-snippets (github.com)](https://github.com/count/sql-snippets/blob/main/postgres/split-column-to-rows.md)*

View an interactive version of this snippet [here](https://count.co/n/lF1dUz66TuF?vm=e).

## Description

You will often see multiple values, separated by a single character, appear in a single column. 

If you want to split them out but instead of having separate columns, generate rows for each value, you can use the function [`REGEXP_SPLIT_TO_TABLE`](https://www.postgresql.org/docs/13/functions-string.html):

```sql
WITH data AS (
  SELECT *
  FROM (VALUES ('yellow;green;blue'), ('orange;red;grey;black')) AS data (str)
)

SELECT
  REGEXP_SPLIT_TO_TABLE(str,';') str_split
FROM data;
```

_The separator can be any single character (i.e. `','` or `/`) or something more complex like a string (`to&char123`), as the function uses Regular Expressions._ 

Output:

| str_split |
| --------- |
| yellow    |
| green     |
| blue      |
| orange    |
| red       |
| grey      |
| black     |

***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[PostgreSQL]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - PostgreSQL - Split a Single Column into Separate Rows]] AND -"Changelog"
```