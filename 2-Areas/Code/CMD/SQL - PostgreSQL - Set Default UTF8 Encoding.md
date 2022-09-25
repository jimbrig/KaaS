---
Date: 2022-03-02
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL - Set Default UTF8 Encoding"]
---

# SQL - PostgreSQL - Set Default UTF8 Encoding

*Source: https://gist.github.com/katylava/765188*

```SQL
UPDATE pg_database SET datistemplate=FALSE WHERE datname='template1';
DROP DATABASE template1;
CREATE DATABASE template1 WITH owner=postgres template=template0 encoding='UTF8';
UPDATE pg_database SET datistemplate=TRUE WHERE datname='template1';
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
list from [[SQL - PostgreSQL - Set Default UTF8 Encoding]] AND -"Changelog"
```