---
Date: 2021-11-15
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev"]
Alias: "API Architecture - Performance Best Practices"
---

# API Architecture - Performance Best Practices

*Source: [API Architecture — Performance Best Practices for REST APIs | by Abdul Wahab | Nov, 2021 | Medium](https://abdulrwahab.medium.com/api-architecture-performance-best-practices-for-rest-apis-1d4a5922dae1)*

## Contents

- [[#Overview|Overview]]
- [[#Performance Tips|Performance Tips]]
	- [[#Reduce and Limit Payload Size|Reduce and Limit Payload Size]]
	- [[#Caching|Caching]]
	- [[#Network Speed|Network Speed]]
	- [[#Prevent Accidental Calls, Slowdowns, and Abuse|Prevent Accidental Calls, Slowdowns, and Abuse]]
	- [[#Use PATCH over PUT|Use PATCH over PUT]]
	- [[#Enable Logging, Monitoring, and Alerting|Enable Logging, Monitoring, and Alerting]]
	- [[#Pagination|Pagination]]
- [[#Closing Thoughts|Closing Thoughts]]
- [[#Appendix: Links|Appendix: Links]]


## Overview

Just like any performance, API performance is largely about how an API responds and functions, _in response to different types of requests_ it receives.

## Performance Tips

### Reduce and Limit Payload Size

Extremely large payloads of response data will _slow down_ request completion, other service calls, and in affect degrade performance. As you know, now that we are returning _all orders_ for the customer as opposed to just their current order, we will have to deal with some performance degradation.

We can use [GZip Compression](https://developers.google.com/blogger/docs/3.0/performance#gzip) to reduce our payload size.

This lessens the download size of our response on the web app (client side), as well as increase the upload speed, or creation of some entity (orders).

We can use `Deflate compression` on a Web API.

Or, we can update the `Accept-Encoding` request header to `gzip` .

### Caching

Caching is one of the easiest methods to improve an API’s performance. If we have requests that frequently give back the _same response_, then a cached version of that response helps avoid additional service calls/database queries.

Be sure to properly *invalidate* the data housed in the cache though, especially when new data updates occur.

### Network Speed

A slow network will degrade the performance of even the most robustly-designed API. Unreliable networks can cause downtime, which could cause your organization to be in violation of SLAs, terms of service, and promises you may have made to your customers. It is important to invest in the proper network infrastructure, so that we can maintain the desired level of performance.

This can be achieved by leveraging and purchasing sufficient cloud resources and infrastructure (example: in AWS, allocate the proper # of EC2 instances, use a Network Load Balancer).

Also, if you have a large amount of background processes, run those on separate threads to avoid blocking requests. You can also use mirrors, and Content Delivery Networks (CDNs) such as CloudFront to serve requests faster around different parts of the globe.

### Prevent Accidental Calls, Slowdowns, and Abuse

This method to **rate-limiting** helps reduce excessive requests that would slow the API down, helps deal with accidental calls/executions, and proactively monitor and identify possible malicious activity.

### Use PATCH over PUT

`PUT` operations update resources by sending updates to the _entire resource_. `PATCH` operations apply partial updates to only the resources that need updating. Resulting in `PATCH` calls that produce smaller payloads, and improve performance at scale.

**Pro-Tip:** Even though `PATCH` calls can limit the request size, you should note that it is not Idempotent. Meaning, _it is possible_ that a `PATCH`can yield different results with a series of multiple calls. So, you should _carefully and deliberately_ consider your application for using `PATCH` requests, and make sure that they are idempotently implemented if needed. If not, use `PUT` requests.

### Enable Logging, Monitoring, and Alerting

This is perhaps one of **_the most important tips_** you will read here. If there is one thing you should learn from this article, it should be this! **No negotiation** on this one.

Having logs, monitoring, and alerting help engineers diagnose and remediate issues **_before they become problems_**. Many APIs (Express/Node-based, Java, Go) have predefined endpoints for assessing things like:

- `/health`
- `/metrics`

If you do not have logging enabled, and there is a potential issue going on, you will not be able to track the origin, or where the problem is occurring in a particular request.

If you do not have monitoring enabled, you will not know from an analytical perspective how often some problems or errors are occurring. Which will then prevent you from thinking of possible solutions.

### Pagination

Pagination helps create buckets of content from multiple responses. This sort of optimization helps improve responses while preserving the data that is transferred/displayed to a customer.

You can standardize, segment, and _limit the responses_ which help reduce complexity of results, and improve the overall customer experience by providing the response/results _only for what a customer has asked for_.

## Closing Thoughts

We know that APIs are amazing, and can be extremely powerful in providing the business and customers a great experience, _if_ properly optimized and enhanced for performance.

Business requirements and customer expectations **_always evolve over time_**. And as responsible engineers, it is up to us in deciding how to build our APIs in a performant manner, that can help us achieve and exceed our goals.

These tips are just the tip of the iceberg, and apply to all APIs in a general setting. Depending on your particular API and use case, what services it interacts with, how often it gets called, from where it gets called, etc. you might have to implement these tips in different ways.

***

## Appendix: Links

*Backlinks:*

```dataview
list from [[API Architecture - Performance Best Practices]] AND -"Changelog"
```