# Fact Table Structure

*Source: [Fact Table Structure | Kimball Dimensional Modeling Techniques (kimballgroup.com)](https://www.kimballgroup.com/data-warehouse-business-intelligence-resources/kimball-techniques/dimensional-modeling-techniques/fact-table-structure/)*

A *fact table* contains the numeric measures produced by an operational measurement event in the real world. At the lowest grain, a fact table row corresponds to a measurement event and vice versa. Thus the fundamental design of a fact table is entirely based on a physical activity and is not influenced by the eventual reports that may be produced. In addition to numeric measures, a fact table always contains foreign keys for each of its associated dimensions, as well as optional degenerate dimension keys and date/time stamps. Fact tables are the primary target of computations and dynamic aggregations arising from queries.

## Appendix: Links

* [Data Warehouse](Data%20Warehouse.md)
* [Data Science](../2-Areas/MOCs/Data%20Science.md)
* [Databases](../2-Areas/MOCs/Databases.md)
* [Ralph Kimball](../2-Areas/People/Ralph%20Kimball.md)
* [The Kimball Lifecycle](The%20Kimball%20Lifecycle.md)
* [Kimball Techniques for Data Warehousing](Kimball%20Techniques%20for%20Data%20Warehousing.md)
