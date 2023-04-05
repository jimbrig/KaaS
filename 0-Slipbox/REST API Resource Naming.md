# REST API Resource Naming

*Source: [REST Tutorial Lessons - RESTful Resource Naming](https://www.restapitutorial.com/lessons/restfulresourcenaming.html)*.

See Also:

* [REST API Methods](REST%20API%20Methods.md) ([HTTP Methods](https://www.restapitutorial.com/lessons/httpmethods.html)) 
* [REST API Idempotence](REST%20API%20Idempotence.md) ([Idempotence](https://www.restapitutorial.com/lessons/idempotency.html))

In addition to utilizing the HTTP verbs appropriately, resource naming is arguably the most debated and most important concept to grasp when creating an understandable, easily leveraged Web service API. When resources are named well, an API is intuitive and easy to use. Done poorly, that same API can feel klutzy and be difficult to use and understand. Below are a few tips to get you going when creating the resource URIs for your new API.

Essentially, a RESTful API ends up being simply a collection of URIs, HTTP calls to those URIs and some JSON and/or XML representations of resources, many of which will contain relational links. The RESTful principal of addressability is covered by the URIs. Each resource has its own address or URI—every interesting piece of information the server can provide is exposed as a resource. The constraint of uniform interface is partially addressed by the combination of URIs and HTTP verbs, and using them in line with the standards and conventions.

In deciding what resources are within your system, name them as nouns as opposed to verbs or actions. In other words, a RESTful URI should refer to a resource that is a thing instead of referring to an action. Nouns have properties as verbs do not, just another distinguishing factor.

Some example resources are:

* Users of the system.
* Courses in which a student is enrolled.
* A user's timeline of posts.
* The users that follow another user.
* An article about horseback riding.

Each resource in a service suite will have at least one URI identifying it. And it's best when that URI makes sense and adequately describes the resource. URIs should follow a predictable, hierarchical structure to enhance understandability and, therefore, usability: predictable in the sense that they're consistent, hierarchical in the sense that data has structure—relationships. This is not a REST rule or constraint, but it enhances the API.

RESTful APIs are written for consumers. The name and structure of URIs should convey meaning to those consumers. It's often difficult to know what the data boundaries should be, but with understanding of your data, you most-likely are equipped to take a stab and what makes sense to return as a representation to your clients. Design for your clients, not for your data.

## Resource URI Examples

Let's say we're describing an order system with customers, orders, line items, products, etc. Consider the URIs involved in describing the resources in this service suite:

To insert (create) a new customer in the system, we might use:  
*POST http://www.example.com/customers*

To read a customer with Customer ID# 33245:  
*GET http://www.example.com/customers/33245* The same URI would be used for PUT and DELETE, to update and delete, respectively.

Here are proposed URIs for products:  
*POST http://www.example.com/products* for creating a new product.

*GET|PUT|DELETE http://www.example.com/products/66432*  
for reading, updating, deleting product 66432, respectively.

Now, here is where it gets fun... What about creating a new order for a customer? One option might be: POST http://www.example.com/orders And that could work to create an order, but it's arguably outside the context of a customer.

Because we want to create an order for a customer (note the relationship), this URI perhaps is not as intuitive as it could be. It could be argued that the following URI would offer better clarity: *POST http://www.example.com/customers/33245/orders* Now we know we're creating an order for customer ID# 33245.

Now what would the following return?  
*GET http://www.example.com/customers/33245/orders*  
Probably a list of orders that customer #33245 has created or owns. Note: we may choose to not support DELETE or PUT for that url since it's operating on a collection.

Now, to continue the hierarchical concept, what about the following URI?  
*POST http://www.example.com/customers/33245/orders/8769/lineitems*  
That might add a line item to order #8769 (which is for customer #33245). Right! GET for that URI might return all the line items for that order. However, if line items don't make sense only in customer context or also make sense outside the context of a customer, we would offer a POST www.example.com/orders/8769/lineitems URI.

Along those lines, because there may be multiple URIs for a given resource, we might also offer a GET http://www.example.com/orders/8769 URI that supports retrieving an order by number without having to know the customer number.

To go one layer deeper in the hierarchy:  
*GET http://www.example.com/customers/33245/orders/8769/lineitems/1*  
Might return only the first line item in that same order.

By now you can see how the hierarchy concept works. There aren't any hard and fast rules, only make sure the imposed structure makes sense to consumers of your services. As with everything in the craft of Software Development, naming is critical to success.

Look at some widely used APIs to get the hang of this and leverage the intuition of your teammates to refine your API resource URIs. Some example APIs are:

* Twitter: https://developer.twitter.com/en/docs/api-reference-index
* Facebook: https://developers.facebook.com/docs/reference/api/
* LinkedIn: https://developer.linkedin.com/apis

## Resource Naming Anti-Patterns

While we've discussed some examples of appropriate resource names, sometimes it's informative to see some anti-patterns. Below are some examples of poor RESTful resource URIs seen in the "wild." These are examples of what not to do!

First up, often services use a single URI to specify the service interface, using query-string parameters to specify the requested operation and/or HTTP verb. For example to update customer with ID 12345, the request for a JSON body might be:

*GET http://api.example.com/services?op=update_customer&id=12345&format=json*

By now, you're above doing this. Even though the 'services' URL node is a noun, this URL is not self- descriptive as the URI hierarchy is the same for all requests. Plus, it uses GET as the HTTP verb even though we're performing an update. This is counter-intuitive and is painful (even dangerous) to use as a client.

Here's another example following the same operation of updating a customer:

*GET http://api.example.com/update_customer/12345*

And its evil twin:

*GET http://api.example.com/customers/12345/update*

You'll see this one a lot as you visit other developer's service suites. Note that the developer is attempting to create RESTful resource names and has made some progress. But you're better than this —able to identify the verb phrase in the URL. Notice that we don't need to use the 'update' verb phrase in the URL because we can rely on the HTTP verb to inform that operation. Just to clarify, the following resource URL is redundant:

*PUT http://api.example.com/customers/12345/update*

With both PUT and 'update' in the request, we're offering to confuse our service consumers! Is 'update' the resource? So, we've spent some time beating the horse at this point. I'm certain you understand...

## Pluralization

Let's talk about the debate between the pluralizers and the "singularizers"... Haven't heard of that debate? It does exist. Essentially, it boils down to this question...

Should URI nodes in your hierarchy be named using singular or plural nouns? For example, should your URI for retrieving a representation of a customer resource look like this:

*GET http://www.example.com/customer/33245* or: *GET http://www.example.com/customers/33245*

There are good arguments on both sides, but the commonly-accepted practice is to always use plurals in node names to keep your API URIs consistent across all HTTP methods. The reasoning is based on the concept that customers are a collection within the service suite and the ID (e.g. 33245) refers to one of those customers in the collection.

Using this rule, an example multi-node URI using pluralization would look like (emphasis added):

*GET http://www.example.com/**customers**/33245/**orders**/8769/**lineitems**/1*

with 'customers', 'orders', and 'lineitems' URI nodes all being their plural forms.

This implies that you only really need two base URLs for each root resource. One for creation of the resource within a collection and the second for reading, updating and deleting the resource by its identifier. For example the creation case, using customers as the example, is handled by the following URL:

*POST http://www.example.com/customers*

And the read, update and delete cases are handled by the following:

*GET|PUT|DELETE http://www.example.com/customers/{id}*

As mentioned earlier, there may be multiple URIs for a given resource, but as a minimum full CRUD capabilities are aptly handled with two simple URIs.

You ask if there is a case where pluralization doesn't make sense. Well, yes, in fact there is. When there isn't a collection concept in play. In other words, it's acceptable to use a singularized resource name when there can only be one of the resource—it's a singleton resource. For example, if there was a single, overarching configuration resource, you might use a singularized noun to represent that:

*GET|PUT|DELETE http://www.example.com/configuration*

Note the lack of a configuration ID and usage of POST verb. And say that there was only one configuration per customer, then the URL might be:

*GET|PUT|DELETE http://www.example.com/customers/12345/configuration*

Again, no ID for the configuration and no POST verb usage. Although, I'm sure that in both of these cases POST usage might be argued to be valid. Well... OK.

*Backlinks:*

````dataview
list from [[REST API Resource Naming]] AND -"Changelog"
````
