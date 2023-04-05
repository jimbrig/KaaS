# How to Design a Clean Database

## Metadata

* Author: *Mohammad Faisal*
* Full Title: How to Design a Clean Database
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/2c7158114e2f

## Highlights

* Table: this is a collection of data
* Primary Key: This is the unique identifier of a table
* Attribute: means property of your data. For example, name is an attribute of a user .
* Data Type: Data types represent the various types of your data. For example -string, int, timestamp, etc.
* When your attribute name has more than 1 word, then separate it with snake_case. Don’t use camelCase or any other case for consistency.
* Don’t use upper-case names for your attributes.
* Don’t try to shorten the names of columns for the sake of space or any other logic. Try to be as explicit as possible.
* An exception of rule-4 is when you have a widespread abbreviation. In those situations, go for the short one.
* Always try to use singular names for tables. This is a controversial one, and different people have different opinions. But stick to one.
* When creating a junction table, concatenate the names of the two tables in alphabetical order.
* If it’s a single column, then it should be named as id
* It should be the name of the other table and the referred field. For example, if you are referencing a person inside your team_member the table then you can do it like this.
* If you have boolean type column names, then prefix them with is\_ or has\_ .
