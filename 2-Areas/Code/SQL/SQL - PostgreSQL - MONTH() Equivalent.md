---
Date: 2022-02-16
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL - MONTH() Equivalent"]
---

# SQL - PostgreSQL - `MONTH()` Equivalent

*Source: https://wiki.postgresql.org/wiki/MONTH()_equivalent*

Reproduce the [[SQL Server]] `MONTH()` functionality in [[PostgreSQL]].

## Contents

- [[#Snippets by Data Type|Snippets by Data Type]]
	- [[#Timestamp Without Time Zone|Timestamp Without Time Zone]]
	- [[#Timestamp With Time Zone|Timestamp With Time Zone]]
	- [[#Date|Date]]
- [[#Appendix: Links|Appendix: Links]]


## Snippets by Data Type

- *NOTE: All functions are [[SQL]] and not the [[PostgreSQL]] procedural language [[PLPGSQL]]*

- *NOTE: All functions return integer data type representing the month of the year (i.e. 1-12 being January - December)*

### Timestamp Without Time Zone

- Derive the month from the `timestamp without time zone` data type:

```SQL
CREATE OR REPLACE FUNCTION month(timestamp without time zone) RETURNS integer
AS $$ 
      SELECT extract(MONTH FROM $1)::integer; 
$$ LANGUAGE sql IMMUTABLE;
```

### Timestamp With Time Zone

- Derive the month from the `timestamp with time zone` data type:

```SQL
CREATE OR REPLACE FUNCTION month(timestamp with time zone) RETURNS integer
AS $$
      SELECT extract(MONTH FROM $1)::integer;
$$ LANGUAGE sql STABLE;
```

### Date

- Derive the month from the `date` data type:

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