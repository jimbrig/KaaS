# SQL - SQL Server - Cumulative Distribution Functions

*Source: [sql-snippets/Cumulative distribution functions.md at main · count/sql-snippets (github.com)](https://github.com/count/sql-snippets/blob/main/mssql/Cumulative%20distribution%20functions.md)*

Explore this snippet with some demo data [here](https://count.co/n/ANpwFTvhnWT?vm=e).

## Description

*Cumulative Distribution* functions (CDFs) are a method for analyzing the *statistical distribution* of a quantity, similar to *histograms*. 

They show, for each value of a quantity, what fraction of rows are smaller or greater.

One method for calculating a CDF is as follows:

````SQL
/*
Use a row_number window function to get the position of this row 
and CAST to convert row_number and count from integers to decimal
*/

SELECT CAST(row_number() OVER (ORDER BY <quantity> ASC) AS DECIMAL) / CAST((SELECT COUNT(*) FROM <table> ) AS DECIMAL ) AS cdf
FROM <table>
  
````

where:

* `quantity` - the column containing the metric of interest
* `table` - the table name

**Note:** `CAST` is used to convert the numerator and denominator of the fraction into decimals before they are divided. 

## Example

Using some student test scores as an example data source, let’s identify:

* `table` - this is called `Example_data`
* `quantity` - this is the `column score`

then the query becomes:

````SQL
SELECT student_id,
       score,
       CAST(ROW_NUMBER() OVER (ORDER BY score ASC) AS DECIMAL) / CAST(( SELECT COUNT(*) FROM Example_data) AS DECIMAL) AS frac
FROM Example_data
````

Output:

|student_id|score|frac|
|----------|-----|----|
|3|76|0.2|
|5|77|0.2|
|4|82|0.6|
|...|...|...|
|1|97|1|

---

## Appendix: Links

* *Code*
* [SQL](SQL.md)
* [Databases](../../MOCs/Databases.md)
* [SQL Server](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/SQL%20Server.md)
* [T-SQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Procedural%20Languages/T-SQL.md)
* [Development](../../MOCs/Development.md)
* [Mathematics and Statistics](../../MOCs/Mathematics%20and%20Statistics.md)

*Backlinks:*

````dataview
list from [[SQL - SQL Server - Cumulative Distribution Functions]] AND -"Changelog"
````
