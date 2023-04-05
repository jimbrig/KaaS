# SQL - PostgreSQL String Manipulation

*Source: https://gist.github.com/chillahwhale/1f27869ece7f757e0242da94ae696e8e*

## Contents

* \[\[\#`LOWER()`\|`LOWER()`\]\]
* \[\[\#`UPPER()`\|`UPPER()`\]\]
* \[\[\#`INITCAP()`\|`INITCAP()`\]\]
* \[\[\#`LENGTH()`\|`LENGTH()`\]\]
* \[\[\#`TRIM()`\|`TRIM()`\]\]
* \[\[\#`SUBSTRING()`\|`SUBSTRING()`\]\]
* [Concatenation](SQL%20-%20PostgreSQL%20String%20Manipulation.md#concatenation)
* \[\[\#`REPLACE()`\|`REPLACE()`\]\]
* \[\[\#`COALESCE()`\|`COALESCE()`\]\]
* [Appendix: Links](SQL%20-%20PostgreSQL%20String%20Manipulation.md#appendix-links)

## `LOWER()`

This is the same as the `.lower()` method for strings in Python used to convert every letter in a string to lower case

*Example*: Convert all letters of the string `HeLlO, wOrLd!` to lower case:

````SQL
SELECT LOWER('HeLlO, wOrLd!')
````

## `UPPER()`

For completeness, this is the same as the `.upper()` method for strings in Python used to capitalize every letter in a string

*Example*: Capitalize all letters of the string `Hello World`

````SQL
SELECT UPPER('Hello, world!')
````

## `INITCAP()`

This is the same as the `.capitalize()` method for strings in Python that is used to convert the first letter to upper case.

````SQL
SELECT INITCAP(first_name), INITCAP(department)
FROM employees
WHERE first_name ILIKE 'an%'
````

## `LENGTH()`

This is the same as the `len()` function in Python. However, since we don't have lists or tuples in SQL, this is only applicable to objects with characters.

````SQL
SELECT INITCAP(first_name), INITCAP(department)
FROM employees
WHERE department = 'Sports' AND LENGTH(first_name) >= 6
````

## `TRIM()`

This is the same as the `.strip()` method for strings in Python that eliminates leading and trailing white spaces.

*Example:* Write a query that strips out the white space from the string `'     Hello, world!     '`

````SQL
SELECT TRIM('     Hello, world!     ')
````

## `SUBSTRING()`

[2-Areas/MOCs/Python](../../MOCs/Python.md) doesn't have a function that extracts a sub-string since we can just do it by directly indexing through the string. 

If you're familiar with [2-Areas/MOCs/R](../../MOCs/R.md) though, then you'll recognize this is similar to the `substr()` function.

Syntax for this function:

````SQL
SELECT SUBSTRING(string_column FROM <start_position> FOR <num_characters_ahead>)
````

Or

````SQL
SELECT SUBSTRING(string_column, <start_position>, <num_characters_ahead>)
````

**Example #1:**

````SQL
SELECT SUBSTRING('Hello there, friend! Hehe.' FROM 1 FOR 5)
````

OR

````SQL
SELECT SUBSTRING('Hello there, friend! Hehe.', 1, 5)
````

will return `'Hello'`

**Example #2:**

````SQL
SELECT SUBSTRING('Hello there, friend! Hehe.' FROM 14)
````

OR

````SQL
SELECT SUBSTRING('Hello there, friend! Hehe.', 14)
````

will return `'friend! Hehe.`

## Concatenation

This is the equivalent of string concatenation in Python using `+`. The `+` in [2-Areas/MOCs/Python](../../MOCs/Python.md) is replaced by `||` in [PostgreSQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md). 

Alternatively, you can use the `CONCAT()` function.

*Example:* Write a query that prints every employees's full name (i.e. first name then last name)

````SQL
SELECT INITCAP(e.first_name) || ' ' || INITCAP(e.last_name)
FROM employees e
````

**EXERCISE:** Write a query that automatically generates the sentence `<employee first name> works in the <department> department.`

*Answer:*

````SQL
SELECT INITCAP(e.first_name) || ' twerks in ' || INITCAP(e.department) AS "where u twerk?"
FROM employees e;
-- OR
SELECT CONCAT(INITCAP(e.first_name), ' twerks in ', INITCAP(e.department)) AS "where u twerk?"
FROM employees e;
````

## `REPLACE()`

This is the equivalent of the `.replace()` method for strings in Python and the `gsub()` function in R.

*Example:* Replace the 'Jewelry' department with 'Bling' in the employee table.

````SQL
SELECT first_name,
       REPLACE(department, 'Jewelry', 'Bling') AS new_dept
FROM employees
````

Does the function work when replacing `NULL` values though? Try this and let me know what you see

````SQL
SELECT first_name,
       REPLACE(email, NULL, 'missing') AS new_email
FROM employees
````

## `COALESCE()`

This is an extremely powerful function that lets us handle missing values on a column-by-column basis.

The syntax is pretty straight forward for this one:

````SQL
COALESCE(<column_name>, <fill_value>)
````

**EXERCISE**: Write a query that prints every employees's first name in one column and their email in another, but make sure to replace all `NULL` emails with `¯\_(ツ)_/¯`.

*Answer:*

````SQL
SELECT first_name,
       COALESCE(email, '`¯\_(ツ)_/¯`') AS new_email
FROM employees;
````

---

## Appendix: Links

* *Code*
* [SQL](SQL.md)
* [Databases](../../MOCs/Databases.md)
* [SQL Server](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/SQL%20Server.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[SQL - PostgreSQL String Manipulation]] AND -"Changelog"
````
