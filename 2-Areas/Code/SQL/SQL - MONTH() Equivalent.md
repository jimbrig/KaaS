---
Date: 2022-02-16
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Data/Databases"]
Alias: ["SQL - MONTH() Equivalent"]
---

# SQL - MONTH() Equivalent

*Source: https://wiki.postgresql.org/wiki/MONTH()_equivalent*

```SQL
CREATE OR REPLACE FUNCTION month(timestamp without time zone) RETURNS integer
AS $$ 
      SELECT extract(MONTH FROM $1)::integer; 
$$ LANGUAGE sql IMMUTABLE;
```

```SQL
CREATE OR REPLACE FUNCTION month(timestamp with time zone) RETURNS integer
AS $$
      SELECT extract(MONTH FROM $1)::integer;
$$ LANGUAGE sql STABLE;
```

```SQL
CREATE OR REPLACE FUNCTION month(date) RETURNS integer
AS $$
      SELECT extract(MONTH FROM $1)::integer;
$$ LANGUAGE sql IMMUTABLE;
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
list from [[SQL - MONTH() Equivalent]] AND -"Changelog"
```