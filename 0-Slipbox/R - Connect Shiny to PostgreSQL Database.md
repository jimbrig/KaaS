# R - Connect Shiny to PostgreSQL Database

*Source: [How To Connect R Shiny to Postgres Database - The Definite Guide (appsilon.com)](https://appsilon.com/r-shiny-postgres-database/)*

## Contents

* [Install Necessary Packages](R%20-%20Connect%20Shiny%20to%20PostgreSQL%20Database.md#install-necessary-packages)
* [Database Credentials](R%20-%20Connect%20Shiny%20to%20PostgreSQL%20Database.md#database-credentials)
* [Connect to the Database](R%20-%20Connect%20Shiny%20to%20PostgreSQL%20Database.md#connect-to-the-database)
* [Running Queries](R%20-%20Connect%20Shiny%20to%20PostgreSQL%20Database.md#running-queries)
* [Appendix: Links](R%20-%20Connect%20Shiny%20to%20PostgreSQL%20Database.md#appendix-links)

## Install Necessary Packages

* [R Package - DBI](../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20DBI.md)
* [R Package - RPostgreSQL](../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20RPostgreSQL.md)

````R
pak::pak(c("DBI", "RPostgreSQL"))
````

## Database Credentials

* **Database Driver** - `RPostgreSQL::Postgres()` in this instance.
* **Database Name** - The name of the database to connect to (Note: PostgreSQL default database name is *postgres*)
* **Host** (Server) - The server/host URL to connect to: can be cloud based server, `localhost`, [Docker](../3-Resources/Tools/Developer%20Tools/Docker/Docker.md) Container, etc.
* **Port** - PostgreSQL default port is `5432`
* **Username** & **Password** - User credentials

*Best Practice: Do not keep database connection details tracked in VCS/Git, instead abstract the configuration away from the codebase as a separate config file, a dedicated secrets vault or keyring, or environment variables.*

## Connect to the Database

In R, to connect to a database using [DBI](../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/Database%20R%20Packages/R%20Package%20-%20DBI.md), you create an *R6* object housing the connection, in this case the connection object is assigned to `conn`. 

````R
library(DBI)

db <- "postgres"
db_host <- "localhost"
db_port <- "5432"
db_user <- "<your_user>"
db_pass <- "<your_password>"

conn <- dbConnect(
	RPostgres::Postgres(),
	dbname = db,
	host = db_host,
	port = db_port,
	user = db_user,
	password = db_pass
)
````

Next, you can check the connection was successful by running `DBI::dbListTables(conn)` to list all tables.

## Running Queries

* Example `SELECT` query:

````R
DBI::dbGetQuery(conn, "SELECT * FROM <table name> LIMIT 10")
````

---

## Appendix: Links

* [Development](../2-Areas/MOCs/Development.md)
* [2-Areas/MOCs/R](../2-Areas/MOCs/R.md)
* [R Shiny](../2-Areas/MOCs/R%20Shiny.md)
* [Databases](../2-Areas/MOCs/Databases.md)
* [PostgreSQL](../3-Resources/Tools/Developer%20Tools/Data%20Stack/Databases/PostgreSQL.md)
* [R - Database Packages List](../2-Areas/Lists/R%20-%20Database%20Packages%20List.md)
* [R Shiny Packages List](../2-Areas/Lists/R%20Shiny%20Packages%20List.md)
