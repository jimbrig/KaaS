# Docker Best Practices

* Utilize multistage builds and set `DOCKER_BUILDKIT=1` environment variable to allow them to build *in parallel*.
* You can also copy files between stages in multistage builds from previous layers
* Split long `RUN` commands into multiple lines per statement and *alphabetize the order* of the arguments
* `apt-get` notes:
  * don't run `apt-get upgrade` or `dist-upgrade` since that will be the job of the base image
  * keep `apt-get update` and `apt-get install` together

````
RUN apt-get update && apt-get install -y \
  package-bar \
  package-baz \
  package-foo
````

* Build an Image from a Github Repo (without a dockerfile)

````powershell
docker build -t myimage:latest -f- https://github.com/docker-library/hello-world.git <<EOF
FROM busybox
COPY hello.c .
EOF
````

* Use `ENV` to update the path: `ENV PATH /usr/local/nginx/bin:$PATH`
* Use `ENTRYPOINT` for the main executable, with default flags provided by `CMD`

````
ENTRYPOINT ["s3cmd"]
CMD ["--help"]
````

* so this will show help menu: `docker run s3cmd` and this will do whatever the params say: `docker run s3cmd ls s3://mybucket`
* it's very common to create a script `docker-entrypoint.sh` as the `ENTRYPOINT`

````
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["postgres"]
````

* docker-entrypoint.sh:

````
#!/bin/bash

# exit if any commands return non-zero
set -e

# if first param is 'postgres'
if [ "$1" = 'postgres' ]; then
    # assign postgres to the PGDATA directory
    chown -R postgres "$PGDATA"

    # if string is empty
    if [ -z "$(ls -A "$PGDATA")" ]; then
        # gosu is like sudo without certain annoying TTY features
        gosu postgres initdb
    fi

    # $@ is all of the parameters passed through (e.g. $1 $2 ...)

    # exec will replace the currently executing process with a new one
    exec gosu postgres "$@"
fi

exec "$@"
````

* example invocations:
  
  * `docker run postgres`: runs postres
  * `docker run postgres postgres --help`: run Postgres and pass parameters to the server
  * `docker run --rm -it postgres bash`: start a totally different tool, such as Bash
* use `VOLUME` for any mutable or user-servicable parts of your image

* avoid using `sudo`- `gosu` is a better option

* if you can run a service without root, use the `USER` command to change to the user
  
  * You can create a user and set group with something like: `RUN groupadd -r postgres && useradd --no-log-init -r -g postgres postgres.`
* use absolute paths for your `WORKDIR`

* Caching
  
  * only RUN, COPY, and ADD statments are cached
  * COPY and ADD will perform a checksum on the corresponding file contents
  * RUN will only attempt to match by the command name
  * Once 1 cache layer is invalidated, everything dockerfile statement after it is run dynamically (not cached)
    * So if you copy your source code in and it has changed, everything else after that is rebuilt
    
    * Some people inject a specifically cache-busting layer:
      
      * `docker build --build-arg CACHE_BUST=$(date +%s) .`
      ````
      ARG CACHE_BUST
      RUN echo "command with external dependencies"
      ````

* Dockerfile vs Docker-Compose
  
  * From somebody on [Docker Team](https://github.com/docker/compose/issues/5523)
   > 
   > Dockerfiles are the recipe for building images and should add all the binaries/other files you need to make your service work. There are a couple of exceptions to this: secrets (i.e.: credentials), configs (i.e.: configuration files), and application state data (e.g.: your database data). Note that secrets and configs are read only.
  
   > 
   > Compose files are used to describe how a set of services are deployed and interact. The Compose format is used not only for a single engine (i.e.: docker-compose) but also for orchestrated environments like Swarm and Kubernetes. The goal of the Compose format is to make it easy to write an application and test it locally, then deploy it to an orchestrated environment with little or no changes. This goal limits what we can change in the format because of fundamental differences like how each environemtn handles volumes and data storage.

---

Links: 
Source: [Best practices for writing Dockerfiles | Docker Documentation](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
