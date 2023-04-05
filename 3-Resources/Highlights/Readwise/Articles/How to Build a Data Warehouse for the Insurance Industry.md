# How to Build a Data Warehouse for the Insurance Industry

## Metadata

* Author: *Greg Marsh*
* Full Title: How to Build a Data Warehouse for the Insurance Industry
* Category: #Type/Highlight/Article
* URL: https://aptitive.com/blog/how-to-build-a-data-warehouse-for-insurance/

## Highlights

* At its most basic, the insurance industry can be described by its cash inflows and outflows (e.g., the business will collect premiums based on effective policies and pay out claims resulting from accidents). From here, we can describe the measures that are relevant to these activities:
  Policy Transactions: Quote, Written Premium, Fees, Commission
  Billing Transactions: Invoice, Taxes
  Claim Transactions: Payment, Reserve
  Payment transactions: Received amount ([View Highlight](https://instapaper.com/read/1479629171/18661325))
* Isolate your source data in a “common landing area”: I have been working on an insurance client with 20+ data sources (many acquisitions). The first step of our process is to identify the source tables that we need to build out the warehouse and load the information in a staging database. (We create a schema per source and automate most of the development work.) ([View Highlight](https://instapaper.com/read/1479629171/18661478))
* Denormalize and combine data into a data hub: After staging the data in the CLA, our team creates “Get” Stored Procedures to combine the data into common tables. For example, at one client, I have 13 sources with policy information (policy number, holder, effective date, etc.) that I combined into a single \[Business\].\[Policy\] table in my database. I also created tables for tracking other dimensions and facts such as claims, billing, and payment. ([View Highlight](https://instapaper.com/read/1479629171/18661479))
* Create a star schema warehouse: Finally, the team loads the business layer into the data warehouse by assigning surrogate keys to the dimensions, creating references in the facts, and structuring the tables in a star schema. If designed correctly, any modern reporting tool, from Tableau to SSRS, will be able to connect to the data warehouse and generate high-performance reporting. ([View Highlight](https://instapaper.com/read/1479629171/18661480))
* By combining your sources into a centralized data warehouse for insurance, the business has created a single source of the truth. From here, users have a well of data to extract operational metrics, build predictive models, and generate executive dashboards. The potential for insurance analytics is endless: premium forecasting, geographic views, fraud detection, marketing, operational efficiency, call-center tracking, resource optimization, cost comparisons, profit maximization, and so much more! ([View Highlight](https://instapaper.com/read/1479629171/18661485))
