# About Data Requirements

*Sources: [Data Requirement Analysis - an overview | ScienceDirect Topics](https://www.sciencedirect.com/topics/computer-science/data-requirement-analysis)*

* [Data Requirement Document (dendanskemaritimefond.dk)](https://www.dendanskemaritimefond.dk/wp-content/uploads/2016/04/GLAUCUS-Data-Requirements.pdf)
* [Agile Gathering Data Requirements | AgileData Way of Working](https://wow.agiledata.io/wow/agiledata-thoughts/agile-gathering-data-requirements/)
* [Documenting Data Quality: Considerations | U.S. Geological Survey (usgs.gov)](https://www.usgs.gov/data-management/documenting-data-quality-considerations)
* [DOC_15138.DOC (live.com)](https://view.officeapps.live.com/op/view.aspx?src=https%3A%2F%2Fwww.hud.gov%2Fsites%2Fdocuments%2FDOC_15138.DOC&wdOrigin=BROWSELINK)

![](https://i.imgur.com/153NIxq.png)

The Data Requirement Document (DRD) is a central document of the project, in which all information relating to data is gathered for agreement by the key stakeholders and then for guidance and information for those involved in the project

1. **Document information workflow:** 

Create an information flow model that depicts the sequence, hierarchy, and timing of process activities. The goal is to use this workflow to identify locations within the business processes where data quality controls can be introduced for continuous monitoring and measurement.

2. **Identify required data elements:** 

Reviewing the business questions will help segregate the required (or commonly used) data concepts (party, product, agreement, etc.) from the characterizations or aggregation categories (e.g., grouped by geographic region). This drives the determination of required reference data and potential master data items.

3. **Specify required facts:**

These facts represent specific pieces of business information that are tracked, managed, used, shared, or forwarded to a reporting and analytics facility in which they are counted or measured (such as quantity or volume). In addition, the data quality analyst must document any qualifying characteristics of the data that represent conditions or dimensions that are used to filter or organize your facts (such as time or location). The metadata for these data concepts and facts will be captured within a metadata repository for further analysis and resolution.

4. **Harmonize data element semantics:**

A metadata glossary captures all the business terms associated with the business workflows, and classifies the hierarchical composition of any aggregated or analyzed data concepts. Most glossaries may contain a core set of terms across similar projects along with additional project specific terms. When possible, use existing metadata repositories to capture the approved organization definition.

*Backlinks:*

````dataview
list from [[About Data Requirements]] AND -"Changelog"
````
