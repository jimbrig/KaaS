# Chapter 2 - The `SELECT` Statement

`SELECT` = [3-Resources/Tools/Developer Tools/Data Stack/Procedural Languages/SQL](../../Tools/Developer%20Tools/Data%20Stack/Procedural%20Languages/SQL.md) Code to retrieve data from database

## Contents

* [Use Cases](Chapter%202%20-%20SELECT%20Statement.md#use-cases)
* [Syntax](Chapter%202%20-%20SELECT%20Statement.md#syntax)
* \[\[\#`LIMIT`\|`LIMIT`\]\]
* \[\[\#`ORDER BY`\|`ORDER BY`\]\]
* [Inline Calculations](Chapter%202%20-%20SELECT%20Statement.md#inline-calculations)
* [Appendix: Links and References](Chapter%202%20-%20SELECT%20Statement.md#appendix-links-and-references)

## Use Cases

* View data from set of columns in a table
* Combine data from multiple tables
* Filter results from above, perform custom calculations, etc.

## Syntax

````SQL
SELECT [DISTINCT]
	[COLUMN],
	...
FROM
	[SCHEMA].[TABLENAME]
WHERE
	[CONDITIONAL STATEMENTS]
GROUP BY
	[GROUPING FIELDS]
HAVING
	[CONDITIONAL FILTER STATEMENTS AFTER GROUPING]
ORDER BY
	[COLUMNS TO SORT];
````

**Select All:**

````SQL
SELECT * FROM [SCHEMA].[TABLENAME];
````

## `LIMIT`

* Sets maximum number of rows to return
* Is *always* the last line of the query

````SQL
SELECT *
FROM [SCHEMA].[TABLENAME]
LIMIT 5
````

## `ORDER BY`

* Sort output rows
* Add `ASC` or `DESC`
  * In MySQL, `NULL` values appear first w/ `ASC`

````SQL
SELECT * 
FROM [SCHEMA].[TABLENAME] 
ORDER BY [ORDERCOLUMN] DESC
LIMIT 5
````

## Inline Calculations

---

## Appendix: Links and References

* *2022-10-28*
* *SQL for Data Scientists*
* [3-Resources/Tools/Developer Tools/Data Stack/Procedural Languages/SQL](../../Tools/Developer%20Tools/Data%20Stack/Procedural%20Languages/SQL.md)
* *Databases*

---

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2022
