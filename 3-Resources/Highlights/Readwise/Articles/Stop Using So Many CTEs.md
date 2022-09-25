---
Date: 2022-09-03
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: medium
Link: https://medium.com/p/7d8aa686cbec
Tags: ["#Type/Highlight/Article"]
Aliases: ["Stop Using So Many CTEs", "Stop Using So Many CTEs"]
---
# Stop Using So Many CTEs

## Metadata
- Author: [[Claire Carroll]]
- Full Title: Stop Using So Many CTEs
- Category: #Type/Highlight/Article
- URL: https://medium.com/p/7d8aa686cbec

## Highlights
- While CTEs let you create a temporary, named result set that you can reference within the same query, Chained SQL lets you create a temporary, named result set that you can reference in any SQL query using the same data connection. This gives you all the benefits of using CTEs (modular, readable SQL), while also making exploratory and debugging workflows in data analytics much, much easier.
- CTE stands for “ Common Table Expression.” It’s the feature in SQL that lets you create a temporary, named result set that you can reference within the same query, usually used for creating conveniently organized intermediate data sets.
- In general, CTEs let analysts write queries that are more modular — breaking up complex logic into readable chunks. You’d be hard pressed to find someone using the modern data stack who isn’t pro-CTEs (myself included!), thanks to their reusability, readability, recursion, and referenceability.
- CTEs can only be referenced in the same query where you created the CTE. On the surface this isn’t such a huge problem, especially if you’re writing a smaller query with only 1 or 2 CTEs. But where CTEs start to fall apart is when you need to debug them.
- What if instead, you could break up your query into separate queries that chained on top of each other, and they all magically re-ran as soon as you updated one of the queries?
