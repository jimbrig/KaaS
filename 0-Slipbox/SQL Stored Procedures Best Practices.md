---
Date: 2022-01-24
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev/Databases"]
Alias: "SQL Stored Procedures Best Practices"
---

# SQL Stored Procedures Best Practices

*Source: [CREATE PROCEDURE (Transact-SQL) - SQL Server - Best Practices | Microsoft Docs](https://docs.microsoft.com/en-us/sql/t-sql/statements/create-procedure-transact-sql?view=sql-server-ver15#best-practices)*

## Best Practices for Writing Stored Procedures

Although this is not an exhaustive list of best practices, these suggestions may improve procedure performance.

-   Use the `SET NOCOUNT ON` statement as the first statement in the body of the procedure. That is, place it just after the `AS` keyword. This turns off messages that SQL Server sends back to the client after any `SELECT`, `INSERT`, `UPDATE`, `MERGE`, and `DELETE` statements are executed. This keeps the output generated to a minimum for clarity. There is no measurable performance benefit however on today's hardware. For information, see [SET NOCOUNT (Transact-SQL)](https://docs.microsoft.com/en-us/sql/t-sql/statements/set-nocount-transact-sql?view=sql-server-ver15).
-   Use schema names when creating or referencing database objects in the procedure. It takes less processing time for the Database Engine to resolve object names if it does not have to search multiple schemas. It also prevents permission and access problems caused by a user's default schema being assigned when objects are created without specifying the schema.
-   Avoid wrapping functions around columns specified in the `WHERE` and `JOIN` clauses. Doing so makes the columns non-deterministic and prevents the query processor from using indexes.
-   Avoid using scalar functions in `SELECT` statements that return many rows of data. Because the scalar function must be applied to every row, the resulting behavior is like row-based processing and degrades performance.
-   Avoid the use of `SELECT *`. Instead, specify the required column names. This can prevent some Database Engine errors that stop procedure execution. For example, a `SELECT *` statement that returns data from a 12 column table and then inserts that data into a 12 column temporary table succeeds until the number or order of columns in either table is changed.
-   Avoid processing or returning too much data. Narrow the results as early as possible in the procedure code so that any subsequent operations performed by the procedure are done using the smallest data set possible. Send just the essential data to the client application. It is more efficient than sending extra data across the network and forcing the client application to work through unnecessarily large result sets.
-   Use explicit transactions by using `BEGIN/COMMIT TRANSACTION` and keep transactions as short as possible. Longer transactions mean longer record locking and a greater potential for deadlocking.
-   Use the Transact-SQL `TRY...CATCH` feature for error handling inside a procedure. `TRY...CATCH` can encapsulate an entire block of Transact-SQL statements. This not only creates less performance overhead, it also makes error reporting more accurate with significantly less programming.
-   Use the `DEFAULT` keyword on all table columns that are referenced by `CREATE TABLE` or `ALTER TABLE` Transact-SQL statements in the body of the procedure. This prevents passing NULL to columns that do not allow null values.
-   Use `NULL` or `NOT NULL` for each column in a temporary table. The `ANSI_DFLT_ON` and `ANSI_DFLT_OFF` options control the way the Database Engine assigns the `NULL` or `NOT NULL` attributes to columns when these attributes are not specified in a `CREATE TABLE` or `ALTER TABLE` statement. If a connection executes a procedure with different settings for these options than the connection that created the procedure, the columns of the table created for the second connection can have different nullability and exhibit different behavior. If `NULL` or `NOT NULL` is explicitly stated for each column, the temporary tables are created by using the same nullability for all connections that execute the procedure.
-   Use modification statements that convert nulls and include logic that eliminates rows with null values from queries. Be aware that in Transact-SQL, `NULL` is not an empty or "nothing" value. It is a placeholder for an unknown value and can cause unexpected behavior, especially when querying for result sets or using `AGGREGATE` functions.
-   Use the `UNION ALL` operator instead of the `UNION` or `OR` operators, unless there is a specific need for distinct values. The `UNION ALL` operator requires less processing overhead because duplicates are not filtered out of the result set.

## General Remarks

There is no predefined maximum size of a procedure.

Variables specified in the procedure can be user-defined or system variables, such as @@SPID.

When a procedure is executed for the first time, it is compiled to determine an optimal access plan to retrieve the data. Subsequent executions of the procedure may reuse the plan already generated if it still remains in the plan cache of the Database Engine.

One or more procedures can execute automatically when SQL Server starts. The procedures must be created by the system administrator in the `master` database and executed under the **sysadmin** fixed server role as a background process. The procedures cannot have any input or output parameters. For more information, see [Execute a Stored Procedure](https://docs.microsoft.com/en-us/sql/relational-databases/stored-procedures/execute-a-stored-procedure?view=sql-server-ver15).

Procedures are nested when one procedure call another or executes managed code by referencing a CLR routine, type, or aggregate. Procedures and managed code references can be nested up to 32 levels. The nesting level increases by one when the called procedure or managed code reference begins execution and decreases by one when the called procedure or managed code reference completes execution. Methods invoked from within the managed code do not count against the nesting level limit. However, when a CLR stored procedure performs data access operations through the SQL Server managed provider, an additional nesting level is added in the transition from managed code to SQL.

Attempting to exceed the maximum nesting level causes the entire calling chain to fail. You can use the @@NESTLEVEL function to return the nesting level of the current stored procedure execution.

## Examples

### Simple Example

```SQL
CREATE PROCEDURE HumanResources.uspGetAllEmployees
AS
    SET NOCOUNT ON;
    SELECT LastName, FirstName, JobTitle, Department
    FROM HumanResources.vEmployeeDepartment;
GO

SELECT * FROM HumanResources.vEmployeeDepartment;
```

The `uspGetEmployees` procedure can be executed in the following ways:

```SQL
EXECUTE HumanResources.uspGetAllEmployees;
GO
-- Or
EXEC HumanResources.uspGetAllEmployees;
GO
-- Or, if this procedure is the first statement within a batch:
HumanResources.uspGetAllEmployees;
```

### Return More than One Result

```SQL
CREATE PROCEDURE dbo.uspMultipleResults
AS
SELECT TOP(10) BusinessEntityID, Lastname, FirstName FROM Person.Person;
SELECT TOP(10) CustomerID, AccountNumber FROM Sales.Customer;
GO
```

### Passing Parameters

```SQL
IF OBJECT_ID ( 'HumanResources.uspGetEmployees', 'P' ) IS NOT NULL
    DROP PROCEDURE HumanResources.uspGetEmployees;
GO
CREATE PROCEDURE HumanResources.uspGetEmployees
    @LastName NVARCHAR(50),
    @FirstName NVARCHAR(50)
AS

    SET NOCOUNT ON;
    SELECT FirstName, LastName, JobTitle, Department
    FROM HumanResources.vEmployeeDepartment
    WHERE FirstName = @FirstName AND LastName = @LastName;
GO
```

Then execute:

```SQL
EXECUTE HumanResources.uspGetEmployees N'Ackerman', N'Pilar';
-- Or
EXEC HumanResources.uspGetEmployees @LastName = N'Ackerman', @FirstName = N'Pilar';
GO
-- Or
EXECUTE HumanResources.uspGetEmployees @FirstName = N'Pilar', @LastName = N'Ackerman';
GO
-- Or, if this procedure is the first statement within a batch:
HumanResources.uspGetEmployees N'Ackerman', N'Pilar';
```

## Appendix: Links

[[Databases]]
[[Data Science]]
[[Data Engineering]]
[[SQL]]
[[SQL Server]]
[[SQL Server Management Studio]]
[[Azure SQL Databases]]

*Backlinks:*

```dataview
list from [[SQL Stored Procedures Best Practices]] AND -"Changelog"
```