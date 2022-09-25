---
Date: 2022-03-10
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL - Using Tables as Templates"]
---

# SQL - PostgreSQL - Using Tables as Templates

*Source: [Using tables as templates in Azure Database for PostgreSQL - sqlshack](https://www.sqlshack.com/using-tables-as-templates-in-azure-database-for-postgresql/)*

## Use Existing Tables As Templates

We need at least one table to start with which we can use as a template while creating another table in [[PostgreSQL]]. 

The default schema for [[PostgreSQL]] is the `public` schema. 

We will create a sample table as shown below. This table has a few fields and one primary key constraint. This table is just a sample, and one can use any existing table or create a new table which we will consider as a template while creating the new table.

```SQL
CREATE TABLE public.employee (
    id INTEGER NOT NULL DEFAULT nextval('employee_id_seq'::regclass),
    name TEXT,
    address TEXT,
    country TEXT,
    phone TEXT,
    email CHARACTER VARYING(50),
    website TEXT,
    CONSTRAINT employee_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;
```

To create a new table named `employee_copy` with the existing fields from the table created above as part of the table definition but *without* constraints nor data or anything else, use the `LIKE` operator and specify the name of the table as shown below:

```SQL
CREATE TABLE employee_copy (LIKE employee);
```

One thing to observe here is that the new table got created without any primary key constraint. This is the default behavior when we just specify the table name using the `LIKE` operator.

While in the above case, the constraint did not get created, this may not be desired in many cases as we may want to have some of the same properties as the referenced table. Examples of such properties include *Defaults, Constraints, Indexes, Comments, etc*. 

To include these properties or objects that are associated with the referenced table, we can use the `INCLUDING` keyword and specify the property or object that we want to include in the new table being created. 

As shown below, we can use the keyword `INCLUDING ALL` which will clone the existing table with all the associated properties and objects but without data:

```SQL
CREATE TABLE employee_copy_1 (LIKE employee INCLUDING ALL);
```

In this way, by using two simple keywords **LIKE** and **INCLUDING** we can use existing tables as templates and have full granular control over cloning properties as well as objects associated with existing tables. While `CREATE TABLE AS` command helps to have the same fields and data that are resulting from the `SELECT` query in the command, this command helps to granularly curate the table definition of an existing table and create a new table. In this way, both commands serve a different purpose and cater to different needs of developing tables.



***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[SQL Server]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - PostgreSQL - Using Tables as Templates]] AND -"Changelog"
```