# What Is a Star Schema?

## Metadata

* Author: *Christianlauer*
* Full Title: What Is a Star Schema?
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/5a03e0f9ce6d

## Highlights

* The Star Schema has become the standard for mapping multidimensional data structures in relational databases and is used primarily in Data Warehouses and OLAP apps. This article gives you a short overview and what you have to know about it.
* The fact table is used to store numbers or derived quantities, such as sales or costs. From a cube perspective, it contains the cube core. The dimension tables contain the qualitative data for visualizing the dimensions and dimension hierarchies.
* The individual rows of a dimension table are identified by a minimal attribute combination, the primary key. To establish the relationship between the dimension tables and the associated fact tables, the primary keys of the dimension tables are included in the fact table as foreign keys, where they in turn together form the primary key of the fact table.
