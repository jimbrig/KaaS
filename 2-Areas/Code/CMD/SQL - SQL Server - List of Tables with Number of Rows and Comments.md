---
Date: 2022-09-02
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - SQL Server - List of Tables with Number of Rows and Comments"]
---

# SQL - SQL Server - List of Tables with Number of Rows and Comments

*Source: https://dataedo.com/blog/useful-sql-server-data-dictionary-queries-every-dba-should-have*

```SQL
select schema_name(tab.schema_id) as schema_name,
       tab.name as table_name, 
       tab.create_date as created,  
       tab.modify_date as last_modified, 
       p.rows as num_rows, 
       ep.value as comments 
  from sys.tables tab
       inner join (select distinct 
                          p.object_id,
                          sum(p.rows) rows
                     from sys.tables t
                          inner join sys.partitions p 
                              on p.object_id = t.object_id 
                    group by p.object_id,
                          p.index_id) p
            on p.object_id = tab.object_id
        left join sys.extended_properties ep 
            on tab.object_id = ep.major_id
           and ep.name = 'MS_Description'
           and ep.minor_id = 0
           and ep.class_desc = 'OBJECT_OR_COLUMN'
  order by schema_name,
        table_name
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
list from [[SQL - SQL Server - List of Tables with Number of Rows and Comments]] AND -"Changelog"
```