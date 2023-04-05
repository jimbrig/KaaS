# API Architecture  —  Performance Best Practices for REST APIs

## Metadata

* Author: *Abdul Wahab*
* Full Title: API Architecture  —  Performance Best Practices for REST APIs
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/1d4a5922dae1

## Highlights

* Just like any performance, API performance is largely about how an API responds and functions, in response to different types of requests it receives.
* How do we ensure that our API is able to return all of the data to present back to our customer, without issues like: latency, server-side errors, and excessive requests?
* Extremely large payloads of response data will slow down request completion, other service calls, and in affect degrade performance. As you know, now that we are returning all orders for the customer as opposed to just their current order, we will have to deal with some performance degredation.
* Caching is one of the easiest methods to improve an API’s performance. If we have requests that frequently give back the same response, then a cached version of that response helps avoid additional service calls/database queries.
* You will want to make sure when using caching to periodically invalidate the data in the cache, especially when new data updates occur.
* A slow network will degrade the performance of even the most robustly-designed API. Unreliable networks can cause downtime, which could cause your organization to be in violation of SLAs, terms of service, and promises you may have made to your customers. It is important to invest in the proper network infrastructure, so that we can maintain the desired level of performance.
* You can have a situation where your API suffers a DDoS attack that can either be malicious and intentional, or unintenional when an engineer calls the API to execute on a loop from some local application
* You can avoid this by measuring transactions, and monitoring the number of how many transactions occur per IP Address, or per SSO/JWT Token (if the customer/calling app is authorized before calling the API)
* It is a common misconception among engineers that PUT and PATCH operations yield the same result.
* They are similar in updating resources, but they each perform the updates differently.
* PUT operations update resources by sending updates to the entire resource. PATCH operations apply partial updates to only the resources that need updating. Resulting inPATCH calls that produce smaller payloads, and improve performance at scale
* This is perhaps one of the most important tips you will read here. If there is one thing you should learn from this article, it should be this! No negotiation on this one.
