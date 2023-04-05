# API Design

*Source: *Azure_API-Design_Guide_eBook.pdf**

## REST

### Recommended reading

Understanding the philosophy behind the REST Architectural Style is recommended for developing good HTTP-based services. If you are new to RESTful design, here are some good resources:

[REST on Wikipedia](http://en.wikipedia.org/wiki/Representational_state_transfer) -- Overview of common definitions and core ideas behind REST.

[REST Dissertation](https://www.ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm) -- The chapter on REST in Roy Fielding's dissertation on Network Architecture, "Architectural Styles and the Design of Network-based Software Architectures"

[RFC 7231](https://tools.ietf.org/html/rfc7231) -- Defines the specification for HTTP/1.1 semantics, and is considered the authoritative resource.

[REST in Practice](http://www.amazon.com/REST-Practice-Hypermedia-Systems-Architecture/dp/0596805829/) -- Book on the fundamentals of REST.

## Taxonomy

As part of onboarding to Microsoft REST API Guidelines, services MUST comply with the taxonomy defined below.

### Errors

Errors, or more specifically Service Errors, are defined as a client passing invalid data to the service and the service *correctly* rejecting that data. Examples include invalid credentials, incorrect parameters, unknown version IDs, or similar. These are generally "4xx" HTTP error codes and are the result of a client passing incorrect or invalid data.

Errors do *not* contribute to overall API availability.

### Faults

Faults, or more specifically Service Faults, are defined as the service failing to correctly return in response to a valid client request. These are generally "5xx" HTTP error codes.

Faults *do* contribute to the overall API availability.

Calls that fail due to rate limiting or quota failures MUST NOT count as faults. Calls that fail as the result of a service fast-failing requests (often for its own protection) do count as faults.

### Latency

Latency is defined as how long a particular API call takes to complete, measured as closely to the client as possible. This metric applies to both synchronous and asynchronous APIs in the same way. For long running calls, the latency is measured on the initial request and measures how long that call (not the overall operation) takes to complete.

### Time to complete

Services that expose long operations MUST track "Time to Complete" metrics around those operations.

### Long running API faults

For a Long Running API, it's possible for both the initial request to begin the operation and the request to retrieve the results to technically work (each passing back a 200), but for the underlying operation to have failed. Long Running faults MUST roll up as Faults into the overall Availability metrics.

## Consistency Fundamentals

### URL structure

Humans SHOULD be able to easily read and construct URLs.

This facilitates discovery and eases adoption on platforms without a well-supported client library.

An example of a well-structured URL is:

````bash
https://api.contoso.com/v1.0/people/jdoe@contoso.com/inbox
````

An example URL that is not friendly is:

````bash
https://api.contoso.com/EWS/OData/Users('jdoe@microsoft.com')/Folders('AAMkADdiYzI1MjUzLTk4MjQtNDQ1Yy05YjJkLWNlMzMzYmIzNTY0MwAuAAAAAACzMsPHYH6HQoSwfdpDx-2bAQCXhUk6PC1dS7AERFluCgBfAAABo58UAAA=')
````

A frequent pattern that comes up is the use of URLs as values. Services MAY use URLs as values. For example, the following is acceptable:

````bash
https://api.contoso.com/v1.0/items?url=https://resources.contoso.com/shoes/fancy
````

### URL length

The HTTP 1.1 message format, defined in RFC 7230, in section [3.1.1](https://tools.ietf.org/html/rfc7230#section-3.1.1), defines no length limit on the Request Line, which includes the target URL. From the RFC:

 > 
 > HTTP does not place a predefined limit on the length of a request-line. \[...\] A server that receives a request-target longer than any URI it wishes to parse MUST respond with a 414 (URI Too Long) status code.

Services that can generate URLs longer than 2,083 characters MUST make accommodations for the clients they wish to support. Here are some sources for determining what target clients support:

* [http://stackoverflow.com/a/417184](http://stackoverflow.com/a/417184)
* [https://blogs.msdn.microsoft.com/ieinternals/2014/08/13/url-length-limits/](https://blogs.msdn.microsoft.com/ieinternals/2014/08/13/url-length-limits/)

Also note that some technology stacks have hard and adjustable url limits, so keep this in mind as you design your services.

### Canonical Identifier

In addition to friendly URLs, resources that can be moved or be renamed SHOULD expose a URL that contains a unique stable identifier. It MAY be necessary to interact with the service to obtain a stable URL from the friendly name for the resource, as in the case of the "/my" shortcut used by some services.

The stable identifier is not required to be a GUID.

An example of a URL containing a canonical identifier is:

````bash
https://api.contoso.com/v1.0/people/7011042402/inbox
````

### Supported methods

\#Status/Todo 

*Backlinks:*

````dataview
list from [[API Design]] AND -"Changelog"
````
