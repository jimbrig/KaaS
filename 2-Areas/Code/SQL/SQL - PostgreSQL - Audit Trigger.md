# SQL - PostgreSQL - Audit Trigger

*Source: https://wiki.postgresql.org/wiki/Audit_trigger*

## The Trigger

### Setup

````SQL
create schema audit;
revoke create on schema audit from public;

create table audit.logged_actions (
    schema_name text not null,
    table_name text not null,
    user_name text,
    action_tstamp timestamp with time zone not null default current_timestamp,
    action TEXT NOT NULL check (action in ('I','D','U')),
    original_data text,
    new_data text,
    query text
) with (fillfactor=100);

revoke all on audit.logged_actions from public;

-- You may wish to use different permissions; this lets anybody
-- see the full audit data. In Pg 9.0 and above you can use column
-- permissions for fine-grained control.
grant select on audit.logged_actions to public;

create index logged_actions_schema_table_idx 
on audit.logged_actions(((schema_name||'.'||table_name)::TEXT));

create index logged_actions_action_tstamp_idx 
on audit.logged_actions(action_tstamp);

create index logged_actions_action_idx 
on audit.logged_actions(action);
````

### Trigger Definition

````SQL
--
-- Now, define the actual trigger function:
--

CREATE OR REPLACE FUNCTION audit.if_modified_func() RETURNS trigger AS $body$
DECLARE
    v_old_data TEXT;
    v_new_data TEXT;
BEGIN
    /*  If this actually for real auditing (where you need to log EVERY action),
        then you would need to use something like dblink or plperl that could log outside the transaction,
        regardless of whether the transaction committed or rolled back.
    */

    /* This dance with casting the NEW and OLD values to a ROW is not necessary in pg 9.0+ */

    if (TG_OP = 'UPDATE') then
        v_old_data := ROW(OLD.*);
        v_new_data := ROW(NEW.*);
        insert into audit.logged_actions (schema_name,table_name,user_name,action,original_data,new_data,query) 
        values (TG_TABLE_SCHEMA::TEXT,TG_TABLE_NAME::TEXT,session_user::TEXT,substring(TG_OP,1,1),v_old_data,v_new_data, current_query());
        RETURN NEW;
    elsif (TG_OP = 'DELETE') then
        v_old_data := ROW(OLD.*);
        insert into audit.logged_actions (schema_name,table_name,user_name,action,original_data,query)
        values (TG_TABLE_SCHEMA::TEXT,TG_TABLE_NAME::TEXT,session_user::TEXT,substring(TG_OP,1,1),v_old_data, current_query());
        RETURN OLD;
    elsif (TG_OP = 'INSERT') then
        v_new_data := ROW(NEW.*);
        insert into audit.logged_actions (schema_name,table_name,user_name,action,new_data,query)
        values (TG_TABLE_SCHEMA::TEXT,TG_TABLE_NAME::TEXT,session_user::TEXT,substring(TG_OP,1,1),v_new_data, current_query());
        RETURN NEW;
    else
        RAISE WARNING '[AUDIT.IF_MODIFIED_FUNC] - Other action occurred: %, at %',TG_OP,now();
        RETURN NULL;
    end if;

EXCEPTION
    WHEN data_exception THEN
        RAISE WARNING '[AUDIT.IF_MODIFIED_FUNC] - UDF ERROR [DATA EXCEPTION] - SQLSTATE: %, SQLERRM: %',SQLSTATE,SQLERRM;
        RETURN NULL;
    WHEN unique_violation THEN
        RAISE WARNING '[AUDIT.IF_MODIFIED_FUNC] - UDF ERROR [UNIQUE] - SQLSTATE: %, SQLERRM: %',SQLSTATE,SQLERRM;
        RETURN NULL;
    WHEN others THEN
        RAISE WARNING '[AUDIT.IF_MODIFIED_FUNC] - UDF ERROR [OTHER] - SQLSTATE: %, SQLERRM: %',SQLSTATE,SQLERRM;
        RETURN NULL;
END;
$body$
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = pg_catalog, audit;

--
-- To add this trigger to a table, use:
-- CREATE TRIGGER tablename_audit
-- AFTER INSERT OR UPDATE OR DELETE ON tablename
-- FOR EACH ROW EXECUTE PROCEDURE audit.if_modified_func();
--
````

### Making the trigger more flexible

If you want to omit the full query text, or omit the data, for changes to some tables but not others it's not hard to do that. PostgreSQL triggers can take parameters that are passed during [CREATE TRIGGER](http://www.postgresql.org/docs/9.1/static/sql-createtrigger.html). These are passed each time that particular trigger instance from that CREATE TRIGGER statement is executed.

For example, if you define a trigger mytrigger(log_query_text boolean, log_values boolean) then in a CREATE TRIGGER statement you can say EXECUTE PROCEDURE mytrigger(false, true) and those params will get passed to the trigger function invocation. The trigger can use IF or CASE statements to change its behaviour based on the parameters.

It's fairly trivial to extend the above trigger function so you can turn query text logging, values logging, etc on and off for different invocations.

## Demo

````SQL
-- Tested with a table named "t"
 drop table if exists t;
 create table t (x int not null primary key, y text);

 -- needs to be applied to all tables that we want to monitor

 -- this is a test trigger to show how we can audit all changes to the relevant tables, including inserts
 CREATE TRIGGER t_if_modified_trg 
 AFTER INSERT OR UPDATE OR DELETE ON t
 FOR EACH ROW EXECUTE PROCEDURE audit.if_modified_func();


 -- Some sample updates, deletes, and inserts to illustrate the points
 select * from t; select * from audit.logged_actions;

 insert into t (x,y) values (1,'asdf'),(2,'werwer'),(3,null);

 select * from t; select * from audit.logged_actions;

 -- You may have noticed that the times output in the prior query are in your local time. 
 -- They're stored as UTC, but Pg is converting them for display according to the 'timezone' GUC.
 SHOW timezone;

 -- See?
 SET timezone = 'UTC';
 SELECT * FROM audit.logged_actions;
 RESET timezone;
 -- Another way to achieve the same effect:
 SELECT *, action_tstamp AT TIME ZONE 'UTC' AS action_tstamp_utc FROM audit.logged_actions;

 update t set y='eeeeee' where x=2;
 select * from t; select * from audit.logged_actions;

 update t set y='yuyuyuy' where x=3;
 select * from t; select * from audit.logged_actions;

 delete from t where x=1;
 select * from t; select * from audit.logged_actions;

 -- should be a pk violation
 update t set x=4 where x=2;
 select * from t; select * from audit.logged_actions;
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
list from [[SQL - PostgreSQL Audit Trigger]] AND -"Changelog"
````
