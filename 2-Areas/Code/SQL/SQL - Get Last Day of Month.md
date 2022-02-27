---
Date: 2022-02-16
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - Get Last Day of Month"]
---

# SQL - Get Last Day of Month

*Source: https://wiki.postgresql.org/wiki/Date_LastDay*

```SQL
CREATE OR REPLACE FUNCTION last_day(date)
RETURNS date AS
$$
  SELECT (date_trunc('MONTH', $1) + INTERVAL '1 MONTH - 1 day')::date;
$$ LANGUAGE 'sql' IMMUTABLE STRICT;
```

*Note: for [[PostgreSQL]] only*

***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[PostgreSQL]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - Get Last Dat of Month]] AND -"Changelog"
```