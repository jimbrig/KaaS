---
Date: 2022-01-30
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code", "#Topic/Dev/SQL", "#Status/Todo"]
Alias: "SQL Server Useful Queries"
---

# SQL Server Useful Queries

## Contents

- [[#Create a Database Conditionally|Create a Database Conditionally]]
- [[#Create Schema Conditionally|Create Schema Conditionally]]
- [[#Utilize `sp_sql` to Run Dynamic SQL|Utilize `sp_sql` to Run Dynamic SQL]]



## Create a Database Conditionally

Use this query to generate a database using the `CREATE DATABASE` command, dropping any pre-existing databases with the same name.

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

*REPLACE `<dbname>` with the name of the database.*

**Notes**:
- Notice the use of the `DATABASEPROPERTYEX ('<dbname>', 'Version')` (See [[SQL Server System Functions#DATABASEPROPERTYEX]])^[1]
- Notice you must `ALTER` the database using `SET SINGLE_USER` first in order to make this work properly
- Create a database, removing any previous database with an identical name

## Create Schema Conditionally


## Utilize `sp_sql` to Run Dynamic SQL






*Backlinks:*

```dataview
list from [[SQL Server Useful Queries]] AND -"Changelog"
```

