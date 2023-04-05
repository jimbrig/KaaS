# SQL - SQL Server - Table and Column Details

*Source: https://dataedo.com/blog/useful-sql-server-data-dictionary-queries-every-dba-should-have*

````SQL
select schema_name(tab.schema_id) as schema_name,
       tab.name as table_name, 
       col.name as column_name, 
       t.name as data_type,    
       t.name + 
       case when t.is_user_defined = 0 then 
                 isnull('(' + 
                 case when t.name in ('binary', 'char', 'nchar', 
                           'varchar', 'nvarchar', 'varbinary') then
                           case col.max_length 
                                when -1 then 'MAX' 
                                else 
                                     case when t.name in ('nchar', 
                                               'nvarchar') then
                                               cast(col.max_length/2 
                                               as varchar(4)) 
                                          else cast(col.max_length 
                                               as varchar(4)) 
                                     end
                           end
                      when t.name in ('datetime2', 'datetimeoffset', 
                           'time') then 
                           cast(col.scale as varchar(4))
                      when t.name in ('decimal', 'numeric') then
                            cast(col.precision as varchar(4)) + ', ' +
                            cast(col.scale as varchar(4))
                 end + ')', '')        
            else ':' + 
                 (select c_t.name + 
                         isnull('(' + 
                         case when c_t.name in ('binary', 'char', 
                                   'nchar', 'varchar', 'nvarchar', 
                                   'varbinary') then 
                                    case c.max_length 
                                         when -1 then 'MAX' 
                                         else   
                                              case when t.name in 
                                                        ('nchar', 
                                                        'nvarchar') then 
                                                        cast(c.max_length/2
                                                        as varchar(4))
                                                   else cast(c.max_length
                                                        as varchar(4))
                                              end
                                    end
                              when c_t.name in ('datetime2', 
                                   'datetimeoffset', 'time') then 
                                   cast(c.scale as varchar(4))
                              when c_t.name in ('decimal', 'numeric') then
                                   cast(c.precision as varchar(4)) + ', ' 
                                   + cast(c.scale as varchar(4))
                         end + ')', '') 
                    from sys.columns as c
                         inner join sys.types as c_t 
                             on c.system_type_id = c_t.user_type_id
                   where c.object_id = col.object_id
                     and c.column_id = col.column_id
                     and c.user_type_id = col.user_type_id
                 )
        end as data_type_ext,
        case when col.is_nullable = 0 then 'N' 
             else 'Y' end as nullable,
        case when def.definition is not null then def.definition 
             else '' end as default_value,
        case when pk.column_id is not null then 'PK' 
             else '' end as primary_key, 
        case when fk.parent_column_id is not null then 'FK' 
             else '' end as foreign_key, 
        case when uk.column_id is not null then 'UK' 
             else '' end as unique_key,
        case when ch.check_const is not null then ch.check_const 
             else '' end as check_contraint,
        cc.definition as computed_column_definition,
        ep.value as comments
   from sys.tables as tab
        left join sys.columns as col
            on tab.object_id = col.object_id
        left join sys.types as t
            on col.user_type_id = t.user_type_id
        left join sys.default_constraints as def
            on def.object_id = col.default_object_id
        left join (
                  select index_columns.object_id, 
                         index_columns.column_id
                    from sys.index_columns
                         inner join sys.indexes 
                             on index_columns.object_id = indexes.object_id
                            and index_columns.index_id = indexes.index_id
                   where indexes.is_primary_key = 1
                  ) as pk 
            on col.object_id = pk.object_id 
           and col.column_id = pk.column_id
        left join (
                  select fc.parent_column_id, 
                         fc.parent_object_id
                    from sys.foreign_keys as f 
                         inner join sys.foreign_key_columns as fc 
                             on f.object_id = fc.constraint_object_id
                   group by fc.parent_column_id, fc.parent_object_id
                  ) as fk
            on fk.parent_object_id = col.object_id 
           and fk.parent_column_id = col.column_id    
        left join (
                  select c.parent_column_id, 
                         c.parent_object_id, 
                         'Check' check_const
                    from sys.check_constraints as c
                   group by c.parent_column_id,
                         c.parent_object_id
                  ) as ch
            on col.column_id = ch.parent_column_id
           and col.object_id = ch.parent_object_id
        left join (
                  select index_columns.object_id, 
                         index_columns.column_id
                    from sys.index_columns
                         inner join sys.indexes 
                             on indexes.index_id = index_columns.index_id
                            and indexes.object_id = index_columns.object_id
                    where indexes.is_unique_constraint = 1
                    group by index_columns.object_id, 
                          index_columns.column_id
                  ) as uk
            on col.column_id = uk.column_id 
           and col.object_id = uk.object_id
        left join sys.extended_properties as ep 
            on tab.object_id = ep.major_id
           and col.column_id = ep.minor_id
           and ep.name = 'MS_Description'
           and ep.class_desc = 'OBJECT_OR_COLUMN'
        left join sys.computed_columns as cc
            on tab.object_id = cc.object_id
           and col.column_id = cc.column_id
  order by schema_name,
        table_name, 
        column_name;   
````

---

## Appendix: Links

* *Code*
* [SQL](SQL.md)
* [Databases](../../MOCs/Databases.md)
* [SQL Server](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/SQL%20Server.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[SQL - SQL Server - Table and Column Details]] AND -"Changelog"
````
