---
Date: 2022-02-27
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL - Calculating the Median"]
---

# SQL - PostgreSQL - Calculating the Median

*Source: [sql-snippets/median.md at main · count/sql-snippets (github.com)](https://github.com/count/sql-snippets/blob/main/postgres/median.md)*

View an interactive version of this snippet [here](https://count.co/n/QH2mMBK2RJu?vm=e).

## Description

Postgres does not have an explicit `MEDIAN` function. The following snippet will show you how to calculate the median of any column.

## Snippet ✂️

Here is a median function with a sample dataset: 

```sql
WITH data AS (
    SELECT CASE
        WHEN RANDOM() <= 0.25 THEN 'apple'
        WHEN RANDOM() <= 0.5 THEN 'banana'
        WHEN RANDOM() <= 0.75 THEN 'pear'
      ELSE 'orange'
    END AS fruit,
    RANDOM()::DOUBLE PRECISION AS weight
    FROM generate_series(1,10)
)

SELECT
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY weight) AS median
FROM
  data
```

Output:

| median    |
| --------- |
| 0.1358146 |

***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[PostgreSQL]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - PostgreSQL - Calculating the Median]] AND -"Changelog"
```