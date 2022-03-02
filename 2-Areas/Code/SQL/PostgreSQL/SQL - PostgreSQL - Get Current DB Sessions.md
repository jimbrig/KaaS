---
Date: 2022-03-02
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL - Get Current DB Sessions"]
---

# SQL - PostgreSQL - Get Current DB Sessions

*Source: https://www.postgresql.org/docs/current/monitoring-stats.html*

```SQL
-- Ref: https://www.postgresql.org/docs/current/monitoring-stats.html
-- Get current DB Sessions
SELECT count(*) as stat_count, state 
FROM pg_stat_activity 
WHERE "query"::text not ilike '%pg_stat_activity%' 
GROUP BY "state"
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
list from [[SQL - PostgreSQL - Get Current DB Sessions]] AND -"Changelog"
```