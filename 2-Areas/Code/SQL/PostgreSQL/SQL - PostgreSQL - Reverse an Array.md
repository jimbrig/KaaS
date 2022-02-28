---
Date: 2022-02-27
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL - Reverse an Array"]
---

# SQL - PostgreSQL - Reverse an Array

*Source: [sql-snippets/array-reverse.md at main · count/sql-snippets (github.com)](https://github.com/count/sql-snippets/blob/main/postgres/array-reverse.md)*

Explore this snippet [here](https://count.co/n/aDl6lXQKQdx?vm=e).

## Description
There is no built-in function for reversing an array, but it is possible to construct one using the `generate_subscripts` function:

```sql
with data as (select array[1, 2, 3, 4] as nums)

select
  array(
    select nums[i]
    from generate_subscripts(nums, 1) as indices(i)
    order by i desc
  ) as reversed
from data
```


## References

- PostgreSQL wiki [https://wiki.postgresql.org/wiki/Array_reverse](https://wiki.postgresql.org/wiki/Array_reverse)


***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[PostgreSQL]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - PostgreSQL - Reverse an Array]] AND -"Changelog"
```