# PostgreSQL Tools

## Contents

* [CLI](PostgreSQL%20Tools%20List.md#cli)
* [Monitoring](PostgreSQL%20Tools%20List.md#monitoring)
* [GUI](PostgreSQL%20Tools%20List.md#gui)
* [Developer Tools](PostgreSQL%20Tools%20List.md#developer-tools)
  * [Docker](PostgreSQL%20Tools%20List.md#docker)
* [Extensions](PostgreSQL%20Tools%20List.md#extensions)

## PostgreSQL Engine

* [PostgreSQL: The world's most advanced open source database](https://www.postgresql.org/)
  * [PostgreSQL: About](https://www.postgresql.org/about/)
  * [PostgreSQL: Documentation: 13: PostgreSQL 13.2 Documentation](https://www.postgresql.org/docs/13/index.html)
  * [PostgreSQL: Downloads](https://www.postgresql.org/download/)
* [PostgreSQL: Software Catalogue - Administration/development tools](https://www.postgresql.org/download/products/1-administrationdevelopment-tools/)

## CLI

* [pgcli](https://github.com/dbcli/pgcli) - Postgres CLI with autocompletion and syntax highlighting
* [pgsh](https://github.com/sastraxi/pgsh) - Branch your PostgreSQL Database like Git
* [psql](https://www.postgresql.org/docs/current/static/app-psql.html) - The built-in PostgreSQL CLI client
* [psql2csv](https://github.com/fphilipe/psql2csv) - Run a query in psql and output the result as CSV
* [nancy](https://gitlab.com/postgres-ai/nancy) - The Nancy CLI is a unified way to manage automated database experiments either in clouds or on-premise
* [schemaspy](https://github.com/schemaspy/schemaspy) - SchemaSpy is a JAVA JDBC-compliant tool for generating your database to HTML documentation, including Entity Relationship diagrams

## Monitoring

* [check_pgactivity](https://github.com/OPMDG/check_pgactivity) - check\_pgactivity is designed to monitor PostgreSQL clusters from Nagios. It offers many options to measure and monitor useful performance metrics.
* [Check_postgres](https://github.com/bucardo/check_postgres) - Nagios check\_postgres plugin for checking status of PostgreSQL databases.
* [Instrumental](https://github.com/Instrumental/instrumentald) - Real-time performance monitoring, including [pre-made graphs](https://instrumentalapp.com/docs/instrumentald/postgresql#suggested-graphs) for ease of setup (Commercial Software)
* [libzbxpgsql](https://github.com/cavaliercoder/libzbxpgsql) - Comprehensive PostgreSQL monitoring module for Zabbix.
* [PMM](https://github.com/percona/pmm) - Percona Monitoring and Management (PMM) is a Free and Open Source platform for monitoring and managing PostgreSQL, MySQL, and MongoDB.
* [Pome](https://github.com/rach/pome) - Pome stands for PostgreSQL Metrics. Pome is a PostgreSQL Metrics Dashboard to keep track of the health of your database.
* [pgmetrics](https://pgmetrics.io/) - pgmetrics is an open-source, zero-dependency, single-binary tool that can collect a lot of information and statistics from a running PostgreSQL server and display it in easy-to-read text format or export it as JSON and CSV for scripting.
* [pg_view](https://github.com/zalando/pg_view) - Open-source command-line tool that shows global system stats, per-partition information, memory stats and other information.
* [pgwatch2](https://github.com/cybertec-postgresql/pgwatch2) - Flexible and easy to get started PostgreSQL metrics monitor focusing on Grafana dashboards.
* [pgbench](https://www.postgresql.org/docs/devel/static/pgbench.html) - Run a benchmark test on PostgreSQL.
* [opm.io](http://opm.io/) - Open PostgreSQL Monitoring is a free software suite designed to help you manage your PostgreSQL servers. It can gather stats, display dashboards and send warnings when something goes wrong.
* [okmeter.io](https://okmeter.io/pg) - Commercial SaaS agent-based monitoring with a very detailed PostgreSQL plugin. It automatically gathers 100s of stats, displays dashboards on every aspect and sends alerts when something goes wrong (Commercial Software).

## GUI

## PostgreSQL Specific

*⭐ = Recommended*

* [Adminer](https://www.adminer.org/) - Full-featured database management tool written in PHP.
* [Beekeeper Studio](https://www.beekeeperstudio.io/) - Free and open source SQL client with a modern UI and great Postgres support. Cross platform. ⭐
* [DataGrip](https://www.jetbrains.com/datagrip/) - IDE with advanced tool sets and good cross-platform experience (Commercial Software).⭐
* [Datazenit](https://datazenit.com/) - Web-based PostgreSQL GUI (Commercial Software).
* [DataRow](https://www.datarow.com/) - Cross-platform SQL Client for Amazon Redshift: Simple, Effortless, Extensible.
* [DBeaver](https://dbeaver.io/) - Universal Database Manager with excellent support for PostgreSQL.⭐
* [dbglass](http://dbglass.web-pal.com/) - Cross-platform desktop client for PostgreSQL, built with Electron.
* [Holistics](https://www.holistics.io/) - Online cross platform database management tool and SQL query reporting GUI with strong PostgreSQL support (Commercial Software).
* [JackDB](https://www.jackdb.com/) - Web-based SQL query interface (Commercial Software).
* [Metabase](https://www.metabase.com/) - Simple dashboards, charts and query tool for PostgreSQL.
* [Numeracy](https://numeracy.co/) - Fast SQL editor with charts and dashboards for PostgreSQL (Commercial Software).
* [OmniDB](https://omnidb.org/en/) - Open Source Collaborative Environment For Database Management
* [pgAdmin](https://www.pgadmin.org/) - PostgreSQL Administration and Management GUI.⭐
* [pgModeler](https://pgmodeler.io/) - pgModeler is an open-source PostgreSQL Database Modeler.
* [pgweb](https://github.com/sosedoff/pgweb) - Web-based PostgreSQL database browser written in Go.⭐
* [phpPgAdmin](https://github.com/phppgadmin/phppgadmin) - The Premier Web Based Administration Tool for PostgreSQL.
* [Postbird](https://github.com/Paxa/postbird) - PostgreSQL Client for macOS.
* [PostgresCompare](https://www.postgrescompare.com/) - Cross-platform database comparison and deployment tool (Commercial Software).
* [Postico](https://eggerapps.at/postico/) - Modern PostgreSQL Client for macOS (Commercial Software).
* [PSequel](http://www.psequel.com/) - Clean and simple interface to perform common PostgreSQL tasks quickly (Commercial Software).
* [SQL Tabs](http://www.sqltabs.com/) - Cross Platform Desktop Client for PostgreSQL written in JS.
* [SQLPro for Postgres](http://macpostgresclient.com/) - Simple, powerful PostgreSQL manager for macOS (Commercial Software).
* [temBoard](https://github.com/dalibo/temboard) - Web-based PostgreSQL GUI and monitoring.
* [TablePlus](https://tableplus.com/) - Native App which let you edit database and structure. High-end security ensured (Commercial Software).
* [Valentina Studio](https://www.valentina-db.com/en/valentina-studio-overview) - Cross-platform database administration tool (Free/Commercial)⭐

---

*Backlinks:*

````dataview
list from [[Database GUIs]] AND -"Changelog"
````

## Developer Tools

* pgHero
* pgSync
* postgres-ai/database-lab
* DBML, dbdocs.io, dbdiagram.io
* PostgREST
* postGIS
* WAL-G: [wal-g/wal-g: Archival and Restoration for Postgres (github.com)](https://github.com/wal-g/wal-g#configuration)

### Docker

* [postgres (docker.com)](https://hub.docker.com/_/postgres)
* [postgres/Dockerfile](https://github.com/docker-library/postgres/blob/7bd41786539082857396f4d1b4f1cb326ebee8de/13/Dockerfile)
* [postgresai/extended-postgres (docker.com)](https://hub.docker.com/r/postgresai/extended-postgres)

````bash
docker pull postgresai/extended-postgres
````

* [postgresai/sync-instance (docker.com)](https://hub.docker.com/r/postgresai/sync-instance)

````powershell
docker pull postgresai/sync-instances

docker run \
   --name sync_instance \
   --env PGDATA=/var/lib/postgresql/pgdata \
   --env WALG_GS_PREFIX="gs://{BUCKET}/{SCOPE}" \
   --env GOOGLE_APPLICATION_CREDENTIALS="/etc/sa/credentials.json" \
   --volume {PATH_TO_CREDENTIALS}:/etc/sa/credentials.json \
   --volume /var/lib/dblab/data:/var/lib/postgresql/pgdata:rshared \
   --detach \
   postgresai/sync-instance:13
````

* [postgrest/postgrest (docker.com)](https://hub.docker.com/r/postgrest/postgrest)
* [postgrestoauth/api (docker.com)](https://hub.docker.com/r/postgrestoauth/api)
* [PostgREST Documentation — PostgREST 7.0.1 documentation](https://postgrest.org/en/stable/#)

## Extensions

* [Table of Contents — pgRouting Manual (3.1)](https://docs.pgrouting.org/latest/en/index.html)

---

## Appendix: Links

* [PostgreSQL](../../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md)
* [Databases](../MOCs/Databases.md)
* [Database GUIs List](Database%20GUIs%20List.md)
* *Tools*
* *Database Tools*

*Backlinks:*

````dataview
list from [[PostgreSQL Tools]] AND -"Changelog"
````
