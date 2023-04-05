# SQL - PostgreSQL - Dump Entire Database to CSV

*Source: https://gist.github.com/abmmhasan/2f4024922eaea537cd1795223e38c18a*
*Source: https://stackoverflow.com/questions/17463299/export-postgres-database-into-csv-file*

````SQL
-- Dump whole database to CSV
-- Ref: https://stackoverflow.com/questions/17463299/export-postgres-database-into-csv-file

CREATE OR REPLACE FUNCTION db_to_csv(path TEXT) RETURNS void AS $$
DECLARE
    tables RECORD;
    statement TEXT;
BEGIN
FOR tables IN
    SELECT (table_schema || '.' || table_name) AS schema_table
    FROM information_schema.tables t
    INNER JOIN information_schema.schemata s
        ON s.schema_name = t.table_schema
    WHERE t.table_schema NOT IN ('pg_catalog', 'information_schema')
        AND t.table_type NOT IN ('VIEW')
    ORDER BY schema_table
LOOP
    statement := 'COPY ' || tables.schema_table || ' TO ''' || path || '/' || tables.schema_table || '.csv' ||''' DELIMITER '';'' CSV HEADER';
    EXECUTE statement;
END LOOP;
RETURN;
END;
$$ LANGUAGE plpgsql;

-- use it as (this will create one csv file per table, in /path/to/dir/)
SELECT db_to_csv('/path/to/dir/');
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
list from [[SQL - PostgreSQL - Dump Entire Database to CSV]] AND -"Changelog"
````
