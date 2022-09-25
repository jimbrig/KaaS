---
Date: 2022-03-02
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL - UPSERT"]
---

# SQL - PostgreSQL - UPSERT

*Source: https://gist.github.com/nosamanuel/11260660*

```SQL
create table foo (id serial primary key, data json);

with updated_foo as (
    update foo set data = '"bar"' where id = 1
    returning id
)
insert into foo (id, data)
select 1, '"foo"'
where not exists(select id from updated_foo);

-- data is inserted with value "foo"

with updated_foo as (
    update foo set data = '"bar"' where id = 1
    returning id
)
insert into foo (id, data)
select 1, '"foo"'
where not exists(select id from updated_foo);

-- data is updated with value "bar"
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
list from [[SQL - PostgreSQL - UPSERT]] AND -"Changelog"
```