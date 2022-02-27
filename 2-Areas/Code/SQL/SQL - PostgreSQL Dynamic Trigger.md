---
Date: 2022-02-23
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL Dynamic Trigger"]
---

# SQL - PostgreSQL Dynamic Trigger

*Source: https://wiki.postgresql.org/wiki/PL/pgSQL_Dynamic_Triggers*

```SQL
EXECUTE 'SELECT (' ||
         quote_literal(NEW) || '::' || TG_RELID::regclass ||
         ').' || quote_ident(columnname)
         INTO var;
```

```SQL
CREATE OR REPLACE FUNCTION dynamic_trigger()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
    ri RECORD;
    t TEXT;
BEGIN
    RAISE NOTICE E'\n    Operation: %\n    Schema: %\n    Table: %',
        TG_OP,
        TG_TABLE_SCHEMA,
        TG_TABLE_NAME;
    FOR ri IN
        SELECT ordinal_position, column_name, data_type
        FROM information_schema.columns
        WHERE
            table_schema = TG_TABLE_SCHEMA
        AND table_name = TG_TABLE_NAME
        ORDER BY ordinal_position
    LOOP
        EXECUTE 'SELECT ($1).' || ri.column_name || '::text' INTO t USING NEW;
        RAISE NOTICE E'Column\n    number: %\n    name: %\n    type: %\n    value: %.',
            ri.ordinal_position,
            ri.column_name,
            ri.data_type,
            t;
    END LOOP;
    RETURN NEW;
END;
$$;
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
list from [[SQL - PostgreSQL Dynamic Trigger]] AND -"Changelog"
```