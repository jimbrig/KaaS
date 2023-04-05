# SQL Server Useful Queries

## Contents

* [Create a Database Conditionally](SQL%20-%20SQL%20Server%20-%20Useful%20Queries.md#create-a-database-conditionally)
* [Create Schema Conditionally](SQL%20-%20SQL%20Server%20-%20Useful%20Queries.md#create-schema-conditionally)
* \[\[\#Utilize `sp_sql` to Run Dynamic SQL|Utilize `sp_sql` to Run Dynamic SQL\]\]

## Create a Database Conditionally

Use this query to generate a database using the `CREATE DATABASE` command, dropping any pre-existing databases with the same name.

````SQL
-- Check if Datatbase exists and DROP if it does:
IF DATABASEPROPERTYEX ('<dbname>', 'Version') IS NOT NULL
BEGIN
    ALTER DATABASE [<dbname>] SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [<dbname>];
END
GO
````

*REPLACE `<dbname>` with the name of the database.*

**Notes**:

* Notice the use of the `DATABASEPROPERTYEX ('<dbname>', 'Version')` (See [SQL Server System Functions > DATABASEPROPERTYEX](../../../0-Slipbox/SQL%20Server%20System%20Functions.md#databasepropertyex))^\[1\]
* Notice you must `ALTER` the database using `SET SINGLE_USER` first in order to make this work properly
* Create a database, removing any previous database with an identical name

## Create Schema Conditionally

## Utilize `sp_sql` to Run Dynamic SQL

---

## Appendix: Links

* [SQL Server - DBA MultiTool](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Miscellaneous/SQL%20Server%20-%20DBA%20MultiTool.md)

*Backlinks:*

````dataview
list from [[SQL Server Useful Queries]] AND -"Changelog"
````
