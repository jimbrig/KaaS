# Shiny on Google Cloud Run - Scale-To-Zero R Web Apps

## Metadata

* Author: *Mark Edmondson*
* Full Title: Shiny on Google Cloud Run - Scale-To-Zero R Web Apps
* Category: #Type/Highlight/Article
* URL: https://code.markedmondson.me/shiny-cloudrun/

## Highlights

* Cloud Run is a container-as-a-service which lets you deploy Docker containers to the web without needing to worry about the infrastructure. One of its most attractive features is the scaling, as you pay zero when your app has no visits, but as demand increases it can flexibly serve up your app to billions of users. ([View Highlight](https://instapaper.com/read/1364275734/14671783))
* I favour Cloud Run over Kubernetes clusters, since its simpler to deploy and maintain apps, and you don’t need to pay at least $100 a month for a Kubernetes cluster. ([View Highlight](https://instapaper.com/read/1364275734/14671784))
* Why Not Shiny on Cloud Run ([View Highlight](https://instapaper.com/read/1364275734/14671787))
* The limitations that affect Shiny are around support for websockets and the fact that Shiny is a stateful service, whereas Cloud Run is meant for stateless services.
  This means that for Cloud Run each HTTP request should not depend on previous HTTP requests, or is stateless. This is the case for an API, but Shiny is inherently a session based system: a user’s past actions affect the current Shiny state. If a subsequent request to Shiny is directed to a different Shiny app than the one the user is in then we have problems. ([View Highlight](https://instapaper.com/read/1364275734/14671788))
* As a newly launched service, for a long while Cloud Run did not support websockets. That support is now enabled in some limited fashion, and so with a little configuration you can have a Shiny app running.
  Thanks to randy3k the limitations above where navigated in the following ways: ([View Highlight](https://instapaper.com/read/1364275734/14671791))
* Limit the number of instances to 1 - this means there is only one instance to route requests too
  Disable some websocket protocols to only leave those that work with Cloud Run - namely disable_protocols websocket xdr-streaming xhr-streaming iframe-eventsource iframe-htmlfile xdr-polling iframe-xhr-polling; ([View Highlight](https://instapaper.com/read/1364275734/14671793))
* The above means that your Shiny app is limited: the number of concurrent requests you can have to one container in Cloud Run is 80 connections. This means you lose the “scale-to-a-billion” feature, as on concurrent request 81 no container will be available to serve it. It also means the app won’t autoscale as the normal Cloud Run setups would - for normal applications, Cloud Run allows 1000 containers with up to 80 requests each e.g. 80,000 concurrent requests.
  Having only one container means that you need to worry about the footprint of your Shiny app. Whereas if autoscaling was available, high CPU/RAM load would trigger another container, as we will have only one container the max limit may be 80 but the real limit will be how much traffic your Shiny app can handle, which depends on how much CPU/RAM your Shiny app uses. Also remember as R is single-threaded, all users will be waiting to use a single R process - see this nice article by Appsilon for an overview on scaling shiny. This then is much like a traditional Shiny server running on say googleComputeEngineR ([View Highlight](https://instapaper.com/read/1364275734/14671797))
* However, the above still leaves some use cases where Shiny on Cloud Run is useful:
  If your peak traffic is below 80 concurrent users e.g. 80 people browsing at the same time
  And your app load on CPU/RAM is small enough to support your expected amount of concurrent users.
  For APIs the above limitations would be a problem as they can be queried thousands of times an hour, but since Shiny is usually a dashboard option for a select group of users, I think this leaves a lot of room for Shiny on Cloud Run being viable, plus you also get the killer feature of scaling to 0 in the downtime between user sessions, which gives it the advantage over other solutions such as running your own Shiny server. ([View Highlight](https://instapaper.com/read/1364275734/14671801))
* Another big plus for me is that as its running on Google infrastructure, this means OAuth2 workflows are automatically on the accepted list of domains leading to setup for OAuth2 buttons using say googleAuthR::googleAuth_js as simpler and not needing to validate a domain.
  If your Shiny app expects big peaks of traffic however, or is a big heavy app in terms of resources, then you are probably best looking at other options. For me, this is keeping the existing Shiny deployments running on Google Kubernetes Engine. ([View Highlight](https://instapaper.com/read/1364275734/14671803))
* client.id and GCP setup ([View Highlight](https://instapaper.com/read/1364275734/14671806))
* The client.json was a web client json from my project:
  {"web":{"client_id":"10XXX","project_id":"XXXX","auth_uri":"https://accounts.google.com/o/oauth2/auth","token_uri":"https://accounts.google.com/o/oauth2/token","auth_provider_x509_cert_url":"https://www.googleapis.com/oauth2/v1/certs","client_secret":"XXXXX","redirect_uris":\["http://localhost"\],"javascript_origins":\["https://www.example.com","http://localhost:1221"\]}}
  You need to add the domain of where the Cloud Run is running in the JavaScript origins within the GCP console, that you get after deploying the app. (GCP console > APIs & Services > Credentials > Click on the Web Client ID you are using > Add URL to Authorised JavaScript origins). ([View Highlight](https://instapaper.com/read/1364275734/14671808))
* shiny-customized.config
  This is the configuration file for Shiny that will overwrite the default one - its main purpose is turning off the websocket functionality that is not supported on Cloud Run
  disable_protocols websocket xdr-streaming xhr-streaming iframe-eventsource iframe-htmlfile xdr-polling iframe-xhr-polling;
  run_as shiny;
  server {
  listen 8080;
  location / {
  site_dir /srv/shiny-server;
  log_dir /var/log/shiny-server;
  directory_index off;
  }
  } ([View Highlight](https://instapaper.com/read/1364275734/14671809))
