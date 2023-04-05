# Docker CLI

## Docker Development Best Practices

🔗 <https://docs.docker.com/develop/dev-best-practices/>

---

## Keep Docker Images Small

* Start with the appropriate [base image](https://docs.docker.com/develop/develop-images/baseimages/): i.e. start with a Rocker image instead of Ubuntu > R 
* [Use multi-stage builds](https://docs.docker.com/develop/develop-images/multistage-build/): your final image doesn’t have to include all of the libraries and dependencies pulled in by the build, but only the artifacts and the environment needed to run them.
  * Minimize number of layers in your image by minimizing number of separate `RUN` commands in your Dockerfile.
  * Consolidate multiple commands into a single `RUN` line and use the shell to combine them together. For example,

````dockerfile
# BAD
RUN apt-get -y update
RUN apt-get install -y python

# GOOD
RUN apt-get -y update && apt-get install -y python
````

*Notice that `RUN` is only used once above.*

* If using multiple images with a lot in common (i.e. *polished shiny apps*) consider creating your own [base image](https://docs.docker.com/develop/develop-images/baseimages/) with the shared components, and basing the unique images off of it.
  * Docker only needs to load the common layers once, and they are cached. This means that your derivative images use memory on the Docker host more efficiently and load more quickly.
* To keep your production image lean but allow for debugging, consider using the production image as the base image for the debug image. Additional testing or debugging tooling can be added on top of the production image.
* When building images, always tag them with useful tags which codify version information, intended destination (`prod` or `test`, for instance), stability, or other information that is useful when deploying the application in different environments. Do not rely on the automatically-created `latest` tag.

## Dealing with Application Data

* Avoid storing application data in your container’s writable layer using [storage drivers](https://docs.docker.com/storage/storagedriver/select-storage-driver/). This increases the size of your container and is less efficient from an I/O perspective than using volumes or bind mounts. **Instead, store data using [volumes](https://docs.docker.com/storage/volumes/).**
* One case where it is appropriate to use [bind mounts](https://docs.docker.com/storage/bind-mounts/) is during development, when you may want to mount your source directory or a binary you just built into your container. For production, use a volume instead, mounting it into the same location as you mounted a bind mount during development.
* For production, use [secrets](https://docs.docker.com/engine/swarm/secrets/) to store sensitive application data used by services, and use [configs](https://docs.docker.com/engine/swarm/configs/) for non-sensitive data such as *configuration files*. 
  * If you currently use standalone containers, consider migrating to use *single-replica services*, so that you can take advantage of these service-only features.

---

## Appendix: Links

Source: <https://docs.docker.com/develop/develop-images/baseimages/>

* [Tools](../../Tools.md)
* [Docker CLI](Docker%20CLI.md)
* [Docker Compose](Docker%20Compose.md)
* *Containers*
* *Kubernetes*
* [Web Development](../../../../2-Areas/MOCs/Web%20Development.md)

*Backlinks:*

````dataview
list from [[Docker CLI]] AND -"Changelog"
````
