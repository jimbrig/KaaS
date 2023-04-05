# Pyrseas (Python)

*Source: https://github.com/perseas/Pyrseas*

 > 
 > Pyrseas provides utilities to describe a PostgreSQL database schema as YAML, to verify the schema against the same or a different database and to generate SQL that will modify the schema to match the YAML description.

## Contents

* [Features](Pyrseas%20%28Python%29.md#features)
* [Documentation](Pyrseas%20%28Python%29.md#documentation)
* [Installation](Pyrseas%20%28Python%29.md#installation)
  * [Requirements](Pyrseas%20%28Python%29.md#installation-requirements)
* [Features](Pyrseas%20%28Python%29.md#features)
  * [Augment a Database](Pyrseas%20%28Python%29.md#features-augment-a-database)
  * [Database to YAML](Pyrseas%20%28Python%29.md#features-database-to-yaml)
* [Appendix: Links](Pyrseas%20%28Python%29.md#appendix-links)

## Features

* Outputs a YAML description of a Postgres database's tables and other objects (metadata), suitable for storing in a version control repository
* Generates SQL statements to modify a database so that it will match an input YAML/JSON specification
* Generates an augmented YAML description of a Postgres database from its catalogs and an augmentation specification.

## Documentation

Please visit [Read the Docs](https://pyrseas.readthedocs.io/en/latest/) for the latest documentation.

## Installation

````python
pip install Pyrseas
````

### Requirements

* [PostgreSQL](https://www.postgresql.org/) 9.4 or higher
* [Python](http://www.python.org/) 2.7, 3.4 or higher
* [Psycopg2](http://initd.org/psycopg) 2.7 or higher
* [PyYAML](http://pyyaml.org/) 3.13 or higher
* [PgDbConn](https://github.com/perseas/pgdbconn) 0.8 or higher

## Features

### Augment a Database

 > 
 > `dbaugment` – [Augment](../../../Dictionary/Augment%20%28en-US%29.md) a [PostgreSQL](../Data%20Stack/Databases/PostgreSQL.md) database in predefined ways

**dbaugment** is a utility for augmenting a Postgres database with various standard attributes and procedures, such as automatically maintained audit columns. The augmentations are defined in a YAML-formatted `spec` file.

The following is an example of a specification file:

````yaml
augmenter:
  columns:
    modified_date:
      not_null: true
      type: date
schema public:
  table t1:
    audit_columns: default
  table t3:
    audit_columns: modified_only
````

The specification file lists each schema, and within it, each table to be augmented. Under each table the following values are currently recognized:

 > 
 > * audit_columns: This indicates that audit trail columns are to be added to the table, e.g., a timestamp column recording when a row was last modified.

The first section of the specification file, under the `augmenter` header, lists configuration information. This is in addition to the built-in configuration objects (see [Predefined Database Augmentations](https://pyrseas.readthedocs.io/en/latest/predefaug.html#predef-aug)).

**dbaugment** first reads the database catalogs. It also initializes itself from predefined configuration information. **dbaugment** then reads the specification file, which may include additional configuration objects, and outputs a YAML file, including the existing catalog information together with the desired enhancements. The YAML file is suitable for input to **yamltodb** to generate the SQL statements to implement the changes.

### Database to YAML

 > 
 > `dbtoyaml` – extract the schema of a [PostgreSQL](../Data%20Stack/Databases/PostgreSQL.md) database in *YAML* format

**dbtoyaml** is a utility for extracting the schema of a Postgres database to a [YAML](http://yaml.org/) formatted specification. By default, the specification is output as a single output stream, which can be redirected or explicitly sent to a file. As an alternative, the `--multiple-files` option allows you to break down the specification into multiple files, in general, one for each object (see [Multiple File Output](https://pyrseas.readthedocs.io/en/latest/dbtoyaml.html#multiple-file-output)).

Note that [JSON](http://json.org/) is an official subset of YAML version 1.2, so the **dbtoyaml** output should also be compatible with JSON tools.

A sample of the output format is as follows:

````yaml
schema public:
  owner: postgres
  privileges:
  - postgres:
    - all
  - PUBLIC:
    - all
  table t1:
    check_constraints:
      t1_c2_check:
        columns:
        - c2
        expression: (c2 > 123)
    columns:
    - c1:
        not_null: true
        type: integer
    - c2:
        type: smallint
    - c3:
        default: 'false'
        type: boolean
    - c4:
        type: text
    foreign_keys:
      t1_c2_fkey:
        columns:
        - c2
        references:
          columns:
          - c21
          schema: s1
          table: t2
    owner: alice
    primary_key:
      t1_pkey:
        columns:
        - c1
schema s1:
  owner: bob
  privileges:
  - bob:
    - all
  - alice:
    - all
  table t2:
    columns:
    - c21:
         not_null: true
         type: integer
    - c22:
         type: character varying(16)
    owner: bob
    primary_key:
      t2_pkey:
        columns:
        - c21
    privileges:
    - bob:
      - all
    - PUBLIC:
      - select
    - alice:
      - insert:
          grantable: true
      - delete:
          grantable: true
      - update:
          grantable: true
    - carol:
        grantor: alice
        privs:
        - insert
````

The above should be mostly self-explanatory. The example database has two tables, named `t1` and `t2`, the first –owned by user ‘alice’– in the `public` schema and the second –owned by user ‘bob’– in a schema named `s1` (also owned by ‘bob’). The `columns:` specifications directly under each table list each column in that table, in the same order as shown by Postgres. The specifications `primary_key:`, `foreign_keys:` and `check_constraints:` define PRIMARY KEY, FOREIGN KEY and CHECK constraints for a given table. Additional specifications (not shown) define unique constraints and indexes.

User ‘bob’ has granted all privileges to ‘alice’ on the `s1` schema. On table `t2`, he also granted SELECT to PUBLIC; INSERT, UPDATE and DELETE to ‘alice’ with GRANT OPTION; and she has in turn granted INSERT to user ‘carol’.

**dbtoyaml** currently supports extracting information about nearly all types of Postgres database objects. See [API Reference](https://pyrseas.readthedocs.io/en/latest/index.html#api-ref) for a list of supported objects.

The behavior and options of `dbtoyaml` are patterned after the [pg_dump utility](https://www.postgresql.org/docs/current/static/app-pgdump.html) since it is most analogous to using `pg_dump --schema-only`.

---

## Appendix: Links

* *Tools*

*Backlinks:*

````dataview
list from [[Pyrseas (Python)]] AND -"Changelog"
````
