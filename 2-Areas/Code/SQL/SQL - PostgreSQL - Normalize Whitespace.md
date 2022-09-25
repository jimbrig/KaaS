---
Date: 2022-02-23
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - PostgreSQL -Normalize Whitespace"]
---

# SQL - PostgreSQL -Normalize Whitespace

*Source: https://wiki.postgresql.org/wiki/Normalize_whitespace*

*NOTE: This function uses generic [[SQL]].*

```SQL
CREATE OR REPLACE FUNCTION normalize_space(TEXT)
RETURNS TEXT
IMMUTABLE
LANGUAGE SQL
AS $$
SELECT regexp_replace(
    trim($1),
    E'\\s+',
    ' ',
    'g'
);
$$;
CREATE OR REPLACE FUNCTION normalize_space(text) 
RETURNS text LANGUAGE plperl AS $$
    $_ = $_[0]; 
    s/(^\s+|\s+$)//g;
    s/\s+/ /og;
    return $_;
$$;
```

So, if you want to update/insert to a table and normalize the text previously this action, you might create a trigger before insert for each row, like this:

```SQL
CREATE TABLE pepito (wordy text, moody text, bar text);

DROP IF EXISTS trigger n_space on pepito;

CREATE TRIGGER n_space BEFORE INSERT OR UPDATE ON pepito FOR EACH ROW EXECUTE PROCEDURE n_space();
```

This function trigger, looks up fields of text type and touch `NEW` values with the replace expression.

*NOTE: This function uses the [[PLPERL]] language based off of [[PERL]].*

```SQL
CREATE OR REPLACE FUNCTION n_space() 
RETURNS trigger
VOLATILE
LANGUAGE plperl
AS $$
	my $rs = spi_exec_query(<<"    EOT");
    SELECT
        a.attname as name,
        format_type(a.atttypid,pg_attribute.atttypmod) 
    FROM
        pg_class AS c
    JOIN
        pg_attribute AS a
        ON (
            a.attrelid = c.oid
        AND c.oid = '$_TD->{table_name}'::regclass 
        AND a.attstorage <> 'p'
        AND format_type(a.atttypid,pg_attribute.atttypmod) = 'text'
    EOT
        
	my $rs_rows = $rs->{processed}-1;
	foreach my $rn (0 .. $rs_rows){
		my $row = $rs->{rows}[$rn]->{name};
		$_TD->{new}{$row} =~ s/(^\s+|\s+$)//g;
		$_TD->{new}{$row} =~ s/\s+/ /g;		
	}	
	return "MODIFY";
$$;
TRUNCATE TABLE pepito;
INSERT INTO pepito
VALUES
    ('asd asd AS     asd asf      ',' asd  4t45gr g er    ergt',' asd sa'),
    ('asd asd AS     asdbhfg',' asd  4t45gr g er    ergt',' asd sa'),
    ('    asd asd AS     asd asf      ',' asd  4t45gr g er    ergt',' asd sa');
SELECT * FROM pepito;
```

***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[PostgreSQL]]
- [[PLPERL]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - Normalize Whitespace]] AND -"Changelog"
```