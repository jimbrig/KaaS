# Dockerfiles

## Dockerfile vs Docker-Compose

*From somebody on [Docker Team](https://github.com/docker/compose/issues/5523):*

* Dockerfiles are the recipe for building images and should add all the binaries/other files you need to make your service work. There are a couple of exceptions to this: secrets (i.e.: credentials), configs (i.e.: configuration files), and application state data (e.g.: your database data). Note that secrets and configs are read only.

* Compose files are used to describe how a set of services are deployed and interact. The Compose format is used not only for a single engine (i.e.: docker-compose) but also for orchestrated environments like Swarm and Kubernetes. The goal of the Compose format is to make it easy to write an application and test it locally, then deploy it to an orchestrated environment with little or no changes. This goal limits what we can change in the format because of fundamental differences like how each environemtn handles volumes and data storage.

---

## Appendix: Links

* [Tools](../../Tools.md)
* [Docker CLI](Docker%20CLI.md)
* [Docker Compose](Docker%20Compose.md)
* *Containers*
* *Kubernetes*
* [Web Development](../../../../2-Areas/MOCs/Web%20Development.md)

*Backlinks:*

````dataview
list from [[Dockerfiles]] AND -"Changelog"
````
