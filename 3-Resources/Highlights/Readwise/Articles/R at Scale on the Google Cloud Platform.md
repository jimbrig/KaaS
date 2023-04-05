# R at Scale on the Google Cloud Platform

## Metadata

* Author: *Mark Edmondson*
* Full Title: R at Scale on the Google Cloud Platform
* Category: #Type/Highlight/Article
* URL: https://code.markedmondson.me/r-at-scale-on-google-cloud-platform/

## Highlights

* This post covers my current thinking on what I consider the optimal way to work with R on the Google Cloud Platform (GCP). It seems this has developed into my niche, and I get questions about it so would like to be able to point to a URL. ([View Highlight](https://instapaper.com/read/1362616169/14671724))
* Both R and the GCP rapidly evolve, so this will have to be updated I guess at some point in the future, but even as things stand now you can do some wonderful things with R, and can multiply those out to potentially billions of users with GCP. The only limit is ambition. ([View Highlight](https://instapaper.com/read/1362616169/14671725))
* The common scenarios I want to cover are:
  Scaling a standalone R script
  Scaling Shiny apps and R APIs ([View Highlight](https://instapaper.com/read/1362616169/14671726))
* It always starts with Docker
  Docker is the main mechanism to achieve scale on GCP. ([View Highlight](https://instapaper.com/read/1362616169/14671727))
* It encapsulates code into a unit of computation that can be built on top of, one which doesn’t care which language or system that code needs to run.
  This means that a lot of the techniques described are not specific to R - you could have components running Python, Java, Rust, Node, whatever is easiest for you. I do think that Docker’s strengths seems to cover R’s weaknesses particularly well, but having Docker skills is going to be useful whatever you are doing, and is a good investment in the future.
  There is growing support for Docker in R, of which I’ll mention:
  The Rocker Project is where it all flows from, providing useful R Docker images
  containerit is helpful to quickly generate a Dockerfile from an R script or project
  steveadore is a Docker client written in R ([View Highlight](https://instapaper.com/read/1362616169/14671728))
* Within GCP containers are fundamental and once you have a Docker image, you will be able to use many of GCP’s services both now and in the future, as well as on other cloud providers. The tools I use day to day with my Docker workflows are:
  Build Triggers - I never build Docker on my machine, I always commit the Dockerfiles to GitHub and then this service builds them for me.
  Container registry - Once built images are available from here. They are by default private, and over time I’ve built a library of useful images. Some of these are available publically at this repo (you do need to login though)
  The above are used within googleComputeEngineR’s templates, so as RStudio, Shiny and R APIs can be launched quickly.
  This basically constitutes a continuous delivery (CD) basis, so to deploy new code I need but push to GitHub and my script, Shiny app, R API or model are updated automatically. ([View Highlight](https://instapaper.com/read/1362616169/14671730))
* Scaling R applications ([View Highlight](https://instapaper.com/read/1362616169/14671732))
* First - Dockerise your app ([View Highlight](https://instapaper.com/read/1362616169/14671733))
* The Dockerfiles are relatively simple, thanks to rocker/shiny: ([View Highlight](https://instapaper.com/read/1362616169/14671734))
* FROM rocker/shiny
  MAINTAINER Mark Edmondson (r@sunholo.com)# install R package dependencies
  
  RUN apt-get update && apt-get install -y   
  libssl-dev ## clean up
  
  && apt-get clean \ 
  && rm -rf /var/lib/apt/lists/ \ 
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds## Install packages from CRAN needed for your app
  
  RUN install2.r --error \ 
  -r 'http://cran.rstudio.com'   
  googleAuthR   
  && Rscript -e "devtools::install_github(c('MarkEdmondson1234/googleAnalyticsR')" ## clean up
  
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds## assume shiny app is in build folder /shiny
  
  COPY ./shiny/ /srv/shiny-server/myapp/ ([View Highlight](https://instapaper.com/read/1362616169/14671737))
* When deploying Shiny apps, the biggest stumbling block I have found is that Shiny requires websocket support. Check your solution first to see if it can deal with websockets before deployment. For instance, App Engine Flexible or Cloud Functions would be a better serverless solutions if websockets were supported, as it would give you a more managed service. ([View Highlight](https://instapaper.com/read/1362616169/14671738))
* If deploying an R API via plumber, the Dockerfile is largely the same thanks to trestletech/plumber taking care of the defaults for you, including serving on port 8000. ([View Highlight](https://instapaper.com/read/1362616169/14671741))
* R APIs on Cloud Run ([View Highlight](https://instapaper.com/read/1362616169/14671742))
* Now Google has released Cloud Run! And with that release, I modify my original recommendation for R APIs to be deployed on Kubernetes, to instead use Cloud Run.
  Why? Its so simple. After you have made your Docker container for your plumber API, you simply point the Cloud run service at the image and you are done. Hosting, scaling and the rest is all taken care of. ([View Highlight](https://instapaper.com/read/1362616169/14671745))
* The only trick to it really is to allow Cloud Run to set the port plumber listens on, which is done via this Dockerfile: ([View Highlight](https://instapaper.com/read/1362616169/14671746))
* FROM trestletech/plumber
  LABEL maintainer="mark"
  COPY \[".", "./"\]
  ENTRYPOINT \["R", "-e", "pr \<- plumber::plumb(commandArgs()\[4\]); pr$run(host='0.0.0.0', port=as.numeric(Sys.getenv('PORT')))"\]
  CMD \["api.R"\]
  Once the Cloud Build has finished it will give you a Docker URI such as gcr.io/mark-edmondson-gde/cloudrunr:939c04dfe80a1eefed28f9dd59aae5dff5dc1e1e. ([View Highlight](https://instapaper.com/read/1362616169/14671747))
* Create a new service, name it something cool
  Put the Docker URI into the Cloud Run field.
  Select public endpoint, and limit concurrency to what your app is configured to handle per instance (I chose 8)
  And thats it. A deployed R API. ([View Highlight](https://instapaper.com/read/1362616169/14671749))
* R apps on Kubernetes ([View Highlight](https://instapaper.com/read/1362616169/14671752))
* Kubernetes will take care of deploying the right number of pods to scale your traffic, and starts to make savings once you are past 3 VMs. You may already have a kubernetes cluster deployed for other things at your company (its getting very popular with IT teams), in which case you can hitch onto an existing cluster.
  Its mainly due to the need of websockets that I recommend going straight to Kubernetes once you have need for more than a couple of Shiny apps, rather than say App Engine flexible. I have an example of deploying plumber on App Engine flexible that you may favour, but these days since I have a kubernetes cluster already deployed for other things I find it easier to deploy it all on that. ([View Highlight](https://instapaper.com/read/1362616169/14671753))
* Once setup, deployment is quick via the CLI:
  kubectl run shiny1 --image gcr.io/gcer-public/shiny-googleauthrdemo:latest --port 3838
  kubectl expose deployment shiny1 --target-port=3838 --type=NodePort
  The trickest thing is the ingress, but once grokked works by uploading some boilerplate yaml:
  apiVersion: extensions/v1beta1
  kind: Ingress
  metadata:
  name: r-ingress-nginx
  annotations:
  kubernetes.io/ingress.class: nginx
  nginx.ingress.kubernetes.io/rewrite-target: / 
  nginx.ingress.kubernetes.io/ssl-redirect: "false"
  spec:
  rules:
  * http:
    paths:
  * path: /gar/
  # app deployed to /gar/shiny/
  
  backend:
  serviceName: shiny1
  servicePort: 3838 ([View Highlight](https://instapaper.com/read/1362616169/14671755))
* With the introduction of Cloud Run, the options get simpler for R APIs, although in all circumstances the first suggestion is “Use Docker!”. Cloud Run is a level of service built on top of Kubernetes, but if you can’t use that then “Use Kubernetes!” is the next byword for scale.
  In all cases, having that Docker container gives you the flexibility to swap once the new services comes along. Cloud Functions and App Engine in particular are the next step in managed services, and perhaps in the future you won’t even need to create the Docker image - just upload your code, it builds the Dockerfile for you then deploys. ([View Highlight](https://instapaper.com/read/1362616169/14671758))
