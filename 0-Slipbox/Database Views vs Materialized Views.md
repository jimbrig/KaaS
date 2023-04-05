# Database Views vs Materialized Views

*Source: [What are Materialized Views? A 5 Minute Introduction (educative.io)](https://www.educative.io/blog/materialized-view-introduction)*

What are the major differences between a view and materialized view, and why should you use one over the other?

## Views

Normal views have their own advantages and disadvantages in comparison to *materialized views*.

A view is created with the `Create View` `SQL` command and contains all data obtained from the supplied view query expression. 

A primary advantage of views is that you can query them in the same manner as you would any normal database schema's table and retrieve the latest updated calculated results. 

The key here is that views **always compute** every time they are queried or accessed in any way; which may be seen as both a pro and con.

Another side-note is that in the circumstance you make any type of update to the content in a View, it will always be *“pushed back”* and updated in the original table.

Likewise, the reverse is also true: any changes that are made to the original base table are instantly reflected in the View.

What this means, however, is that the performance of a View will **always be slower** than that of a materialized view. The major advantage is that a View doesn’t actually require storage space. You can also have total control over which users can or cannot view sensitive information within the database itself.

A materialized view, on the other hand, is a **physical copy** of those original base tables. Think of it more like a photograph of the original base table. The key difference is that a materialized view **will not be updated** every time it is interacted with.

---

## Appendix: Links

* [Development](../2-Areas/MOCs/Development.md)
* [Databases](../2-Areas/MOCs/Databases.md)
* [Data Science](../2-Areas/MOCs/Data%20Science.md)
* [Data Engineering](../2-Areas/MOCs/Data%20Engineering.md)

*Backlinks:*

````dataview
list from [[Database Views vs Materialized Views]] AND -"Changelog"
````
