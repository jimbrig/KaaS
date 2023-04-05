# Data Warehouse for Insurance

*Source: [How to Build a Data Warehouse for Insurance | Blog Post (aptitive.com)](https://aptitive.com/blog/how-to-build-a-data-warehouse-for-insurance/)*

*Highlights: *3-Resources/Highlights/Readwise 1/Articles/How to Build a Data Warehouse for the Insurance Industry**

## Contents

* [Understanding the Value Chain and Create a Design](Data%20Warehouse%20for%20Insurance.md#understanding-the-value-chain-and-create-a-design)
* [Develop a Data Flow](Data%20Warehouse%20for%20Insurance.md#develop-a-data-flow)
* [Produce Reports, Visualizations, and Analysis](Data%20Warehouse%20for%20Insurance.md#produce-reports-visualizations-and-analysis)
* [Appendix: Links](Data%20Warehouse%20for%20Insurance.md#appendix-links)

## Understanding the Value Chain and Create a Design

````ad-quote
At its most basic, the insurance industry can be described by its cash inflows and outflows (e.g., the business will collect premiums based on effective policies and pay out claims resulting from accidents)
````

From here, we can describe the *measures* that are relevant to these activities:

1. **Policy Transactions**: Quote, Written Premium, Fees, Commission
1. **Billing Transactions**: Invoice, Taxes
1. **Claim Transactions**: Payment, Reserve
1. **Payment Transactions**: Received Amount

## Develop a Data Flow

*See Also: [ELT Architecture in Azure Cloud](ELT%20Architecture%20in%20Azure%20Cloud.md)*

1. **Isolate your source data in a “common landing area”**: I have been working on an insurance client with 20+ data sources (many acquisitions). The first step of our process is to identify the source tables that we need to build out the warehouse and load the information in a staging database. (We create a schema per source and automate most of the development work.)

1. **Denormalize and combine data into a data hub**: After staging the data in the CLA, our team creates “Get” Stored Procedures to combine the data into common tables. For example, at one client, I have 13 sources with policy information (policy number, holder, effective date, etc.) that I combined into a single \[Business\].\[Policy\] table in my database. I also created tables for tracking other dimensions and facts such as claims, billing, and payment.

1. **Create a star schema warehouse**: Finally, the team loads the business layer into the data warehouse by assigning surrogate keys to the dimensions, creating references in the facts, and structuring the tables in a star schema. If designed correctly, any modern reporting tool, from [Tableau](https://www.tableau.com/) to SSRS, will be able to connect to the data warehouse and generate high-performance reporting.

## Produce Reports, Visualizations, and Analysis

By combining your sources into a centralized data warehouse for insurance, the business has created a single source of the truth. From here, users have a well of data to extract operational metrics, build predictive models, and generate executive dashboards. The potential for [insurance analytics](https://aptitive.com/insurance-analytics-solutions/) is endless: premium forecasting, geographic views, fraud detection, marketing, operational efficiency, call-center tracking, resource optimization, cost comparisons, profit maximization, and so much more!

---

## Appendix: Links

* [Development](../2-Areas/MOCs/Development.md)
* [Actuarial Science](../2-Areas/MOCs/Actuarial%20Science.md)
* [Data Warehouse](Data%20Warehouse.md)
* [Data Engineering](../2-Areas/MOCs/Data%20Engineering.md)
* [Data Science](../2-Areas/MOCs/Data%20Science.md)
* [Databases](../2-Areas/MOCs/Databases.md)
