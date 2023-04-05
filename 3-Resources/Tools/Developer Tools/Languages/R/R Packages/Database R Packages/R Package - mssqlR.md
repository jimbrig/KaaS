# R Package - mssqlR

*Source: [abhisheksinha08/mssqlR: Use mssqlR to query data from MS SQL Server. Based on the concept on Entity Framework, the package allows querying data from MS SQL Server Database. (github.com)](https://github.com/abhisheksinha08/mssqlR)*

## Contents

* [Functions](R%20Package%20-%20mssqlR.md#functions)
  * \[\[\#`connect_db`\|`connect_db`\]\]
  * \[\[\#`connect_entity_gen`\|`connect_entity_gen`\]\]
  * \[\[\#`exec`\|`exec`\]\]
  * \[\[\#`from`\|`from`\]\]
  * \[\[\#`orderby`\|`orderby`\]\]
  * \[\[\#`select`\|`select`\]\]
  * \[\[\#`trim`\|`trim`\]\]
  * \[\[\#`where`\|`where`\]\]
* [Appendix: Links](R%20Package%20-%20mssqlR.md#appendix-links)

## Overview

Use `mssqlR` to query data from MS SQL Server. Based on the concept on Entity Framework, the package allows querying data from MS SQL Server Database.

## Functions

### `connect_db`

````R
#' Connect Function
#'
#' This function allows you to connect to a MS SqlServer Database
#' @param server Database Server Url/IP Address
#' @param db Database Name
#' @param uid User id
#' @param pwd Password
#' @keywords Connect
#' @import RODBC magrittr
#' @importFrom magrittr %>%
#' @export
#' @examples
#' dbHandle <- connect_db("server.com","db_test","admin","password")
connect_db <- function(server, db, uid, pwd){
  dbhandle <- tryCatch({
    odbcDriverConnect(paste('driver={SQL Server Native Client 11.0};server=', server, ';database=',db, ';uid=', uid, ';pwd=',pwd, sep = ""))
  },
  error = function(e){
    print(paste("Error!", e))
  }
  )
  return(dbhandle)
}
````

### `connect_entity_gen`

````R
#' Connect to Database Server and Generate Entity Details Function
#'
#' This function connects to database and creates entity details
#' @param server Database Server Url/IP Address
#' @param db Database Name
#' @param uid User id
#' @param pwd Password
#' @keywords Connect Entity Generation
#' @import RODBC magrittr
#' @importFrom magrittr %>%
#' @export
#' @examples
#' dbHandle <- connect_entity_gen("server.com","db_test","admin","password")

connect_entity_gen <- function(server, db, uid, pwd){
  #Connect to SQL Server
  cat("mssqlR: Connecting to Database...")
  dbhandle <- tryCatch({
    odbcDriverConnect(paste('driver={SQL Server Native Client 11.0};server=', server, ';database=',db, ';uid=', uid, ';pwd=',pwd, sep = ""))
  },
  error = function(e){
    cat(paste("Error!", e, sep = " - "))
    return(NULL)
  }
  )

  if(dbhandle==-1)
  {
    cat("ERROR!")
    return(NULL)
  }
  cat("Connected!\n")
  cat("Generating Entities...")
  #Get Table Names
  tables_sys <- sqlQuery(dbhandle, 'Select SS.name + \'.\' + ST.name from sys.tables ST LEFT JOIN sys.schemas SS ON ST.schema_id=SS.schema_id WHERE ST.type_desc = \'USER_TABLE\' ORDER BY ST.Name')
  tables_sys<-data.frame(tables_sys, stringsAsFactors = FALSE)
  tables_sys$Var.1 <- levels(tables_sys$Var.1)

  dbDetails<-list(dbhandle = dbhandle)

  i<-1
  for(i in 1:nrow(tables_sys)){
    dbDetails[[paste("tbl",tables_sys[i,1], sep = "_")]] <-  as.character(tables_sys[i,1])
    i<-i+1
  }
  rm( list = c("tables_sys","i"))

  #Get View Names
  tables_sys <- sqlQuery(dbhandle, 'Select SS.name + \'.\' + SV.name from sys.views SV LEFT JOIN sys.schemas SS ON SV.schema_id=SS.schema_id ORDER BY SV.Name')
  tables_sys<-data.frame(tables_sys, stringsAsFactors = FALSE)
  tables_sys$Var.1 <- levels(tables_sys$Var.1)

  i<-1
  for(i in 1:nrow(tables_sys)){
    dbDetails[[paste("view",tables_sys[i,1], sep = "_")]] <-  as.character(tables_sys[i,1])
    i<-i+1
  }
  rm( list = c("tables_sys","i"))


  #Get Field Names

  tables_sys <- as.list(sqlQuery(dbhandle, 'Select SS.name, ST.name from sys.tables ST LEFT JOIN sys.schemas SS ON ST.schema_id=SS.schema_id WHERE ST.type_desc = \'USER_TABLE\' ORDER BY ST.Name'))
  i<-1
  for(i in 1:length(tables_sys$name.1)){
    cat(".")
    schema_name <- tables_sys$name[i]
    table_name <- tables_sys$name.1[i]
    tableName <- paste(schema_name, ".", table_name, sep = "")
    cols <- sqlQuery(dbhandle, paste("Select COLUMN_NAME from INFORMATION_SCHEMA.columns where TABLE_NAME=\'", table_name, "\' and TABLE_SCHEMA=\'", schema_name, "\'", sep = ""))
    cols<-data.frame(cols, stringsAsFactors = FALSE)
    cols$Var.1 <- levels(cols$Var.1)
    j<-1
    for(j in 1:nrow(cols)){
      dbDetails[[paste("col",tableName, cols[j,1], sep = "_")]] <-  as.character(cols[j,1])
      j<-j+1
    }


    i<-i+1
  }
  rm( list = c("tables_sys","cols","i","j","schema_name","table_name","tableName"))

  #Get View Field Names

  view_sys <- as.list(sqlQuery(dbhandle, 'Select SS.name, ST.name from sys.views ST LEFT JOIN sys.schemas SS ON ST.schema_id=SS.schema_id ORDER BY ST.Name'))
  i<-1
  for(i in 1:length(view_sys$name.1)){
    cat(".")
    schema_name <- view_sys$name[i]
    view_name <- view_sys$name.1[i]
    viewName <- paste(schema_name, ".", view_name, sep = "")
    cols <- sqlQuery(dbhandle, paste("Select COLUMN_NAME from INFORMATION_SCHEMA.columns where TABLE_NAME=\'", view_name, "\' and TABLE_SCHEMA=\'", schema_name, "\'", sep = ""))
    cols<-data.frame(cols, stringsAsFactors = FALSE)
    cols$Var.1 <- levels(cols$Var.1)
    j<-1
    for(j in 1:nrow(cols)){
      dbDetails[[paste("vcol",viewName, cols[j,1], sep = "_")]] <-  as.character(cols[j,1])
      j<-j+1
    }


    i<-i+1
  }
  rm( list = c("view_sys","cols","i","j","schema_name","view_name","viewName"))

  cat("Done\n")

  return(dbDetails)
}
````

### `exec`

````R
#' Executes the query
#'
#' This function executes the query
#' @param query full query for execution
#' @param dbHandle Database Handle to use for query
#' @keywords exec
#' @importFrom magrittr %>%
#' @export
#' @examples
#' df <- exec("",NULL)

exec <- function(query, dbHandle){
  df <- tryCatch({
    if(grepl("Select", query) == FALSE && grepl("select", query) == FALSE)
    {
      query <- paste("Select *", query, sep = " ") #Add Select * if Select part is missing
    }
    sqlQuery(dbHandle, query)
  },
  error = function(e){
    cat(paste("Error!\n", e))
    return(NULL)
  }
  )
}
````

### `from`

````R
#' Generates from part for the query
#'
#' This function creates a from part for the query
#' @param query Existing query
#' @param data Table or View to query from
#' @keywords from
#' @importFrom magrittr %>%
#' @export
#' @examples
#' from_tb <- from("","tableName")

from <- function(query=NULL, data){
  if(is.null(query))
  {
    query ="";
  }

  if(query=="")
  {
    return(paste("from", data, sep = " "))
  }
  else
  {
    if(grepl("select", query) == FALSE)
    {
      return(paste("from", data, query, sep = " "))
    }
    else
    {
      return(paste(query, "from", data, sep = " "))
    }
  }
}
````

### `orderby`

````R
#' Generates order by part of a query
#'
#' This function generates "order by" part of a query
#' @param query Existing query
#' @param  ... order by list
#' @keywords order by
#' @importFrom magrittr %>%
#' @export
#' @examples
#' order_by_cols <- orderby("", "col1", "ASC","col2", "DESC")

orderby <- function(query=NULL,  ...){

  if(is.null(query))
  {
    query ="";
  }

  c1 <- c(...);

  if(length(c1)==0 || (length(c1)) %%2>0)
  {
    return(query);
  }

  for(i in seq(1,length(c1),2))
  {
    orderbydir <- toupper(c1[i+1]);
    if(orderbydir!='ASC' && orderbydir!='DESC')
    {
      orderbydir <- 'ASC';
    }
    if(i==1)
    {
      order_by_clause <- paste("ORDER BY", c1[i], orderbydir, sep = " ");
    }
    else
    {
      order_by_clause <- paste(order_by_clause, paste(c1[i], orderbydir, sep = " "), sep=",");
    }
  }

  return(trim(paste(query, order_by_clause, sep = " ")));
}
````

### `select`

````R
#' Generates Select part fo the query
#'
#' This function creates "Select" part fo the query
#' @param query Existing query
#' @param ... Fields to query
#' @param top Top n rows of the data
#' @param distinct True or FALSE
#' @keywords from
#' @importFrom magrittr %>%
#' @export
#' @examples
#'
#' #Returns Top 100 rows
#' from_tb <- select("","COl1","COl2","Col3", top=100)
#'
#' #Returns distinct rows
#' from_tb <- select("","COl1","COl2","Col3", distinct=TRUE)

select <- function(query=NULL, ..., top=NULL, distinct=NULL){

  top_provided<-TRUE
  if(is.null(top))
  {
    top_provided <- FALSE # Top Parameter not provided
  }
  else
  {
    if(is.numeric(top)==FALSE)
    {
      top_provided <- FALSE # Top Parameter is a string
    }
    else
    {
      if(top%%1!=0)
      {
        top_provided <-FALSE #Top parameter is not an integer
      }
      else
      {
        if(top<=0)
        {
          top_provided<-FALSE #TOP parameter is not a positive number
        }
      }
    }
  }

  if(is.null(query))
  {
    query ="";
  }

  if(is.null(distinct))
  {
    distinct = FALSE;
  }


  # no columns name are provided
  if(length(c(...))==0)
  {
    if(top_provided==TRUE)
    {
      if(distinct==TRUE)
      {
        return(paste("Select DISTINCT TOP", top , "*",query,sep = " "))
      }
      return(paste("Select TOP", top , "*",query,sep = " "))
    }
    if(distinct==TRUE)
    {
      return(paste("Select DISTINCT *",query,sep = " "))
    }
    return(paste("Select *",query,sep = " "))
  }

  # when columns name are provided
  if(top_provided==TRUE)
  {
    if(distinct==TRUE)
    {
      return(trim(paste("Select DISTINCT TOP", top, paste(...,sep = ","), query, sep = " ")))
    }
    return(trim(paste("Select TOP", top, paste(...,sep = ","), query, sep = " ")))
  }
  if(distinct==TRUE)
  {
    return(trim(paste("Select DISTINCT",paste(...,sep = ","), query, sep = " ")))
  }
  return(trim(paste("Select",paste(...,sep = ","), query, sep = " ")))

}
````

### `trim`

````R
#' Trims leading and trailing whitespaces
#'
#' This function trims leading and trailing whitespaces
#' @param x string to trim
#' @keywords trim leading trailing whitespaces
#' @importFrom magrittr %>%
#' @export
#' @examples
#' df <- trim(" text containing leading and trailing whitespaces. ")
#' #text containing leading and trailing whitespaces.
trim <- function (x) gsub("^\\s+|\\s+$", "", x)
````

### `where`

````R
#' Generates where part of a query
#'
#' This function generates "where" part of a query
#' @param query Existing query
#' @param  ... where list
#' @keywords where
#' @importFrom magrittr %>%
#' @export
#' @examples
#' where_cond <- where("", "col1", "=", "test1", "AND", "col2", ">", 25)

where <- function(query=NULL,  ...){

  if(is.null(query))
  {
    query ="";
  }

  c1 <- c(...);

  if(length(c1)==0 || (length(c1) +1) %%4>0)
  {
    return(query);
  }

  where_clause <- "";

  for(i in seq(0,length(c1),4))
  {
    where_clause_right_side <- c1[i+3];
    if(suppressWarnings(is.na(as.numeric(c1[i+3]))))
    {
      where_clause_right_side <- paste("'", c1[i+3], "'", sep = "");
    }

    if(i==0)
    {
      where_clause <- paste("where", c1[i+1], c1[i+2],where_clause_right_side, sep = " ");
    }
    else
    {
      if(toupper(c1[i])=="AND")
      {
        #AND Condition
        where_clause <- paste(where_clause, paste("AND",c1[i+1], c1[i+2],where_clause_right_side, sep = " "), sep=" ");
      }
      else
      {
        #OR Condition
        where_clause <- paste(where_clause, paste("OR",c1[i+1], c1[i+2],where_clause_right_side, sep = " "), sep=" ");
      }
    }
  }

  return(trim(paste(query, where_clause, sep = " ")));
}
````

---

## Appendix: Links

* [Tools](../../../../../Tools.md)
* [Development](../../../../../../../2-Areas/MOCs/Development.md)
  \<\<\<\<\<\<\< HEAD:3-Resources/Tools/R/R Packages/Database R Packages/R Package - mssqlR.md
* [R](../../../../../../../2-Areas/Code/R/R.md)
* *R Database Packages*
  =======
* [2-Areas/MOCs/R](../../../../../../../2-Areas/MOCs/R.md)
* [R - Database Packages List](../../../../../../../2-Areas/Lists/R%20-%20Database%20Packages%20List.md)
  \>>>>>>> develop:3-Resources/Tools/Developer Tools/Languages/R/R Packages/Database R Packages/R Package - mssqlR.md

*Backlinks:*

````dataview
list from [[R Package - mssqlR]] AND -"Changelog"
````
