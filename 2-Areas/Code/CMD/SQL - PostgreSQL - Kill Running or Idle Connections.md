---
Date: 2022-03-02
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL - Kill Running or Idle Connections"]
---

# SQL - PostgreSQL - Kill Running or Idle Connections

*Source: *

```SQL
-- Ref: https://www.postgresql.org/docs/current/functions-admin.html
-- Kill all running connection
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE datname = current_database()  
  AND pid <> pg_backend_pid();
```

```SQL
-- Kill all the Idle sessions
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'DatabaseName'
AND pid <> pg_backend_pid()
AND state in ('idle', 'idle in transaction', 'idle in transaction (aborted)', 'disabled')
AND state_change < current_timestamp - INTERVAL '15' MINUTE;
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
list from [[SQL - PostgreSQL - Kill Running or Idle Connections]] AND -"Changelog"
```