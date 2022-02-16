---
Date: 2022-02-16
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Data/Databases"]
Alias: ["SQL - Simulate `IIF` in PostgreSQL"]
---

# SQL - Simulate `IIF` in PostgreSQL

*Source: https://wiki.postgresql.org/wiki/Simulating_iif_function*

Some developers are accustomed to some 'Access' (and others db's) functions. One of them is the 'iif' function that works very simple and sometimes add to the query more intelligence.

Well, you will surprising to know that in [[PostgreSQL]] is possible and is quite simple to add this function.

In plain SQL: 

```SQL
CREATE OR REPLACE FUNCTION iif_sql(boolean, anyelement, anyelement) returns anyelement as
$body$ select case $1 when true then $2 else $3 end $body$
LANGUAGE sql IMMUTABLE;
```


***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[SQL Server]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - Simulate `IIF` in PostgreSQL]] AND -"Changelog"
```