---
Date: 2022-03-02
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL - Basic Instance Information"]
---

# SQL - PostgreSQL - Basic Instance Information

*Source: https://gist.github.com/parallelo3301/260435228584f1dc85701e884c4c97c1*

```SQL
-- show db version
SELECT version();

-- uptime
SELECT pg_postmaster_start_time();

-- show connections
SELECT * FROM pg_stat_activity;

-- show users
SELECT u.usename AS "Role name", CASE WHEN u.usesuper AND u.usecreatedb THEN CAST('superuser, create database' AS pg_catalog.text) WHEN u.usesuper THEN CAST('superuser' AS pg_catalog.text) WHEN u.usecreatedb THEN CAST('create database' as pg_catalog.text) ELSE CAST('' AS pg_catalog.text) END AS "Attributes" FROM pg_catalog.pg_user u ORDER BY 1;

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
list from [[SQL - PostgreSQL - Basic Instance Information]] AND -"Changelog"
```