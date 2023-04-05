# Create Your DB Without a Single CREATE Statement!

## Metadata

* Author: *ZD*
* Full Title: Create Your DB Without a Single CREATE Statement!
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/94984b3b2370

## Highlights

* This is exactly what dbd does. You can use it to create your data schemas by just placing data files (CSV, JSON, XLS(X), or parquet) to a directory on your computer and calling dbd run.
* dbd introspects your data files, determines data types, creates tables, and populates them.
* If you don’t like the default data types, you can write simple YAML annotations that override just the data types that you don’t like. Or you can specify that a certain column is a primary key or foreign key, or you can create an index. You write less than 30% of the code that you’d otherwise have to write with SQL.
* Do you need to derive a new table from those that you’ve created from the data files? Create a SQL file with a SELECT statement and the tool will materialize it for you. You just decide if you want a table or view.
