# ELT Cloud Based Pipeline Architecture

*Sources: [ELT Architecture in the Azure Cloud | by Greg Marsh | Aptitive](https://blog.aptitive.com/elt-architecture-in-the-azure-cloud-50a90681036b) | [How to Build a Data Warehouse for the Insurance Industry | by Greg Marsh | Aptitive](https://blog.aptitive.com/how-to-build-a-data-warehouse-for-the-insurance-industry-adb6399ddb89)*

## Overview

Extract, Load, Transform or ELT is the process of intaking data from a variety of raw data sources, both structured and semi/unstructured and ultimately combining them (in the cloud for this case) to create a centralized data repository that becomes accessible to business reporting/intelligence tools.

To demonstrate, the diagram below displays two data flows: one using relational data and the other using semi-structured flat files. In the end the two data flows merge into a warehouse.

![](https://i.imgur.com/3qEtSUn.png)

## Best Practices

1. **Isolate your source data in a "common landing area"**: 

The first step of our process is to identify the source tables that we need to build out the warehouse and load the information in a staging database

2. **Denormalize and combine data into a data hub**:

After staging the data in the common landing area (CLA) or staging schema (STG), next, the data should trigger some sort of a *Stored Procedure* to combine the data into common tables. 

3. **Create Star Schema Warehouse**:

Finally, the team loads the business layer into the data warehouse by assigning surrogate keys to the dimensions, creating references in the facts, and structuring the tables in a star schema. If designed correctly, any modern reporting tool, will be able to connect to the DW and generate high-performance reporting.

![](https://i.imgur.com/72ojaZQ.png)

## Collection

This first step is to **collect**.  There are a couple methods to do this; you can dump raw data files into a [Data Lake](Data%20Lake.md) or pull the data directly into a relational database via more traditional ETL methods.

There needs to a mechanism in place to orchestrate the transition from the collected input data into a staging area where all collected data gets housed, logged, and cataloged.

*Backlinks:*

````dataview
list from [[ELT Cloud Based Pipeline Architecture]] AND -"Changelog"
````
