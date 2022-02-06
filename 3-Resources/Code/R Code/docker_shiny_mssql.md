---
Date: 2022-02-05
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/R", "#Topic/Dev/R"]
Alias: ["docker_shiny_mssql"]
---

# docker_shiny_mssql

*Source: [viktortat/docker_shiny_mssql: This repo holds the relevant Docker, R and SQL scripts needed to reproduce my tutorial on Dockerizing R/Shiny and MS SQL Server (github.com)](https://github.com/viktortat/docker_shiny_mssql)*

## Contents

- [[#Overview|Overview]]
- [[#Code|Code]]
	- [[#Docker and Docker Compose|Docker and Docker Compose]]
	- [[#R|R]]
	- [[#PowerShell|PowerShell]]
	- [[#SQL Server|SQL Server]]
	- [[#Apps|Apps]]
- [[#Appendix: Links|Appendix: Links]]



## Overview

This repo holds the relevant Docker, R and SQL scripts needed to reproduce my tutorial on Dockerizing R/Shiny and MS SQL Server

## Code

### Docker and Docker Compose

- [Dockerfile](https://github.com/viktortat/docker_shiny_mssql/blob/master/Dockerfile)

```Dockerfile
FROM rocker/shiny-verse

COPY /first_app/ /srv/shiny-server/
```

- [Dockerfile_R](https://github.com/viktortat/docker_shiny_mssql/blob/master/Dockerfile_R)

```Dockerfile
FROM rocker/shiny-verse

#update all packages
RUN apt-get update

#upgrade
RUN apt-get upgrade -y

#install additional packages
RUN apt install gpg-agent -y unixodbc apt-utils curl

#get msodbcsql17 and install it
 RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
 RUN curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
 RUN apt-get update -y
 RUN ACCEPT_EULA=Y apt-get install -y msodbcsql17 

#rename SQL Driver title in odbcinst file
RUN sed -i 's/ODBC Driver 17 for SQL Server/SQL Server/' etc/odbcinst.ini

#install packaes needed for running the app
RUN R -e "install.packages(c('odbc', 'data.table'))"

#copy app to image
COPY second_app/ /srv/shiny-server/second_app
```

- [Dockerfile_sql](https://github.com/viktortat/docker_shiny_mssql/blob/master/Dockerfile_sql)

```Dockerfile
FROM mcr.microsoft.com/mssql/server:2017-CU21-ubuntu-16.04

RUN ln -s /opt/mssql-tools/bin/* /usr/local/bin/

ENV SA_PASSWORD MyPassword123!
ENV ACCEPT_EULA Y
ENV MSSQL_PID Express

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Copy scripts to load data
COPY sqlserver/ /usr/src/app

# Grant permissions to ensure files are executable
RUN chmod +x /usr/src/app/run-startup.sh
RUN chmod +x /usr/src/app/entrypoint.sh

#define new entry point
CMD /bin/bash /usr/src/app/entrypoint.sh
```

- [docker-compose.yml](https://github.com/viktortat/docker_shiny_mssql/blob/master/docker-compose.yml)

```yaml
version: "3.7"
services:

  R-container:
    container_name: R-container
    image: shiny_app
    ports:
        - "3838:3838"

  sql-server-db:
    container_name: sql-server
    image: sql-server
    ports:
      - "1433:1433"
```

### R

- [local_db_connector.R](https://github.com/viktortat/docker_shiny_mssql/blob/master/local_db_connector.R):

```R
#load odbc package
library(odbc)

#create connection to master database
con <- dbConnect(odbc(), Driver="SQL Server", Server="localhost", UID="SA", PWD="MyPassword123!", Database="master", port=1434)

#print out connection
print(con)

#check databases in existence 
dbGetQuery(con, "SELECT name, database_id, create_date FROM sys.databases")

#create new database
dbGetQuery(con, "CREATE DATABASE test_db")
```

### PowerShell

- [script.ps1](https://github.com/viktortat/docker_shiny_mssql/blob/master/script.ps1)

```PowerShell
#get docker version
docker --version

#get docker-compose version
docker-compose --version

#pull the r base image from docker hub
docker pull rocker/r-base

#running the container in interactive mode through the terminal
docker run --rm -t -i rocker/r-base 

#getting an R shiny image
docker pull rocker/shiny-verse

#running the shiny server
docker run --name shiny_container --rm -d -p 3838:3838 rocker/shiny-verse

#check which containers are running
docker container ls  

#build image from Dockerfile - Shiny server plus app
docker build -t shiny_app .

#run image with app
docker run --name shiny_container --rm -d -p 3838:3838 shiny_app


#pull image for SQL Server
docker pull mcr.microsoft.com/mssql/server:2017-latest-ubuntu

#do a test run of the image
docker run --rm --name sql-server -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=MyPassword123!' -e 'MSSQL_PID=Express' -p 1433:1433 -d mcr.microsoft.com/mssql/server:2017-latest-ubuntu

#build sql image
docker build -t sql-server -f Dockerfile_sql .

#run sql image
docker run --rm --name sql-server -d -p 1433:1433 sql-server

#shell into sql container
docker exec -it sql-server bash

#log on to database
sqlcmd -S localhost -U sa -P MyPassword123! -d master

#build R/Shiny image
docker build -t shiny_app -f Dockerfile_R .

#run R/Shiny image
docker run --rm --name R-container -d -p 3838:3838 shiny_app

#check R is running
docker exec -it R-container R

#run compose script to spin up all containers
docker-compose up -d

#read out logs
docker logs R-container -f

#finish off by bringing down the containers
docker-compose down
```

### SQL Server

*Source: [docker_shiny_mssql/sqlserver at master · viktortat/docker_shiny_mssql (github.com)](https://github.com/viktortat/docker_shiny_mssql/tree/master/sqlserver)*

- [entrypoint.sh](https://github.com/viktortat/docker_shiny_mssql/blob/master/sqlserver/entrypoint.sh):

```bash
/usr/src/app/run-startup.sh & /opt/mssql/bin/sqlservr
```

- [load_data.sql](https://github.com/viktortat/docker_shiny_mssql/blob/master/sqlserver/load_data.sql):

```SQL
CREATE DATABASE app_db;
GO
USE app_db;
GO

CREATE TABLE iris (
Sepal_Length numeric(10,5), 
Sepal_Width numeric(10,5), 
Petal_Length numeric(10,5), 
Petal_Width numeric(10,5), 
Species VARCHAR(20));
GO

BULK INSERT iris
FROM '/usr/src/app/iris.csv'
WITH
(  FIRSTROW = 2,
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n',  
    TABLOCK
)
GO

UPDATE iris
SET Species = REPLACE(Species, CHAR(34), '')
```

- [run-startup.sh](https://github.com/viktortat/docker_shiny_mssql/blob/master/sqlserver/run-startup.sh):

```bash
# Wait a little to ensure the server has booted up
sleep 10s

#run sql script to create database and load data
sqlcmd -S localhost -U sa -P MyPassword123! -d master -i /usr/src/app/load_data.sql
```


### Apps

- [first_app/app.R](https://github.com/viktortat/docker_shiny_mssql/blob/master/first_app/app.R):


```R
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
```

- [second_app/app.R](https://github.com/viktortat/docker_shiny_mssql/blob/master/second_app/app.R):

```R
library(shiny)
library(data.table)
library(odbc)

con <- dbConnect(odbc(), Driver = "SQL Server", Server = "sql-server", Database = "app_db", UID = "SA",PWD = "MyPassword123!", Port = 1434)

iris <- as.data.table(dbGetQuery(con, "select * from iris"))

# iris[, Sepal_Length:=as.numeric(Sepal_Length)][, Sepal_Width:=as.numeric(Sepal_Width)]
# iris[, Petal_Length:=as.numeric(Petal_Length)][, Petal_Width:=as.numeric(Petal_Width)]

print(iris)

names(iris) <- gsub("_", "\\.", names(iris))

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Iris Data App"),

    # Sidebar 
    sidebarLayout(
        sidebarPanel(
            selectInput("select", label = h3("Select Species"), 
                        choices = list("setosa" = "setosa", "versicolor" = "versicolor", "virginica" = "virginica"), 
                        selected = 1)
        ),

        # Show plots of the generated distributions
        mainPanel(
           plotOutput("sep.length"),
           plotOutput("sep.width"),
           plotOutput("pet.length"),
           plotOutput("pet.width")
        )
    )
)

# Define server logic required to draw histograms
server <- function(input, output) {

    output$sep.length <- renderPlot({
        
       # draw the histogram 
        hist(iris[Species==input$select, Sepal.Length], col = 'darkgray', border = 'white', main="Sepal Length", xlab="cm")
    })
    
    output$sep.width <- renderPlot({
        
        # draw the histogram 
        hist(iris[Species==input$select, Sepal.Width], col = 'darkgray', border = 'white', main="Sepal Width", xlab="cm")
    })
    
    output$pet.length <- renderPlot({
        
        # draw the histogram 
        hist(iris[Species==input$select, Petal.Length], col = 'darkgray', border = 'white', main="Petal Length", xlab="cm")
    })
    
    output$pet.width <- renderPlot({
        
        # draw the histogram 
        hist(iris[Species==input$select, Petal.Width], col = 'darkgray', border = 'white', main="Petal Width", xlab="cm")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
```

***

## Appendix: Links

- [[Code]]
- [[R]]
- [[Development]]

*Backlinks:*

```dataview
list from [[docker_shiny_mssql]] AND -"Changelog"
```