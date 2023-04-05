# SQL - SQL Server - Views Columns

\*Source: *

````SQL
select schema_name(v.schema_id) as schema_name,
       v.name as view_name, 
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
                                     case 
                                         when t.name in ('nchar', 
                                              'nvarchar') then
                                              cast(col.max_length/2 
                                              as varchar(4))
                                         else cast(col.max_length 
                                              as varchar(4))
                                     end
                           end
                      when t.name in ('datetime2', 
                           'datetimeoffset', 'time') then 
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
                                        else case when t.name in
                                                       ('nchar',
                                                        'nvarchar')
                                                  then cast(c.max_length/2
                                                       as varchar(4))
                                                  else cast(c.max_length
                                                       as varchar(4))
                                             end
                                   end
                              when c_t.name in ('datetime2', 
                                   'datetimeoffset', 'time') then
                                   cast(c.scale as varchar(4))
                              when c_t.name in ('decimal', 'numeric') then
                                   cast(c.precision as varchar(4)) +
                                   ', ' + cast(c.scale as varchar(4))
                         end + ')', '')
                    from sys.columns as c
                         inner join sys.types as c_t 
                             on c.system_type_id = c_t.user_type_id
                   where c.object_id = col.object_id
                     and c.column_id = col.column_id
                     and c.user_type_id = col.user_type_id
                 ) 
       end as data_type_ext,
       case when col.is_nullable = 0 then 'N' else 'Y' end as nullable,
       ep.value as comments
  from sys.views as v
       join sys.columns as col
           on v.object_id = col.object_id
       left join sys.types as t
           on col.user_type_id = t.user_type_id
       left join sys.extended_properties as ep 
           on v.object_id = ep.major_id
          and col.column_id = ep.minor_id
          and ep.name = 'MS_Description'        
          and ep.class_desc = 'OBJECT_OR_COLUMN'
 order by schema_name,
       view_name,
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
list from [[SQL - SQL Server - Views Columns]] AND -"Changelog"
````
