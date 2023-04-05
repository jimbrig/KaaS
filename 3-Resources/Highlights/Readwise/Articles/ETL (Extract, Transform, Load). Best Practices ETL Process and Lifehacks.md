# ETL (Extract, Transform, Load). Best Practices ETL Process and Lifehacks

## Metadata

* Author: *Katarina Harbuzava*
* Full Title: ETL (Extract, Transform, Load). Best Practices ETL Process and Lifehacks
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/553409238509

## Highlights

* Availability of data sources
* The more complex and valuable your data is, the higher are the chances it will be scattered across numerous sources and presented in various formats.
* direct access via query language interface and DB driver could be an option. However, in the real world, granting direct access to the database service is rarely the case as it imposes high-security risks and might generate breaches and vulnerabilities. On the other hand, getting direct access to a source DB is overkill as we need to read the data and any writing is out of the ETL functionality scope.
* Therefore the most efficient and hence popular way to access source data is to create an HTTP endpoint that will feed the data in a structured format like XML, JSON, or CSV.
* Contact the data source owner and ask about the availability of the official API endpoints or permission to scrape the data. In many cases, the solution might be easier than it seems. Link exchange, mentioning the data owner or revenue sharing could be good motivators to share the data with you. Anyway, sharing is caring.
* Dynamic nature of data
* Nothing is stable in this changing world and data is one of the least stable things. The information which is relevant and true at the moment could become history in a few minutes. Good examples of such rapid changes would be pricing information, market availability, user status to mention a few. In terms of ETL architecture, this means that the more dynamic source data is the more often it needs to be stored and re-processed. Generally, you would find the following approaches to the dynamic data problem:
* Notification service. The data source notifies its users about the changes by either posting an event code to the subscriber endpoint or posting the full information about which data object has changed and what exactly the changes are. In some cases, the data changes would be posted not straight away but at certain intervals in batches, typically daily.
* Snapshot publishing service. This might be a practical solution for data with dynamic nature where keeping track of the change history is important. A file containing either a full data snapshot or diff log is published daily, file name typically containing the date and timestamp.
* . The above two approaches where the data owner actively notifies the clients on the changes or publishes the changes at certain intervals are a dream service for the data consumers as it saves tons of resources and time. Unfortunately, in most cases, this is too good to be true and the data consumers have to take the burden of tracking the changes themselves. The most obvious way to do it is by pinging the data sources over and over again and comparing the latest data to the previously scanned snapshot. Slow, inefficient, expensive for both serving and consuming parties, yet oftentimes inevitable. The source scanning process can become the starting point of the whole ETL pipeline. The process execution schedule can be configured as a simple Cron job or by a more sophisticated pipeline scheduling system such as Apache Airflow or AWS Glue.
