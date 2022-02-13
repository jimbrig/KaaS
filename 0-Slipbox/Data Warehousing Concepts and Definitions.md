---
Date: 2021-12-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev/Data/Databases", "#Topic/Dev/Data"]
Alias: "Data Warehousing Concepts and Definitions"
---

# Data Warehousing Concepts and Definitions

*Primary Source: [Data warehouse - Wikipedia](https://en.wikipedia.org/wiki/Data_warehouse)*

A [Data Warehouse]() is defined as a system used for reporting and data analysis and is considered a core component of the field of [[Business Intelligence]] or *BI*.  In short, DW's are central repositories of integrated data from one or more [[disparate]] sources. The warehouse stores current/latest data as well as historical data used for creating analytical reports, summaries, and visualizations.

The process of extracting, manipulating, and loading the input data from raw sources into the data warehouse is known as [[ETL]] or Extract, Transform, Load or its alternative [[ELT]] for Extract, Load, Transform.

In addition to [[ETL]], a data warehouse should implement data workflows such as cleansing, cataloging, merging, validating, and aggregating to ensure proper data quality before any data is used in the final analysis.

## Information

The information encompassed by the data included in a data warehouse can be broken down into a variety of conceptual *types* to better understand the structure and relationships between various data entities and attributes.

### Facts

In data warehousing, a fact is a value, or measurement, which represents a fact about the managed entity or system.

**Raw Facts** are derived directly from the raw level of data and should be further aggregated to higher levels into various **Dimensions** to extract more service or business-relevant information from the fact.

These fact tables are called aggregates or summaries or aggregated facts.

### Dimensions vs. Measures

*See also: [[Ralph Kimball]] the creator of [[Dimensional Approach to Data Warehousing]]*

**Dimensions** represent the *reference* attributes that contain information giving context to the facts. For example, a sales transaction can be broken into facts such as number of products ordered, total price, etc. (i.e. the *facts*) plus various dimensional attributes such as Order Date, Customer Name, Product Number, Geographic Details, etc.

Data can be separated into *dimensions* and *measures* where dimensions are ideally only necessary as of the latest, most current datasets while the *measures* need values throughout history.  

***

## Appendix: Links

*Related:*

- [[Databases]]
- [[Data Science]]
- [[Development]]

*Backlinks:*

```dataview
list from [[Data Warehousing Concepts and Definitions]] AND -"Changelog"
```