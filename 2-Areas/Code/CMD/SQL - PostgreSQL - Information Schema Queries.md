---
Date: 2022-02-18
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL - Information Schema Queries"]
---

# SQL - PostgreSQL - Information Schema Queries

*Source: *

## Retrieve Tables from the `information_schema`

```SQL
SELECT * FROM information_schema.tables;
```

Filter for a specific schema:

```sql
SELECT * FROM information_schema.tables WHERE table_schema = '<schema_name>';
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
list from [[SQL - PostgreSQL Information Schema Queries]] AND -"Changelog"
```