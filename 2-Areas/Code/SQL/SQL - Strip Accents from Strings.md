---
Date: 2022-02-23
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Data/Databases"]
Alias: ["SQL - Strip Whitespace"]
---

# SQL - Strip Accents from Strings

## Strip Accents Default

*Source: https://wiki.postgresql.org/wiki/Strip_accents_from_strings*

```SQL
create or replace function unaccent(text) returns text language plpythonu as $$
import unicodedata
rv = plpy.execute("select setting from pg_settings where name = 'server_encoding'");
encoding = rv[0]["setting"]
s = args[0].decode(encoding)
s = unicodedata.normalize("NFKD", s)
s = ''.join(c for c in s if ord(c) < 127)
return s
$$;
```

## Strip Accents and Output Lowercase

*Source: https://wiki.postgresql.org/wiki/Strip_accents_from_strings,_and_output_in_lowercase*

```SQL
CREATE OR REPLACE FUNCTION unaccent_string(text) RETURNS text AS $$
my ($input_string) = @_;
$input_string =~ s/[âãäåāăą]/a;
$input_string =~ s/[ÁÂÃÄÅĀĂĄ]/A;
$input_string =~ s/[èééêëēĕėęě]/e;
$input_string =~ s/[ĒĔĖĘĚ]/E;
$input_string =~ s/[ìíîïìĩīĭ]/i;
$input_string =~ s/[ÌÍÎÏÌĨĪĬ]/I;
$input_string =~ s/[óôõöōŏő]/o;
$input_string =~ s/[ÒÓÔÕÖŌŎŐ]/O;
$input_string =~ s/[ùúûüũūŭů]/u;
$input_string =~ s/[ÙÚÛÜŨŪŬŮ]/U;
return $input_string;
$$ LANGUAGE plperl;
CREATE OR REPLACE FUNCTION unaccent_string(text)
RETURNS text
IMMUTABLE
STRICT
LANGUAGE SQL
AS $$
SELECT translate(
    $1,
    'âãäåāăąÁÂÃÄÅĀĂĄèééêëēĕėęěĒĔĖĘĚìíîïìĩīĭÌÍÎÏÌĨĪĬóôõöōŏőÒÓÔÕÖŌŎŐùúûüũūŭůÙÚÛÜŨŪŬŮ',
    'aaaaaaaaaaaaaaaeeeeeeeeeeeeeeeiiiiiiiiiiiiiiiiooooooooooooooouuuuuuuuuuuuuuuu'
);
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
list from [[SQL - Strip Whitespace]] AND -"Changelog"
```