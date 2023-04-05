# What Is Data Modeling?

## Metadata

* Author: *Louise de Leyritz*
* Full Title: What Is Data Modeling?
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/6f14c1b7f2fd

## Highlights

* Simply put, data transformation is the process of changing the format, structure, or values of your variables. The aim of structuring and reformatting data is to transform it into a data model from which you can learn insights and derive business intelligence.
* A lot of the time, the transformation step involves integrating transactional data with operational data so that data can be made useful for business analytics and BI.
* Transformations are thus mostly dictated by the specific needs of analysts who are seeking to solve a precise business problem with data
* Data discovery and profiling: The first step of the transformation workflow consists in identifying and understanding data in their original source. This step allows you to decide which operations the data should go through to reach the desired format/structure.
* Translation and mapping: This involves establishing a clear correspondence between the source and the target destination fields.
* Workflow creation: This step involves writing the code to execute the transformation task. The code is often generated using a specific data transformation platform.
* Workflow execution: Data is converted to the desired format.
* Data review: Transformed data is examined, ensuring it has been correctly formatted.
* 1st generation: Data transformations are operated by ETL (Extract-Transform-Load) tools, mostly using python and airflow.
* 2nd generation: EL-T (Extract-Load-transform) processes come to replace Traditional ETL. Transformations are now operated in the data warehouse. A blurry era with no tools specifically dedicated to data transformation.
* 3rd generation: Emergence of tools specialized for data transformation in the data warehouse. A new transformation paradigm is established with the emergence of dbt.
* Data transformation is part of the wider data integration process, which consists in integrating data from multiple sources into a single source of truth, usually the data warehouse.
* The point of building a unique source of truth is to allow data users to find data more easily than when it’s scattered across dozens of applications and source systems.
* The key thing to remember is that in the ETL process, data is transformed before being loaded in the warehouse.
* The peculiarity of cloud data warehouses is that they are infinitely more scalable than traditional data warehouses, with a capacity to accommodate virtually any amount of data.
* Dbt is a platform that specifically dedicates to data transformation, focusing only on the T in the EL- T process. It’s now widely accepted that Dbt set a new standard for data transformation.
* With the number of datasets created when everyone gets involved with data transformation, you better have a solid data documentation solution if you don’t want to end up drowning in a sea of unlabelled, poorly documented data.
* Data engineers transform data according to a different logic. Their objective is to build a solid data infrastructure, providing clean and reliable data for self-service analytics. Data engineers seek to transform and structure data in a way that makes it useful for business analysis, but that also makes it reusable for different use cases.
* Analytics engineers have enough business context and experience with data tools to build reusable data models. They basically apply software engineering best practices to data analysis and bring a business-oriented mindset to data engineering efforts.
* When analytics engineers are in charge of data transformations, organizations live in the best possible world: great data infrastructure, well-built and reusable databases in a self-service configuration, and perfect visibility across the data warehouse.
