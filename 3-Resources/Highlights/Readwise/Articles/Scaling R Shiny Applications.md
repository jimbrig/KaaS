# Scaling R Shiny Applications:

## Metadata

* Author: *Siva Anne*
* Full Title: Scaling R Shiny Applications:
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/b32d56b24f03

## Highlights

* R and Shiny are popular tools to analyze data and visualize insights quickly. The single-threaded implementation of open-source R kernel constrains the scalability of R Shiny applications. Scaling R Shiny applications with commercial offerings may incur high licensing costs. The cloud-native implementation offers a cost-efficient solution to scale R Shiny applications.
* The R Shiny application can be scaled using a cloud-native architecture. Typically the nexts step are:
* Package the application code, its dependencies, and R Shiny Server for runtime into a Linux Docker image.
  * Tags: *favorite* 
* Deploy the containerized application to a Kubernetes cluster and configure to run multiple replica instances.
* Configure a load balancer service to distribute the incoming requests across the collection of pods
