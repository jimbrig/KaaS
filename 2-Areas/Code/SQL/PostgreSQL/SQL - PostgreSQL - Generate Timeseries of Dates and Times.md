---
Date: 2022-02-27
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL - Generate Timeseries of Dates and Times"]
---

# SQL - PostgreSQL - Generate Timeseries of Dates and Times

*Source: [sql-snippets/generate-timeseries.md at main · count/sql-snippets (github.com)](https://github.com/count/sql-snippets/blob/main/postgres/generate-timeseries.md)*

View an interactive version of this snippet [here](https://count.co/n/Du9nUudW9MH?vm=e).

## Description

In order to conduct time-series analysis, we need to have a complete time-series for the data in question. Often, we cannot be certain that every day/hour etc. occurs naturally in our dataset.

Therefore, we to be able to generate a series of dates and/or times to base our query on.

The [`GENERATE_SERIES`](https://www.postgresql.org/docs/13/functions-srf.html) function will allow us to do this:

```sql
--generate timeseries in hourly increments
SELECT timeseries_hour
FROM generate_series('2021-01-01 00:00:00'::TIMESTAMP, '2021-01-01 03:00:00'::TIMESTAMP, '1 hour') AS timeseries_hour;
```

Output:

| timeseries_hour            |
| -------------------------- |
| 2021-01-01 00:00:00.000000 |
| 2021-01-01 01:00:00.000000 |
| 2021-01-01 02:00:00.000000 |
| 2021-01-01 03:00:00.000000 |

```sql
--generate timeseries in daily increments
SELECT timeseries_day::DATE
FROM generate_series('2021-01-01'::DATE, '2021-01-04'::DATE, '1 day') AS timeseries_day;
```

Output:

| timeseries_day |
| -------------- |
| 2021-01-01     |
| 2021-01-02     |
| 2021-01-03     |
| 2021-01-04     |


***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[PostgreSQL]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - PostgreSQL - Generate Timeseries of Dates and Times]] AND -"Changelog"
```