# Better Extract/Transform/Load (ETL) Practices in Data Warehousing (Part 2 of 2)

## Metadata

* Author: [codemag.com]()
* Title: Better Extract/Transform/Load (ETL) Practices in Data Warehousing (Part 2 of 2)
* Reference: https://codemag.com/article/1803051
* Category: #Type/Highlight/Article

## Highlights

* Every aspect of data warehousing is about context. — [Updated on 2021-12-16 16:34:29](https://hyp.is/8wtqBl63EeyehxuF_naH5g/codemag.com/article/1803051)  — Group: #Topic/Dev

* Every aspect of data warehousing is about context. — [Updated on 2021-12-16 16:38:49](https://hyp.is/jj-ANF64Eey5ektbSkjeNA/codemag.com/article/1803051)  — Group: #Topic/Dev

* Common Mistakes in Data Warehousing and ETL Applications — [Updated on 2021-12-16 16:39:01](https://hyp.is/lSpo0l64EeypRqcaYehmMA/codemag.com/article/1803051)  — Group: #Topic/Dev

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
  Not running ideas by team members — [Updated on 2021-12-16 16:39:11](https://hyp.is/m2bMpF64Eeyghd_IyF00FA/codemag.com/article/1803051)  — Group: #Topic/Dev

* Not having a full understanding of the transactional grain (level of detail) of all source data: I can't stress enough that if you don't have a firm understanding of the grain and cardinality of the source data, you'll never be able to confidently design extract logic. — [Updated on 2021-12-16 16:39:39](https://hyp.is/rC6n0l64Eey5e-f0tQ7jJg/codemag.com/article/1803051)  — Group: #Topic/Dev

* Not retaining historical data: Here's a cautionary tale that every data warehouse person should remember. Years ago, a company wanted to do a complete refresh of data from the source systems. Unfortunately, the source system had archived their data, and as it turned out, some of the backup archives weren't available. (Yes, the situation was a mess). Had the ETL processes retained copies of what they'd extracted along the way before transforming any of the data in the staging area, the data warehouse team might not have needed to do a complete refresh from the source systems. If you're a DBA, you're probably feeling your blood pressure rising over the thought of storage requirements. Yes, good data warehouses sometimes need high storage capacity. — [Updated on 2021-12-16 16:39:56](https://hyp.is/tijmJl64Eey0Vsv-DtrzAw/codemag.com/article/1803051)  — Group: #Topic/Dev

* Agile methodologies, Sprint processes, and frequent meaningful prototypes are tools and approaches. By themselves, they don't guarantee success. — [Updated on 2021-12-16 16:40:03](https://hyp.is/ulcPol64EeyghmeS2tgySQ/codemag.com/article/1803051)  — Group: #Topic/Dev

* Operational Data Store (ODS) Databases — [Updated on 2021-12-16 16:40:17](https://hyp.is/wuXyyF64Eeydya9_pDbK8w/codemag.com/article/1803051)  — Group: #Topic/Dev

* So, when determining the anticipated growth of your databases, factor in these four items:

Any new or anticipated subject matter data, data feeds, etc.
Backups
Historical/periodic snapshots
Redundant information in staging areas and operational/intermediary areas — [Updated on 2021-12-16 16:40:43](https://hyp.is/0hJOLF64Eey0V6dhRKFiYg/codemag.com/article/1803051)  — Group: #Topic/Dev

* Change Data Capture and Temporal Tables and Their Place in the Data Warehouse Universe — [Updated on 2021-12-16 16:40:57](https://hyp.is/2pDHIl64Eey5fBvRKqj6OQ/codemag.com/article/1803051)  — Group: #Topic/Dev

* Implement database triggers to capture inserted/updated/deleted data.
  Implement logic in stored procedures (or in the application layer) to capture inserted/updated/deleted values.
  Purchase a third-party tool, such as SQLAudit. — [Updated on 2021-12-16 16:41:30](https://hyp.is/7jTX3F64EeyxCSt9MW3ZRg/codemag.com/article/1803051)  — Group: #Topic/Dev

* Data Lineage Documentation — [Updated on 2021-12-16 16:41:58](https://hyp.is/_sSMUF64Eey4olMBulJDPA/codemag.com/article/1803051)  — Group: #Topic/Dev

* Producing good documentation can be very time-consuming.
  Producing good (and up-to-date) documentation can be especially difficult if the team constantly faces change/enhancement requests.
  Different team members can have reasonable disagreements about what constitutes good and useful documentation. — [Updated on 2021-12-16 16:42:13](https://hyp.is/CAr_Ql65EeyKTTcyFlJSIg/codemag.com/article/1803051)  — Group: #Topic/Dev

* In some cases, I've been able to “cut to the chase” of hashing out business requirements by building prototypes and showing them to users. Without this approach, we might never have identified some of the more intricate details. — [Updated on 2021-12-16 16:42:45](https://hyp.is/Gs01ZF65EeyKTo_VCWD7sQ/codemag.com/article/1803051)  — Group: #Topic/Dev
