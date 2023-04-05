# SQL - PostgreSQL - Calculating the Median

*Source: [sql-snippets/median.md at main · count/sql-snippets (github.com)](https://github.com/count/sql-snippets/blob/main/postgres/median.md)*

View an interactive version of this snippet [here](https://count.co/n/QH2mMBK2RJu?vm=e).

## Description

Postgres does not have an explicit `MEDIAN` function. The following snippet will show you how to calculate the median of any column.

## Snippet ✂️

Here is a median function with a sample dataset: 

````sql
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
````

Output:

|median|
|------|
|0.1358146|

---

## Appendix: Links

* *Code*
* [SQL](SQL.md)
* [Databases](../../MOCs/Databases.md)
* [PostgreSQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[SQL - PostgreSQL - Calculating the Median]] AND -"Changelog"
````
