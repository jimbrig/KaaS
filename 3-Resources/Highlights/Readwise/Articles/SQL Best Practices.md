# SQL Best Practices

## Metadata

* Author: *Brandon Southern*
* Full Title: SQL Best Practices
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/e1c61e96ee27

## Highlights

* Formatting
* The first thing that I’d like to talk about is formatting. Code should be well formatted and visually appealing, which makes it very easy to read. Having properly formatted code we pay off when it comes to debugging, troubleshooting, and modifying your code.
* Alignment
* One Item Per Line
* Bad Practice — Multiple Case Conditions on a single line
* Best Practice — Multiple Case Conditions on Multiple Lines
* Commenting Code
* Common Table Expressions (CTE)
* Common table expressions or CTEs are a way of creating an in-memory table of your query results. This table can then be used throughout the rest of your SQL script. The benefit to using a CTE is that you can reduce code duplication, make your code more readable, and increase your ability to perform QA checks on your results.
* It’s really hard to perform a QA on the sub queries and inspect the results. For example, what if we wanted to run a some counts on the number of users that have multiple records for default screens? We can’t easily just execute some sql against the sub query. We’d have to copy/paste the sub query and then modify it to perform this qa. It would be much better if we could avoid changing code during our QA process.
* If we need to utilize this users sub-query elsewhere in our code, we’d have to re-write or copy/paste that block of code to other places in our script. This would not be a DRY (don’t repeat yourself)
* More cycles on the database. Each time that the subquery is execute it performs table scans to return results. With our users subquery containing wildcard conditions, the database is going to have a fair amount of work to do. It’s much cheaper (CPU cycles and dollars if you’re using cloud databases) to perform the subquery once, store it in memory and then just re-use the result set as needed in your code.
* More complex to read the entire block of code and understand what is being performed and why. While it is possible to scroll through the code, it may be hard to easily comprehend what is happening. Generally speaking, if you have to vertically scroll your code on your monitor, your code is too way too long and should be refactored to smaller components.
* You should never write queries with “select \*”. I
* Database performance. Returning columns that aren’t needed is more expensive than querying only the columns that you care about.
* Challenges debugging. Assuming that you’re using CTEs as described in the previous section, it can be very challenging to trace the origins of certain attributes.
* Tables change. Even if you actually need to select all columns, there’s no guarantee that your table won’t change over time. And as the table changes you’ll be querying new data that was never intended which could possibly break code elsewhere, cause confusion, or impact database performance and costs.
* Aliasing is very important to help readers understand where elements reside and what tables are being used. When aliases aren’t used or poor naming conventions are used, complexity is increased, and the reading/comprehension of code is reduced.
* Leading vs Lagging Commas
* Bad Practice — Trailing Comma
* Best Practice — Leading Comma
* Best Practice — Lowercase
* Group By — Numbers vs Explicit Fields
* I almost always perform my group by with explicit field names as opposed to the position number in the select statement. While this doesn’t have any bering on the results I have found that it saves me time when when it comes to typing and debugging. Normally I’d prefer to just use the numbers because it’s less text on the page but it has caused too many issues and time spent chasing down run-time bugs.
