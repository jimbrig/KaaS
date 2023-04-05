# Chapter 1 - Data Sources

## Contents

* [Terms](Chapter%201%20-%20Data%20Sources.md#terms)
* [Structured v. Unstructured Data](Chapter%201%20-%20Data%20Sources.md#structured-v-unstructured-data)
* [Database v. Database Schema](Chapter%201%20-%20Data%20Sources.md#database-v-database-schema)
* [One-to-many relationships](Chapter%201%20-%20Data%20Sources.md#one-to-many-relationships)
* [Many-to-many relationships](Chapter%201%20-%20Data%20Sources.md#many-to-many-relationships)
* [Database normalization](Chapter%201%20-%20Data%20Sources.md#database-normalization)
* [Dimensional Data Warehouses](Chapter%201%20-%20Data%20Sources.md#dimensional-data-warehouses)

## Terms

|Term|Definition|Notes|
|:--:|:--------:|:---:|
|[API](../../Tools/Developer%20Tools/APIs/APIs.md)|*Application Programming Interface*||
|[SQL](../../Tools/Developer%20Tools/Data%20Stack/Procedural%20Languages/SQL.md)|*Structured Query Language*||
|*RDBMS*|*Relational Database Management System*||
|*ODBC*|*Open Database Connectivity*|Uses drivers to standardize interfaces between software applications and database.|
|*ERD*|*Entity Relationship Diagram*||
|[Foreign Key](../../../0-Slipbox/Foreign%20Key%20Constraints%20in%20Relational%20Databases.md)|*Primary Key* referenced by another table as a *constraint*||
||||

## Structured vs. Unstructured Data

**Unstructured:**

* Text Documents
* Images
* etc.

**Structured:**

* Tabular
* Spreadsheets
* Database
* etc.

## Database vs. Database Schema

* *Database* = Collection of tables
* *Database Schema* = Stores table information and relationships (i.e. defines the structure)

## One-to-Many Relationships

* Where a unique entity only occurs in one table *once* but can have multiple entries in another 
  * e.g., patient tbl and appointments tbl 

## Many-to-Many Relationships

* Connection between entities where records on each side of the relationship can connect 
  to multiple records on the other side 
  * Junction of associated table needs to capture the pairs of related rows 
  * Allows the ability to reduce the amount of redundant data stored in the database 

## Database Normalization

* Idea of not storing redundant data in a database 

## Dimensional Data Warehouses

* Often contain data from multiple underlying sources 
  
  * may contain row and summary data 
  * Can contain historical data logs, etc
* Star scheme design (pg 7)
  
  * Divides data into facts/dimensions 
    * Facts tbl = metadata of an entity and measures 
    * Dimension tbl = property of entity you can group or "slice and dice" the fact 
      records by, get further info, etc
* Table *grain*
  
  * level of detail; what set of columns makes a row unique 
* Database roles 
  
  * SME's = subject matter experts 
  * DBA's = Database administrators 
  * ETL engineers = PEople who extract, transform, and load data from a source system 
    into a data warehouse

---

## Appendix: Links and References

* *2022-10-28*
* *SQL for Data Scientists*
* [3-Resources/Tools/Developer Tools/Data Stack/Procedural Languages/SQL](../../Tools/Developer%20Tools/Data%20Stack/Procedural%20Languages/SQL.md)
* *Databases*

---

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2022
