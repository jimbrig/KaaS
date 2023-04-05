# Data Lake

## What is a Data Lake?

*Source: [What is a data lake?](https://aws.amazon.com/big-data/datalakes-and-analytics/what-is-a-data-lake/)*

A data lake is a centralized repository that allows you to store all your structured and unstructured data at any scale. You can store your data as-is, without having to first structure the data, and run different types of analytics—from dashboards and visualizations to big data processing, real-time analytics, and machine learning to guide better decisions.

![](https://d1.awsstatic.com/AWS_Analytics_2021_LakeHouse.337c5d294eae24fe954c1d2e93fcda03233dfba4.png)

## Why do you need a data lake?

Organizations that successfully generate business value from their data, will outperform their peers. An [Aberdeen survey](https://s3-ap-southeast-1.amazonaws.com/mktg-apac/Big+Data+Refresh+Q4+Campaign/Aberdeen+Research+-+Angling+for+Insights+in+Today's+Data+Lake.pdf) saw organizations who implemented a Data Lake outperforming similar companies by 9% in organic revenue growth. These leaders were able to do new types of analytics like machine learning over new sources like log files, data from click-streams, social media, and internet connected devices stored in the data lake. This helped them to identify, and act upon opportunities for business growth faster by attracting and retaining customers, boosting productivity, proactively maintaining devices, and making informed decisions.

## Data Lakes compared to Data Warehouses – two different approaches

Depending on the requirements, a typical organization will require both a data warehouse and a data lake as they serve different needs, and use cases.

A data warehouse is a database optimized to analyze relational data coming from transactional systems and line of business applications. The data structure, and schema are defined in advance to optimize for fast SQL queries, where the results are typically used for operational reporting and analysis. Data is cleaned, enriched, and transformed so it can act as the “single source of truth” that users can trust.

A data lake is different, because it stores relational data from line of business applications, and non-relational data from mobile apps, IoT devices, and social media. The structure of the data or schema is not defined when data is captured. This means you can store all of your data without careful design or the need to know what questions you might need answers for in the future. Different types of analytics on your data like SQL queries, big data analytics, full text search, real-time analytics, and machine learning can be used to uncover insights.

As organizations with data warehouses see the benefits of data lakes, they are evolving their warehouse to include data lakes, and enable diverse query capabilities, data science use-cases, and advanced capabilities for discovering new information models. Gartner names this evolution the "Data Management Solution for Analytics" or "[DMSA](https://www.gartner.com/doc/3614317/magic-quadrant-data-management-solutions)."

|Characteristics|Data Warehouse|Data Lake|
|---------------|--------------|---------|
|**Data**|Relational from transactional systems, operational databases, and line of business applications|Non-relational and relational from IoT devices, web sites, mobile apps, social media, and corporate applications|
|**Schema**|Designed prior to the DW implementation (schema-on-write)|Written at the time of analysis (schema-on-read)|
|**Price/Performance**|Fastest query results using higher cost storage|Query results getting faster using low-cost storage|
|**Data Quality<br>**|Highly curated data that serves as the central version of the truth|Any data that may or may not be curated (ie. raw data)<br>|
|**Users**|Business analysts|Data scientists, Data developers, and Business analysts (using curated data)|
|**Analytics**|Batch reporting, BI and visualizations|Machine Learning, Predictive analytics, data discovery and profiling|

## Deploying Data Lakes in the cloud

Data Lakes are an ideal workload to be deployed in the cloud, because the cloud provides performance, scalability, reliability, availability, a diverse set of analytic engines, and massive economies of scale. [ESG research](https://s3-ap-southeast-1.amazonaws.com/mktg-apac/Big+Data+Refresh+Q4+Campaign/ESG-White-Paper-AWS-Apr-2017+(FINAL).pdf) found 39% of respondents considering cloud as their primary deployment for analytics, 41% for data warehouses, and 43% for Spark. The top reasons customers perceived the cloud as an advantage for Data Lakes are better security, faster time to deployment, better availability, more frequent feature/functionality updates, more elasticity, more geographic coverage, and costs linked to actual utilization.

---

### Appendix: Related

* [Logical Architecture of Modern Data Lake Centric Analytics Platforms](Logical%20Architecture%20of%20Modern%20Data%20Lake%20Centric%20Analytics%20Platforms.md)
* [Data Warehouse](Data%20Warehouse.md)

*Backlinks:*

````dataview
list from [[Data Lake]] AND -"Changelog"
````
