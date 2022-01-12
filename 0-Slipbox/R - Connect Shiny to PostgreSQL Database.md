---
Date: 2022-01-12
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev/R"]
Alias: "R - Connect Shiny to PostgreSQL Database"
---

# R - Connect Shiny to PostgreSQL Database

*Source: [How To Connect R Shiny to Postgres Database - The Definite Guide (appsilon.com)](https://appsilon.com/r-shiny-postgres-database/)*

## Install Necessary Packages

- [[R Package - DBI]]
- [[R Package - RPostgreSQL]]

```R
pak::pak(c("DBI", "RPostgreSQL"))
```

## Database Credentials

- **Database Driver** - `RPostgreSQL::Postgres()` in this instance.
- **Database Name** - The name of the database to connect to (Note: PostgreSQL default database name is *postgres*)
- **Host** (Server) - The server/host URL to connect to: can be cloud based server, `localhost`, [[Docker]] Container, etc.
- **Port** - PostgreSQL default port is `5432`
- **Username** & **Password** - User credentials

***

#### Related

- [[Development]]
- [[R]]
- [[R Shiny]]
- [[Databases]]
- [[PostgreSQL]]
- [[R Database Packages]]
- [[R Shiny Packages]]