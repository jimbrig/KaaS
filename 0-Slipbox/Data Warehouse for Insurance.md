---
Date: 2022-01-30
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev/Data", "#Topic/Actuarial"]
Alias: "Data Warehouse for Insurance"
---

# Data Warehouse for Insurance

*Source: [How to Build a Data Warehouse for Insurance | Blog Post (aptitive.com)](https://aptitive.com/blog/how-to-build-a-data-warehouse-for-insurance/)*

*Highlights: [[How to Build a Data Warehouse for the Insurance Industry]]*

## Contents

- [[#Understanding the Value Chain and Create a Design|Understanding the Value Chain and Create a Design]]
- [[#Develop a Data Flow|Develop a Data Flow]]
- [[#Produce Reports, Visualizations, and Analysis|Produce Reports, Visualizations, and Analysis]]
- [[#Appendix: Links|Appendix: Links]]



## Understanding the Value Chain and Create a Design

```ad-quote
At its most basic, the insurance industry can be described by its cash inflows and outflows (e.g., the business will collect premiums based on effective policies and pay out claims resulting from accidents)
```

From here, we can describe the *measures* that are relevant to these activities:

1. **Policy Transactions**: Quote, Written Premium, Fees, Commission
2. **Billing Transactions**: Invoice, Taxes
3. **Claim Transactions**: Payment, Reserve
4. **Payment Transactions**: Received Amount

## Develop a Data Flow

*See Also: [[ELT Architecture in Azure Cloud]]*

1.  **Isolate your source data in a “common landing area”**: I have been working on an insurance client with 20+ data sources (many acquisitions). The first step of our process is to identify the source tables that we need to build out the warehouse and load the information in a staging database. (We create a schema per source and automate most of the development work.)


2.  **Denormalize and combine data into a data hub**: After staging the data in the CLA, our team creates “Get” Stored Procedures to combine the data into common tables. For example, at one client, I have 13 sources with policy information (policy number, holder, effective date, etc.) that I combined into a single [Business].[Policy] table in my database. I also created tables for tracking other dimensions and facts such as claims, billing, and payment.

3.  **Create a star schema warehouse**: Finally, the team loads the business layer into the data warehouse by assigning surrogate keys to the dimensions, creating references in the facts, and structuring the tables in a star schema. If designed correctly, any modern reporting tool, from [Tableau](https://www.tableau.com/) to SSRS, will be able to connect to the data warehouse and generate high-performance reporting.

## Produce Reports, Visualizations, and Analysis

By combining your sources into a centralized data warehouse for insurance, the business has created a single source of the truth. From here, users have a well of data to extract operational metrics, build predictive models, and generate executive dashboards. The potential for [insurance analytics](https://aptitive.com/insurance-analytics-solutions/) is endless: premium forecasting, geographic views, fraud detection, marketing, operational efficiency, call-center tracking, resource optimization, cost comparisons, profit maximization, and so much more!

***

## Appendix: Links

- [[Development]]
- [[Actuarial Science]]
- [[Data Warehouse]]
- [[Data Engineering]]
- [[Data Science]]
- [[Databases]]
