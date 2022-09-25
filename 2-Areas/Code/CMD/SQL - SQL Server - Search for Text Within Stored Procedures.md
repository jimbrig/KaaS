---
Date: 2022-02-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - SQL Server - Search for Text Within Stored Procedures"]
---

# SQL - SQL Server - Search for Text Within Stored Procedures

*Source: [sql-snippets/search-stored-procedures.md at main · count/sql-snippets (github.com)](https://github.com/count/sql-snippets/blob/main/mssql/search-stored-procedures.md)*

## Description

Often you'll want to know which stored procedure is performing an action or contains specific text. Query will match on comments.

## Snippet ✂️

```sql
SELECT name
FROM   sys.procedures
WHERE  Object_definition(object_id) LIKE '%strHell%'
```

## Usage

```sql
SELECT name
FROM   sys.procedures
WHERE  Object_definition(object_id) LIKE '%blitz%'
```

Output:

| name            |
| --------------- |
| sp_BlitzFirst   |
| sp_BlitzCache   |
| sp_BlitzWho     |
| sp_Blitz        |
| sp_BlitzBackups |
| sp_BlitzLock    |
| sp_BlitzIndex   |

## Reference

- [Stackoverflow](https://stackoverflow.com/questions/14704105/search-text-in-stored-procedure-in-sql-server)


***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[SQL Server]]
- [[T-SQL]]
- [[Stored Procedures - SQL Server]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - SQL Server - Search Stored Procedures]] AND -"Changelog"
```