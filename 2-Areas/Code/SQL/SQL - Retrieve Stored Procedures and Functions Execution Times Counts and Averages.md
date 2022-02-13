---
Date: 2022-02-06
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Data/Databases"]
Alias: ["SQL - Retrieve Stored Procedures and Functions Execution Times Counts and Averages"]
---

# SQL - Retrieve Stored Procedures and Functions Execution Times Counts and Averages

*Source: [Retrieve Stored Procedures and Functions Execution Time, Count, and Average | thiscodeWorks](https://www.thiscodeworks.com/61faf1cfb783be0015bbaf78)*


*Note: time is in Micro-Seconds*

```SQL
/* STORED PROCEDURES AND FUNCTIONS EXECUTION TIME, COUNT AND AVERAGE */
 
SELECT DB_NAME(st.dbid) DBName
      ,OBJECT_SCHEMA_NAME(st.objectid,dbid) SchemaName
      ,OBJECT_NAME(st.objectid,dbid) StoredProcedure
      ,max(cp.usecounts) Execution_count
      ,sum(qs.total_worker_time) total_cpu_time
      ,sum(qs.total_worker_time) / (max(cp.usecounts) * 1.0)  avg_cpu_time
 
FROM sys.dm_exec_cached_plans cp join sys.dm_exec_query_stats qs on cp.plan_handle = qs.plan_handle
     CROSS APPLY sys.dm_exec_sql_text(cp.plan_handle) st
where DB_NAME(st.dbid) is not null and cp.objtype = 'proc'
group by DB_NAME(st.dbid),OBJECT_SCHEMA_NAME(objectid,st.dbid), OBJECT_NAME(objectid,st.dbid) 
order by sum(qs.total_worker_time) desc;
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
list from [[SQL - Retrieve Stored Procedures and Functions Execution Times Counts and Averages]] AND -"Changelog"
```