---
Date: 2021-11-12
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev", "#Topic/Actuarial"]
Alias: "Loss Triangles"
---

# Loss Triangles

*Source: [Loss Triangle |](http://www.hbactuarial.com/274-2/)*

## Definition

A loss triangle is the primary method in which actuaries organize claims data that will be used in an actuarial analysis. 

The reason it is called a loss triangle is that a typical submission of claim data from a client company shows numeric values forming a triangle when viewed.

## Example

The easiest loss triangle to explain is the accident year paid loss triangle. This loss triangle totals paid loss data in each of two categories. The first is accident year. Simply put, all paid losses from all claims occurring in the accident year are totaled. Now keep in mind, these losses are cumulative, not incremental. This means loss payments are included regardless of when the payment was made. The only thing that determines the accident year of a claim payment is the year of the accident. For example, James Slipsalot  fell down on the job in 2004 and became permanently injured. All loss payments for Mr. Slipsalot’s claim are included in accident year 2004 paid losses. If you are instructed to calculate accident year 2004 losses, you must add all of the payments to that worker that have ever been made, not just the payments made in 2004, or the payments made in the current year. You must include the payments to Mr. Slipsalot even if the claim has been closed for several years.

The second category that claim data is organized by is called “age”. Age, in this context, is the number of years from the beginning of the accident year to the moment of the last transaction in your database. So, let’s say $75,000 was paid for Mr. Slipsalot’s claim in 2004(mostly medical); then in each subsequent  year an additional $30,000 (mostly indemnity) has been paid; he is relatively young, so you expect that these $30,000 claim payments will continue for the next 30 years. For this claim the information can be presented as follows:

<center>

| Accident Year | Age | Valuation Year | Paid Losses |
| :-------------: | :---: | :--------------: | :-----------: |
| 2004          | 1   | 2004           | 75,000      |
| 2004          | 2   | 2005           | 105,000     |
| 2004          | 3   | 2006           | 135,000     |
| 2004          | 4   | 2007           | 165,000     |
| 2004          | 5   | 2008           | 195,000     |
| 2004          | 6   | 2009           | 225,000     |
| 2004          | 7   | 2010           | 255,000     |
| 2004          | 8   | 2011           | 285,000     |
| 2004          | 9   | 2012           | 315,000     |
| 2004          | 10  | 2013           | 345,000     |
| 2004          | 11  | 2014           | 375,000     |


#### Related

- [[Development]]
- [[Actuarial Science]]


*Backlinks:*

```dataview
list from [[Loss Triangles]] AND -"Changelog"
```