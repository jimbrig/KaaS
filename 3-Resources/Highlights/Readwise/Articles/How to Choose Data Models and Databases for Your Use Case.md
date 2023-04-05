# How to Choose Data Models and Databases for Your Use Case

## Metadata

* Author: *Chandan Kumar*
* Full Title: How to Choose Data Models and Databases for Your Use Case
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/ee3aa3a864ae

## Highlights

* Data can be represented in a lot of ways but the major ones are relational, document, graph, key-value, column-family, and time series. It depends on the use case which model can be used.
* Relational
* Data is organised into relations (tables), where each relation is a tuple of records. This data model is most prevalent where data has one-to-one, one-to-many and many-to-many relationships and transaction processing like banking, sales, airline reservations.
  It supports strong consistency and data integrity using normalisation. It ensures ACID transactions. Data is queried using SQL and query optimisers are advanced. Example: PostgreSQL, MySQL
* Document
* This model targets the area where data comes in self-contained documents and relationships between two documents are rare. Data is semi-structured and JSON-like format. Some use cases are real-time feeds, live sports app, user comments, product catalogues.
  It provides better performance due to data locality, schema flexibility and nested records. Example: MongoDB, CouchDB, DocumentDB
* Graph
* This data model targets the data which comes with multiple many-to-many relationships between the entities and becomes complex in relational model. It is represented in the form of vertices and edges which are entities and their relationships respectively.
  Most of the big tech companies like Facebook, Google use graph models like social graphs and web graphs. Data can be heterogenous like vertices can be anything from people, locations, events. It provides better visualisation, latency in traversing, etc. Example: Neo4J, Cypher, Datalog
* Key-Valu
* This data model is used where data is fetched with very low latency. Caching, implementing queues, implementing pub/sub systems are some use cases. Example: Redis, Memcached
* Wide-Column (Column Family)
* This data model organises the data in such a way that column names and format can differ in different rows. It is used when scalability, performance, availability and analytics are involved.
  Example: Cassandra, HBase, Google BigTable
* Time-Series
* This data model targets the use cases with time series data to track and analyse the behaviour of a system. IoT devices, sensors, stock market data are some of the use cases. Example: Influx DB, Timescale DB, Prometheus
