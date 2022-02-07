---
Date: 2022-02-06
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Databases"]
Alias: ["SQL - Re-build all Indexes"]
---

# SQL - Re-build all Indexes

*Source: [Rebuild all indexes online | thiscodeWorks](https://www.thiscodeworks.com/61faf2fab783be0015bbaf82)*

```SQL
-- rebuild all indexes online
ALTER INDEX ALL ON Table1
REBUILD WITH (ONLINE = ON);   
GO  
-- rebuild single index online
ALTER INDEX IX_IndexName ON Table1
REBUILD WITH (ONLINE = ON);   
GO  
```


***

## Appendix: Links

- [[3-Resources/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[SQL Server]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - Re-build all Indexes]] AND -"Changelog"
```