# Notes on Database Indexing and Primary Keys

## Contents

* [Primary Keys](Notes%20on%20Database%20Indexing%20and%20Primary%20Keys.md#primary-keys)
* [Indexes](Notes%20on%20Database%20Indexing%20and%20Primary%20Keys.md#indexes)
  * [Indexing Guidelines](Notes%20on%20Database%20Indexing%20and%20Primary%20Keys.md#indexes-indexing-guidelines)
* [Identity Columns](Notes%20on%20Database%20Indexing%20and%20Primary%20Keys.md#identity-columns)
* [Surrogate Keys](Notes%20on%20Database%20Indexing%20and%20Primary%20Keys.md#surrogate-keys)

## Primary Keys

* Always create a primary key at table creation. 
* To retrieve a single specific record from a table, the record must be uniquely identified.
* A primary key is a column or combination of columns (composite primary key) that contains a unique value or combination of values. 
* Each table should have a primary key — either explicit (surrogate) or implicit in order to support indexing and referential/relational integrity.
* A primary key index, like any index, speeds up access to data in the table. Unlike other indexes, however, a primary key index also controls the order in which records are stored in the database. This is called clustering.
* Records are stored in ascending order based on the primary key values.
* If a primary key is not specified by a user, the most efficient query method is not available for that table. Also, such a table cannot be used in referential integrity constraints as a referenced table.
* Once a primary key is defined (whether by the table creator or by the server), the server prevents rows with duplicate primary key values from being inserted into the table. Primary key indexes cannot be dropped.

## Indexes

* An index is a database structure that you can use to improve the performance of database activity.
* A database table can have one or more indexes associated with it.
* An index is defined by a field expression that you specify when you create the index. Typically, the field expression is a single field name, like EMP_ID
* A database driver can use indexes to find records quickly. An index on the EMP_ID field, for example, greatly reduces the time that the driver spends searching for a particular employee ID value. Consider the following Where clause:

````sql
WHERE emp_id = 'E10001'
````

* Without an index, the driver must search the entire database table to find those records having an employee ID of E10001. By using an index on the EMP_ID field, however, the driver can quickly find those records.
* Indexes may improve the performance of SQL statements. You may not notice this improvement with small tables but it can be significant for large tables; however, there can be disadvantages to having too many indexes. Indexes can slow down the performance of some inserts, updates, and deletes when the driver has to maintain the indexes as well as the database tables. Also, indexes take additional disk space.

### Indexing Guidelines

Here are a few rules to help you decide which indexes to create:

1. If your record retrievals are based on one field at a time (for example, dept='D101'), create an index on these fields.
1. If your record retrievals are based on a combination of fields, look at the combinations.
1. If the comparison operator for the conditions is AND (for example, CITY = 'Raleigh' AND STATE = 'NC'), then build a concatenated index on the CITY and STATE fields. This index is also useful for retrieving records based on the CITY field.
1. If the comparison operator is OR (for example, DEPT = 'D101' OR HIRE_DATE > {01/30/89}), an index does not help performance. Therefore, you need not create one.

## Identity Columns

Identity columns make it easy to have surrogate key columns that are automatically populated. Having a column be populated by the identity property also makes it easy to create unique identity column values for each row. Next time you want a surrogate key when you design a table, consider creating the key as an identity column.

## Surrogate Keys

A surrogate key is a key which does not have any contextual or business meaning. It is manufactured "artificially" and only for the purposes of data analysis. The most frequently used version of a surrogate key is an increasing sequential integer or "counter" value (i.e. 1, 2, 3).

---

## Appendix: Links

* [Databases](../2-Areas/MOCs/Databases.md)
* [Development](../2-Areas/MOCs/Development.md)
* [SQL](../2-Areas/Code/SQL/SQL.md)
* *SQL Server*

*Backlinks:*

````dataview
list from [[Notes on Database Indexing and Primary Keys]] AND -"Changelog"
````
