---
Date: 2022-02-18
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev/Database"]
Alias: "PostgreSQL Stored Procedures and Functions"
---

# PostgreSQL Stored Procedures and Functions Notes

*Source: [Everything you need to know about Postgres stored procedures and functions ](https://www.enterprisedb.com/postgres-tutorials/everything-you-need-know-about-postgres-stored-procedures-and-functions)*

## History

[[PostgreSQL]] began implementing [[Stored Procedure]] capabilities with the release of version 11. Before version 11, to declare a stored procedure one would simply write a [[User Defined Function]], or `udf`, with a return type of `void`:

```sql
CREATE FUNCTION function_name() RETURNS void
LANGUAGE SQL
AS $$
    UPDATE a_table SET a_column = false WHERE balance < 0;
$$;
```

and to call it use `SELECT`:

```sql
SELECT function_name();
```

which would return a `NULL` void type result.

Beginning with version 11, one can now declare a `PROCEDURE`:

```sql
CREATE PROCDURE my_stored_procedure()
LANGUAGE SQL
AS $$
    UPDATE accounts SET active = false WHERE balance < 0;
$$;
```

and call using `CALL`:

```sql
CALL my_stored_procedure();
```

This stored procedure does not return any result, although will show any errors that occurred during its invocation.

## Function

The syntax for declaring a [[PostgreSQL]] Function is the same for all versions of PostgreSQL:

```sql
CREATE OR REPLACE FUNCTION account_type_count(account_type text) RETURNS integer
LANGUAGE plpgsql
AS $$
    DECLARE account_count int;
BEGIN

    SELECT COUNT(*) INTO account_count
    FROM accounts
    WHERE accounts.account_type = $1;
    
    RETURN account_count;
    
END;
$$;
```

From these examples, you can see that you can use functions to update and retrieve data, or to just perform a procedure, but now we also have procedures, which are designed specifically with performing a set of actions in mind.

Functions come in even more flavors though. We have the regular kind, which are used in queries, but we also have some additional ones, which we'll get to shortly.

## Parameters

Function parameters can be referenced using either *positional references* or *named references*. Positional references work by using `$1` to reference the first parameter, then `$2` for the second, and so on. For named references, you can just use the name of the parameter. So if you had a parameter called *my_value*, you could just reference it using either method:

```sql
SELECT $1 + 1;
SELECT my_value + 1;
```

This is true for functions written in SQL or PL/pgSQL languages. You can also call the function and specifically set the parameters in whichever order you like using named notation:

```sql
SELECT create_user(age => 50, country => 'France', username => 'Henri');
```

You can set the default value for a parameter if the user doesn't specify it using the DEFAULT keyword and a value of your choosing:

```sql
CREATE FUNCTION create_user(username text, country text, age int, active bool DEFAULT true)...
```

This means we could use named notation, not specifying the "active" parameter, and it would automatically set that value to "true".

There is also the `OUT` parameter, which is *a way to produce an output that returns those fields in the result*. 
And `INOUT`, which we use *to define a parameter that accepts input, but will also be included in the output*.

```sql
CREATE FUNCTION dog_years(INOUT age int, OUT dog_years int)
LANGUAGE SQL
AS $$
  SELECT age, age * 7;
$$;

SELECT * FROM dog_years(8);
 age | dog_years

-----+-----------
   8 |    56
(1 row)
```

You may also have a function where you want the user to be able to specify multiple items, but you don't know how many to expect because the number can vary. This is when you can use the `VARIADIC` parameter, which must always be the last parameter defined, and you define it as an array type:

```sql
CREATE FUNCTION create_post(title text, content text, VARIADIC tags text[])

RETURNS integer

LANGUAGE SQL AS $$

  INSERT INTO posts (title, content, tags)

  VALUES (title, content, array_to_string(tags,','))

  RETURNING id;

$$;
```

## Aggregate Functions

Aggregate functions are functions used by aggregates in order to reach the result required.  In short, you would only need such functions if you're creating your own custom aggregates.

## Trigger Functions

Trigger functions don't contain any code themselves, but instead call functions when the trigger's conditions are met. Trigger functions only return a type of *trigger*.

For example, we'll create a function that logs information when a table is changed.

We have a table of user information:

```sql
CREATE TABLE users (

  id serial PRIMARY KEY,

  username text NOT NULL,

  display_name text NOT NULL,

  tag_line text NULL

);
```

Then a second table to log the values in that table for when they change:

```sql
CREATE TABLE user_change_log (entry_time timestamp with time zone, entry users);
```

Now we'll create a function that inserts changed rows into the *user_change_log* table:

```sql
CREATE FUNCTION log_user_change() RETURNS trigger

LANGUAGE plpgsql AS

$$

BEGIN

  IF NEW <> OLD THEN

INSERT INTO user_change_log(entry_time, entry) VALUES (now(), NEW);

  END IF;

  RETURN NEW;

END;

$$;
```

Finally, we’ll create a trigger on the “users” table to execute that function when updates are made to the table:

```sql
CREATE TRIGGER user_changes

  AFTER UPDATE ON users

  FOR EACH ROW

  EXECUTE PROCEDURE log_user_change();
```

There are two other types of trigger that use functions too: constraint triggers and event triggers. Constraint triggers work in much the same way as we've just demonstrated, but have additional properties. Event triggers must use functions that return a type of event_trigger, and are fired when certain commands are fired. These functions have additional values associated with the event available.

## Other function features

Functions can have many more options, including whether it's a WINDOW function (only currently useful for C language functions), whether it's parallel-safe, the cost of running the function for the executor to bear in mind, the configuration parameters specifically for this function (using SET to set), and various others.

***

## Appendix: Links

- [[PostgreSQL]]
- [[PostgreSQL Triggers]]
- [[SQL]]
- [[Databases]]
- [[Data Engineering]]
- [[ETL]] and [[ELT]]
- [[Data Warehouse]]
- [[Dimensional Modeling]]
- [[Development]]

*Backlinks:*

```dataview
list from [[PostgreSQL Stored Procedures Notes]] AND -"Changelog"
```