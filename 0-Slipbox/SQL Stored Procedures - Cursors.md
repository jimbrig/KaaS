# SQL Stored Procedures: Cursors

*Source: [SQL Stored Procedures: Cursors - Medium](https://medium.com/codex/sql-stored-procedures-cursors-2e4984d39599)*

## Overview

![](https://miro.medium.com/max/1400/1*mGFTxowhCjZlBoH0HrnE4g.png)

Cursors provide us the ability to perform operations on a single record in contrast to default SQL behavior which enables us to operate on a set of data. Cursors point to a single record in the dataset and move along the table to operate on the subsequent records.

Cursors provide us a very fine-tuned way of operating on single records and as a result cursors operations are slower than usual operations as it takes more time to move through a single record.

Now let us get our hands dirty.

1. **Declaring Cursors**

````SQL
DECLARE <Cursor_Name> CURSOR
	FOR SELECT <Col1>, <Col2> FROM [<schema>].[<table1>]
````

To define a cursor we simply use the `DECLARE` statement followed by the cursor name and then datatype is defined as `CURSOR`. A cursor is always declared for a set of records and then we use `FOR` statement to point to that set of records. `SELECT` statement is followed by the `FOR` statement to define the set of records we want to operate on.

2. **Open & Close a Cursor**

````SQL
OPEN <Cursor_Name>  
    -- Do Something
	
	CLOSE <Cursor_Name>  
DEALLOCATE <Cursor_Name>
````

To start using a cursor we first need to open it. Use the `OPEN` keyword followed by the cursor name to open it. Then we write the code which uses the opened cursor. When the code using the cursor is executed we can close it using the `CLOSE` keyword followed by cursor’s name.

At this point the cursor still persists in the SQL’s working memory and is at its last position. To remove any references to the cursor we simply use the `DEALLOCATE` keyword to de-allocate any memory associated with the cursor.

3. **Reading a Single Record**

````SQL
OPEN <Cursor_Name>  
    FETCH NEXT FROM <Cursor_Name>
CLOSE <Cursor_Name>  
DEALLOCATE <Cursor_Name>
````

To move the cursor to the first record we use the `FETCH NEXT FROM` clause followed by the cursor name. This moves the cursor to the first record in our selected set of records.

4. **Reading Multiple Records (First to Last)**

````SQL
DECLARE <Cursor_Name> CURSOR  
    FOR SELECT <Col1>, <Col2> FROM [<schema>].[<table>]
	
OPEN <Cursor_Name>  
    FETCH NEXT FROM <Cursor_Name> 
	
	WHILE @@FETCH_STATUS=0
		FETCH NEXT FROM <Cursor_Name>
		
CLOSE <Cursor_Name>  
DEALLOCATE <Cursor_Name>
````

To read multiple records we utilize the global variable `@@FETCH_STATUS`. This variable is equal to 0 until the cursor is able to fetch a record. If the cursor fails to fetch a record the value is not 0. So we use the `WHILE @@FETCH_STATUS=0` to continue looping. To read the next record we simply use `FETCH NEXT FROM` statement.

When the cursor reaches the last record the `FETCH NEXT FROM` does not fetch the next record successfully and the `@@FETCH_STATUS` is no more 0 and hence the loop breaks. By this point we have read all the records in the selected set one by one.

5. **Reading Multiple Records (Last to First)**

````SQL
DECLARE <Cursor_Name> CURSOR SCROLL  
    FOR SELECT <Col1>, <Col2> FROM [<schema>].[<table>]
	
OPEN <Cursor_Name>
	FETCH LAST FROM <Cursor_Name>

WHILE @@FETCH_STATUS=0
	FETCH PRIOR FROM <Cursor_Name>

CLOSE <Cursor_Name>  
DEALLOCATE <Cursor_Name>
````

We have different types of cursors available in SQL. One such cursor is a scroll cursor defined above using `CURSOR SCROLL` keyword when declaring a cursor. The scroll cursor lets us use the `FETCH LAST FROM` clause to start reading records from the last record of the defined set of records to be read.

To read records from last to first we first read the last record into the cursors and then we move upward in the `WHILE` loop using `FETCH PRIOR FROM` clause.

*Note: Scroll cursor also lets us use clauses like* `_FETCH FIRST FROM_` *which provide access to the first record. This is equivalent to* `_FETCH NEXT FROM_` *if the cursor is just opened. The main difference is that scroll cursors let us scroll to different records in the given set directly whereas normal cursors move from beginning to end.*

6. **Reading Nth Record**

````SQL
DECLARE <Cursor_Name> CURSOR SCROLL
	FOR SELECT <Col1>, <Col2> FROM [<schema>].[<table>]
	
OPEN <Cursor_Name>
	FETCH ABSOLUTE 5 FROM <Cursor_Name>
	
CLOSE <Cursor_Name>  
DEALLOCATE <Cursor_Name>
````

To read the *Nth* record directly we again will use a scroll cursor. In the above example we read the *6th* record in the given set (given that it has at least five records). We simply use `FETCH ABSOLUTE N-1 FROM` clause. Here *N* is the *Nth* record we want to read.

For reading records backward we simply use `FETCH ABSOLUTE -N FROM`. This will let us read the Nth record from the end. In the following example, we read the 5th record from the end of the set.

````SQL
DECLARE <Cursor_Name> CURSOR SCROLL
	FOR SELECT <Col1>,<Col2> FROM [<schema>].[<table>]
	
OPEN <Cursor_Name>
	FETCH ABSOLUTE -5 FROM <Cursor_Name>
	
CLOSE <Cursor_Name>  
DEALLOCATE <Cursor_Name>
````

7. **Stepping While Reading Records**

````SQL
DECLARE <Cursor_Name> CURSOR SCROLL
	FOR SELECT <Col1>,<Col2> FROM [<schema>].[<table>]
	
OPEN <Cursor_Name>  
    FETCH ABSOLUTE 5 FROM <Cursor_Name>
	
WHILE @@FETCH_STATUS=0  
	FETCH RELATIVE 10 FROM <Cursor_Name>
	
CLOSE <Cursor_Name>
DEALLOCATE <Cursor_Name>
````

The above code lets us start at the fifth record of the set. Then we use `FETCH RELATIVE N FROM` to jump N records from the current spot. The next record read in the loop will be *16th*.

To read in reverse we simply negate the number after the `RELATIVE` keyword.

````SQL
DECLARE <Cursor_Name> CURSOR SCROLL  
    FOR SELECT <Col1>, <Col2> FROM [<schema>].[<table>]
	
OPEN <Cursor_Name> 
    FETCH ABSOLUTE -5 FROM <Cursor_Name>
	
WHILE @@FETCH\_STATUS=0  
	FETCH RELATIVE -10 FROM <Cursor_Name>
	
CLOSE <Cursor_Name>  
DEALLOCATE <Cursor_Name>
````

8. **Variables and Cursors**

````SQL
DECLARE @ValCol1 INT  
DECLARE @ValCol2 VARCHAR(100)DECLARE <Cursor_Name> CURSOR  
    FOR SELECT Col1, Col2 FROM \[dbo\].\[table1\]OPEN <Cursor_Name>  
    FETCH NEXT FROM <Cursor_Name>  
        INTO @ValCol1, @ValCol2WHILE @@FETCH\_STATUS=0  
        FETCH NEXT FROM <Cursor_Name>  
            INTO @ValCol1, @ValCol2  
        SELECT @ValCol1, @ValCol2CLOSE <Cursor_Name>  
DEALLOCATE <Cursor_Name>
````

To read the value of the cursor into variables first we create the `@ValCol1` and `@ValCol2` to store the values of `Col1` and `Col2` respectively. Next after the `FETCH NEXT FROM` statement we use the `INTO` keyword followed by the names of the variables declared to store column values.

We use a similar syntax inside the code block in the `WHILE` loop. Then we do a `SELECT` to output the values read into the variable.

9. **Scope of Cursors**

````SQL
DECLARE <Cursor_Name> CURSOR GLOBAL  
    FOR SELECT Col1, Col2 FROM \[dbo\].\[table1\]OPEN <Cursor_Name>  
    -- Do SomethingCLOSE <Cursor_Name>  
DEALLOCATE <Cursor_Name>
````

We have two types of cursors `GLOBAL` and `LOCAL`. We can define this scope by using the respective keyword in the cursor declaration statement after the keyword `CURSOR` as shown above.

Local cursors are only available within a given batch of the statements and global cursors are available anywhere inside the current connection reference. To better understand, the following code will result in an error as the local cursor is outside the scope of the current batch.

````SQL
DECLARE <Cursor_Name> CURSOR LOCAL  
    FOR SELECT Col1, Col2 FROM \[dbo\].\[table1\]  
GOOPEN <Cursor_Name>  
    -- Do SomethingCLOSE <Cursor_Name>  
DEALLOCATE <Cursor_Name>
````

10. **Types of Cursors**

There are two types of cursors we have discussed so far:

1. Forward Only
1. Scroll.

Forward only is the default cursor which reads only in one direction i.e. forward relative to its current position. The scroll cursor lets us read *Nth* record and also lets us read forward ( `NEXT` ), backward ( `PRIOR` ) and with a step size to skip intermediate records ( `RELATIVE N` ).

Other types of cursors:

1. Fast Forward
1. Static
1. Dynamic
1. Keyset

*Refer to this* [*Microsoft’s documentation*](https://docs.microsoft.com/en-us/sql/t-sql/language-elements/declare-cursor-transact-sql?view=sql-server-ver15) *for more details on these cursors types.*

*So far we have discussed the basics of cursors. Next time let us see how to modify data with cursors. Make sure to check last post on* [*loops in SQL and stored procedures*](https://medium.com/@yuvrendergill21/sql-stored-procedures-loops-a3cb6d6114a9) *if you haven’t done already.*

---

## Appendix: Links

* [Data Science](../2-Areas/MOCs/Data%20Science.md)
* [Data Engineering](../2-Areas/MOCs/Data%20Engineering.md)
* [Data Warehouse](Data%20Warehouse.md)
* [SQL Server](../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/SQL%20Server.md)
* [SQL](../2-Areas/Code/SQL/SQL.md)
* [Stored Procedures - SQL Server](Stored%20Procedures%20-%20SQL%20Server.md)
* [SQL Stored Procedures Best Practices](SQL%20Stored%20Procedures%20Best%20Practices.md)

*Backlinks:*

````dataview
list from [[SQL Stored Procedures - Cursors]] AND -"Changelog"
````
