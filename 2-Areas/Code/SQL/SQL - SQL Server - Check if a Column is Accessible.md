---
Date: 2022-02-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - SQL Server - Check if a Column is Accessible"]
---

# SQL - SQL Server - Check if a Column is Accessible

*Source: [sql-snippets/check-column-is-accessible.md at main · count/sql-snippets (github.com)](https://github.com/count/sql-snippets/blob/main/mssql/check-column-is-accessible.md)*

Explore this snippet [here](https://count.co/n/xpgYlM1uDAT?vm=e).

## Description

One method to check if the current session has access to a column is to use the [`COL_LENGTH`](https://docs.microsoft.com/en-us/sql/t-sql/functions/col-length-transact-sql) function, which returns the length of a column in bytes.

If the column doesn't exist (or cannot be accessed), `COL_LENGTH` returns `null`.

```sql
SELECT col_length('Orders', 'Sales') AS does_exist,
       col_length('Orders', 'Shmales') AS does_not_exist
```

Output:

| does_exist | does_not_exist |
| ---------- | -------------- |
| 8          | NULL           |

***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[SQL Server]]
- [[T-SQL]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - SQL Server - Check if a Column is Accessible]] AND -"Changelog"
```