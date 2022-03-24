---
Date: 2022-03-23
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Clipping"]
Alias: "Developing flexible ETL pipelines between databases with Apache Airflow"
---

# Developing flexible ETL pipelines between databases with Apache Airflow

*Source: [Developing flexible ETL pipelines between databases with Apache Airflow](https://engineering.getmidas.com/developing-flexible-etl-pipelines-between-databases-with-apache-airflow-f8352329e651)*

![](https://miro.medium.com/max/1400/0*JFiCSBC9FN3fX24r)

Photo by [Joshua Sortino](https://unsplash.com/@sortino?utm_source=medium&utm_medium=referral) on [Unsplash](https://unsplash.com/?utm_source=medium&utm_medium=referral)

**Requires knowledge on:** PostgreSQL, MySQL, and as always, Python.

As data engineers, one of our responsibilities is to develop, manage and optimize Extract, Transform, Load (ETL) pipelines to extract data (APIs, web scraping, databases etc.) and load data to the target using appropriate transforms. This goal rarely changes according to role, but the source and destination of data might vary depending on the need. If let’s say, the marketing team decided to measure their campaign performance on various platforms, then this process will require reporting on a daily basis. But, as data team, our goal must be permanently eliminating time-consuming, repetitive processes in our team like going to the website, downloading a CSV, creating graphs out of it, and reporting it to the management & stakeholders using PowerPoint each day. A well-qualified data engineer must always represent solutions to manual processes with the help of automation tools like Apache Airflow, Apache NiFi, SQL Server Integration Services (SSIS), or Talend using excellent data manipulation skills. These tools provides you a framework to organize your pipelines, but the most important thing about a pipeline is its flexibility. As your enterprise grows, your pipeline must be as scalable and flexible as possible to have sustainability in the long term.

## Flexible pipelines

![](https://miro.medium.com/max/1400/0*L6cFdEjFfp4IaE1r)

Photo by [Dragoș Grigore](https://unsplash.com/@skyclear?utm_source=medium&utm_medium=referral) on [Unsplash](https://unsplash.com/?utm_source=medium&utm_medium=referral)

The most important thing about building a reliable pipeline is its flexibility to the changes. The development team can change the design of the database by adding a new column, changing data type, enforcing default values, adding new tables, or removing deprecated ones. Therefore, our pipeline should be manipulated easily against these changes. In Midas, our solution to this problem is a manager schema with reference tables specifically designed and integrated into pipelines. You can think of it as a pilot cockpit. The essential part of flight instruments of a pilot is the Mode Control Panel which is used to control heading, speed, altitude, vertical speed, vertical navigation, and lateral navigation. Inspired by design, our reference tables will be like the following:

The reference table is designed to be the input to a single or multiple ETL pipelines. Its columns are divided into three groups.

1- Source information — source database (PostgreSQL, MySQL, Cloud Databases), source schema, source table name, and key fields

2- Extraction configurations — extraction type (TRUNCATE/INSERT, UPSERT, DELETE/INSERT), extraction method (JDBC, PXF)

3- Target informations (destination database, destination schema, destination table and target\_fields)

Our goal in this tutorial is to build a flexible ETL pipeline that extracts an example dataset from MySQL and ingests it to PostgreSQL using reference tables in the PostgreSQL database.

**Tasks that will be covered in this tutorial:**

1- Deploying Apache Airflow with Docker Compose  
2- Deploying MySQL and PostgreSQL with Docker Compose  
3- Data ingestion to MySQL  
4- Implementing reference table logic in PostgreSQL to manage the ETL pipeline  
5- Developing ETL pipeline to transfer data using Apache Airflow

## **Setting up the environment**

![](https://miro.medium.com/max/1400/0*ZeokgkbeOcmfksdo)

Photo by [ANGELA BENITO](https://unsplash.com/@angelareinosa?utm_source=medium&utm_medium=referral) on [Unsplash](https://unsplash.com/?utm_source=medium&utm_medium=referral)

**Requirements:**  
1- [Docker Desktop](https://docs.docker.com/get-docker/)  
2- [Docker Compose](https://docs.docker.com/compose/install/) (Not required for MacOS users since Docker Desktop includes Docker Compose)  
3- [Python](https://www.python.org/downloads/)  
4- Clone the repository for [required materials](https://github.com/egehanyorulmaz/reference_etl)

After successfully downloading Docker and Docker Compose, you have specific options to install PostgreSQL and MySQL, but the easiest way is to use docker-compose. I have designed two docker-compose yml files to install both of them for the sake of this tutorial, along with Apache Airflow to use.

After cloning the repository to your local computer, please follow these steps to deploy PostgreSQL, MySQL, and Apache Airflow as docker containers:

1- Navigate to the path of the .yml files using terminal  
2- Make sure docker is up and running.  
3- Run `docker-compose -f etl_databases.yml up -d` in the terminal to install Postgresql and MySQL databases.  
4- Run `docker-compose -f apache-airflow.yaml up -d` in the terminal to install Apache Airflow.  
5- Run python file, *initialize\_databases.py*, which is located inside the dags folder.

To access the database, you can use different tools, but I highly recommend DataGrip if you are working with multiple databases simultaneously. It also allows manually migrating data between databases.

Helper classes are extremely useful to manage databases without writing any SQL scripts. If you are using Airflow, it is easy to go with already implemented operators like PostgresOperator, MysqlOperator. Unfortunately, after a certain amount of time, you will face limitations when running complex operations like deleting the last 7 days of data and inserting your data where you do nothing on conflict.

That ’s why we prefer to develop a subclass called ***Database*** (in connections.py) that offers SQL capabilities in Python. In this way, when you are working with Airflow, you have the option to customize your pipeline. Then, we are able to inherit the methods of the Database from database-specific classes. To do this, we will be using the phrase super().init(<CHILD CLASS PARAMETERS>). This definition allows the child class to use the methods (basically inherits from parent class) of the parent passed as parameters to the class definition.

## connections.py

Our main class is as following:

class Database:  
    def \_\_init\_\_(self, database\_type, host, port, db\_name, user\_name, password):  
        self.host = host  
        self.port = port  
        self.db\_name = db\_name  
        self.\_user\_name = user\_name   
        self.\_password = password  
        self.database\_type = database\_type  
        self.conn = self.establish\_connection()  
        self.cursor = self.conn.cursor()

    def establish\_connection(<PARAMETERS>):  
        pass

    def execute\_query(<PARAMETERS>):  
        pass

    def truncate\_table(<PARAMETERS>)  
        pass

    def create\_schema(<PARAMETERS>):  
        pass

    def create\_table(<PARAMETERS>):  
        pass

    def drop\_schema(<PARAMETERS>):  
        pass

    def drop\_table(<PARAMETERS>):  
        pass

    def insert\_values(<PARAMETERS>):  
        pass

    def close\_connection(<PARAMETERS>):  
        pass

Now, we will create two child classes for our operations in MySQL and PostgreSQL

class Mysql(Database):  
    def \_\_init\_\_(self, host, port, db\_name, user\_name, password):  
        super().\_\_init\_\_('mysql', host, port, db\_name, user\_name, password)class Postgresql(Database):  
    def \_\_init\_\_(self, host, port, db\_name, user\_name, password):  
        super().\_\_init\_\_('postgresql', host, port, db\_name, user\_name, password)

## initialize\_databases.py

In this code, we will be inserting an example dataset into the Mysql database.

from helpers.connections import Mysql  
import pandas as pd  
import osCUR\_DIR = os.path.abspath(os.path.dirname(\_\_file\_\_))database = Mysql(host='localhost', port='3306', db\_name='mysql\_db', user\_name='root', password='root\_mysql')database.drop\_table(table\_schema='stock',  
table\_name='stock\_symbols')database.drop\_table(table\_schema='stock', table\_name='stock\_values')  
database.drop\_schema(table\_schema='stock')

database.create\_schema('stock')

stock\_symbols\_df = pd.read\_csv(CUR\_DIR + "/tutorial\_data/Company.csv")

database.create\_table(table\_schema='stock', table\_name='stock\_symbols',  
                      columns={'ticker\_symbol': 'varchar(20)',  
                               'stock\_name': 'varchar(20)'})database.insert\_values(data=stock\_symbols\_df, table\_schema='stock', table\_name='stock\_symbols',  
columns='ticker\_symbol, stock\_name')stock\_values\_df = pd.read\_csv(CUR\_DIR + "/tutorial\_data/CompanyValues.csv")database.create\_table(table\_schema='stock', table\_name='stock\_values',  
columns={'ticker\_symbol': 'varchar(20)',  
         'day\_date': 'timestamp',  
         'close\_value': 'float',  
         'volume': 'bigint',  
         'open\_value': 'float',  
         'high\_value': 'float',  
         'low\_value': 'float'})database.insert\_values(data=stock\_values\_df, table\_schema='stock', table\_name='stock\_values', columns='ticker\_symbol, day\_date, close\_value, volume, open\_value, high\_value, low\_value')

When you run the script provided above, then you will be having two different tables which are already downloaded to the repository from the [Kaggle dataset](https://www.kaggle.com/omermetinn/values-of-top-nasdaq-copanies-from-2010-to-2020), Daily Stock Market Values of Top NASDAQ Companies from 2010 to 2020, and running this code will insert our tutorial data to the MySQL database.

![](https://miro.medium.com/max/1400/1*bKpW-ZvyEXTn9EgJrmhqZw.png)

Stock Symbols

![](https://miro.medium.com/max/1400/1*ndCWJtoSJXhBmR4ursiQ7w.png)

Stock Values

Now, our goal is quite clear. We have to develop a pipeline to transfer these two tables to PostgreSQL. Therefore, we are now ready to create our manager reference table for this particular pipeline in PostgreSQL.

## initialize\_reference\_table.py

Firstly, we will establish a connection to the postgresql database.

from helpers.connections import Postgresql  
import pandas as pd  
from datetime import datetime  
import os

CUR\_DIR = os.path.abspath(os.path.dirname(\_\_file\_\_))  
database = Postgresql(host='localhost', port='5433', db\_name='postgres\_db', user\_name='postgres', password='postgres')

Then, we will create stock\_symbols and stock\_values tables for the ingestion process under stock schema.

\# initialize destination tables for data ingestion  
database.create\_schema('stock')  
database.create\_table(table\_schema='stock', table\_name='stock\_symbols',  
                      columns={'ticker\_symbol': 'varchar',  
                               'stock\_name': 'varchar'})database.create\_table(table\_schema='stock', table\_name='stock\_values',  
columns={'ticker\_symbol': 'varchar',  
         'day\_date': 'timestamp',  
         'close\_value': 'numeric',  
         'volume': 'bigint',  
         'open\_value': 'float',  
         'high\_value': 'float',  
         'low\_value': 'float'})

Later, we insert two rows to our reference table which will be used in the Airflow DAG.

stock\_symbol\_dict = {'insert\_date': str(datetime.now()), 'source\_connection': 'mysql',   
'source\_schema': 'stock',  
'source\_table': 'stock\_symbols',   
'key\_fields': 'ticker\_symbol, stock\_name',   
'extraction\_method': 'jdbc', 'extraction\_type': 'full', 'destination\_connection': 'postgresql',   
'destination\_schema': 'stock',   
'destination\_table': 'stock\_symbols',   
'target\_fields': 'ticker\_symbol, stock\_name'}

stock\_values\_dict = {'insert\_date': str(datetime.now()), 'source\_connection': 'mysql',   
'source\_schema': 'stock',  
'source\_table': 'stock\_values',  
'key\_fields': 'ticker\_symbol, day\_date, close\_value, volume, open\_value, high\_value, low\_value',   
'extraction\_method': 'jdbc','extraction\_type': 'full', 'destination\_connection': 'postgresql',  
'destination\_schema': 'stock',   
'destination\_table': 'stock\_values',  
'target\_fields': 'ticker\_symbol, day\_date, close\_value, volume, open\_value, high\_value, low\_value'}

stock\_symbol\_dict = {k:\[v,\] for k,v in stock\_symbol\_dict.items()}  
stock\_values\_dict = {k:\[v,\] for k,v in stock\_values\_dict.items()}

stock\_symbol\_df = pd.DataFrame(stock\_symbol\_dict)  
stock\_values\_df = pd.DataFrame(stock\_values\_dict)

database.insert\_values(data=stock\_symbol\_df, table\_schema='etl\_manager', table\_name='database\_flow\_reference\_table',  
columns=', '.join(stock\_symbol\_df.columns.tolist()))

database.insert\_values(data=stock\_values\_df, table\_schema='etl\_manager', table\_name='database\_flow\_reference\_table',  
columns=', '.join(stock\_values\_df.columns.tolist()))

## Airflow DAG design

Luckily, you have already installed Airflow, and we are going to work with Directed Acyclic Graphs (DAGs). Apache Airflow UI can be accessed by localhost:8080 because of the airflow-webserver configuration on the apache-airflow.yaml file.

The login credentials are both ‘airflow’ for username and password. To build a pipeline, we must have the following functions:

**Function 1- Downloads the reference table and returns it as dataframe**

def download\_reference\_table() -> DataFrame:  
  conn\_obj = Postgresql(host=POSTGRE\_HOST, port=POSTGRE\_PORT, db\_name=POSTGRE\_DB\_NAME, user\_name=POSTGRE\_USER, password=POSTGRE\_PASSWORD)  
    query = """SELECT \* FROM etl\_manager.database\_flow\_reference\_table"""  
    ref\_table = conn\_obj.execute\_query(query=query, return\_data=True)  
    conn\_obj.close\_connection()  # close connection to greenplum db  
    return ref\_table

In this function, we will first establish a connection to Postgresql, run a select query and retrieve the returned data frame. We will be using the returned reference table data to iterate over in our tasks.

**Function 2- Extracts data with given schema and table from MySQL database**

def extract(source\_connection\_name: str, schema\_name: str, table\_name: str, key\_fields: str) -> None:  
    if source\_connection\_name == 'mysql':  
        conn\_obj = Mysql(host=MYSQL\_HOST, port=MYSQL\_PORT, db\_name=MYSQL\_DB\_NAME, user\_name=MYSQL\_USER, password=MYSQL\_PASSWORD)  
    query = f"SELECT {key\_fields} FROM {schema\_name}.{table\_name}"  
    data = conn\_obj.execute\_query(query, return\_data=True)  
    file\_name = f"{schema\_name}\_{table\_name}.csv"  
    file\_path = CUR\_DIR + '/' + file\_name  
    data.to\_csv(file\_path, index=False)  
    conn\_obj.close\_connection()

Here, we will establish a connection to the source connection name provided in the reference table and retrieve the key fields from the table again specified in the reference table. The most beneficial factor of using reference tables, a.k.a. a table that manages the pipeline, we can easily add new source databases with minimum code development and change the configurations of the ETL pipeline.

**Function 3- Inserts data to given schema and table in the PostgreSQL database**

def load\_to\_target(output\_path: str, target\_connection\_name: str, target\_schema: str, target\_table: str,  
                   target\_fields: str) -> None:  if target\_connection\_name == 'postgresql':  
        conn\_obj = Postgresql(host=POSTGRE\_HOST, port=POSTGRE\_PORT, db\_name=POSTGRE\_DB\_NAME, user\_name=POSTGRE\_USER, password=POSTGRE\_PASSWORD)

    data = pd.read\_csv(output\_path)  
    conn\_obj.truncate\_table(table\_schema=target\_schema, table\_name=target\_table)  
    conn\_obj.insert\_values(data=data, table\_schema=target\_schema, table\_name=target\_table, columns=target\_fields)  
    conn\_obj.close\_connection()

This function will insert our extracted data to the destination passed as a parameter to the reference table. It is flexible because you can post any data with additional configuration in this function.

So, [the entire DAG](https://github.com/egehanyorulmaz/reference_etl/blob/main/dags/etl_pipeline_dag.py) is easily manipulatable.

Let’s trigger our pipeline and see our green nodes :)

![](https://miro.medium.com/max/1400/1*EcuXDASN2bi2rE5SuiqWEQ.png)

Successful DAG Run

Here we go! Now, we successfully transferred data from MySQL to PostgreSQL using Apache Airflow. Congratulations!

***

## Appendix: Links

- [[JavaScript - Obsidian Web Clipper Bookmarklet|Obsidian Web Clipper Bookmarklet]]
- [[3-Resources/Clippings/_README|Clippings]]
