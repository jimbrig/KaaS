---
Date: 2022-01-30
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code", "#Topic/Dev/SQL"]
Alias: "SQL Server Useful Queries"
---

# SQL Server Useful Queries

## Create a Database Conditionally

Use this query to generate a database using the `CREATE DATABASE` command, dropping a
Create a database, removing any previous database with an identical name:

```SQL
-- Check if Datatbase exists and DROP if it does:
IF DATABASEPROPERTYEX ('<dbname>', 'Version') IS NOT NULL
BEGIN
    ALTER DATABASE [<dbname>] SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [<dbname>];
END
GO
```

*Backlinks:*

```dataview
list from [[SQL Server Useful Queries]] AND -"Changelog"
```