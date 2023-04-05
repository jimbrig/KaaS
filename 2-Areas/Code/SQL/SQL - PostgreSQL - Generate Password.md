# SQL - PostgreSQL - Generate Password

*Source: [postgres_dba/generate_password.sql at master · NikolayS/postgres_dba](https://github.com/NikolayS/postgres_dba/blob/master/misc/generate_password.sql)*

````SQL
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
````

---

## Appendix: Links

* *Code*
* [SQL](SQL.md)
* [Databases](../../MOCs/Databases.md)
* [PostgreSQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[SQL - PostgreSQL - Generate Password]] AND -"Changelog"
````
