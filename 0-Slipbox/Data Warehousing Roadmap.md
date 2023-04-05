# Data Warehousing Roadmap

*Source: [A Sample Road-Map for Building Your Data Warehouse (upgrad.com)](https://www.upgrad.com/blog/a-sample-road-map-for-building-your-data-warehouse/)*

<center><img src="https://i.imgur.com/NHmG2T7.png"/></center>

## Contents

* [Overview](Data%20Warehousing%20Roadmap.md#overview)
* [Data Warehouse Tools](Data%20Warehousing%20Roadmap.md#data-warehouse-tools)
* [Setting up a Data Warehouse](Data%20Warehousing%20Roadmap.md#setting-up-a-data-warehouse)
  * [Evaluate Your Objectives](Data%20Warehousing%20Roadmap.md#evaluate-your-objectives)
  * [Analyze Current Technological Landscape](Data%20Warehousing%20Roadmap.md#analyze-current-technological-landscape)
  * [Information Modeling](Data%20Warehousing%20Roadmap.md#information-modeling)
  * [Designing the Warehouse and Tracking the Data Lineage](Data%20Warehousing%20Roadmap.md#designing-the-warehouse-and-tracking-the-data-lineage)
  * [Implement the Plan](Data%20Warehousing%20Roadmap.md#implement-the-plan)
* [Final Thoughts](Data%20Warehousing%20Roadmap.md#final-thoughts)
* [Appendix: Links](Data%20Warehousing%20Roadmap.md#appendix-links)

## Overview

Data warehousing, *a technique of consolidating all of your organizational data into one place for easier access and better analytics*, is every business stakeholder’s dream. 

However, setting up a data warehouse is a significantly complex task, and even before taking your first steps, you should be utterly clear as to what the end desired goals are for setting up a Data Warehouse.

Data Warehouse is extremely helpful when organizing large amounts of data to retrieve and analyze efficiently. For the same reason, extreme care should be taken to ensure that the data is rapidly accessible. One approach to designing the system is by using dimensional modeling – a method that allows large volumes of data to be efficiently and quickly queried and examined. Since most of the data present in data warehouses are historical and stable – in a sense, it doesn’t change frequently, there is hardly a need to employ repetitive backup methods. Instead, once any data is added, the entire warehouse can be backed up at once – instead of backing up routinely.

## Data Warehouse Tools

The tools needed for creation of a Data Warehouse can be broadly broken down into four core categories:

1. Extraction Tools
1. Table Management Tools
1. Query Management Tools
1. Data Integrity Tools

Each of these tools come in extremely handy at different stages of development of the Data Warehouse. Research on your part will help you understand more about these tools, and will allow you to can pick the ones which suit your needs.

## Setting up a Data Warehouse

Now, let’s look at a sample roadmap that’ll help you build a more robust and insightful warehouse for your organization:

### Evaluate Your Objectives

The first step in setting up your organization’s data warehouse is to evaluate your goals. We’ve mentioned this earlier, but we can’t stress this enough. Most of the organizations lose out on valuable insights just because they lack a clear picture of their company’s objectives, requirements, and goals. For instance, if you’re a company looking for your first significant breakthrough, you might want to engage your customers in building rapport – so, you’ll need to follow a different approach than an organization that’s well established and now wants to use the data warehouse for improving their operations. Bringing a data warehouse in-house is a big step for any organization and should be performed only after some due diligence on your part.

### Analyze Current Technological Landscape

By asking your customers and business stakeholders pointed questions, you can gather insights on how your current technical system is performing, the challenges it’s facing, and the improvements possible. Further, they can even find out how suitable their current technology stack is – thereby efficiently deciding whether it is to be kept or replaced. Various department of your organization can contribute to this by providing reports and feedback.

### Information Modeling

An information model is a representation of your organization’s data. It is conceptual and allows you to form ideas of what business processes need to be interrelated and how to get them linked. The data warehouse will ultimately be a collection of correlating structures, so, it’s important to conceptualize the indicators that need to be connected together and create top performance methods – this is what is known as information modeling. The simplest way to design an efficient information model is by gathering key performance indicators into fact tables, and relating them to various dimensions such as customers, employees, products, and such.

### Designing the Warehouse and Tracking the Data Lineage

Once you’ve gathered insights into your organization and prepared an efficient information model, now comes the time to move your data into the warehouse and track the performance of the same. During the design phase, it is essential to plan how to link all of the data from different databases so that the information can be interconnected when we’re loading it into our data warehouse tables. The ETL tools can be quite time and money consuming and might require experts to implement successfully. So, it’s important to know the right tools at the right time – and pick the most cost-effective option available to you. A data warehouse consumes a significant amount of storage space, so you need to plan how to archive the data as time goes on. One way to do this is by keeping a threefold granularity data storage system (we’ll talk more about that in a while). However, the problem with granularity is that grain of data will defer over a period. So, you should design your system such that the differing granularity is consistent with a specific data structure.

### Implement the Plan

Now that you’ve developed your plan and linked the pieces of data together, it’s time to implement your strategy. The implementation of Data Warehouse is a grand move, and there is a viable basis for scheduling the project. The project should be broken down into chunks and should be taken up one piece at a time. It’s recommended to define a phase of completion for each chunk of the task and finally collate all the bits upon completion. With such a systematic and thought-out implementation, your Data Warehouse will perform much more efficiently and provide the much-needed information required during the data analytics phase.

## Final Thoughts

Your data warehouse is set to stand the tests of time and granularity. It has to remain consistent for long stretches of time and at many levels of granularity. In the design phase of the setup, you can opt for various storage plans that tie into the non-repetitive update. For instance, an IT manager can set up a daily, weekly, or monthly grain storage systems. In the daily grain, the data can be stored in the original format in which it was collected can be kept for 2-3 years, after which it has to be summarized and moved to the weekly grain. Now, the data can remain in the weekly grain structure for the next 3-5 years, after which it will be moved to the monthly grain structure.

---

## Appendix: Links

* [Data Warehouse](Data%20Warehouse.md)
* [Databases](../2-Areas/MOCs/Databases.md)
* [Data Mart](Data%20Mart.md)
* [Data Lake](Data%20Lake.md)
* [Data Warehousing for Insurance Data](Data%20Warehousing%20for%20Insurance%20Data.md)
* *3-Resources/Highlights/Readwise 1/Articles/Data Warehouse Insurance - Kimball Group*
* [Data Warehousing Concepts and Definitions](Data%20Warehousing%20Concepts%20and%20Definitions.md)
