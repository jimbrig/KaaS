# Part I-I : Data Warehouse Modelling Concept

## Metadata

* Author: *William Ong*
* Full Title: Part I-I : Data Warehouse Modelling Concept
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/962f286d1566

## Highlights

* Data engineering is a process to provide data in usable formats to the data analytics and data scientists who run queries to perform analytics and applying algorithms against the information for predictive analytics, machine learning and data mining applications.
* The data warehouse is a specific infrastructure element that provides down-the-line users, including data analysts and data scientists, access to data that has been shaped to conform to business rules and is stored in an easy-to-query format
* The data must conform to specific business rules that validate quality. Then it is stored in a denormalized structure — that means storing together pieces of information that will likely be queried together. This serves to increase performance by decreasing the complexity of queries required to get data out of the warehouse (i.e., by reducing the number of data joins).
* Star schema is a mature modeling approach for data warehouse which requires modelers to classify their model tables as either dimension or fact.
* Dimension tables describe business entities — the things you model. Entities can include products, people, places, and concepts including time itself. The most consistent table you’ll find in a star schema is a date dimension table. A dimension table contains a key column (or columns) that acts as a unique identifier, and descriptive columns.
* Fact tables store observations or events, and can be sales orders, stock balances, exchange rates, temperatures, etc. A fact table contains dimension key columns that relate to dimension tables, and numeric measure columns. The dimension key columns determine the dimensionality of a fact table, while the dimension key values determine the granularity of a fact table.
* A slowly changing dimension (SCD) is one that appropriately manages change of dimension members over time. It applies when business entity values change over time, and in an ad hoc manner. A good example of a slowly changing dimension is a customer dimension, specifically its contact detail columns like email address and phone number. In contrast, some dimensions are considered to be rapidly changing when a dimension attribute changes often, like a stock’s market price. The common design approach in these instances is to store rapidly changing attribute values in a fact table measure.
* A Type 2 SCD supports versioning of dimension members. If the source system doesn’t store versions, then it’s usually the data warehouse load process that detects changes, and appropriately manages the change in a dimension table. In this case, the dimension table must use a surrogate key to provide a unique reference to a version of the dimension member. It also includes columns that define the date range validity of the version (for example, StartDate and EndDate) and possibly a flag column (for example, IsCurrent) to easily filter by current dimension members.
* In star schema design, a measure is a fact table column that stores values to be summarized. Here, our fact table store 5 different types of measure from each product from an order :
* To connect data between fact table and dimension table, we need a surrogate key. A surrogate key is a unique identifier that you add to a table to support star schema modeling. By definition, it’s not defined or stored in the source data. Commonly, surrogate keys are added to relational data warehouse dimension tables to provide a unique identifier for each dimension table row.
* To load data from our OLTP (Database) into OLAP (Data Warehouse) we need a pipeline for ETL. To do that, we need to create an ETL process for each dimension and fact table.
