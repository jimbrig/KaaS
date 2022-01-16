---
Date: 2022-01-15
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev/DataScience"]
Alias: "Dimensional Modeling"
---

# Dimensional Modeling

*Source: [Dimensional modeling - Wikipedia](https://en.wikipedia.org/wiki/Dimensional_modeling)*

**Dimensional modeling** (**DM**) is part of the *[Business Dimensional Lifecycle](https://en.wikipedia.org/wiki/The_Kimball_Lifecycle "The Kimball Lifecycle")* methodology developed by [[Ralph Kimball]] ([wiki](https://en.wikipedia.org/wiki/Ralph_Kimball "Ralph Kimball")) which includes a set of methods, techniques and concepts for use in [data warehouse](https://en.wikipedia.org/wiki/Data_warehouse "Data warehouse") design.

The approach focuses on identifying the key [business processes](https://en.wikipedia.org/wiki/Business_process "Business process") within a business and modeling and implementing these first before adding additional business processes, as a [bottom-up approach](https://en.wikipedia.org/wiki/Top-down_and_bottom-up_design "Top-down and bottom-up design").

An alternative approach from [[Bill Inmon]] ([wiki](https://en.wikipedia.org/wiki/Bill_Inmon "Bill Inmon")) advocates a top down design of the model of all the enterprise data using tools such as [entity-relationship modeling](https://en.wikipedia.org/wiki/Entity-relationship_model "Entity-relationship model") (**ER**).

## Description

To understand Dimensional Modeling, one must first become familiar with the concepts of **facts (measures)** and **dimensions (context)**.

- Facts are typically (but not always) numeric values that can be aggregated
- Dimensions are groups of hierarchies and descriptors that define the facts. 

For example, sales amount is a fact; timestamp, product, register number, store number, etc. are elements of dimensions. 

Dimensional models are built by business process area, e.g. store sales, inventory, claims, etc., because the different business process areas share some but not all dimensions, efficiency in design, operation, and consistency, is achieved using [conformed dimensions](https://en.wikipedia.org/wiki/Dimension_(data_warehouse)#Types "Dimension (data warehouse)"), i.e. using one copy of the shared dimension across subject areas.

## Design

The dimensional model is built on a [star-like schema](https://en.wikipedia.org/wiki/Star_schema "Star schema") or [snowflake schema](https://en.wikipedia.org/wiki/Snowflake_schema "Snowflake schema"), with dimensions surrounding the fact table.

To build the schema, the following design model is used:

1.  Choose the business process
2.  Declare the grain
3.  Identify the dimensions
4.  Identify the fact

### Choose the Business Process

The process of dimensional modeling builds on a 4-step design method that helps to ensure the usability of the dimensional model and the use of the [data warehouse](https://en.wikipedia.org/wiki/Data_warehouse "Data warehouse"). The basics in the design build on the actual business process which the [data warehouse](https://en.wikipedia.org/wiki/Data_warehouse "Data warehouse") should cover. Therefore, the first step in the model is to describe the business process which the model builds on. This could for instance be a sales situation in a retail store. To describe the business process, one can choose to do this in plain text or use basic Business Process Modeling Notation ([BPMN](https://en.wikipedia.org/wiki/BPMN "BPMN")) or other design guides like the Unified Modeling Language ([UML](https://en.wikipedia.org/wiki/Unified_Modeling_Language "Unified Modeling Language")).

### Declare the grain

After describing the business process, the next step in the design is to declare the grain of the model. The grain of the model is the exact description of what the dimensional model should be focusing on. This could for instance be “An individual line item on a customer slip from a retail store”. To clarify what the grain means, you should pick the central process and describe it with one sentence. Furthermore, the grain (sentence) is what you are going to build your dimensions and fact table from. You might find it necessary to go back to this step to alter the grain due to new information gained on what your model is supposed to be able to deliver.

Identify the dimensions

The third step in the design process is to define the dimensions of the model. The dimensions must be defined within the grain from the second step of the 4-step process. Dimensions are the foundation of the fact table, and is where the data for the fact table is collected. Typically dimensions are nouns like date, store, inventory etc. These dimensions are where all the data is stored. For example, the date dimension could contain data such as year, month and weekday.

Identify the facts

After defining the dimensions, the next step in the process is to make keys for the fact table. This step is to identify the numeric facts that will populate each fact table row. This step is closely related to the business users of the system, since this is where they get access to data stored in the [data warehouse](https://en.wikipedia.org/wiki/Data_warehouse "Data warehouse"). Therefore, most of the fact table rows are numerical, additive figures such as quantity or cost per unit, etc.


***

## Appendix: Links

- [[Data Warehouse]]
- [[Kimball Techniques for Data Warehousing]]
- [[Ralph Kimball]]
- [[Bill Inmon]]
- [[Data Warehousing Concepts - Facts Measures Dimensions]]

*Backlinks:*

```dataview
list from [[Dimensional Modeling]] AND -"Changelog"
```