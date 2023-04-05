# Advanced PostgreSQL Features: A Guide

## Metadata

* Author: *Arctype*
* Full Title: Advanced PostgreSQL Features: A Guide
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/2964878989f9

## Highlights

* PostgreSQL supports inheritance to enable users to create clean tables that model their model structures. For example, imagine you have a use-case where there is a customer table and there is a specific type of customer with an additional field called office_address. In a database that does not support inheritance, this has to be handled through two separate tables using the below DDL statements.
* One of the main constraints of a relational model is that columns should be atomic. PostgreSQL does not have this constraint and allows columns to have sub-values that can be accessed via queries.
* It is possible to create tables with fields as arrays of any data type.
* This needs two functions. The to_tsvector function converts the values to their lexeme and the to_tsquery function will try to match the words.
* SELECT * FROM LOG WHERE to_tsvector(description) @@ to_tsquery('miss');
