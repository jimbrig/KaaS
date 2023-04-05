# Better Extract/Transform/Load (ETL) Practices in Data Warehousing

## Metadata

* Author: *codemag.com*
* Full Title: Better Extract/Transform/Load (ETL) Practices in Data Warehousing
* Category: #Type/Highlight/Article
* URL: https://codemag.com/article/1803051

## Highlights

* Every aspect of data warehousing is about context.
* Common Mistakes in Data Warehousing and ETL Applications
* Insufficient Logging
  Insufficient time spent vetting and testing the incremental extract process
  Insufficient time spent profiling the source data
  Not having a full understanding of the transactional grain (level of detail) of all source data
  Not taking enough advantage of newer technologies
  Less than optimal SQL code in the ETL layer
  Uneasiness/challenges in getting the business to agree on rules
  Not retaining historical data
  Building a solution that works but doesn't get used
  Not using the Kimball model (or any model) and not using accepted patterns
  Not running ideas by team members
* Not having a full understanding of the transactional grain (level of detail) of all source data: I can't stress enough that if you don't have a firm understanding of the grain and cardinality of the source data, you'll never be able to confidently design extract logic.
* Not retaining historical data: Here's a cautionary tale that every data warehouse person should remember. Years ago, a company wanted to do a complete refresh of data from the source systems. Unfortunately, the source system had archived their data, and as it turned out, some of the backup archives weren't available. (Yes, the situation was a mess). Had the ETL processes retained copies of what they'd extracted along the way before transforming any of the data in the staging area, the data warehouse team might not have needed to do a complete refresh from the source systems. If you're a DBA, you're probably feeling your blood pressure rising over the thought of storage requirements. Yes, good data warehouses sometimes need high storage capacity.
* Agile methodologies, Sprint processes, and frequent meaningful prototypes are tools and approaches. By themselves, they don't guarantee success.
* Operational Data Store (ODS) Databases
* So, when determining the anticipated growth of your databases, factor in these four items:
  Any new or anticipated subject matter data, data feeds, etc.
  Backups
  Historical/periodic snapshots
  Redundant information in staging areas and operational/intermediary areas
* Change Data Capture and Temporal Tables and Their Place in the Data Warehouse Universe
* Implement database triggers to capture inserted/updated/deleted data.
  Implement logic in stored procedures (or in the application layer) to capture inserted/updated/deleted values.
  Purchase a third-party tool, such as SQLAudit.
* Data Lineage Documentation
* Producing good documentation can be very time-consuming.
  Producing good (and up-to-date) documentation can be especially difficult if the team constantly faces change/enhancement requests.
  Different team members can have reasonable disagreements about what constitutes good and useful documentation.
* In some cases, I've been able to “cut to the chase” of hashing out business requirements by building prototypes and showing them to users. Without this approach, we might never have identified some of the more intricate details.
