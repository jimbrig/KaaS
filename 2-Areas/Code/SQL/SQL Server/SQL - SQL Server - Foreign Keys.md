---
Date: 2022-09-02
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - SQL Server - Foreign Keys"]
---

# SQL - SQL Server - Foreign Keys

*Source: *

```SQL
select schema_name(tab.schema_id) as table_schema_name,
       tab.name as table_name,
       col.name as column_name,
       fk.name as constraint_name,
       schema_name(tab_prim.schema_id) as primary_table_schema_name,
       tab_prim.name as primary_table_name,
       col_prim.name as primary_table_column, 
       schema_name(tab.schema_id) + '.' + tab.name + '.' + 
            col.name + ' = ' + schema_name(tab_prim.schema_id) + '.' + 
            tab_prim.name + '.' + col_prim.name as join_condition,
       case
            when count(*) over (partition by fk.name) > 1 then 'Y'
            else 'N'
       end as complex_fk,
       fkc.constraint_column_id as fk_part
  from sys.tables as tab
       inner join sys.foreign_keys as fk
           on tab.object_id = fk.parent_object_id
       inner join sys.foreign_key_columns as fkc
           on fk.object_id = fkc.constraint_object_id
       inner join sys.columns as col
           on fkc.parent_object_id = col.object_id
          and fkc.parent_column_id = col.column_id
       inner join sys.columns as col_prim
           on fkc.referenced_object_id = col_prim.object_id
          and fkc.referenced_column_id = col_prim.column_id
       inner join sys.tables as tab_prim
           on fk.referenced_object_id = tab_prim.object_id
 order by table_schema_name,
       table_name, 
       primary_table_name, 
       fk_part;
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
list from [[SQL - SQL Server - Foreign Keys]] AND -"Changelog"
```