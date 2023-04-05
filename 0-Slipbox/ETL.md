# ETL

*Source: [A gentle introduction to an ETL process | by Horacio Soldman | Jan, 2022 | Dev Genius](https://blog.devgenius.io/a-gentle-introduction-to-an-etl-process-19925e16367c)*

See Also: [ELT](ELT.md) | [Data Pipeline Architecture](Data%20Pipeline%20Architecture.md)

 > 
 > The process of extracting, transforming and loading the data, namely the extraction of data from its data sources to a staging area, the transformations to add structure or to clean the data and the act of loading it to its final destination.— [Real-Time Big Data Warehousing](https://doi.org/10.4018/978-1-5225-5516-2.ch002)

![](https://i.imgur.com/9eyhQvG.png)

## Extract

The very first step in the ETL process is to retrieve data from their original sources. These days, there are multiple types of data sources being available for multiple purposes, these include databases, websites, APIs, device sensors, backup files, and so many more. Different methods are employed at this stage depending on the source or the data provider. To gather information from a website, for instance, we can perform a web scraping which essentially reads the content of a web page and extract meaningful information from it without actually opening the page on a browser. Similarly, in order to extract data from an API, we can simply make an API call, which usually consists of sending a GET request with or without an API KEY. For sensor data, other methods are employed. Long story short, in this step, many datasets are gathered in a temporary location called: a staging area and made ready for a transformation.

In the example project mentioned above (i.e [ETL with Python](https://github.com/HoracioSoldman/etl-with-python)), data from the [World Happiness Report](https://worldhappiness.report/ed/2021/) and the [World Population Review](https://worldpopulationreview.com/country-rankings/happiest-countries-in-the-world) websites were imported to the staging area.

## Transform

Usually, data coming from different sources also come in different formats. Some data are in CSV file format, some others are in JSON, XML, etc. In this stage, the challenge is not only to deal with various data types and formats but also to ensure their quality and usability. Therefore, the purpose of this step is to transform these raw data in such a way that they will be more uniform, cleaner and easier to handle in their future usage. Depending on the purpose of the data pipeline, whether to feed a Machine Learning model, to have data for analysis or visualization; a large range of techniques can be employed here including formatting data types (e.g from String to Datetime formats), removing duplicate entries, imputing missing values, combining datasets, and so on.

Also, the operations in this stage can be very domain-specific. For instance, we might perform a lot of currency conversions in financial data while more aggregation operations might be required when it comes to medical data.

## Load

The last step in the ETL process is to load the transformed data. This is where the data are practically moved to a destination system. Again, depending on the purpose of the pipeline, the data can be inserted into a Data Warehouse, or any sort of repository where Data Analysts, Data Scientists, or ML Engineers can come to retrieve and use the pre-processed data.

It is also important to have a logging system in the pipeline in order to keep track of the progress of all the processes. This can be made with a simple log function that records the starting and the ending of each stage with timestamps, as well as the potential error is thrown during the process.

---

## Appendix: Links

* [ELT](ELT.md)
* [Data Warehouse](Data%20Warehouse.md)
* [ETL Data Warehousing Best Practices](ETL%20Data%20Warehousing%20Best%20Practices.md)
* [Data Warehousing Concepts and Definitions](Data%20Warehousing%20Concepts%20and%20Definitions.md)
* [Databases](../2-Areas/MOCs/Databases.md)

*Backlinks:*

* *3-Resources/Highlights/Readwise 1/Articles/The Baker’s Dozen 13 Tips for Better ExtractTransformLoad (ETL) Practices in Data Warehousing*
* [Stored Procedures - SQL Server](Stored%20Procedures%20-%20SQL%20Server.md)
* [Data Warehousing Concepts and Definitions](Data%20Warehousing%20Concepts%20and%20Definitions.md)
