# Querying Data from PostgreSQL Database

## Contents

* [Introduction](Querying%20Data%20from%20PostgreSQL%20Database.md#introduction)
* [SELECT Statements](Querying%20Data%20from%20PostgreSQL%20Database.md#select-statements)
  * [WITH Queries - Common Table Expressions](Querying%20Data%20from%20PostgreSQL%20Database.md#with-queries-common-table-expressions)
* [Views](Querying%20Data%20from%20PostgreSQL%20Database.md#views)
* [Materialized Views](Querying%20Data%20from%20PostgreSQL%20Database.md#materialized-views)
* [Conclusion](Querying%20Data%20from%20PostgreSQL%20Database.md#conclusion)
* [Appendix: Links](Querying%20Data%20from%20PostgreSQL%20Database.md#appendix-links)

## Introduction

PostgreSQL is an efficient and flexible database that fits a wide variety of use cases. In this guide, you will learn about different ways to query a PostgreSQL database so that you can create a simple and expressive backend to your app or library.

Let's dive in!

## SELECT Statements

The SELECT statement is the fundamental building block of querying your PostgreSQL database. SELECT statements can include several clauses. Some of the more important clauses include:

* FROM
* WHERE
* GROUP BY
* ORDER BY
* LIMIT

The following query showcases a SELECT statement that uses all of the clauses mentioned above.

````sql
SELECT id, first_name, last_name
FROM person
WHERE age > 20
GROUP BY country
ORDER BY last_name
LIMIT 10
````

The above query will grab the first 10 people over the age of 20 from the `person` table ordered by their surname and grouped by the country in which they reside. As you can see, a set of columns follows the SELECT keyword in the query. From there, you can specify one or more tables using the `FROM` clause. The `WHERE`clause is used to filter your returned rows. The `GROUP BY` clause is used to group rows together by one or more columns, while the `ORDER BY`clause is used to order rows in ascending or descending order. The `LIMIT` clause is used to limit the number of rows returned by the query.

There are many more clauses that can be used. Some of these include the different joining clauses and the `OFFSET` clause, but these are beyond the scope of this guide. For more information, please check out the [documentation](https://www.postgresql.org/docs/12/sql-select.html).

### WITH Queries - Common Table Expressions

`WITH` queries, or common table expressions, provide a succinct way to create temporary tables that are only kept in memory until the final query is completed. `WITH` queries are often much faster and more readable than creating multiple temporary tables from which to query as well. The below SQL uses a common table expression to select the average ages for dogs and people by their countries.

````sql
WITH dog_ages AS (
    SELECT AVG(age) AS avg_dog_age, country 
    FROM animals
    GROUP BY country 
    WHERE species = 'dog'
), person_ages AS (
    SELECT AVG(age) as avg_person_age, country 
    FROM person
    GROUP BY country
)
SELECT da.avg_dog_age, pa.avg_person_page, da.country
FROM dog_ages da
LEFT JOIN person_ages pa ON pa.country = da.country;
````

As you can see, common table expressions are a powerful and expressive means of querying your PostgreSQL database. Remember that anywhere you are using a temporary table, you can probably use a common table expression instead and get faster results!

## Views

The view is PostgreSQL's way of encapsulating queries such that they can be reused in different parts of your database schema. A view makes it so that your query can be used by other queries, triggers, or functions all across your database. The below SQL is an example of a view that is used to query our mocked `person` table.

````sql
CREATE VIEW vw_person_seniors AS
    SELECT p.id, p.age, p.first_name, p.last_name
    FROM person p
    WHERE age >= 65;
````

Apart from making your queries reusable, views are a great means of making your backend code more readable and maintainable. By creating views, you can structure your queries such that they are separated out by features found within your app. This can dramatically improve the maintainability and separation of concerns within your app's architecture.

## Materialized Views

A materialized view is a view that is immediately executed at the time of creation. The results of the query executed by the view are stored on disk and are retrieved when the materialized view is queried. This is huge in terms of performance! A query that takes seconds can be reduced to milliseconds. Below, you can see an example materialized view.

````sql
CREATE MATERIALIZED VIEW mat_person AS
    SELECT p.id, p.age, p.first_name, p.last_name
    FROM person p
    INNER JOIN blog_posts bp ON bp.person_id = p.id;
````

The biggest downside to using materialized views is that, unless you refresh them by running `REFRESH MATERIALIZED VIEW <mat_table>`, you may have stale data when you query the view. This is why materialized views work best when the data you are querying is mostly static and rarely updated.

## Conclusion

In this guide, you learned all about the key methods for querying data in PostgreSQL. You learned how SELECT queries comprise the fundamental base for querying a PostgreSQL database and how CTEs (Common Table Expressions) can be used to combine temporary tables together. Building on top of the SELECT query, you learned how to create PostgreSQL views to organize your queries in an elegant manner. You also learned how to utilize materialized views to gain massive performance boosts to your queries when the possibility of stale data is not a problem for your user base.

You can now be confident when it comes to querying your PostgreSQL database.

---

## Appendix: Links

* [PostgreSQL](../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md)
* [Databases](../MOCs/Databases.md)
* [Data Engineering](../MOCs/Data%20Engineering.md)
* [SQL](../Code/SQL/SQL.md)
* *Guides*

*Backlinks:*

````dataview
list from [[Querying Data from PostgreSQL Database]] AND -"Changelog"
````
