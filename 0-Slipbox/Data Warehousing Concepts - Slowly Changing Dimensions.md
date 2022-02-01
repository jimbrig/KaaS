---
Date: 2022-02-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev"]
Alias: "Data Warehousing Concepts - Slowly Changing Dimensions"
---

# Data Warehousing Concepts - Slowly Changing Dimensions

There are six types (Type 1 thru Type 6) of *Slowly Changing Dimensions* (SCD) operations and transformers that enable you to handle and implement two common SCD Types: Type 1 and Type 2

**Type 1 SCD** — Doesn’t require history of dimension changes to be maintained and the old dimension value is simply overwritten with the new one. This type of operation is easy to implement (similar to a normal SQL update) and is often used for things like removing special characters, correcting typos and spelling mistakes in record field values.

**Type 2 SCD** — Requires maintaining history of all changes made to each key in a dimensional table. Here are some challenges involved when manually dealing with Type 2 SCD:

-   Every process that updates these tables has to honor the Type 2 SCD pattern of expiring old records and replacing them with new ones
-   There might not be a built-in constraint to prevent overlapping start and end dates for a given dimension key
-   When converting an existing table to a Type 2 SCD, it will most likely require you to update every single query that reads from or writes to that table
-   Every query against that table will need to account for the historical Type 2 SCD pattern by filtering only for current data or for a specific point in time

As you can imagine, Type 2 SCD operations can become complex and hand-written code, SQL queries, etc. may not scale and can be difficult to maintain.

## One-Time Migration - File Based (Batch Mode)

Let’s first take a very simple yet concrete example of managing customer records (with updates to addresses) for existing and new customers. In this case, the assumption is that the destination is empty so it’s more of a one-time migration scenario for ingesting "master" and "change" records from respective origins to a new file destination.

This scenario involves:

-   Creating one record for every row in “master” origin
-   Creating one record for every row in “change” origin
    -   New customers: Version set to 1 where customer id doesn’t exist in “master” origin
    -   Existing customers: Version set to current value in “master” origin + 1 where customer id exists in “master” origin

*Backlinks:*

```dataview
list from [[Data Warehousing Concepts - Slowly Changing Dimensions]] AND -"Changelog"
```