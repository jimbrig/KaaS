---
Date: 2022-02-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev/DataScience"]
Alias: "Data Engineering and Its Main Concepts"
---

# Data Engineering and Its Main Concepts

*Source: [Data Engineering: Data Warehouse, Data Pipeline and Data Engineer Role | AltexSoft](https://www.altexsoft.com/blog/datascience/what-is-data-engineering-explaining-data-pipeline-data-warehouse-and-data-engineer-role/)*

**Data engineering** is a set of operations aimed at creating interfaces and mechanisms for the flow and access of information. It takes dedicated specialists – _data engineers_ – to maintain data so that it remains available and usable by others. In short, data engineers set up and operate the organization’s data infrastructure preparing it for further analysis by data analysts and scientists.

## Data Engineering 101

## ETL Data Pipeline

A **Data pipeline** is basically a set of tools and processes for moving data from one system to another for storage and further handling. It captures datasets from multiple sources and inserts them into some form of database, another tool, or app, providing quick and reliable access to this combined data for the [teams of data scientists](https://www.altexsoft.com/blog/datascience/how-to-structure-data-science-team-key-models-and-roles/), [BI engineers](https://www.altexsoft.com/blog/bi-developer-role-responsibilities-skills/), data analysts, etc.

Constructing data pipelines is the core responsibility of data engineering. It requires advanced programming skills to design a program for continuous and automated data exchange. A data pipeline is commonly used for

-   moving data to the cloud or to a data warehouse,
-   wrangling the data into a single location for convenience in [machine learning projects](https://www.altexsoft.com/blog/datascience/machine-learning-project-structure-stages-roles-and-tools/),
-   integrating data from various connected devices and systems in IoT,
-   copying databases into a cloud data warehouse, and
-   bringing data to one place in BI for informed business decisions.

You can read our detailed explanatory post to learn more about [data pipelines, their components, and types](https://www.altexsoft.com/blog/data-pipeline-components-and-types/). Now, let’s explore what ETL stands for.

## What is ETL?

Pipeline infrastructure varies depending on the use case and scale. However, data engineering usually starts with [**ETL** operations](https://www.altexsoft.com/blog/datascience/who-is-etl-developer-role-description-process-breakdown-responsibilities-and-skills/):

1. **E**xtracting data from source databases,

2. **T**ransforming data to match a unified format for specific business purposes, and

3. **L**oading reformatted data to the storage (mainly, data warehouses).


![](https://i.imgur.com/v6NlFUW.png)

### Extract

**1. Extract — retrieving incoming data.** At the start of the pipeline, we’re dealing with raw data from numerous separate sources. Data engineers write pieces of code – _jobs_ – that run on a schedule extracting all the data gathered during a certain period.


### Transform

**2. Transform — standardizing data.** Data from disparate sources is often inconsistent. So, for efficient querying and analysis, it must be modified. Having data extracted, engineers execute another set of jobs that transforms it to meet the format requirements (e.g., units of measure, dates, attributes like color or size.) Data transformation is a critical function, as it significantly improves data discoverability and usability.

### Load

**3. Load — saving data to a new destination.** After bringing data into a usable state, engineers can load it to the destination that typically is a relational database management system (RDBMS), a data warehouse, or Hadoop. Each destination has its specific practices to follow for performance and reliability.

Once the data is transformed and loaded into a single storage, it can be used for further analysis and [business intelligence](https://www.altexsoft.com/blog/business/complete-guide-to-business-intelligence-and-analytics-strategy-steps-processes-and-tools/) operations, i.e., generating reports, [creating visualizations](https://www.altexsoft.com/blog/data-visualization-tools-types-techniques/), etc.

**NB:** Despite being automated, a data pipeline must be constantly maintained by data engineers. They repair failures, update the system by adding/deleting fields, or adjust the schema to the changing needs of the business.

## Data Pipeline Challenges

> _“The importance of a healthy and relevant metrics system is that it can inform us of the status and performance of each pipeline stage, while with underestimating the data load, I am referring to building the system in such a way that it won’t face any overload if the product experiences an unexpected surge of users,”_ Juan De Dios Santos.

## Data Warehouse

*See Also: [[Data Warehouse]]*

A **data warehouse** (DW) is a central repository where data is stored in query-able forms. From a technical standpoint, a data warehouse is a relational database optimized for reading, aggregating, and querying large volumes of data. Traditionally, DWs only contained structured data, or data that can be arranged in tables. However, modern DWs can combine both [structured and unstructured data](https://www.altexsoft.com/blog/structured-unstructured-data/) where unstructured refers to a wide variety of forms (such as images, pdf files, audio formats, etc.) that are harder to categorize and process.

Surprisingly, DW isn’t a regular database. How so?

First of all, they differ in terms of data structure. A regular database normalizes data excluding any data redundancies and separating related data into tables. This takes up a lot of computing resources, as a single query combines data from many tables. Contrarily, a DW uses simple queries with few tables to improve performance and analytics.

Second, aimed at day-to-day transactions, standard transactional databases don’t usually store historic data, while for warehouses, it’s their main purpose, as they collect data from multiple periods. DW simplifies a data analyst’s job, allowing for manipulating all data from a single interface and deriving analytics, visualizations, and statistics.

Typically, a data warehouse doesn’t support as many concurrent users as a database, being designed for a small group of analysts and business users.

![](https://i.imgur.com/BhzINgi.png)

### Constructing Data Warehouse

1. **Data warehouse storage.** The foundation of data warehouse architecture is a database that stores all enterprise data allowing business users to access it for drawing valuable insights.
2. **Metadata.** Adding business context to data, metadata helps transform it into comprehensible knowledge. Metadata defines how data can be changed and processed. It contains information about any transformations or operations applied to source data while loading it into the data warehouse.
3. 


*Backlinks:*

```dataview
list from [[Data Engineering and Its Main Concepts]] AND -"Changelog"
```