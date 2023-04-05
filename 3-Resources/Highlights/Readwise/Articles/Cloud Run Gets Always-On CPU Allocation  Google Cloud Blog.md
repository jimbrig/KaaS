# Cloud Run Gets Always-On CPU Allocation | Google Cloud Blog

## Metadata

* Author: *cloud.google.com*
* Full Title: Cloud Run Gets Always-On CPU Allocation | Google Cloud Blog
* Category: #Type/Highlight/Article
* URL: https://cloud.google.com/blog/products/serverless/cloud-run-gets-always-on-cpu-allocation

## Highlights

* Cloud Run, Google Cloud's serverless container platform, offers a very granular pay-per-use pricing, charging you only for CPU and memory when your app processes requests or events. By default, Cloud Run does not allocate CPU outside of request processing. For a class of workloads that expect to do background processing, this can be problematic. So today, we are excited to introduce the ability to allocate CPU for Cloud Run container instances even outside of request processing.
* This feature unlocks many use cases that weren't previously compatible with Cloud Run:Executing background tasks and other asynchronous processing work after returning responsesLeveraging monitoring agents like OpenTelemetry that may assume access to CPU in background threadsUsing Go's Goroutines or Node.js async, Java threads, and Kotlin coroutinesMoving Spring Boot apps that use built-in scheduling/background functionalityListening for Firestore changes to keep an in-memory cache up to date
