---
Date: 2022-02-23
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Data/Databases"]
Alias: ["SQL - PostgreSQL Pivot Query"]
---

# SQL - PostgreSQL Pivot Query

*Source: https://wiki.postgresql.org/wiki/Pivot_query*

```SQL
CREATE OR REPLACE FUNCTION pivoty_with_header(query text) RETURNS void AS $pivot$
DECLARE
 num_cols int;
 num_rows int;
 table_pivoted text;
 columna text;
 header text;
 counter int := 0;
BEGIN
 DROP TABLE IF EXISTS pivoted;
 DROP TABLE IF EXISTS pivot_;
 
 EXECUTE 'CREATE TEMP TABLE pivot_ AS ' || query ;

 SELECT count(*) INTO num_cols from information_schema.columns where table_name = 'pivot_';
 SELECT count(*) INTO num_rows FROM pivot_;

 table_pivoted := 'CREATE TABLE pivoted (';

 SELECT column_name into header from information_schema.columns where table_name = 'pivot_' limit 1;
 FOR header IN EXECUTE 'SELECT ' || header || ' from pivot_'
 LOOP
    counter := counter +1;
   SELECT table_pivoted || 'col_' || translate(header,'.,|/?!','') || counter ||' text ,' INTO table_pivoted;
 END LOOP;
 select regexp_replace(table_pivoted,E'\,$','','g') INTO table_pivoted;
 select table_pivoted || ')' into table_pivoted;

 EXECUTE table_pivoted;
 
 
 FOR columna IN SELECT column_name::Text FROM  information_schema.columns where table_name = 'pivot_'
 LOOP
   if (columna != ('col_' || translate(header,'.,|/?!','')) )
   THEN
     EXECUTE 'INSERT INTO pivoted SELECT  ((translate(array_agg(' ||  columna || ')::text,''{}'',''()'' ))::pivoted).*  FROM pivot_';
   END IF;
 END LOOP;
 
END;
$pivot$ LANGUAGE plpgsql;
```

Another without using column name:

```SQL
CREATE OR REPLACE FUNCTION pivoty(query text) RETURNS void AS $pivot$
DECLARE
 num_cols int;
 num_rows int;
 table_pivoted text;
 columna text;
BEGIN
 DROP TABLE IF EXISTS pivoted;
 DROP TABLE IF EXISTS pivot_;
 
 EXECUTE 'CREATE TEMP TABLE pivot_ AS ' || query ;

 SELECT count(*) INTO num_cols from information_schema.columns where table_name = 'pivot_';
 SELECT count(*) INTO num_rows FROM pivot_;

 table_pivoted := 'CREATE TABLE pivoted (';
 FOR i IN 1 .. num_rows 
 LOOP

   IF ( i = num_rows )  
   THEN
     SELECT table_pivoted || 'col' || i || ' text ' INTO table_pivoted;
   ELSE
     SELECT table_pivoted || 'col' || i || ' text ,' INTO table_pivoted;
   END IF;
 END LOOP;
 select table_pivoted || ')' into table_pivoted;

 EXECUTE table_pivoted;

 FOR columna IN SELECT column_name::Text FROM  information_schema.columns where table_name = 'pivot_'
 LOOP
   EXECUTE 'INSERT INTO pivoted SELECT  ((translate(array_agg(' ||  columna || ')::text,''{}'',''()'' ))::pivoted).*  FROM pivot_';
 
 END LOOP;

END;
$pivot$ LANGUAGE plpgsql;
```
  
This function will generate a table called pivoted of your query, so execute it with the query as parametter and then:

```SQL
SELECT * FROM pivoted;
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
list from [[SQL - PostgreSQL Pivot Query]] AND -"Changelog"
```