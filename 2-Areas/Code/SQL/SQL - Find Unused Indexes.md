---
Date: 2022-02-06
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Databases"]
Alias: ["SQL - Find Unused Indexes"]
---

# SQL - Find Unused Indexes

*Source: [Helpful functions when you need to find out what is going on on SQL Server (github.com)](https://gist.github.com/jimbrig/5d91eef57ce1de7d7f799e92d565631d)*

```SQL
/* FIND UNUSED INDEXES - MIGHT AFFECT LOG WRITES */
 
SELECT o.name Object_Name,
i.name Index_name, 
i.Type_Desc
FROM sys.objects AS o
JOIN sys.indexes AS i
ON o.object_id = i.object_id 
LEFT OUTER JOIN 
sys.dm_db_index_usage_stats AS s 
ON i.object_id = s.object_id 
AND i.index_id = s.index_id
WHERE o.type = 'u'
-- Clustered and Non-Clustered indexes
AND i.type IN (1, 2) 
-- Indexes without stats
AND (s.index_id IS NULL) OR
-- Indexes that have been updated but not used
(s.user_seeks = 0 AND s.user_scans = 0 AND s.user_lookups = 0 );
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
list from [[SQL - Find Unused Indexes]] AND -"Changelog"
```