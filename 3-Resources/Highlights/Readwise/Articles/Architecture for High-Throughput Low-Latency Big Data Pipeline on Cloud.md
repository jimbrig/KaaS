# Architecture for High-Throughput Low-Latency Big Data Pipeline on Cloud

## Metadata

* Author: *Satish Chandra Gupta*
* Full Title: Architecture for High-Throughput Low-Latency Big Data Pipeline on Cloud
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/4d59efc092b5

## Highlights

* Batch Layer: offers high throughput, comprehensive, economical map-reduce batch processing, but higher latency.
* Speed Layer: offers low latency real-time stream processing, but costlier and may overshoot memory limit when data volume is high.
* Serving Layer: The output from high throughput batch processing, when ready, is merged with the output of the stream processing to provide comprehensive results in the form of pre-computed views or ad-hoc queries.
