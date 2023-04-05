# SQL - PostgreSQL - UPSERT

*Source: https://gist.github.com/nosamanuel/11260660*

````SQL
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
list from [[SQL - PostgreSQL - UPSERT]] AND -"Changelog"
````
