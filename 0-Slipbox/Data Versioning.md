---
Date: 2022-01-26
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev/DataScience"]
Alias: "Data Versioning"
---

# Data Versioning

## Principles of Data Versioning

1. Changes to data have sources or explanations
2. Data versioning should be value-based, not variable- or observation-based
3. Data exist independent of their format
4. Collaboration is essential to data generation and curation

The first principle of data versioning is that *changes to data have sources or explanations*. A system of data versioning must be able to connect data values, structure, and metadata (and changes to those features) to explanations of those values or the changes to values at the value level (rather than at the level of variables, observations, or files).

The second principle is that *data versioning should be value-based, not variable- or observation-based*. A system cannot privilege observations over variables or variables over observations; a change to an observation is necessarily a change to a variable, and vice versa.

The third principle of data versioning is that *data exist independent of their format*. If one changes a data value in a CSV versus a JSON tree, those are content-equivalent changes. As such, any system of version control should allow data users to interact with data in whatever file format they choose without necessarily using the underlying data storage format.

The fourth principle of data versioning is that *collaboration is essential to data generation and curation*. A system of data versioning must be natively collaborative and logically record who is generating and modifying data.

The fifth principle of data versioning is that *changes to data structure should be recorded independently of data values. Sort order of observations, the arrangement of columns/variables, and the arrangement of rows as cases versus case-years, etc. (i.e., "wide" versus "long" arrangements) are structural features of a dataset, not features of the data per se. These are important, but a data versioning process should be able to distinguish a change to the content of a dataset from a change to the organization or structure of a dataset and, in the latter case, correctly recognize as identical a dataset that is arranged in two different ways.

The sixth principle of data versioning is that metadata matters but, like structure, should be handled separately from changes to data. Two identical datasets with different metadata should be recognized as content-identical.


*Backlinks:*

```dataview
list from [[Data Versioning]] AND -"Changelog"
```