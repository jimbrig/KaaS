# An Introduction to SQL Design Patterns and Best Practices

## Metadata

* Author: *Ergest Xheblati*
* Full Title: An Introduction to SQL Design Patterns and Best Practices
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/169891b4e27f

## Highlights

* Experienced analysts and data scientists are able to solve complex queries quickly because they’ve built up a collection of patterns and best practices that go beyond the SQL syntax. They use these patterns to break down these complex queries into simple elements and solve them quickly.
* Top 10 SQL Design Patterns and Best Practices
* Pattern 1: Always use CTEs
* When writing a complex query it’s a good idea to break it down into smaller components. As tempting as it might be to solve the query in one step don’t. CTEs make your query easier to write and maintain in the future.
* CTEs or Common Table Expressions are SQL queries you define inside a query and use as a temporary result. They help by breaking down large complex queries into easier, more manageable ones.
* Pattern 2: Keep CTEs small and single purpose
* Your CTEs needs to be an encapsulated logical components that help you build your final query quickly and easily. They shouldn’t try to do too much. You can then mix and match the CTEs to solve just about any data request. This also makes the CTEs easy to test as you build them.
* You can do just about anything you can do in SQL inside a CTE:
* Pre-Filter data to the desired subset before joining later, which speeds up queries
* Pre-Aggregate data in order to create custom groupings used later
* Pre-Calculate a metric that’s used later in another calculation
* Pattern 3: Start with the ground truth
* The ground truth means to start with definitions. The definitions will lead you to the tables you will then need to build your final query.
* Pattern 4: Combine CTEs to solve any query
* As we talked about earlier you can combine multiple CTEs to build up a solution to a complex query.
* Pattern 5: Don’t Repeat Yourself (DRY)
* If you find yourself joining the same table multiple times or doing the same calculation, aggregation or filtering, that query chunk should be placed in a CTE. Not only does this refactoring make the code easier to read, but it can also identify chunks of code that could be used across multiple queries which can be made into views.
* Pattern 6: Don’t mix layers of abstraction
* Pattern 7: Reduce your data before joining
* Pattern 8: Only work with the smallest subset of columns you need
* Pattern 9: Expect the unexpected
* Pattern 10: Start with a left join
* By starting with a left join, you ensure that your query remains robust to future data changes.
