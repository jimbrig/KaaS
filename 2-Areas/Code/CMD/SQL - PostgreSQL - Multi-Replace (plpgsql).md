---
Date: 2022-02-23
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL - Multi-Replace (plpgsql)"]
---

# SQL - PostgreSQL - Multi-Replace (plpgsql)

*Source: https://wiki.postgresql.org/wiki/Multi_Replace_plpgsql*

*NOTE: This function is generic [[SQL]]:*

```SQL
/* This function quotes characters that may be interpreted as special in a regular expression.
   It's used by the function below and declared separately for clarity. */
CREATE FUNCTION quote_meta(text) RETURNS text AS $$
  select regexp_replace($1, '([\[\]\\\^\$\.\|\?\*\+\(\)])', '\\\1', 'g');
$$ language sql strict immutable;
```

*NOTE: This function uses the [[PLPGSQL]] language.*

```SQL
/* Substitute a set of substrings within a larger string.
   When several strings match, the longest wins.
   Similar to php's strtr(string $str, array $replace_pairs).
   Example:
   select multi_replace('foo and bar is not foobar',
             '{"bar":"foo", "foo":"bar", "foobar":"foobar"}'::jsonb);
   => 'bar and foo is not foobar'
 */
CREATE FUNCTION multi_replace(str text, substitutions jsonb)
RETURNS text
as $$
DECLARE
 rx text;
 s_left text;
 s_tail text;
 res text:='';
BEGIN
 select string_agg(quote_meta(term), '|' )
 from jsonb_object_keys(substitutions) as x(term)
   where term <> ''
 into rx;

 if (coalesce(rx, '') = '') then
   -- the loop on the RE can't work with an empty alternation
   return str;
 end if;

 rx := concat('^(.*?)(', rx, ')(.*)$'); -- match no more than 1 row   

 loop
   s_tail := str;
   select 
       concat(matches[1], substitutions->>matches[2]),
       matches[3]
    from
      regexp_matches(str, rx, 'g') as matches
    into s_left, str;
    
   exit when s_left is null;
   res := res || s_left;

 end loop;

 res := res || s_tail;
 return res;

END 
$$ LANGUAGE plpgsql strict immutable;
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
list from [[SQL - Multi-Replace (plpgsql)]] AND -"Changelog"
```