---
Date: 2022-02-16
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox/Dev", "#Topic/Dev/Database/PostgreSQL", "Topic/Dev/Database/SQL"]
Alias: "PostgreSQL Triggers"
---

# PostgreSQL Triggers

*Source: [Introduction to PostgreSQL Trigger](https://www.postgresqltutorial.com/introduction-postgresql-trigger/)*

## Introduction

A PostgreSQL trigger is a [function](https://www.postgresqltutorial.com/postgresql-create-function/) invoked automatically whenever an event such as [insert](https://www.postgresqltutorial.com/postgresql-insert/), [update](https://www.postgresqltutorial.com/postgresql-update/), or [delete](https://www.postgresqltutorial.com/postgresql-python/delete/) occurs. In this section, you will learn about triggers and how to manage them effectively.

-   [Introduction to PostgreSQL trigger](https://www.postgresqltutorial.com/introduction-postgresql-trigger/ "Introduction to PostgreSQL Trigger") – give you a brief overview of PostgreSQL triggers, why you should use triggers, and when to use them.
-   [Create trigger](https://www.postgresqltutorial.com/creating-first-trigger-postgresql/ "Creating the First Trigger in PostgreSQL") – show you step by step how to create your first trigger in PostgreSQL.
-   [Drop trigger](https://www.postgresqltutorial.com/postgresql-drop-trigger/)– describe steps of how to use the `DROP TRIGGER` statement to delete a trigger from a table.
-   [Alter trigger](https://www.postgresqltutorial.com/postgresql-triggers/postgresql-alter-trigger/) – guide you on how to use the `ALTER TRIGGER` statement to rename a trigger.
-   [Disable trigger](https://www.postgresqltutorial.com/managing-postgresql-trigger/ "Managing PostgreSQL Trigger") –  show how how to disable a trigger or all triggers that belong to a table.
-   [Enable triggers](https://www.postgresqltutorial.com/postgresql-triggers/enable-triggers/) – learn how to enable a trigger or all triggers associated with a table.

## Contents

- [[#Overview|Overview]]
- [[#Example|Example]]
- [[#Features|Features]]
- [[#Creation|Creation]]
- [[#Introduction to PostgreSQL CREATE TRIGGER Statement|Introduction to PostgreSQL CREATE TRIGGER Statement]]
- [[#PostgreSQL CREATE TRIGGER Example|PostgreSQL CREATE TRIGGER Example]]
- [[#Appendix: Links|Appendix: Links]]


## Overview

A [[PostgreSQL]] trigger is a [function](https://www.postgresqltutorial.com/postgresql-create-function/) invoked automatically whenever an event associated with a table occurs. An event could be any of the following: [INSERT](https://www.postgresqltutorial.com/postgresql-insert/ "PostgreSQL INSERT"), [UPDATE](https://www.postgresqltutorial.com/postgresql-update/ "PostgreSQL UPDATE"), [DELETE](https://www.postgresqltutorial.com/postgresql-delete/ "PostgreSQL DELETE") or [TRUNCATE](https://www.postgresqltutorial.com/postgresql-truncate-table/ "PostgreSQL TRUNCATE TABLE").

A trigger is a special [user-defined function](https://www.postgresqltutorial.com/postgresql-stored-procedures/) associated with a table. To create a new trigger, you define a trigger function first, and then bind this trigger function to a table. The difference between a trigger and a user-defined function is that a trigger is automatically invoked when a triggering event occurs.

[[PostgreSQL]] provides two main types of triggers: `row` and `statement-level` triggers. The differences between the two kinds are how many times the trigger is invoked and at what time.


## Example

For example, if you issue an `UPDATE` statement that affects 20 rows, the row-level trigger will be invoked 20 times, while the statement level trigger will be invoked 1 time.

You can specify whether the trigger is invoked before or after an event. If the trigger is invoked before an event, it can skip the operation for the current row or even change the row being updated or inserted. In case the trigger is invoked after the event, all changes are available to the trigger.

Triggers are useful in case the database is accessed by various applications, and you want to keep the cross-functionality within the database that runs automatically whenever the data of the table is modified. For example, if you want to keep the history of data without requiring the application to have logic to check for every event such as `INSERT` or `UDPATE`

## Features

You can also use triggers to maintain complex data integrity rules which you cannot implement elsewhere except at the database level.  For example, when a new row is added into the `customer` table, other rows must be also created in tables of banks and credits.

The main drawback of using a trigger is that you must know the trigger exists and understand its logic to figure it out the effects when data changes.

Even though PostgreSQL implements SQL standard, triggers in PostgreSQL has some specific features:

-   PostgreSQL fires trigger for the  [`TRUNCATE`](https://www.postgresqltutorial.com/postgresql-truncate-table/) event.
-   PostgreSQL allows you to define the statement-level trigger on views.
-   PostgreSQL requires you to define a user-defined function as the action of the trigger, while the SQL standard allows you to use any SQL commands.

## Creation

To create a new trigger in PostgreSQL, you follow these steps:

-   First, create a trigger function using `[CREATE FUNCTION](https://www.postgresqltutorial.com/postgresql-create-function/)` statement.
-   Second, bind the trigger function to a table by using `CREATE TRIGGER` statement.

Create Trigger Function Syntax:

```SQL
CREATE FUNCTION trigger_function() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
   -- trigger logic
END;
$$
```

Notice that you can create a trigger function using any languages supported by PostgreSQL. In this tutorial, we will use PL/pgSQL.

A trigger function receives data about its calling environment through a special structure called TriggerData which contains a set of local variables.

For example, `OLD` and `NEW` represent the states of the row in the table before or after the triggering event.

PostgreSQL also provides other local variables preceded by `TG_` such as `TG_WHEN`, and `TG_TABLE_NAME`.

Once you define a trigger function, you can bind it to one or more trigger events such as `[INSERT](https://www.postgresqltutorial.com/postgresql-insert/)`, [`UPDATE`](https://www.postgresqltutorial.com/postgresql-update/), and `[DELETE](https://www.postgresqltutorial.com/postgresql-delete/)`.

## Introduction to PostgreSQL CREATE TRIGGER Statement

The `CREATE TRIGGER` statement creates a new trigger. The following illustrates the basic syntax of the `CREATE TRIGGER` statement:

```SQL
CREATE TRIGGER trigger_name 
   {BEFORE | AFTER} { event }
   ON table_name
   [FOR [EACH] { ROW | STATEMENT }]
       EXECUTE PROCEDURE trigger_function
```

In this syntax:

First, specify the name of the trigger after the `TRIGGER` keywords.

Second, specify the timing that cause the trigger to fire. It can be `BEFORE` or `AFTER` an event occurs.

Third, specify the event that invokes the trigger. The event can be `INSERT` , `DELETE`, `UPDATE` or `TRUNCATE`.

Fourth, specify the name of the table associated with the trigger after the `ON` keyword.

Fifth, specify the type of triggers which can be:

-   Row-level trigger that is specified by the `FOR EACH ROW` clause.
-   Statement-level trigger that is specified by the `FOR EACH STATEMENT` clause.

A row-level trigger is fired for each row while a statement-level trigger is fired for each transaction.

Suppose a table has 100 rows and two triggers that will be fired when a `DELETE` event occurs.

If the `DELETE` statement deletes 100 rows, the row-level trigger will fire 100 times, once for each deleted row. On the other hand, a statement-level trigger will be fired for one time regardless of how many rows are deleted.

Finally, specify the name of the trigger function after the `EXECUTE PROCEDURE` keywords.


## PostgreSQL CREATE TRIGGER Example

The following statement create a new table called `employees`:

```SQL
DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
   id INT GENERATED ALWAYS AS IDENTITY,
   first_name VARCHAR(40) NOT NULL,
   last_name VARCHAR(40) NOT NULL,
   PRIMARY KEY(id)
);
```

Suppose that when the name of an employee changes, you want to log the changes in a separate table called `employee_audits` :

```SQL
CREATE TABLE employee_audits (
   id INT GENERATED ALWAYS AS IDENTITY,
   employee_id INT NOT NULL,
   last_name VARCHAR(40) NOT NULL,
   changed_on TIMESTAMP(6) NOT NULL
);
```

First, create a new function called `log_last_name_changes`:

```
CREATE OR REPLACE FUNCTION log_last_name_changes()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
	IF NEW.last_name <> OLD.last_name THEN
		 INSERT INTO employee_audits(employee_id,last_name,changed_on)
		 VALUES(OLD.id,OLD.last_name,now());
	END IF;

	RETURN NEW;
END;
$$`
```

The function inserts the old last name into the `employee_audits` table including employee id, last name, and the time of change if the last name of an employee changes.

The `OLD` represents the row before update while the `NEW` represents the new row that will be updated. The `OLD.last_name` returns the last name before the update and the `NEW.last_name` returns the new last name.

Second, bind the trigger function to the `employees` table. The trigger name is `last_name_changes`. Before the value of the `last_name` column is updated, the trigger function is automatically invoked to log the changes.

```SQL
CREATE TRIGGER last_name_changes
  BEFORE UPDATE
  ON employees
  FOR EACH ROW
  EXECUTE PROCEDURE log_last_name_changes();`
```

Third, [insert](https://www.postgresqltutorial.com/postgresql-insert/) some rows into the `employees` table:

```SQL
INSERT INTO employees (first_name, last_name)
VALUES ('John', 'Doe');

INSERT INTO employees (first_name, last_name)
VALUES ('Lily', 'Bush');`
```

Fourth, examine the contents of the `employees` table:

```SQL
SELECT * FROM employees;
```

![](https://www.postgresqltutorial.com/wp-content/uploads/2020/07/PostgreSQL-Cretae-Trigger-Sample-Table.png)

Suppose that `Lily Bush` changes her last name to `Lily Brown`.

Fifth, update Lily’s last name to the new one:

```SQL
UPDATE employees
SET last_name = 'Brown'
WHERE ID = 2;`
```

Seventh, check if the last name of `Lily` has been updated:

```SQL
SELECT * FROM employees;`
```

![](https://www.postgresqltutorial.com/wp-content/uploads/2020/07/PostgreSQL-Cretae-Trigger-after-update.png)

As you can see from the output, Lily’s last name has been updated.

Eighth, verify the contents of the `employee_audits` table:

```SQL
SELECT * FROM employee_audits;`
```

![](https://www.postgresqltutorial.com/wp-content/uploads/2020/07/PostgreSQL-Cretae-Trigger-example.png)

The change was logged in the `employee_audits` table by the trigger.

***

## Appendix: Links

- [[PostgreSQL]]
- [[Data Engineering]]
- [[Databases]]
- [[SQL]]
- [[ETL]]
- [[ELT]]
- [[SQL]]
- [[Data Science]]

*Backlinks:*

```dataview
list from [[PostgreSQL Triggers]] AND -"Changelog"
```