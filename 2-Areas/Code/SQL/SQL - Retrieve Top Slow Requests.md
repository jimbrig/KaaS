---
Date: 2022-02-06
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Databases"]
Alias: ["SQL - Retrieve Top Slow Requests"]
---

# SQL - Retrieve Top Slow Requests

*Source: [Retrieve Top Slow Requests | thiscodeWorks](https://www.thiscodeworks.com/61faf178b783be0015bbaf73)*

```SQL
SELECT  creation_time 
        ,last_execution_time
        ,total_physical_reads
        ,total_logical_reads 
        ,total_logical_writes
        , execution_count
        , total_worker_time
        , total_elapsed_time
        , (total_elapsed_time / execution_count) avg_elapsed_time
        ,SUBSTRING(st.text, (qs.statement_start_offset/2) + 1,
         ((CASE statement_end_offset
          WHEN -1 THEN DATALENGTH(st.text)
          ELSE qs.statement_end_offset END
            - qs.statement_start_offset)/2) + 1) AS statement_text
FROM sys.dm_exec_query_stats AS qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) st
WHERE execution_count > 10 -- filter out rare requests
ORDER BY total_elapsed_time / execution_count DESC;
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
list from [[SQL - Retrieve Top Slow Requests]] AND -"Changelog"
```