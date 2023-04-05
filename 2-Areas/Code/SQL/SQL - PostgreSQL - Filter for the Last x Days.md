# SQL - PostgreSQL - Filter for the Last x Days

*Source: [sql-snippets/last-x-days.md at main · count/sql-snippets (github.com)](https://github.com/count/sql-snippets/blob/main/postgres/last-x-days.md)*

## Description

Often you only want to return the last X days of a query (e.g. last 30 days) and you want that to always be up to date (dynamic).

This snippet can be added to your `WHERE` clause to filter for the last X days:

````sql
SELECT
   <COL1>,...<COLN>,
   <DATE_COLUMN>
FROM
   <TABLE>
WHERE
   <DATE_COLUMN> > current_date - interval 'X' day
````

where:

* ` <COL1>,...<COLN>` are all the columns you want to return in your query
* `<DATE_COLUMN>`  is your date column you want to filter on
* `X` is the number of days you want to filter on

For reference see Postgres's [date/time Functions and Operators](https://www.postgresql.org/docs/8.2/functions-datetime.html).

````sql
select 
  day,
  rank,
  title,
  artist,
  streams
from 
   "public".spotify_daily
where 
   day > current_date - interval '180' day
   and artist = 'Drake'
````

Output:

|day|rank|title|artist|streams|
|---|----|-----|------|-------|
|06/04/2021|46|What's Next|Drake|1,524,267|
|...|...|...|...|...|

---

## Appendix: Links

* *Code*
* [SQL](SQL.md)
* [Databases](../../MOCs/Databases.md)
* [PostgreSQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[SQL - PostgreSQL - Filter for the Last x Days]] AND -"Changelog"
````
