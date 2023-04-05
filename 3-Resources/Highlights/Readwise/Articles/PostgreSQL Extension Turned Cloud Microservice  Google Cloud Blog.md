# PostgreSQL Extension Turned Cloud Microservice | Google Cloud Blog

## Metadata

* Author: *cloud.google.com*
* Full Title: PostgreSQL Extension Turned Cloud Microservice | Google Cloud Blog
* Category: #Type/Highlight/Article
* URL: https://cloud.google.com/blog/topics/developers-practitioners/postgresql-extension-turned-cloud-microservice

## Highlights

* One challenge to migrating databases is lining up your environment so that you don’t end up with compatibility issues. So what happens, when you want to move to a managed service in the Cloud, like Cloud SQL, and you discover that your favorite extension isn’t supported? Of course we want to support all the things, but supporting each individual plugin takes time to be sure it gets integrated into Cloud SQL without destabilizing anything.
* For this post, let’s chat about pg_cron. The PostgreSQL plugin which gives you a crontab inside your database. Handy for all kinds of things from pruning old unused data with vacuum, truncating data from tables that’s no longer needed, and a slew of other periodic tasks. Super handy plugin. And while we did just recently add support for it in Cloud SQL, the process of splitting out an extension into a service that doesn’t run within your database can be a good exercise. There’s a few good reasons to avoid using extensions. They’re often engine-specific, so you’re further locking your database engine. If you’re using something open like PostgreSQL? Maybe not a huge deal, but it can be a consideration. Also running a lot of business logic inside your database can and will eventually start to affect performance. Being flexible with microservices can be a good way to balance performance and convenience.Let’s walk through one way to break out pg_cron tasks into a Cloud microservice.
