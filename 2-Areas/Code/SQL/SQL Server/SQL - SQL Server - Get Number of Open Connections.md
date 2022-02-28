---
Date: 2022-02-06
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - Get Number of Open Connections"]
---

# SQL - Get Number of Open Connections

*Source: [Retrieve Number of Open Connections | thiscodeWorks](https://www.thiscodeworks.com/61faf143b783be0015bbaf71)*

```SQL
SELECT DB_NAME(dbid) as "Database", COUNT(dbid) as "Number Of Open Connections",
loginame as LoginName
FROM sys.sysprocesses
WHERE dbid > 0
GROUP BY dbid, loginame;
```

For [[SQL Server]].

***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[SQL Server]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - Get Number of Open Connections]] AND -"Changelog"
```