---
Date: 2022-07-17
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: Matter
Link: https://towardsdatascience.com/how-i-redesigned-over-100-etl-into-elt-data-pipelines-c58d3a3cb3c
Tags: ["#Type/Highlight/Article"]
Aliases: ["How I Redesigned over 100 ETL into ELT Data Pipelines", "How I Redesigned over 100 ETL into ELT Data Pipelines"]
---
# How I Redesigned over 100 ETL into ELT Data Pipelines

## Metadata
- Author: [[Nicholas Leong]]
- Full Title: How I Redesigned over 100 ETL into ELT Data Pipelines
- Category: #Type/Highlight/Article
- URL: https://towardsdatascience.com/how-i-redesigned-over-100-etl-into-elt-data-pipelines-c58d3a3cb3c

## Highlights
- Data Engineers label the processing of data as transformations. This is where they perform their magic to transform all kinds of data into the form they intend it to be.
- In ETL Data Pipelines, Data Engineers perform transformations before loading data into the destination. If there are relational transformations between tables, these happen within the source itself. In my case, the source was a Postgres Database. Hence, we performed relational joins in the source to obtain the data required, then load it into the destination.
- we had to set up a proper Workflow Management System. We chose Apache Airflow. I wrote all about it here. Airflow was originally built by the guys at Airbnb, made open source. It is also used by popular companies like Twitter as their Pipeline management system. You can read all about the benefits of Airflow above.
- redesigning our ETL pipelines into ELT pipelines.
