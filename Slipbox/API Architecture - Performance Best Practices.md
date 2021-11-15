---
Date: 2021-11-15
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev"]
Alias: "API Architecture - Performance Best Practices"
---

# API Architecture - Performance Best Practices

*Source: [API Architecture — Performance Best Practices for REST APIs | by Abdul Wahab | Nov, 2021 | Medium](https://abdulrwahab.medium.com/api-architecture-performance-best-practices-for-rest-apis-1d4a5922dae1)*

## Contents

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



*Backlinks:*

```dataview
list from [[API Architecture - Performance Best Practices]] AND -"Changelog"
```