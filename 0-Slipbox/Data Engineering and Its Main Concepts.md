# Data Engineering and Its Main Concepts

*Source: [Data Engineering: Data Warehouse, Data Pipeline and Data Engineer Role | AltexSoft](https://www.altexsoft.com/blog/datascience/what-is-data-engineering-explaining-data-pipeline-data-warehouse-and-data-engineer-role/)*

**Data engineering** is a set of operations aimed at creating interfaces and mechanisms for the flow and access of information. It takes dedicated specialists – *data engineers* – to maintain data so that it remains available and usable by others. In short, data engineers set up and operate the organization’s data infrastructure preparing it for further analysis by data analysts and scientists.

## Contents

* [Data Engineering 101](Data%20Engineering%20and%20Its%20Main%20Concepts.md#data-engineering-101)
* [ETL Data Pipeline](Data%20Engineering%20and%20Its%20Main%20Concepts.md#etl-data-pipeline)
* [What is ETL?](Data%20Engineering%20and%20Its%20Main%20Concepts.md#what-is-etl)
  * [Extract](Data%20Engineering%20and%20Its%20Main%20Concepts.md#extract)
  * [Transform](Data%20Engineering%20and%20Its%20Main%20Concepts.md#transform)
  * [Load](Data%20Engineering%20and%20Its%20Main%20Concepts.md#load)
* [Data Pipeline Challenges](Data%20Engineering%20and%20Its%20Main%20Concepts.md#data-pipeline-challenges)
* [Data Warehouse](Data%20Engineering%20and%20Its%20Main%20Concepts.md#data-warehouse)
  * [Constructing Data Warehouse](Data%20Engineering%20and%20Its%20Main%20Concepts.md#constructing-data-warehouse)
* [Data Marts](Data%20Engineering%20and%20Its%20Main%20Concepts.md#data-marts)
  * [Types of Data Marts](Data%20Engineering%20and%20Its%20Main%20Concepts.md#types-of-data-marts)
* [OLAP and OLAP Cubes](Data%20Engineering%20and%20Its%20Main%20Concepts.md#olap-and-olap-cubes)
* [Data Lake](Data%20Engineering%20and%20Its%20Main%20Concepts.md#data-lake)
* [The Role of the Data Engineer](Data%20Engineering%20and%20Its%20Main%20Concepts.md#the-role-of-the-data-engineer)
* [Concluding Remarks](Data%20Engineering%20and%20Its%20Main%20Concepts.md#concluding-remarks)

## Data Engineering 101

## ETL Data Pipeline

A **Data pipeline** is basically a set of tools and processes for moving data from one system to another for storage and further handling. It captures datasets from multiple sources and inserts them into some form of database, another tool, or app, providing quick and reliable access to this combined data for the [teams of data scientists](https://www.altexsoft.com/blog/datascience/how-to-structure-data-science-team-key-models-and-roles/), [BI engineers](https://www.altexsoft.com/blog/bi-developer-role-responsibilities-skills/), data analysts, etc.

Constructing data pipelines is the core responsibility of data engineering. It requires advanced programming skills to design a program for continuous and automated data exchange. A data pipeline is commonly used for

* moving data to the cloud or to a data warehouse,
* wrangling the data into a single location for convenience in [machine learning projects](https://www.altexsoft.com/blog/datascience/machine-learning-project-structure-stages-roles-and-tools/),
* integrating data from various connected devices and systems in IoT,
* copying databases into a cloud data warehouse, and
* bringing data to one place in BI for informed business decisions.

You can read our detailed explanatory post to learn more about [data pipelines, their components, and types](https://www.altexsoft.com/blog/data-pipeline-components-and-types/). Now, let’s explore what ETL stands for.

## What is ETL?

Pipeline infrastructure varies depending on the use case and scale. However, data engineering usually starts with [**ETL** operations](https://www.altexsoft.com/blog/datascience/who-is-etl-developer-role-description-process-breakdown-responsibilities-and-skills/):

1. **E**xtracting data from source databases,

1. **T**ransforming data to match a unified format for specific business purposes, and

1. **L**oading reformatted data to the storage (mainly, data warehouses).

![](https://i.imgur.com/v6NlFUW.png)

### Extract

**1. Extract — retrieving incoming data.** At the start of the pipeline, we’re dealing with raw data from numerous separate sources. Data engineers write pieces of code – *jobs* – that run on a schedule extracting all the data gathered during a certain period.

### Transform

**2. Transform — standardizing data.** Data from disparate sources is often inconsistent. So, for efficient querying and analysis, it must be modified. Having data extracted, engineers execute another set of jobs that transforms it to meet the format requirements (e.g., units of measure, dates, attributes like color or size.) Data transformation is a critical function, as it significantly improves data discoverability and usability.

### Load

**3. Load — saving data to a new destination.** After bringing data into a usable state, engineers can load it to the destination that typically is a relational database management system (RDBMS), a data warehouse, or Hadoop. Each destination has its specific practices to follow for performance and reliability.

Once the data is transformed and loaded into a single storage, it can be used for further analysis and [business intelligence](https://www.altexsoft.com/blog/business/complete-guide-to-business-intelligence-and-analytics-strategy-steps-processes-and-tools/) operations, i.e., generating reports, [creating visualizations](https://www.altexsoft.com/blog/data-visualization-tools-types-techniques/), etc.

**NB:** Despite being automated, a data pipeline must be constantly maintained by data engineers. They repair failures, update the system by adding/deleting fields, or adjust the schema to the changing needs of the business.

## Data Pipeline Challenges

 > 
 > *“The importance of a healthy and relevant metrics system is that it can inform us of the status and performance of each pipeline stage, while with underestimating the data load, I am referring to building the system in such a way that it won’t face any overload if the product experiences an unexpected surge of users,”* Juan De Dios Santos.

## Data Warehouse

*See Also: [Data Warehouse](Data%20Warehouse.md)*

A **data warehouse** (DW) is a central repository where data is stored in query-able forms. From a technical standpoint, a data warehouse is a relational database optimized for reading, aggregating, and querying large volumes of data. Traditionally, DWs only contained structured data, or data that can be arranged in tables. However, modern DWs can combine both [structured and unstructured data](https://www.altexsoft.com/blog/structured-unstructured-data/) where unstructured refers to a wide variety of forms (such as images, pdf files, audio formats, etc.) that are harder to categorize and process.

Surprisingly, DW isn’t a regular database. How so?

First of all, they differ in terms of data structure. A regular database normalizes data excluding any data redundancies and separating related data into tables. This takes up a lot of computing resources, as a single query combines data from many tables. Contrarily, a DW uses simple queries with few tables to improve performance and analytics.

Second, aimed at day-to-day transactions, standard transactional databases don’t usually store historic data, while for warehouses, it’s their main purpose, as they collect data from multiple periods. DW simplifies a data analyst’s job, allowing for manipulating all data from a single interface and deriving analytics, visualizations, and statistics.

Typically, a data warehouse doesn’t support as many concurrent users as a database, being designed for a small group of analysts and business users.

![](https://i.imgur.com/BhzINgi.png)

### Constructing Data Warehouse

1. **Data warehouse storage.** The foundation of data warehouse architecture is a database that stores all enterprise data allowing business users to access it for drawing valuable insights.
1. **Metadata.** Adding business context to data, metadata helps transform it into comprehensible knowledge. Metadata defines how data can be changed and processed. It contains information about any transformations or operations applied to source data while loading it into the data warehouse.
1. **Data warehouse access tools.** Designed to facilitate interactions with DW databases for business users, [access tools](https://www.altexsoft.com/blog/best-bi-tools-comparison/) need to be integrated with the warehouse. They have different functions. For example, *query and reporting tools* are used for generating business analysis reports. Another type of access tools – *data mining tools* – automate the process of finding patterns and correlations in large amounts of data based on advanced statistical modeling techniques.
1. **Data warehouse management tools.** Spanning the enterprise, data warehouse deals with a number of management and administrative operations. That’s why managing a DW requires a solution that can facilitate all these operations. Dedicated data warehouse management tools exist to accomplish this.

For a more detailed description of different [data warehouse architectures, types, and components](https://www.altexsoft.com/blog/enterprise-data-warehouse-concepts/), visit our dedicated post.

## Data Marts

*See Also: [Data Mart](Data%20Mart.md)*

Simply speaking, a **data mart** is a smaller data warehouse (their size is usually less than 100Gb.). They become necessary when the company (and the amount of its data) grows and it becomes too long and ineffective to search for information in an enterprise DW. Instead, data marts are built to allow different departments (e.g., sales, marketing, C-suite) to access relevant information quickly and easily.

![](https://i.imgur.com/uRd6gWJ.png)

### Types of Data Marts

There are three main types of data marts.

1. **Dependent data marts** are created from an enterprise DW and use it as a main source of information (it’s also known as a top-down approach).

1. **Independent data marts** are standalone systems that function without DWs extracting information from various external and internal sources (it’s also known as a top-down approach).

1. **Hybrid data marts** combine information from both DW and other operational systems.

So, the main difference between data warehouses and data marts is that a DW is a large repository that holds all company data extracted from multiple sources, making it difficult to process and manage queries. Meanwhile, a data mart is a smaller storage that contains a limited amount of data for the usage of a particular business group or department.

Here is a comprehensive overview of the concept of [data marts, their types, and structure](https://www.altexsoft.com/blog/what-is-data-mart/) if you want to learn more.

While data marts allow business users to quickly access the queried data, often just getting the information is not enough. It has to be efficiently processed and analyzed to get those actionable insights that support decision-making. Looking at your data from different perspectives is possible thanks to OLAP cubes. Let’s see what they are.

## OLAP and OLAP Cubes

**OLAP or Online Analytical Processing** refers to the computing approach that allows users to perform multidimensional data analysis. It’s contrasted with *OLTP or Online Transactional Processing,* which is a simpler method of interacting with databases that isn’t designed for analyzing massive amounts of data from different perspectives.

Traditional databases look like spreadsheets, using the two-dimensional structure of rows and columns. However, in OLAP, datasets are presented in multidimensional structures — **OLAP cubes**. Such structures enable efficient processing and advanced analysis of huge amounts of varied data. For example, a sales department report would include such dimensions as product, region, sales representative, sales amount, month, and so on.

Here’s where OLAP cubes are in the company’s data architecture. Information from DWs is aggregated and loaded into the OLAP cube where it gets precalculated and is readily available for users requests.

![](https://i.imgur.com/K7LYy4Z.png)

## Data Lake

*See Also: [Data Lake](Data%20Lake.md)*

A **Data lake** is a vast pool for saving data in its native, unprocessed form. A data lake stands out for its high agility as it isn’t limited to a warehouse’s fixed configuration.

![](https://i.imgur.com/K2rHSd8.png)

## The Role of the Data Engineer

 > 
 > “*In a multidisciplinary team that includes data scientists, BI engineers, and data engineers, the role of the data engineer is mostly to ensure the quality and availability of the data.”* Juan De Dios Santos

![](https://i.imgur.com/VGwjpr7.png)

**Overlapping skills of the software engineer, data engineer, and data scientist, Source:* [*Ryan Swanstrom*](https://ryanswanstrom.com/2016/11/28/data-scientists-data-engineers-software-engineers-the-difference-according-to-linkedin/)*

## Concluding Remarks

 > 
 > “*Both data scientists and data engineers work with data but solve quite different tasks, have different skills, and use different tools*. *Data engineers build and maintain massive data storage and apply engineering skills: programming languages, ETL techniques, knowledge of different data warehouses and database languages. Whereas data scientists clean and analyze this data, get valuable insights from it, implement models for forecasting and predictive analytics, and mostly apply their math and algorithmic skills, machine learning algorithms and tools.*”

* Vast data volumes require additional effort and specific engineering solutions to access and process it in a reasonable amount of time.
* Data is usually stored in lots of different storages and formats. In this case, it makes sense first to clean it up by taking [dataset preparation measures](https://www.altexsoft.com/blog/datascience/preparing-your-dataset-for-machine-learning-8-basic-techniques-that-make-your-data-better/), transform, merge, and move to a more structured storage, like a data warehouse. This is typically a task for data architects and engineers.
* Data storages have different [APIs](https://www.altexsoft.com/blog/engineering/what-is-api-definition-types-specifications-documentation/) for accessing them. In this case, data scientists need data engineers to implement the most efficient and reliable pipeline of getting data for their purpose.

---

## Appendix: Links

* [Data Engineering](../2-Areas/MOCs/Data%20Engineering.md)
* [Data Warehouse](Data%20Warehouse.md)
* [Databases](../2-Areas/MOCs/Databases.md)
* [Data Mart](Data%20Mart.md)
* [Data Lake](Data%20Lake.md)
* [Data Science](../2-Areas/MOCs/Data%20Science.md)
* [Data Versioning](Data%20Versioning.md)
* [Data Cataloging](Data%20Cataloging.md)
* [Data Science Lifecycle](Data%20Science%20Lifecycle.md)

*Backlinks:*

````dataview
list from [[Data Engineering and Its Main Concepts]] AND -"Changelog"
````
