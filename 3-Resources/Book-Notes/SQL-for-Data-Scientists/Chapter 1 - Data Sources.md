---
Date: 2022-10-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Book", "#Topic/Dev", "#Topic/Dev/SQL", "#Topic/Dev/Data", "#Topic/Dev/Database"]
Alias: ["Data Sources"]
---

# Chapter 1 - Data Sources

## Contents

- [[#Terms|Terms]]
- [[#Structured v. Unstructured Data|Structured v. Unstructured Data]]
- [[#Database v. Database Schema|Database v. Database Schema]]
- [[#One-to-many relationships|One-to-many relationships]]
- [[#Many-to-many relationships|Many-to-many relationships]]
- [[#Database normalization|Database normalization]]
- [[#Dimensional Data Warehouses|Dimensional Data Warehouses]]

## Terms

|                                      Term                                      |                           Definition                            |                                       Notes                                        |
|:------------------------------------------------------------------------------:|:---------------------------------------------------------------:|:----------------------------------------------------------------------------------:|
|                                 [[APIs\|API]]                                  |               *Application Programming Interface*               |                                                                                    |
| [[3-Resources/Tools/Developer Tools/Data Stack/Procedural Languages/SQL\|SQL]] |                   *Structured Query Language*                   |                                                                                    |
|                                   [[RDBMS]]                                    |             *Relational Database Management System*             |                                                                                    |
|                                    [[ODBC]]                                    |                  *Open Database Connectivity*                   | Uses drivers to standardize interfaces between software applications and database. |
|                                    [[ERD]]                                     |                  *Entity Relationship Diagram*                  |                                                                                    |
|        [[Foreign Key Constraints in Relational Databases\|Foreign Key]]        | [[Primary Key]] referenced by another table as a [[constraint]] |                                                                                    |
|                                                                                |                                                                 |                                                                                    |

## Structured vs. Unstructured Data 

**Unstructured:**

- Text Documents
- Images
- etc.

**Structured:**

- Tabular
- Spreadsheets
- Database
- etc.

## Database vs. Database Schema 

* [[3-Resources/Tools/Developer Tools/Data Stack/Databases/_README|Database]] = Collection of tables
* [[Database Schema]] = Stores table information and relationships (i.e. defines the structure)

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

***

## Appendix: Links and References

- [[2022-10-28]]
- [[3-Resources/Book-Notes/SQL-for-Data-Scientists/_README|SQL for Data Scientists]]
- [[3-Resources/Tools/Developer Tools/Data Stack/Procedural Languages/SQL]]
- [[3-Resources/Tools/Developer Tools/Data Stack/Databases/_README|Databases]]

***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2022
