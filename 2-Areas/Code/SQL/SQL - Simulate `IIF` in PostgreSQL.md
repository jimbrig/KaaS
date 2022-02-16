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

In plain [[SQL]]: 

```SQL
CREATE OR REPLACE FUNCTION iif_sql(boolean, anyelement, anyelement) returns anyelement as
$body$ select case $1 when true then $2 else $3 end $body$
LANGUAGE sql IMMUTABLE;
```

while you can cover all datatypes at once with this polymorphic function, the type needs to be defined or specified using casts. A simple iif_sql(8<9,'yes','no') will fail. To solve this, you could add an overloaded method to cover this specific case: 

```SQL
CREATE OR REPLACE FUNCTION iif_sql(boolean, unknown, unknown) returns text as
$body$ select case $1 when true then textin(unknownout($2)) else ﻿﻿textin(unknownout($3)) end $body$
LANGUAGE sql IMMUTABLE;
```

In PL/Pgsql:

```SQL
CREATE OR REPLACE FUNCTION iif_(boolean, double precision, double precision) RETURNS double precision AS
$body$
DECLARE
	rtVal double precision;
BEGIN
	rtVal := (select case $1 when true then $2 else $3 end);
	return rtVal;
END;
$body$
LANGUAGE 'plpgsql' IMMUTABLE CALLED ON NULL INPUT SECURITY INVOKER;
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