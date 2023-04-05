# SQL - PostgreSQL - Kill Running or Idle Connections

\*Source: *

````SQL
-- Ref: https://www.postgresql.org/docs/current/functions-admin.html
-- Kill all running connection
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE datname = current_database()  
  AND pid <> pg_backend_pid();
````

````SQL
-- Kill all the Idle sessions
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'DatabaseName'
AND pid <> pg_backend_pid()
AND state in ('idle', 'idle in transaction', 'idle in transaction (aborted)', 'disabled')
AND state_change < current_timestamp - INTERVAL '15' MINUTE;
````

---

## Appendix: Links

* *Code*
* [SQL](SQL.md)
* [Databases](../../MOCs/Databases.md)
* [PostgreSQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[SQL - PostgreSQL - Kill Running or Idle Connections]] AND -"Changelog"
````
