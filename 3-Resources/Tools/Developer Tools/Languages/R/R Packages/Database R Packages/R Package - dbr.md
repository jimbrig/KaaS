---
Date: 2022-02-05
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool/R", "#Topic/Dev/R", "#Type/Tool", "#Topic/Dev/Database"]
Alias: ["R Package - dbr", "dbr"]
---

# R Package - `dbr`

*Source: [daroczig/dbr: Secure database connections and convenient queries from R on the top of DBI (github.com)](https://github.com/daroczig/dbr)*

Convenient database connections and queries from R.

Vignette coming, until then, please check the talk presented at the useR! 2018 conference:

* [slides](http://bit.ly/user2018-dbr)
* [video](https://www.youtube.com/watch?v=z7x4UOHNguY)

## Contents

- [[#Setting up a config file for the database connections|Setting up a config file for the database connections]]
- [[#Querying databases|Querying databases]]
- [[#SQL templating|SQL templating]]
- [[#Appendix: Links|Appendix: Links]]

## Setting up a config file for the database connections

To be able to connect to a database, the connection parameters are to be specified in a YAML file, for example for a SQLite database to be created in a temp file:

```yaml
sqlite:
  drv: !expr RSQLite::SQLite()
  dbname: !expr tempfile()
```

By default, `dbr` will look for a file named `db_config.yaml` in the current working directory, that can be override via the `dbr.db_config_path` global option, eg to the example config bundled in this package:

```r
options(dbr.db_config_path = system.file('example_db_config.yaml', package = 'dbr'))
```

A more complex example from the demo YAML file describing a MySQL connection to a database hosted by RStudio (with public username and password):

```yaml
shinydemo:
  drv: !expr RMySQL::MySQL()
  host: shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com
  username: guest
  password: guest
  dbname: shinydemo
```

Note, that instead of simple strings, you can also specify KMS-encrypted passwords, other secrets and parameters as well, eg:

```yaml
redshift:
  host: !aws_kms |
    KMSencryptedciphertext...
  port: 5439
  dbname: dbname
  user: username
  drv: !expr RPostgreSQL::PostgreSQL()
  password: !aws_kms |
    KMSencryptedciphertext...
  s3_copy_bucket: !attr |-
    's3://openmail-model/temp'
  s3_copy_iam_role: !attr |-
    arn:aws:iam::accountid:role/redshift_role
```

## Querying databases

Once the connection parameters are loaded from a config file, making SQL queries are as easy as specifying the SQL statement and the name of the connection:

```r
db_query('show tables', 'shinydemo')
#> INFO [2019-01-06 01:06:18] Connecting to shinydemo
#> INFO [2019-01-06 01:06:19] Executing:**********
#> INFO [2019-01-06 01:06:19] show tables
#> INFO [2019-01-06 01:06:19] ********************
#> INFO [2019-01-06 01:06:19] Finished in 0.1336 secs returning 3 rows
#> INFO [2019-01-06 01:06:19] Closing connection to shinydemo
#>   Tables_in_shinydemo
#> 1                City
#> 2             Country
#> 3     CountryLanguage
```

For more advanced usage, eg caching database connections, check `?db_connect` and the above mentioned vignette.

## SQL templating

To reuse SQL chunks, you may list your SQL queries (or parts of it) in a structured YAML file, like in the bundled example config at [`example_sql_chunks.yaml`](https://github.com/daroczig/dbr/blob/master/inst/example_sql_chunks.yaml)

Use `sql_chunk_files` to list or update the currently used SQL template YAML file(s), eg via

```r
sql_chunk_files(system.file('example_sql_chunks.yaml', package = 'dbr'))
```

Then you may refer to any key in that definition by a string that consist of the keys in hierarchy separated by a dot, so looking at the below definition (part of [`example_sql_chunks.yaml`](https://github.com/daroczig/dbr/blob/master/inst/example_sql_chunks.yaml)):

```yaml
dbr:
  shinydemo:
    countries:
      count: SELECT COUNT(*) FROM Country
```

Getting the `count` key from for the `countries` item in `dbr`'s `shinydemo` section, you could do something like:

```r
sql_chunk('dbr.shinydemo.countries.count')
#> SELECT COUNT(*) FROM Country
```

And pass it right away to `db_query`:

```r
countries <- db_query(sql_chunk('dbr.shinydemo.countries.count'), 'shinydemo')
#> INFO [2019-01-06 01:33:33] Connecting to shinydemo
#> INFO [2019-01-06 01:33:34] Executing:**********
#> INFO [2019-01-06 01:33:34] SELECT COUNT(*) FROM Country
#> INFO [2019-01-06 01:33:34] ********************
#> INFO [2019-01-06 01:33:34] Finished in 0.1291 secs returning 1 rows
#> INFO [2019-01-06 01:33:34] Closing connection to shinydemo
```

SQL chunks can be also defined in files outside of the YAML with the `sql` file extensions, and referenced with the `!include` tag in the YAML file, eg:

```yaml
dbr:
  shinydemo:
    countries:
      europe: !include europe.sql
```

This will read the content of [`europe.sql`](https://github.com/daroczig/dbr/blob/master/inst/europe.sql) and make it available as `sql_chunk('dbr.shinydemo.countries.count')`.

Besides files, a folder with `sql` files can be also included -- in that case, the base filename (without the `sql` file extension) will become the key under the given key. For example, consider this YAML definition:

```yaml
cities: !include cities.sql
```

Will load all the files from the [`cities.sql`](https://github.com/daroczig/dbr/tree/master/inst/cities.sql) folder and make those available under `europe`, so resulting in an intermediate YAML as:

```
cities: !include cities.sql
  europe: |-
    SELECT Name
    FROM City
    WHERE CountryCode IN (
      {sql_chunk('dbr.shinydemo.countries.europe', indent_after_linebreak = 2)})
  europe_large: |-
    SELECT Name
    FROM City
    WHERE
      Population > 1000000 AND
      Name IN (
        {sql_chunk('dbr.shinydemo.cities.europe', indent_after_linebreak = 4)}))
```

If the key of a directory `!include` is `~!`, then the keys are made available in the parent node, so eg

```
cities:
  ~!: !include cities.sql
```

Would not actually create the `cities` key, but only the `europe` and `europe_large` keys in the root node.

As you can see from the above, the main power of this templating approach is that you can easily reuse SQL chunks, eg for the list of European countries in:

```r
cities <- db_query(sql_chunk('dbr.shinydemo.cities.europe'), 'shinydemo')
#> INFO [2019-01-06 01:32:02] Connecting to shinydemo
#> INFO [2019-01-06 01:32:02] Executing:**********
#> INFO [2019-01-06 01:32:02] SELECT Name
#> FROM City
#> WHERE CountryCode IN (
#>   SELECT Code
#>   FROM Country
#>   WHERE Continent = 'Europe')
#> INFO [2019-01-06 01:32:02] ********************
#> INFO [2019-01-06 01:32:02] Finished in 0.1225 secs returning 643 rows
#> INFO [2019-01-06 01:32:02] Closing connection to shinydemo
```

Where the `Country`-related subquery was specified in the `dbr.shinydemo.countries.europe` key as per:

```sql
SELECT Name
FROM City
WHERE CountryCode IN (
  {sql_chunk('dbr.shinydemo.countries.europe', indent_after_linebreak = 2)})
```

The `indent_after_linebreak` parameter is just for cosmetic updates in the query to align `FROM` and `WHERE` on the same character in the SQL statement.

Even more complex / nested example:

```sql
sql_chunk('dbr.shinydemo.cities.europe_large')
#> SELECT Name
#> FROM City
#> WHERE
#>   Population > 1000000 AND
#>   Name IN (
#>     SELECT Name
#>     FROM City
#>     WHERE CountryCode IN (
#>       SELECT Code
#>       FROM Country
#>       WHERE Continent = 'Europe')))
```




***

## Appendix: Links

- [[Tools]]
- [[Development]]
<<<<<<< HEAD:3-Resources/Tools/R/R Packages/Database R Packages/R Package - dbr.md
- [[R]]
- [[R Database Packages]]
=======
- [[2-Areas/MOCs/R]]
- [[R - Database Packages List]]
>>>>>>> develop:3-Resources/Tools/Developer Tools/Languages/R/R Packages/Database R Packages/R Package - dbr.md


*Backlinks:*

```dataview
list from [[R Package - dbr]] AND -"Changelog"
```