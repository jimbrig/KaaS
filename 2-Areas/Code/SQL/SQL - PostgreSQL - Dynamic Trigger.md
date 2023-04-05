# SQL - PostgreSQL Dynamic Trigger

*Source: https://wiki.postgresql.org/wiki/PL/pgSQL_Dynamic_Triggers*

````SQL
EXECUTE 'SELECT (' ||
         quote_literal(NEW) || '::' || TG_RELID::regclass ||
         ').' || quote_ident(columnname)
         INTO var;
````

````SQL
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
````

---

## Appendix: Links

* *Code*
* [SQL](SQL.md)
* [Databases](../../MOCs/Databases.md)
* [PostgreSQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md)
* [PLPGSQL](../../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Procedural%20Languages/PLPGSQL.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[SQL - PostgreSQL Dynamic Trigger]] AND -"Changelog"
````
