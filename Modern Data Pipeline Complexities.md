---
Date: 2022-02-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev"]
Alias: "Modern Data Pipeline Complexities"
---

# Modern Data Pipeline Complexities

![](https://i.imgur.com/kNjjWhZ.png)


#### **Data Pipeline Components**

The purpose of a data pipeline is to move data from a point of origin to a specific destination. At a high level, a data pipeline consists of eight types of components (See figure 1.):

**Origin** – The initial point at which data enters the pipeline.

**Destination** – The termination point to which data is delivered.

**Dataflow** – The sequence of processes and data stores through which data moves to get from origin to destination.

**Storage** – The datasets where data is persisted at various stages as it moves through the pipeline.

**Processing** – The steps and activities that are performed to ingest, persist, transform, and deliver data.

**Workflow** – Sequencing and dependency management of processes.

**Monitoring** – Observing to ensure a healthy and efficient pipeline.

**Technology** – The infrastructure and tools that enable data flow, storage, processing, workflow, and monitoring.

#### **Start with the Destination**

Begin pipeline design by starting at the end point – the destination. Know where data is needed and why it is needed. Are you moving data to a data store – warehouse, data mart, data lake, etc.? Or are you providing data for an application such as a dashboard or analytic application?

Timeliness is a destination-driven requirement. How quickly is data needed at the destination? Recognize that different kinds of data may have different timeliness requirements. One or a few data elements that are needed in real time does not require that the pipeline move all of the data in real time.

#### **Next Look at Origin**

Shift attention from destination to origin to consider the data that will enter the pipeline. Origin may be either an initial data source such as a transaction system, or a data store that exists within the analytical data environment such as a data warehouse or data lake.

Destination requirements are a driving force of origin identification and design. The process, however, may be exploratory and iterative with origin discoveries influencing destination and destination requirements guiding origin exploration and design.

Timeliness needs at the destination are closely coupled with latency constraints at the origin. Kinds of data – event-based and entity based – need to be considered. Event data typically moves at a higher velocity than entity-based reference data and is certainly more likely to be ingested as a data stream.

#### **Design the Dataflow**

With origin and destination understood you know what goes into the pipeline and what comes out. Data flow describes how inputs move through the pipeline to become outputs – the sequence of processes and data stores through which data moves to get from origin to destination.

It is possible for a data flow to consist entirely of processes without intermediate data stores. It is not possible for a data flow to consist only of data stores without processes. Intermediate data stores are valuable when a flow needs to be time-sliced: when all inputs are not ready at the same time, when one process must wait for others to complete, etc.

Intermediate data stores are sometimes used when the stored data serves multiple purposes – continued flow through the pipeline and access to the stored data by other processes. This common practice is really a shortcut that may create future pipeline management problems. It is a better practice to design as two distinct pipelines where the intermediate store becomes the destination of one pipeline and the origin of another

![](https://i.imgur.com/zwbmfRG.png)


*Backlinks:*

```dataview
list from [[Modern Data Pipeline Complexities]] AND -"Changelog"
```