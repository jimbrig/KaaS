# Data Pipeline Architecture

![](https://i.imgur.com/gT7F4km.png)

Operationalising a data pipeline can be tricky. Here are some tips that I have learned the hard way:

* **Scale Data Engineering before scaling the Data Science team.** ML wagons can’t run without first laying railroads.
* **Be industrious in clean data warehousing.** ML is only as good as data. Be disciplined in defining the schema of the data being collected, cataloging it. In absence of that, do not be surprised by how much *data* rots for perpetuity in storage as mere *bytes*.
* **Start simple.** Start with serverless, with as few pieces as you can make do. Move to a full-blown pipeline, or your own deployment, only when RoI is justifiable. Bootstrap with minimal investment in the computation stage. Go even “compute-less” by implementing computations by scheduling a bunch of SQL queries and cloud functions. That will get the whole pipeline ready faster, and give you ample time to focus on getting your data strategy in place, along with data schemas and catalogs.
* **Build only after careful evaluation.** What are the business goals? What levers do you have to affect the business outcome? What insights will be actionable? Collect data and build ML based on that.

## Lambda Architecture

* **Batch Layer:** offers high throughput, comprehensive, economical map-reduce batch processing, but higher latency.
* **Speed Layer:** offers low latency real-time stream processing, but costlier and may overshoot memory limit when data volume is high.
* **Serving Layer:** The output from high throughput batch processing, when ready, is merged with the output of the stream processing to provide comprehensive results in the form of pre-computed views or ad-hoc queries.

The underlying assumption in the lambda architecture is that the source data model is *append-only*, i.e. ingested events are timestamped and appended to existing events, and never overwritten.

## Big Data Architecture in The Cloud

Key components of the big data architecture and technology choices are the following:

* **HTTP / MQTT Endpoints** for ingesting data, and also for serving the results. There are several frameworks and technologies for this.
* **Pub/Sub Message Queue** for ingesting high-volume streaming data. [Kafka](https://kafka.apache.org/) is currently the de-facto choice. It is battle-proven to scale to a high event ingestion rate.
* **Low-Cost High-Volume Data Store** for data lake (and data warehouse), [Hadoop HDFS](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/HdfsUserGuide.html) or cloud blob storage like [AWS S3](https://aws.amazon.com/s3/).
* **Query and Catalog Infrastructure** for converting a data lake into a data warehouse, Apache [Hive](https://hive.apache.org/) is a popular query language choice.
* **Map-Reduce Batch Compute** engine for high throughput processing, e.g. [Hadoop Map-Reduce](https://hadoop.apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html), Apache [Spark](https://spark.apache.org/).
* **Stream Compute** for latency-sensitive processing, e.g. Apache [Storm](https://storm.apache.org/), Apache [Flink](https://flink.apache.org/). Apache [Beam](https://beam.apache.org/) is emerging as *the* choice for writing the data-flow computation. It can be deployed on a Spark batch runner or Flink stream runner.
* **Machine Learning Frameworks** for data science and ML. [Scikit-Learn](https://scikit-learn.org/), [TensorFlow](https://www.tensorflow.org/), and [PyTorch](https://pytorch.org/) are popular choices for implementing machine learning.
* **Low-Latency Data Stores** for storing the results. There are many well-established [SQL vs. NoSQL](https://towardsdatascience.com/datastore-choices-sql-vs-nosql-database-ebec24d56106) choices of data stores depending on data type and use case.
* **Deployment** orchestration options are [Hadoop YARN](https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/YARN.html), [Kubernetes](https://kubernetes.io/) / [Kubeflow](https://www.kubeflow.org/).

Scale and efficiency are controlled by the following levers:

* **Throughput** depends on the **scalability** of the ingestion (i.e. **REST/MQTT** endpoints and **message queue**), data lake **storage** capacity, and **map-reduce batch** processing.
* **Latency** depends on the **efficiency** of the **message queue**, **stream compute** and **databases** used for storing computation results.

### Serverless

With the advent of [serverless computing](https://en.wikipedia.org/wiki/Serverless_computing), it is possible to start quickly by avoiding DevOps. Various components in the architecture can be replaced by their serverless counterparts from the chosen cloud service provider.

Typical serverless architectures of big data pipelines on **Amazon Web Services**, **Microsoft Azure**, and **Google Cloud Platform (GCP)** are shown below. Each maps closely to the general big data architecture discussed in the previous section. You can use these as a reference for shortlisting technologies suitable for your needs.

![](https://i.imgur.com/01bxoyQ.png)

## Key Takeaways

Key takeaways are:

* Tuning analytics and machine learning models is only 25% effort.
* Invest in the data pipeline early because analytics and ML are only as good as data.
* Ensure easily accessible data for exploratory work.
* Start from business goals, and seek actionable insights.

---

## Appendix: Links

* [ETL](ETL.md) | [ELT](ELT.md)
* [Data Engineering](../2-Areas/MOCs/Data%20Engineering.md)
* *Amazon Web Services*
* [Microsoft Azure](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/Azure/Microsoft%20Azure.md)
* *Google Cloud Platform*
* [Data Warehouse](Data%20Warehouse.md)
* [Dimensional Modeling](Dimensional%20Modeling.md)

*Backlinks:*

````dataview
list from [[Data Pipeline Architecture]] AND -"Changelog"
````
