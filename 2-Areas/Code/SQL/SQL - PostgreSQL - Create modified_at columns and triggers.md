---
Date: 2022-03-02
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL - Create modified_at columns and triggers"]
---

# SQL - PostgreSQL - Create modified_at columns and triggers

*Source: https://gist.github.com/abmmhasan/2f4024922eaea537cd1795223e38c18a*

```SQL
-- updated_at column function
CREATE FUNCTION update_modified_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  BEGIN
    NEW.modified_at = NOW();
    RETURN NEW;
  END;
$$;

-- add 'updated_at' column in any table:
ALTER TABLE <table_name> ADD (
    modified_at timestamp without time zone DEFAULT now()
)

-- then create trigger to attach to table 'table_name'
CREATE TRIGGER table_name_updated_at_modtime
    BEFORE UPDATE 
    ON public.table_name
    FOR EACH ROW
    EXECUTE PROCEDURE public.update_updated_at_column();
```


***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[PostgreSQL]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - PostgreSQL - Create modified_at columns and triggers]] AND -"Changelog"
```