---
Date: 2022-02-16
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL ETL Function Template"]
---

# SQL - PostgreSQL - ETL Function Template

*Source: [A "best practice" Postgresql function template for ETL processes - Database Administrators Stack Exchange](https://dba.stackexchange.com/questions/122052/a-best-practice-postgresql-function-template-for-etl-processes)*

```SQL
create or replace function 
    table_schema.load_table_name(l_job_date date) 
returns
    void as $$
declare
    -- control variables
    l_job_code              constant varchar(50) = 'table_schema.load_table_name';
    l_job_start             timestamp;
    l_job_end               timestamp;

    -- exception management variables       
    l_exception_error_code  text;
    l_exception_message     text;
    l_exception_detail      text;
    l_exception_hint        text;
    l_exception_context     text;
begin
    -- capture start
    l_job_start = clock_timestamp();

    -- do stuff here
    -- ...
    -- ...
    -- ...

    -- capture end
    l_job_end =  = clock_timestamp();

    -- log success
    perform fn_log_job(
        l_job_code
        ,l_job_date
        ,l_job_start
        ,l_job_end
        ,'success'
    )
    ;

-- if something "breaks" do the following
exception when others then
    get stacked diagnostics 
        l_exception_error_code  = RETURNED_SQLSTATE
        ,l_exception_message        = MESSAGE_TEXT
        ,l_exception_detail     = PG_EXCEPTION_DETAIL
        ,l_exception_hint           = PG_EXCEPTION_HINT
        ,l_exception_context        = PG_EXCEPTION_CONTEXT
    ;

    -- log exception for debugging
    perform fn_log_exception(
        l_exception_error_code
        ,l_exception_message
        ,l_exception_detail
        ,l_exception_hint
        ,l_exception_context
    )
    ;

    -- log job failure
    perform fn_log_job(
        l_job_code
        ,l_job_date
        ,l_job_start
        ,l_job_end
        ,'fail'
    )
    ;

end;
$$ language plpgsql;
```

See Also:

-   [Manual on error trapping](http://www.postgresql.org/docs/current/static/plpgsql-control-structures.html#PLPGSQL-ERROR-TRAPPING)
-   [Example provided for capturing exceptions](http://www.postgresql.org/docs/current/static/plpgsql-control-structures.html#PLPGSQL-EXCEPTION-DIAGNOSTICS)
-   [Example Setting Function Variables](http://www.faqs.org/docs/ppbook/x19832.htm#OPTIONALVARIABLEEXAMPLES)
-   [Raising exceptions example](http://www.depesz.com/2011/07/20/waiting-for-9-2-stacked-diagnostics-in-plpgsql/)
-   [Wraps another `begin ... end` inside the function definition](https://stackoverflow.com/questions/16372794/postgresql-exception-handling-detail-with-get-stacked-diagnostics)
-   [Prefix local variables so as not to confuse the parser](https://stackoverflow.com/a/20518659/893766)


***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[PostgreSQL]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - PostgreSQL ETL Function Template]] AND -"Changelog"
```