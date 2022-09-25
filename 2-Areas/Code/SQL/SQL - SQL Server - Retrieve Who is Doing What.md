---
Date: 2022-02-06
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - Retrieve Who is Doing What"]
---

# SQL - Retrieve Who is Doing What

*Source: [Retrieve Who is Doing What | thiscodeWorks](https://www.thiscodeworks.com/61faf2bfb783be0015bbaf80)*

```SQL
-- to understand who is doing what, alternative view/representation
SELECT
	CAST((SELECT qt.text FROM sys.dm_exec_sql_text(qs.sql_handle) AS qt FOR XML PATH('')) as xml) as query_text,
	qs.blocking_session_id,
	qs.start_time, 
	datediff(ss, qs.start_time, getdate()) as ExecutionTime_Seconds,
	getdate() as  CurrentDate,
	datediff(MINUTE, qs.start_time, getdate()) as ExecutionTime_Minutes,
	qs.session_id,
	qs.command,
	qs.status,
	qs.cpu_time, 
	qs.reads, 
	qs.writes, 
	qs.plan_handle,
	qp.query_plan,
	s.host_name, s.login_name, s.program_name,
	qs.wait_type, qs.open_transaction_count, qs.open_resultset_count, qs.row_count, qs.granted_query_memory, qs.transaction_isolation_level
	--,qs.*
FROM sys.dm_exec_requests AS qs
left join sys.dm_exec_sessions s on s.session_id = qs.session_id ---OUTER APPLY sys.dm_exec_sql_text(qs.sql_handle) AS qt
OUTER APPLY sys.dm_exec_query_plan(qs.plan_handle) AS qp
WHERE 	qs.session_id <> @@SPID
	and qs.command not in ('RESOURCE MONITOR', 'XE TIMER', 'XE DISPATCHER', 'LOG WRITER', 'LOCK MONITOR', 'TASK MANAGER', 'TASK MANAGER', 'CHECKPOINT', 'BRKR TASK', 'LAZY WRITER', 'SIGNAL HANDLER', 'TRACE QUEUE TASK', 'BRKR EVENT HNDLR', 'GHOST CLEANUP', 'RECOVERY WRITER', 'SYSTEM_HEALTH_MONITOR', 'RECEIVE', 'UNKNOWN TOKEN', 'FT FULL PASS', 'FT CRAWL MON')
	and isnull(s.program_name, '') <> 'SQL diagnostic manager Collection Service'
ORDER BY ExecutionTime_Minutes DESC;
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
list from [[SQL - Retrieve Who is Doing What]] AND -"Changelog"
```