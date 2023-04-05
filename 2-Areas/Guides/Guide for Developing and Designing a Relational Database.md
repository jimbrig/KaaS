# Guide for Developing and Designing a Relational Database

## Overview

Many databases are initially developed by professionals not deeply experienced in database development. In a lot of instances, an application engineer is drafted with the task of designing a table or database due to the lack of an available database resource. Unfortunately, sometimes working outside one's area of expertise can sometimes lead to making technical decisions that are later discovered to be less than optimal.

The goal of this tutorial is to help non-database and database professionals alike recognize sound development practices and to recognize practices and techniques that could lead to future technical headaches.

With this goal in mind, the following topics will be examined:

* Logical Design
* Defining Data Types and Sizes
* Defining a Primary Key
* Defining a Clustered Index
* Defining Constraints
* Choosing Non-Clustered Indexes
* Prepared Queries and Stored Procedures
* Querying in Sets
* Preventing Index Nullification
* Temporary Tables and Table Variables
* Working With Triggers

## Logical Design

Before you dive into creating your tables and writing any code, you should initially dedicate time up front to develop a logical data model that attempts to achieve at least 3rd Normal Form.

Logical data modeling is where you will define the business entities which will eventually become tables, it's attributes (columns) and how the entities inter-relate with each other. This initial step involves the process of normalization. Normalization is where you break down your entities and remove redundancy from them, eliminate any repeating data from them, and where eventually each entity has a primary key where the attributes all rely solely on this key. This process is usually performed leveraging data modeling tools which can visualize the model.

There are 3 basic normalization ("normal") forms:

* 1st Normal Form (1NF) (a primary key is identified, attributes reduced to their smallest component, and repeating data is identified and removed)
* 2nd Normal Form (2NF) (non primary key attributes not dependent on the entire primary key are removed)
* 3rd Normal Form (3NF) (remaining non primary key attributes that have dependency on other non primary key attributes (i.e. transitive dependencies) are removed

There are additional normal forms such as Boyce-Codd normal form (BCNF), 4th normal form (4NF), 5th normal form (5NF), etc. I generally find that achieving 3rd normal form is adequate. Your mileage may vary.

Why go through all this effort to normalize? Normalization can help reduce the amount of data in your tables leading to fewer I/Os to retrieve data for queries as well as memory savings in SQL Server's buffer pool. It can also help prevent issues with data modification anomalies where data is updated in one column but perhaps missed in other columns. Lastly, referential integrity, such as foreign key validation, becomes easier to maintain.

Depending on your design, there might be a performance penalty to normalizing to 3NF and, especially, beyond since many JOINs could be required to satisfy a query request. This shouldn't preclude you from initially designing to at least 3NF. If a query issue is later identified, you do have the option of introducing controlled redundancy into your design. In this process, you explicitly introduce redundancy to solve a performance issue. However, don't automatically add de-normalization to a design; instead allow a real performance situation to dictate it.

### Additional Information

* [Database Normalization Basics](http://databases.about.com/od/specificproducts/a/normalization.htm)
* [Understanding First Normal Form in SQL Server](https://www.mssqltips.com/sqlservertip/2417/understanding-first-normal-form-in-sql-server/)
* [Getting started with SQL Server database diagrams](https://www.mssqltips.com/sqlservertip/1816/getting-started-with-sql-server-database-diagrams/)

## Data Types

Once the logical design has been determined, you can start to physically design your database where tables and their columns are created. When the task of defining the columns of a table is begun, it very important to choose data types and their sizes wisely.

SQL Server data pages hold row data and are roughly capped at 8060 overall bytes (8k) though there is a row overflow mechanism that can kick in. Generally speaking, you should look to keep your data type sizes as compact as possible. It stands to reason that the more compact your rows, the more rows that can fit on a data page resulting in fewer I/Os required (page reads) to get the data required for a query request. In addition, SQL Server's data cache will have more room to store data. I usually take a minimalist approach to data type size definitions and use the smallest data sizes needed to reasonably define a column.

Data types themselves also require careful consideration. Is your application multi-national or is there a chance it may become multi-national? You may be best served by using unicode types (i.e. nvarchar, nchar) vs. the varchar and char types. Unicode types do take twice the data storage (they're double byte) but they allow for storing international characters such as Japanese Kanji. That said, this does negatively impact the 8k size limit.

One item to consider when defining character based columns, I usually avoid using char/nchar unless the size of the data in the column is in a known, fixed size format (such as a U.S. check routing number). The reason is that once a column is defined as char/nchar, the entire column size is allocated and counts against your 8k page size limit. For instance, if you were to define a column called FirstName as char(50), the full 50 characters will be allocated even if a first name that is entered is less than 50 characters. Of course, this becomes wasted space in your data page and causes fewer rows to fit resulting in more I/Os to satisfy queries.

Also look to avoid deprecated data types such as text, ntext, and image as they will eventually become unsupported. Instead, look to convert to and start using varchar(max), nvarchar(max), and varbinary, respectively.

## Additional Information

* [NCHAR and NVARCHAR data types](http://msdn.microsoft.com/en-us/library/ms186939.aspx)
* [Row sizes exceeding 8060 bytes in Sql 2005](https://www.mssqltips.com/sqlservertip/2242/row-sizes-exceeding-8060-bytes-in-sql-2005/)

## 1. Develop

Develop the highest quality code faster and receive better performing applications from day one. 

* **Build**: Toad is equipped with multiple features to help developers be more productive and efficient when building or maintaining code. 
* **Test**: Users can create test cases for all their code automatically and run them for functional correctness, then store those test for later regression testing. 
* **Debug**: Bugs and problematic logic in stored procedures are easily identified for quick resolution.
* **Review**: Users can review all their code against predefined coding standards to ensure consistently high quality.

Step two: Optimize Toad’s Code Analysis feature and SQL Optimizer component maximize code quality and SQL performance by automating the manual, tedious and uncertain process of traditional code reviews and ensuring the fastest possible performance of SQL statements. Toad’s Code Analysis feature: • Provides a code-quality assessment of all the code in a project based on predefined standards combined with HTML reporting of overall quality. Toad’s SQL Optimizer component: • Scans application source code and identifies poorly performing SQL. • Generates every possible rewrite and frees up the trial-and-error process. • Benchmarks and compares the fastest alternate statement. • Automates the optimization process, guaranteeing semantic equivalency and discarding those of minimum benefits. • Ensures optimal performance and eliminates the current manual process. Step three: Validate Toad’s Benchmark Factory component: • Tests critical SQL and stored procedure code for scalability and performance under various user loads in pre-production. • Enables full database capture of production transactions and replay on a test server with the ability to scale- up user load.

---

## Appendix: Links

* [SQL](../Code/SQL/SQL.md)
* [Databases](../MOCs/Databases.md)
* [Data Engineers](../../0-Slipbox/Data%20Engineers.md)
* [Database Modeling Tools](../Lists/Database%20Modeling%20Tools.md)
* [Data Engineering](../MOCs/Data%20Engineering.md)
* [Design Your Work](../../3-Resources/Highlights/Readwise/Books/Design%20Your%20Work.md)

**See Also:**
