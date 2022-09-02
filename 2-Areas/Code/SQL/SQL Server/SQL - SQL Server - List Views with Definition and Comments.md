---
Date: 2022-09-02
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - SQL Server - List Views with Definition and Comments"]
---

# SQL - SQL Server - List Views with Definition and Comments

*Source: https://dataedo.com/blog/useful-sql-server-data-dictionary-queries-every-dba-should-have*

```SQL
select schema_name(v.schema_id) as schema_name,
       v.name as view_name,
       v.create_date as created,
       v.modify_date as last_modified,
       m.definition,
       ep.value as comments
  from sys.views v
       left join sys.extended_properties ep 
           on v.object_id = ep.major_id
          and ep.name = 'MS_Description'
          and ep.minor_id = 0
          and ep.class_desc = 'OBJECT_OR_COLUMN'
       inner join sys.sql_modules m 
           on m.object_id = v.object_id
 order by schema_name,
          view_name
```


***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[SQL Server]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - SQL Server - List Views with Definition and Comments]] AND -"Changelog"
```