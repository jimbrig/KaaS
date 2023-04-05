Status:: #Status/Todo  
Type:: #Type/Documentation  
Topic:: #Topic/Dev/WebDev/API

# API Authentication

## Basic Authentication

The logging-in example above is the most basic form of authentication. In fact, the official name for it is **Basic Authentication** ("Basic Auth" to its friends). Though the name has not garnered any creativity awards, the scheme is a perfectly acceptable way for the server to authenticate the client in an API.

Basic Auth only requires a username and password. The client takes these two credentials, smooshes them together to form a single value [1](https://zapier.com/learn/apis/chapter-4-authentication-part-1/#footnote-1), and passes that along in the request in an HTTP header called **Authorization**.

![](https://images.zapier.com/storage/photos/8c6904593b69ea46786f22fe1642f78c.png?format=jpg)

**Figure 1.** The Authorization HTTP header.

When the server receives the request, it looks at the Authorization header and compares it to the credentials it has stored. If the username and password match one of the users in the server's list, the server fulfills the client's request as that user. If there is no match, the server returns a special status code (401) to let the client know that authentication failed and the request is denied.

Though Basic Auth is a valid authentication scheme, the fact that it uses the same username and password to access the API and manage the account is not ideal. That is like a hotel handing a guest the keys to the whole building rather than to a room.

Similarly with APIs, there may be times when the client should have different permissions than the account owner. Take for example a business owner who hires a contractor to write a program that uses an API on their behalf. Trusting the contractor with the account credentials puts the owner at risk because an unscrupulous contractor could change the password, locking the business owner out of their own account. Clearly, it would be nice to have an alternative.

![](https://images.zapier.com/storage/photos/9d065ad75953f866fd3e43698f723135.png?format=jpg)

## API Key Authentication

API Key authentication is a technique that overcomes the weakness of using shared credentials by requiring the API to be accessed with a unique key. In this scheme, the key is usually a long series of letters and numbers that is distinct from the account owner's login password. The owner gives the key to the client, very much like a hotel gives a guest a key to a single room.

When the client authenticates with the API key, the server knows to allow the client access to data, but now has the option to limit administrative functions, like changing passwords or deleting accounts. Sometimes, keys are used simply so the user does not have to give out their password. The flexibility is there with API Key authentication to limit control as well as protect user passwords.

So, where does the API key go? There is a header for it, too, right? Unfortunately, there is not. Unlike Basic Auth, which is an established standard with strict rules, API keys were conceived at multiple companies in the early days of the web. As a result, API key authentication is a bit like the wild west; everybody has their own way of doing it.

Over time, however, a few common approaches have emerged. One is to have the client put the key in the Authorization header, in lieu of a username and password. Another is to add the key onto the URL (`http://example.com?api_key=my_secret_key`). Less common is to bury the key somewhere in the request body next to the data. Wherever the key goes, the effect is the same - it lets the server authenticate the client.

## OAuth 2

To get started, we first need to know the cast of characters involved in an OAuth exchange:

* **The User -** A person who wants to connect two websites they use
* **The Client -** The website that will be granted access to the user's data
* **The Server -** The website that has the user's data

Next, we need to give a quick disclaimer. One goal of OAuth 2 is to allow businesses to adapt the authentication process to their needs. Due to this extendable nature, APIs can have slightly different steps. The workflow shown below is a common one found among web-based apps. Mobile and desktop applications might use slight variations on this process.

With that, here are the steps of OAuth 2.

### Step 1 - User Tells Client to Connect to Server

![](https://images.zapier.com/storage/photos/14308b92c1ecbf386bf6f9968a26655d.png?format=jpg)

The user kicks off the process by letting the client know they want it to connect to the server. Usually, this is by clicking a button.

### Step 2 - Client Directs User to Server

The client sends the user over to the server's website, along with a URL that the server will send the user back to once the user authenticates, called the **callback URL**.

![](https://images.zapier.com/storage/photos/c5abbc5bbb8113fe396c3f1142365d30.png?format=jpg)

### Step 3 - User Logs-in to Server and Grants Client Access

![](https://images.zapier.com/storage/photos/6598fef75989e1c6631633cc5e6b500b.png?format=jpg)

With their normal username and password, the user authenticates with the server. The server is now certain that one of its own users is requesting that the client be given access to the user's account and related data.

### Step 4 - Server Sends User Back to Client, Along with Code

![](https://images.zapier.com/storage/photos/4fa7f92cfc3ec2539ce2d91bc0bbb900.png?format=jpg)

The server sends the user back to the client (to the Callback URL from Step 2). Hidden in the response is a unique **authorization code** for the client.

![](https://images.zapier.com/storage/photos/95009dd46bc2d822372c572b5788f59a.png?format=jpg)

### Step 5 - Client Exchanges Code + Secret Key for Access Token

The client takes the authorization code it receives and makes another request to the server. This request includes the client's **secret key**. When the server sees a valid authorization code and a trusted client secret key, it is certain that the client is who it claims to be and that it is acting on behalf of a real user. The server responds back with an **access token**.

![](https://images.zapier.com/storage/photos/7e0f9c20bc4504568d73d329b2fe940f.png?format=jpg)

### Step 6 - Client Fetches Data from Server

![](https://images.zapier.com/storage/photos/249b7ca9a56bda87413b4de175e79981.png?format=jpg)

At this point, the client is free to access the server on the user's behalf. The access token from Step 6 is essentially another password into the user's account on the server. The client includes the access token with every request so it can authenticate directly with the server.

### Client Refreshes Token (Optional)

A feature introduced in OAuth 2 is the option to have access tokens expire. This is helpful in protecting users' accounts by strengthening security - the faster a token expires, the less time a stolen token might be used maliciously, similar to how a credit card number expires after a certain time. The lifespan of a token is set by the server. APIs in the wild use anything from hours to months. Once the lifespan is reached, the client must ask the server for a new token.

## How OAuth 1 Is Different

There are several key differences between the versions of OAuth. One we already mentioned; access tokens do not expire.

Another distinction is that OAuth 1 includes an extra step. Between Steps 1 and 2 above, OAuth 1 requires the client to ask the server for a **request token**. This token acts like the authorization code in Oauth 2 and is what gets exchanged for the access token.

A third difference is that OAuth 1 requires requests to be digitally signed. We'll skip the details of how signing works (you can find code libraries to do this for you), but it is worth knowing why it is in one version and not the other. Request signing is a way to protect data from being tampered with while it moves between the client and the server. Signatures allow the server to verify the authenticity of the requests.

Today, however, most API traffic happens over a channel that is already secure (HTTPS). Recognizing this, OAuth 2 eliminates signatures in an effort to make version two easier to use. The trade-off is that OAuth 2 relies on other measures to provide security to the data in transit.

## Authorization

An element of OAuth 2 that deserves special attention is the concept limiting access, known formally as **authorization**. Back in Step 2, when the user clicks the button to allow the client access, buried in the fine print are the exact permissions the client is asking for. Those permissions, called **scope**, are another important feature of OAuth 2. They provide a way for the client to request limited access to the user's data, thereby making it easier for the user to trust the client.

What makes scope powerful is that it is client-based restrictions. Unlike an API Key, where limits placed on the key affect every client equally, OAuth scope allows one client to have permission X and another permissions X and Y. That means one website might be able to view your contacts, while another site can view *and* edit them.

---

## Appendix: Links

* [API Design](API%20Design.md)
* [API Architecture - Performance Best Practices](API%20Architecture%20-%20Performance%20Best%20Practices.md)
* [REST API Best Practices](REST%20API%20Best%20Practices.md)
* [REST API Resources List](../2-Areas/Lists/REST%20API%20Resources%20List.md)
* [Development](../2-Areas/MOCs/Development.md)
* [Web Development](../2-Areas/MOCs/Web%20Development.md)

*Backlinks:*

````dataview
list from [[API Authentication]] AND -"Changelog"
````
