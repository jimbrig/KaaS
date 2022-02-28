---
Date: 2022-02-16
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL - Stored Procedure - Merge Tables"]
---

# SQL - PostgreSQL - Stored Procedure - Merge Tables

*Source: [postgres_stored_procedures/sp_merge_tables.sql at main · thevillagers/postgres_stored_procedures](https://github.com/thevillagers/postgres_stored_procedures/blob/main/procedures/sp_merge_tables.sql)*


```SQL
/*
    Merges all tables matching a regex by calling vre_funcs.insert() on all matches
    USAGE:
        CALL vre_funcs.merge(
            table_regex:='^public\.test',
            output_table:='public.test_tables_merged'
        );
*/

DROP PROCEDURE IF EXISTS vre_funcs.merge;
CREATE PROCEDURE         vre_funcs.merge(
    table_regex         TEXT,                   -- regular expression of tables to merge
    output_table        TEXT,                   -- output table to merge tables into
    use_cstore          BOOLEAN DEFAULT TRUE,   -- flag indicating whether or not output should be cstore
    select_col_regex    TEXT DEFAULT NULL,      -- regular expression of columns you want to include in the merged output
    query_suffix        TEXT DEFAULT NULL       -- suffix for filtering which rows get pulled, if relevant. E.g. query_suffix:=$str$WHERE column='value'$str$
)
AS $$
DECLARE
    matching_tables_arr     TEXT[];
    loop_table              TEXT;
    v_state                 TEXT ;
    v_msg                   TEXT ;
    v_detail                TEXT ;
    v_hint                  TEXT ;
    v_context               TEXT ;
    full_error_msg          TEXT ;
BEGIN

    
    CALL vre_funcs.create_empty_table(table_name:=output_table, use_cstore:=use_cstore, drop_existing:=TRUE);

    SELECT
            ARRAY_AGG(QUOTE_IDENT(table_schema)||'.'||QUOTE_IDENT(table_name))
      FROM
            information_schema.tables
      WHERE
            table_schema||'.'||table_name ~ table_regex
      INTO
            matching_tables_arr
    ;

    FOREACH loop_table IN ARRAY matching_tables_arr LOOP
        CALL vre_funcs.insert(
            insert_from         := loop_table,
            insert_into         := output_table,
            add_cols            := TRUE,
            create_into_table   := FALSE,
            select_col_regex    := select_col_regex,
            query_suffix        := query_suffix
        );
    END LOOP;

    EXCEPTION WHEN OTHERS THEN
        GET STACKED DIAGNOSTICS
            v_state     = RETURNED_SQLSTATE,
            v_msg       = MESSAGE_TEXT,
            v_detail    = PG_EXCEPTION_DETAIL,
            v_hint      = PG_EXCEPTION_HINT,
            v_context   = PG_EXCEPTION_CONTEXT
        ;

        full_error_msg := FORMAT($str$
            state: %1$s
            message: %2$s
            detail: %3$s
            hint: %4$s
            context: %5$s
        $str$, v_state, v_msg, v_detail, v_hint, v_context);

        RAISE EXCEPTION USING MESSAGE = full_error_msg;


END ; $$
LANGUAGE 'plpgsql';
```


***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[PostgreSQL]]
- [[PLPGSQL]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - PostgreSQL Stored Procedure - Merge Tables]] AND -"Changelog"
```