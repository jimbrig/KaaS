# Building a Data Pipeline From Scratch on AWS

## Metadata

* Author: *Rayane de Araújo*
* Full Title: Building a Data Pipeline From Scratch on AWS
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/35f139420ebc

## Highlights

* The first step of the pipeline is data ingestion. This stage will be responsible for running the extractors that will collect data from the different sources and load them into the data lake
* a great improvement I recommend you to make is to use Lambda to run those scripts. Lambda is a great serverless solution provided by AWS. By using Lambda, you will not need to worry about maintaining a server nor need to pay for a 24 hour server that you will use only for a few hours.
* But where should I load that data? S3 is a great storage service provided by AWS. It is both highly available and cost efficient and can be a perfect solution to build your data lake on. Once the scripts extracted the data from the different data sources, the data was loaded into S3.
* It is important to think about how you want to organize your data lake. For this pipeline, once we would not have a team of scientists and analysts working on that data and once our data came from the sources pretty organized, I created only a raw partition on S3 where I stored data in its true form (the way they came from the source) with just a few adjustments that were made in the Node JS script.
* Raw: here you will store data in its true form, the way it came from the source without modifications.
* Transformed: after transforming data, treating possible problems such as standardization, missing values and those kind of problems, data will be loaded here. That data will be useful for data scientists.
* Enriched: for analysis you will have to enrich data. You may want to create a One Big Table (OBT) that suits your business rules so that you can have all information an analyst will need in one place. That’s the data that will be stored on this layer.
* Data warehouse
* Now that your data is already on your data lake, transformed and enriched, it is time to send it to a data warehouse! I have been using Redshift for a while now and I have been having a great experience with it. It is a very performing and reliable solution with a fair price. Redshift also provides a very great resource, called Redshift Spectrum, that makes it possible to query data directly from your data lake on S3.
* What is data worth for if people cannot access it? As the last step, you will need to integrate a visualization tool to your pipeline. The tool I chose to use for that was Metabase.
* Metabase is a great open source visualization tool. It offers an intuitive and user-friendly interface so that users with no knowledge of queries, SQL and those stuffs will be able to explore data and create graphs and dashboards to visualize their results. Metabase also allows users to define notifications via email and slack, to receive scheduled emails informing about defined metrics or analysis, to create collections where you can group data by company’s divisions, to create panels to present your analysis to restrain access to user groups and so on.
