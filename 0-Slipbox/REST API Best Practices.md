# REST APIs

## Contents

* [REST API Quick Tips](REST%20API%20Best%20Practices.md#rest-api-quick-tips)
* [Use HTTP Verbs to Make Your Requests Mean Something](REST%20API%20Best%20Practices.md#use-http-verbs-to-make-your-requests-mean-something)
  * [Note](REST%20API%20Best%20Practices.md#note)
* [Provide Sensible Resource Names](REST%20API%20Best%20Practices.md#provide-sensible-resource-names)
* [Use HTTP Response Codes to Indicate Status](REST%20API%20Best%20Practices.md#use-http-response-codes-to-indicate-status)
* [Offer Both JSON and XML](REST%20API%20Best%20Practices.md#offer-both-json-and-xml)
* [Create Fine-Grained Resources](REST%20API%20Best%20Practices.md#create-fine-grained-resources)
* [Consider Connectedness](REST%20API%20Best%20Practices.md#consider-connectedness)

The REST architectural style describes six constraints. These constraints, applied to the architecture, were originally communicated by Roy Fielding in his doctoral dissertation (see [https://www.ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm](https://www.ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm)) and defines the basis of RESTful-style.

**The six constraints are: (click the constraint to read more)**

* [Uniform Interface](https://www.restapitutorial.com/lessons/whatisrest.html#)
* [Stateless](https://www.restapitutorial.com/lessons/whatisrest.html#)
* [Cacheable](https://www.restapitutorial.com/lessons/whatisrest.html#)
* [Client-Server](https://www.restapitutorial.com/lessons/whatisrest.html#)
* [Layered System](https://www.restapitutorial.com/lessons/whatisrest.html#)
* [Code on Demand (optional)](https://www.restapitutorial.com/lessons/whatisrest.html#)

## REST API Quick Tips

Whether it's technically RESTful or not (according to the six constraints mentioned previously), here are a few recommended REST-like concepts. These six quick tips will result in better, more usable services.

## Use HTTP Verbs to Make Your Requests Mean Something

API consumers are capable of sending `GET`, `POST`, `PUT`, and `DELETE` verbs, which greatly enhance the clarity of a given request.

Generally, the four primary HTTP verbs are used as follows:

* `GET`: Read a specific resource (by an identifier) or a collection of resources.
* `PUT`: Update a specific resource (by an identifier) or a collection of resources. Can also be used to create a specific resource if the resource identifier is known before-hand.
* `DELETE`: Remove/delete a specific resource by an identifier.
* `POST`: Create a new resource. Also a catch-all verb for operations that don't fit into the other categories.

### Note

`GET` requests must not change any underlying resource data. Measurements and tracking which update data may still occur, but the resource data identified by the URI should not change.

## Provide Sensible Resource Names

Producing a great API is 80% art and 20% science. Creating a URL hierarchy representing sensible resources is the art part. Having sensible resource names (which are just URL paths, such as `/customers/12345/orders`) improves the clarity of what a given request does.

Appropriate resource names provide context for a service request, increasing understandability of the API. Resources are viewed hierarchically via their URI names, offering consumers a friendly, easily-understood hierarchy of resources to leverage in their applications.

Here are some quick-hit rules for URL path (resource name) design:

* Use identifiers in your URLs instead of in the query-string. Using URL query-string parameters is fantastic for filtering, but not for resource names.
  * **Good:** `/users/12345`
  * **Poor:** `/api?type=user&id=23`
* Leverage the hierarchical nature of the URL to imply structure.
* Design for your clients, not for your data.
* Resource names should be nouns. Avoid verbs as resource names, to improve clarity. Use the HTTP methods to specify the verb portion of the request.
* Use plurals in URL segments to keep your API URIs consistent across all HTTP methods, using the collection metaphor.
  * **Recommended:** `/customers/33245/orders/8769/lineitems/1`
  * **Not:** `/customer/33245/order/8769/lineitem/1`
* Avoid using collection verbiage in URLs. For example 'customer_list' as a resource. Use pluralization to indicate the collection metaphor (e.g. customers vs. customer_list).
* Use lower-case in URL segments, separating words with underscores ('\_') or hyphens ('-'). Some servers ignore case so it's best to be clear.
* Keep URLs as short as possible, with as few segments as makes sense.

## Use HTTP Response Codes to Indicate Status

Response status codes are part of the HTTP specification. There are quite a number of them to address the most common situations. In the spirit of having our RESTful services embrace the HTTP specification, our Web APIs should return relevant HTTP status codes. For example, when a resource is successfully created (e.g. from a `POST` request), the API should return HTTP status code `201`. A list of valid [HTTP status codes](https://www.restapitutorial.com/httpstatuscodes.html) is available [here](https://www.restapitutorial.com/httpstatuscodes.html) which lists detailed descriptions of each.

Suggested usages for the "Top 10" HTTP Response Status Codes are as follows:

|Code|Text|Description|
|:--:|:--:|:----------|
|`200`|`OK`|General success status code. This is the most common code. Used to indicate success.|
|`201`|`CREATED`|Successful creation occurred (via either POST or PUT). Set the Location header to contain a link to the newly-created resource (on POST). Response body content may or may not be present.|
|`204`|`NO CONTENT`|Indicates success but nothing is in the response body, often used for DELETE and PUT operations.|
|`400`|`BAD REQUEST`|General error for when fulfilling the request would cause an invalid state. Domain validation errors, missing data, etc. are some examples.|
|`401`|`UNAUTHORIZED`|Error code response for missing or invalid authentication token.|
|`403`|`FORBIDDEN`|Error code for when the user is not authorized to perform the operation or the resource is unavailable for some reason (e.g. time constraints, etc.).|
|`404`|`NOT FOUND`|Used when the requested resource is not found, whether it doesn't exist or if there was a 401 or 403 that, for security reasons, the service wants to mask.|
|`405`|`METHOD NOT ALLOWED`|Used to indicate that the requested URL exists, but the requested HTTP method is not applicable. For example, POST */users/12345* where the API doesn't support creation of resources this way (with a provided ID). The Allow HTTP header must be set when returning a 405 to indicate the HTTP methods that are supported. In the previous case, the header would look like "Allow: GET, PUT, DELETE"|
|`409`|`CONFLICT`|Whenever a resource conflict would be caused by fulfilling the request. Duplicate entries, such as trying to create two customers with the same information, and deleting root objects when cascade-delete is not supported are a couple of examples.|
|`500`|`INTRENAL SERVER ERROR`|Never return this intentionally. The general catch-all error when the server-side throws an exception. Use this only for errors that the consumer cannot address from their end.|

## Offer Both JSON and XML

Favor JSON support unless you're in a highly-standardized and regulated industry that requires XML, schema validation and namespaces, and offer both JSON and XML unless the costs are staggering. Ideally, let consumers switch between formats using the HTTP Accept header, or by just changing an extension from .xml to .json on the URL.

Be aware that as soon as we start talking about XML support, we start talking about schemas for validation, namespaces, etc. Unless required by your industry, avoid supporting all that complexity initially, if ever. JSON is designed to be simple, terse and functional. Make your XML look like that if you can.

In other words, make the XML that is returned more JSON-like — simple and easy to read, without the schema and namespace details present, just data and links. If it ends up being more complex than this, the cost of XML will be staggering. In my experience no one has used XML responses anyway for the last several years, it's just too expensive to consume.

Note that [JSON-Schema](https://json-schema.org/) offers schema-style validation capabilities, if you need that sort of thing.

## Create Fine-Grained Resources

When starting out, it's best to create APIs that mimic the underlying application domain or database architecture of your system. Eventually, you'll want aggregate services that utilize multiple underlying resources to reduce chattiness. However, it's much easier to create larger resources later from individual resources than it is to create fine-grained or individual resources from larger aggregates. Make it easy on yourself and start with small, easily defined resources, providing CRUD functionality on those. You can create those use-case-oriented, chattiness-reducing resources later.

## Consider Connectedness

One of the principles of REST is connectedness—via hypermedia links (search HATEOAS). While services are still useful without them, APIs become more self-descriptive and discoverable when links are returned in the response. At the very least, a 'self' link reference informs clients how the data was or can be retrieved. Additionally, utilize the HTTP Location header to contain a link on resource creation via POST (or PUT). For collections returned in a response that support pagination, 'first', 'last', 'next' and 'prev' links at a minimum are very helpful.

Regarding linking formats, there are many. The HTTP Web Linking Specification ([RFC5988](https://tools.ietf.org/search/rfc5988)) explains a link as follows:

 > 
 > a link is a typed connection between two resources that are identified by Internationalised Resource Identifiers (IRIs) \[[RFC3987](https://tools.ietf.org/search/rfc3987)\], and is comprised of:
 > 
 > * A context IRI,
 > * a link relation type
 > * a target IRI, and
 > * optionally, target attributes.
 > 
 > A link can be viewed as a statement of the form "{context IRI} has a {relation type} resource at {target IRI}, which has {target attributes}."

At the very least, place links in the HTTP Link header as recommended in the specification, or embrace a JSON representation of this HTTP link style (such as Atom-style links, see: [RFC4287](https://tools.ietf.org/search/rfc4287#section-4.2.7)) in your JSON representations. Later, you can layer in more complex linking styles such as [HAL+JSON](https://stateless.co/hal_specification.html), [Siren](https://github.com/kevinswiber/siren), [Collection+JSON](https://amundsen.com/media-types/collection/), and/or [JSON-LD](https://json-ld.org/), etc. as your REST APIs become more mature.

---

Links:

[REST API Methods](REST%20API%20Methods.md)
[REST API Resource Naming](REST%20API%20Resource%20Naming.md)
[REST API Idempotence](REST%20API%20Idempotence.md)
[R Package - plumber](../3-Resources/Tools/Developer%20Tools/Languages/R/R%20Packages/API%20R%20Packages/R%20Package%20-%20plumber.md)
*3-Resources/Tools/Python/Python Packages 1/Python Package - Flask*
