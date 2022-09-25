---
Date: 2022-03-09
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL - Generate Password"]
---

# SQL - PostgreSQL - Generate Password

*Source: [postgres_dba/generate_password.sql at master · NikolayS/postgres_dba](https://github.com/NikolayS/postgres_dba/blob/master/misc/generate_password.sql)*


```SQL
-- WARNING: random() that is used here is not cryptographically strong – 
-- if an attacker knows one value, it's easy to guess the "next" value
-- TODO: rework to use pgcrypto instead

with init(len, arr) as (
  -- edit password length and possible characters here
  select 16, string_to_array('123456789abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ', null)
), arrlen(l) as (
  select count(*)
  from (select unnest(arr) from init) _
), indexes(i) as (
  select 1 + int4(random() * (l - 1))
  from arrlen, (select generate_series(1, len) from init) _
), res as (
  select array_to_string(array_agg(arr[i]), '') as password
  from init, indexes
)
select password--, 'md5' || md5(password || {{username}}) as password_md5
from res
;
```


***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[PostgreSQL]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - PostgreSQL - Generate Password]] AND -"Changelog"
```