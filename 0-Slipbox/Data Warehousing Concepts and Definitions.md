# Data Warehousing Concepts and Definitions

*Primary Source: [Data warehouse - Wikipedia](https://en.wikipedia.org/wiki/Data_warehouse)*

A [Data Warehouse]() is defined as a system used for reporting and data analysis and is considered a core component of the field of [Business Intelligence](../3-Resources/Tools/Developer%20Tools/Data%20Stack/Business%20Intelligence/Business%20Intelligence.md) or *BI*.  In short, DW's are central repositories of integrated data from one or more [disparate](../3-Resources/Dictionary/Disparate.md) sources. The warehouse stores current/latest data as well as historical data used for creating analytical reports, summaries, and visualizations.

The process of extracting, manipulating, and loading the input data from raw sources into the data warehouse is known as [ETL](ETL.md) or Extract, Transform, Load or its alternative [ELT](ELT.md) for Extract, Load, Transform.

In addition to [ETL](ETL.md), a data warehouse should implement data workflows such as cleansing, cataloging, merging, validating, and aggregating to ensure proper data quality before any data is used in the final analysis.

## Information

The information encompassed by the data included in a data warehouse can be broken down into a variety of conceptual *types* to better understand the structure and relationships between various data entities and attributes.

### Facts

In data warehousing, a fact is a value, or measurement, which represents a fact about the managed entity or system.

**Raw Facts** are derived directly from the raw level of data and should be further aggregated to higher levels into various **Dimensions** to extract more service or business-relevant information from the fact.

These fact tables are called aggregates or summaries or aggregated facts.

### Dimensions vs. Measures

*See also: [Ralph Kimball](../2-Areas/People/Ralph%20Kimball.md) the creator of *Dimensional Approach to Data Warehousing**

**Dimensions** represent the *reference* attributes that contain information giving context to the facts. For example, a sales transaction can be broken into facts such as number of products ordered, total price, etc. (i.e. the *facts*) plus various dimensional attributes such as Order Date, Customer Name, Product Number, Geographic Details, etc.

Data can be separated into *dimensions* and *measures* where dimensions are ideally only necessary as of the latest, most current datasets while the *measures* need values throughout history.

---

## Appendix: Links

*Related:*

* [Databases](../2-Areas/MOCs/Databases.md)
* [Data Science](../2-Areas/MOCs/Data%20Science.md)
* [Development](../2-Areas/MOCs/Development.md)

*Backlinks:*

````dataview
list from [[Data Warehousing Concepts and Definitions]] AND -"Changelog"
````
