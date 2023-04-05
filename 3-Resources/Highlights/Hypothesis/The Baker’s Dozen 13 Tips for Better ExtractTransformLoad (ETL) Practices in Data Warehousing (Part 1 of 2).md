# The Baker’s Dozen: 13 Tips for Better Extract/Transform/Load (ETL) Practices in Data Warehousing (Part 1 of 2)

## Metadata

* Author: [codemag.com]()
* Title: The Baker’s Dozen: 13 Tips for Better Extract/Transform/Load (ETL) Practices in Data Warehousing (Part 1 of 2)
* Reference: https://www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2
* Category: #Type/Highlight/Article

## Highlights

* Fact tables contain the measures that users want to aggregate (sales, quantities, costs, etc.).
  Dimension tables contain the master table business entities (product categories, customer markets, etc.).
  As a starter, link fact tables and dimension tables are linked by surrogate integer keys.
  Dimensional modeling relates to how you specifically define and relate these tables so that the business people can use the data to answer many questions, such as viewing aggregations by this business entity, by that business entity, over time, etc. Within those scenarios, there are a myriad of possibilities. The Kimball methodology shows many patterns for covering these possibilities. — [Updated on 2021-12-16 16:25:06](https://hyp.is/o4SsUF62Eeyj6_v-aiMWpw/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev
  * Tags: #Topic/Dev/Data #Topic/Dev/Cloud #Topic/Dev/Data #Topic/Dev 
  * Annotation: Regarding Data Warehousing and ETL.

Fact Tables: Measures that get aggregated (i.e. values)

Dimension Tables: Categorical attributes that represent various business entities

Fact Tables \<-> Dimension Tables through surrogate integer keys- By populating even a handful of rows, ETL developers have a model to use for populating actual rows. Report designers who need to create reports in parallel with ETL efforts can get a head start on report development. — [Updated on 2021-12-16 16:26:05](https://hyp.is/xsCGnl62EeyMuyONksm-jg/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* Define a High-Level Roadmap of Physical Data Sources and ETL Processes — [Updated on 2021-12-16 16:26:19](https://hyp.is/zxfrrF62Eey-tC-7Ff4KCA/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* Profile Source Data and Define Source Primary Keys — [Updated on 2021-12-16 16:27:06](https://hyp.is/6v0bHF62EeyQKnNZtE1iTw/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* there will be a discovery phase for studying the source system — [Updated on 2021-12-16 16:27:17](https://hyp.is/8glNXl62EeyQLNvDBX2pJQ/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* By the time I'm finished with the discovery phase, I've created dozens of profiling queries to validate what the DBAs for the source system have told me. If you can quickly and effectively pound out SQL queries, it'll help you as an ETL developer. For my current ETL project, I have over 100 SQL queries to profile and sanity-check source data and ETL results. — [Updated on 2021-12-16 16:27:45](https://hyp.is/ArDnAl63EeygH9f8uLl_QA/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* Related to this, it's absolutely imperative that you identify primary key definitions in every source table, and also everything associated with those key definitions. You can't possibly hope to read source data into a data warehouse correctly if you don't know the grain statement (granularity) of the rows in every table. Beware, though. On more than one occasion, the source system DBA inadvertently gave me information on a uniquely defined row that turned out to be inaccurate/incomplete. Trust but verify! — [Updated on 2021-12-16 16:27:56](https://hyp.is/CM9XaF63EeySy4_V19YQ8w/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* Define Extract Logic — [Updated on 2021-12-16 16:28:01](https://hyp.is/DCxCwl63Eeyqqz_9545dgw/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* Extracting data from source systems is the proverbial heart of the ETL system. — [Updated on 2021-12-16 16:28:10](https://hyp.is/EagTSF63Eeywar8qqD_DPg/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* Here's a checklist of major items and things to consider:

Deciding between “Truncate and Load” (T&L) versus incremental extracts. Don't scoff at T&L - if a source table is fewer than 100,000 rows, it's usually harmless. But because many source tables are hundreds of thousands or millions of rows (or more), you need to extract incrementally, based on the last time the system extracted data.
Most incremental extract scenarios use a last date modified/timestamp column. However, in some cases, a source system doesn't have a timestamp column, and you'll need to rely on a transaction date that the source system might back-date. For instance, I had a client with an invoice table that only stored the invoice date but no timestamp. We couldn't rely solely on the invoice date value with respect to the date of the last extract, because the client sometimes posted an invoice date from several days before. We had to be conservative and extract all invoices with an invoice date in the last seven days. Yes, we extracted more than we needed, but it was safe.
It should go without saying that your testing of extract logic should include verification procedures. I'll talk about that in Tip #10.
Make sure to profile how long your extract processes take. Although you might not be able to control it, there's always the chance that additional indexes in the source system can help with extract performance.
Here's one you might not immediately think of: the default isolation level of the source database when querying from a source system! If you're extracting during the day/normal business hours, your extract queries can't disrupt the existing OLTP processes.
Finally, make sure you understand as much as possible about the source system. Does it use Triggers or Change Data Capture or any other mechanism to log source system updates? Does it effectively use timestamps? Are there ever situations where source system DBAs manually update key tables without setting the timestamps? Does the source system have referential integrity? How does the source system handle cascading updates? These are things every ETL developer should know. — [Updated on 2021-12-16 16:29:51](https://hyp.is/TWH49F63Eeygd1_GrBLlBw/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* Annotation: * Truncate and Load vs. Incremental Extracts

* Verification of extract logic through tests
* Profile how long extraction takes
* Isolation level of source database when querying from source system- “Water freezes at 32 degrees.” You might think you've accounted for every extract scenario (and therefore frozen the water), when in fact the water is still 34 degrees because you've left one extract scenario warm. Find that freezing point where you have everything “down cold.” — [Updated on 2021-12-16 16:30:11](https://hyp.is/WU98Xl63EeyyfANam72Ndg/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* Identify Any Specific Data Type Challenges — [Updated on 2021-12-16 16:30:17](https://hyp.is/XPWpWl63EeyehetniRpQMg/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* Identify Scenarios When Source Systems Delete Data — [Updated on 2021-12-16 16:30:44](https://hyp.is/bPAgVl63EeyeT8dtOKXyaA/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* If you're designing a transaction OLTP system, consider how outside systems can identify and retrieve all of the DML activities in your system. — [Updated on 2021-12-16 16:31:03](https://hyp.is/eMAUcl63Eey5YvOdD0weJA/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* Baker's Dozen Spotlight: Collecting All Activity in ETL Logs — [Updated on 2021-12-16 16:31:16](https://hyp.is/f_u6NF63Eey5Y68M4cueKg/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* There are many ingredients in a good data warehouse. An important one is brainstorming sessions over different ETL components. I love whiteboard sessions where the team thinks through every possible scenario and solution. One of my favorite types of brainstorming sessions is on what to capture in ETL audit logs. Just like Windows Event logs and network logs tell us nearly every system activity that occurred days or weeks ago, ETL logs can store all sorts of information, such as:

When extracts occurred and how long they took to execute (so that you can view extract performance over time)
The number of rows inserted/changed/flagged for deletion
Any errors (either system errors, or simply validation errors because the ETL rejected certain rows)
The keys generated from insertions

ETL and Data Warehouse log files are like auto insurance. You put time and money into them for months or even years, possibly without incident. But just like insurance, when you need the contents of a log for an extract three weeks ago, you really need it!
As much as possible, stop and think about all the times you might want to go back and say, “On this date, how many rows did we do such and such?” — [Updated on 2021-12-16 16:31:36](https://hyp.is/jCT8Jl63EeyiT_d-vfHj9w/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* Capturing Periodic Snapshots of Data — [Updated on 2021-12-16 16:31:41](https://hyp.is/jx9zFl63EeyIjr99V4w1yA/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* Make sure to factor snapshots into any physical capacity planning of your database size. — [Updated on 2021-12-16 16:31:47](https://hyp.is/kwU8Xl63EeygMi9HkB_EmQ/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* Source System Verifications — [Updated on 2021-12-16 16:31:52](https://hyp.is/leWrFl63Eeyln2dhryNMLw/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* If users come to you saying that your new system is wrong because the source system shows different numbers, you want to be prepared. If you're doing systematic source verification checks, you can stay on top of it. — [Updated on 2021-12-16 16:31:59](https://hyp.is/mZtAQF63EeyLxD-nlTCyXw/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* Messaging and Alerts — [Updated on 2021-12-16 16:32:02](https://hyp.is/m2hxwl63EeyMv5dHGBBg7Q/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* Scheduling, Source Dependencies, and Parallelism — [Updated on 2021-12-16 16:32:24](https://hyp.is/qP8bxF63Eeyw1VtwG21tFw/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* Miscellaneous ETL thoughts — [Updated on 2021-12-16 16:32:31](https://hyp.is/rQr_RF63EeyLxafPIKkaYQ/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* Avoid row-by-row ETL operations on large tables. The great SQL author Joe Celko has written many books and articles that demonstrate set-based solutions for querying data. Row-by-row processes won't scale well. Yes, that means you might need to analyze queries and perhaps investigate index strategies; badly-implemented queries can perform WORSE than row-by-row operations. Still, a well-designed set-based solution is best. — [Updated on 2021-12-16 16:32:44](https://hyp.is/tHmlMl63Eey5dYdb8xtM7Q/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* A related note: Although I'll talk about this in more detail in the second part of this article, I definitely recommend spending some time researching the in-memory optimizations that Microsoft implemented in SQL Server 2014 (and greatly enhanced in SQL 2016). Even if you only use in-memory optimized tables to speed up staging table operations, the functionality can have a big positive impact on ETL processing time. — [Updated on 2021-12-16 16:32:54](https://hyp.is/uqCTCF63Eey3y1ep8BrXRg/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* As difficult as it might seem, maintain the documentation on data lineage. Imagine if someone asks a question, “For data warehouse column ABC or data warehouse report XYZ, where does that come from in the source system?” If your answer is, “Let me check the code,” there's failure here. — [Updated on 2021-12-16 16:32:59](https://hyp.is/vdr7qF63EeyxBSusvAYseA/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* If your ETL fails midway through the process, can you restart at the point of failure? The answer to this and related questions will probably indicate how modularly you've built your procedures. Although database environments and ETL tools are usually not object-oriented the way development languages can be, there's no reason you can't build ETL components that will stand up to the vetting of fire-drill testing. — [Updated on 2021-12-16 16:33:04](https://hyp.is/wJxsll63Eeygewf4Pllhgg/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* Keep a log of every time you stopped to make sure an ETL process ran correctly. Additionally, keep a log of every time you had to fix a bug/mistake that you realistically could have prevented. Add up the number of instances and minutes/hours over the course of a month. I'm not saying that it should be zero every month, but more than a handful means that you should look at system checks and notifications. Good systems don't require babysitting, and watching over late-night processes like Batman keeping an eye on Gotham isn't heroic. It's ultimately harmful. Yes, you might need to take days or even weeks to come up with better solutions. You might even need to fight a manager or team lead who balks at committing time. Here's where you fight them at their own game, by documenting the hours of lost productivity. — [Updated on 2021-12-16 16:33:15](https://hyp.is/xyyuGF63EeyNzB9uFHoq7Q/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev

* Never assume that you're extracting/receiving data during ETL processes in a timely fashion. The source data might contain effective dates, and you might be receiving “late-arriving data.” If your ETL processes include logic for effective dates and you receive data later than the effective date, your ETL might need to make adjustments. I recommend doing some Web searches on “Type 2 changing dimensions” and “late-arriving data” for more information on this specific ETL pattern. — [Updated on 2021-12-16 16:33:16](https://hyp.is/x_1l0F63Eeyuk8M7ar_ifw/www.codemag.com/Article/1709051/The-Baker%E2%80%99s-Dozen-13-Tips-for-Better-Extract-Transform-Load-ETL-Practices-in-Data-Warehousing-Part-1-of-2)  — Group: #Topic/Dev
