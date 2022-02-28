---
Date: 2022-02-27
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL - Human-Readable Timestamps"]
---

# SQL - PostgreSQL - Human-Readable Timestamps

*Source: [sql-snippets/convert-epoch-to-timestamp.md at main · count/sql-snippets (github.com)](https://github.com/count/sql-snippets/blob/main/postgres/convert-epoch-to-timestamp.md)*

Replace epoch/unix formatted timestamps with human-readable ones.

View an interactive version of this snippet [here](https://count.co/n/UdQXtD16DGx?vm=e).

## Description

Often data sources will include epoch/unix-style timestamps or dates, which are not human-readable. 
Therefore, we want to convert these to a different format, for example to be used in charts or aggregation queries. 
The [`TO_TIMESTAMP`](https://www.postgresql.org/docs/13/functions-formatting.html) function will allow us to do this with little effort:

```sql
WITH data AS (
  SELECT *
  FROM (VALUES (1611176312), (1611176759), (1611176817), (1611176854)) AS data (str)
)

SELECT
  TO_TIMESTAMP(str) AS converted_timestamp
FROM data;
```

| converted_timestamp |
| ---- |
| 2021-01-20 20:58:32.000000 |
| 2021-01-20 21:05:59.000000 |
| 2021-01-20 21:06:57.000000 |
| 2021-01-20 21:07:34.000000 |

```SQL

```


***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[PostgreSQL]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - PostgreSQL - Human-Readable Timestamps]] AND -"Changelog"
```