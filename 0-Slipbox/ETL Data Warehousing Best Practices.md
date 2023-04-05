# ETL Data Warehousing Best Practices

*Source: [Data Warehousing Extract/Transform/Load (ETL) 13 Tips and Practices (Part 1 of 2)](https://www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)*

## Dimensional Modeling

* Fact tables contain the measures that users want to aggregate (sales, quantities, costs, etc.).
* Dimension tables contain the master table business entities (product categories, customer markets, etc.).
* As a starter, link fact tables and dimension tables are linked by surrogate integer keys.
* Dimensional modeling relates to how you specifically define and relate these tables so that the business people can use the data to answer many questions, such as viewing aggregations by this business entity, by that business entity, over time, etc. Within those scenarios, there are a myriad of possibilities. The Kimball methodology shows many patterns for covering these possibilities.

## Populate the Data Model with Test Data as Early as Possible

* "begin with the end in mind." - understand the end game and ask "What data model do I want/need to populate?"

Populating data warehouse fact and dimension tables with sample data can go a long way toward making sure that all subsequent activities align with the end goal; and not just ETL activities but reporting as well.

To summarize, the author states that 

*Backlinks:*

````dataview
list from [[ETL Data Warehousing Best Practices]] AND -"Changelog"
````
