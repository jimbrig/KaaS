---
Date: 2022-03-02
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL - Extensions"]
---

# SQL - PostgreSQL - Extensions

*Source: https://gist.github.com/parallelo3301/260435228584f1dc85701e884c4c97c1*

```SQL
-- show active extensions
SELECT * FROM pg_catalog.pg_extension;

-- show available extensions
SELECT * FROM pg_catalog.pg_available_extensions;

-- enable extension
CREATE EXTENSION xy;
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
list from [[SQL - PostgreSQL - Extensions]] AND -"Changelog"
```