# Web Application Architecture

 > 
 > A web application architecture describes the layout of all the component of a web application and also highlights the interactions between various application components, third-party middleware systems, web services, and databases. This provides a snapshot of interaction between a number of applications working together simultaneously to provide service to end users

![](https://i.imgur.com/0OLf55k.png)

## The Difference Between Software Architecture And Software Design

***Software architecture*** is highlights all the high-level components of a system and the interaction within them.

***Software design*** is a code level design focusing on distributing application business logic into various modules with its own specific purposes. This helps in building and managing the application business logic.

## User Agent

User-Agents are primarily tools that help users to interact with a server. User primary interacts with a server using a web browser — Google Chrome, Firefox, Microsoft Edge, Safari, and mobile applications on — Android and IOS platforms. User Agent sends a request to the server and receives a response which is then shown to the user.

## **DNS**

Domain Name Servers are like an address book for websites. Whenever a user send a request to web address using browser, the browser utilize the DNS to find the web server’s real address (IP Address) before it can send the request. The browser needs to find out which server the website lives on, so it can send HTTP requests to the right place.

## Load Balancer

Load Balancer primarily deals with horizontal scaling. It directs the incoming requests to one of the multiple servers, and the load balancer then sends the response which it receives from these servers to the user. Usually, web application servers exist in the form of multiple copies mirroring each other to provide consistency and availability. The load balancer distributes tasks among them. It works well alongside server auto-scaling.

## Virtual Machine

In computing, a **virtual machine** (**VM**) is the virtualization/emulation of a computer system. Virtual machines are based on computer architectures and provide the functionality of a physical computer. Their implementations may involve specialized hardware, software, or a combination.

## Web Server

Webserver processes a user’s request and sends a response that includes data (HTML, JSON, XML, etc.) back to a browser. Web servers hosted on a virtual machine utilize computation power provided by VMs to perform their tasks. A web server usually refers to back-end infrastructures such as database, cache server, job queue, and others.

## Databases

The database provides tools for organizing, adding, searching, updating, deleting, and performing computations on the data. There are generally relational databases — MySQL, PostgreSQL, Microsoft SQL Server, Oracle Database, and Microsoft Access, etc and non-relational databases — MongoDB, Dynamo DB, etc.

## Caching Service

Caching service provides storage for data, which allows storing and searching data. Caching allows you to refer to the previous result to make computation much faster. Caches can be applied and leveraged throughout various layers of technology including Operating Systems, Networking layers including Content Delivery Networks (CDN) and DNS, web applications, and Databases.

 > 
 > Client-Side — HTTP Cache Headers, Browsers  
 > DNS — DNS Servers  
 > Web — HTTP Cache Headers, CDNs, Reverse Proxies, Web Accelerators, Key/Value Stores  
 > App — Key/Value data stores, Local caches  
 > Database — Database Cache, buffers, Key/Value data stores

## Content Delivery Network(CDN)

A content delivery network, or content distribution network (CDN), is a geographically distributed network of proxy servers and their data centers. The goal is to provide high availability and performance by distributing the service spatially relative to end-users. CDNs serve a large portion of the Internet content including web objects (text, graphics, and scripts), downloadable objects (media files, software, documents), applications (e-commerce, portals), live streaming media, on-demand streaming media, and social media sites.

## External Storage

External Storages are used to store assets including images, videos, documents, and other large files. In many cases, there are also operations performed on these files. Example — Youtube auto converts videos uploaded by users in multiple resolutions. Facebook converts user images and videos into a mobile-friendly format. Because storing these data on a VM local disk can be costly and can consume large computation resources, they are generally stored in external storage. Cloud Storage is one of the most popular options.

**Cloud storage** is a cloud computing model that stores data on the Internet through a cloud computing provider that manages and operates data storage as a service. It’s delivered on-demand with just-in-time capacity and costs and eliminates buying and managing your own data storage infrastructure

## Web Services

Web services provide a common platform that allows multiple applications built on various programming languages to have the ability to communicate with each other.

Web services use SOAP (Simple Object Access Protocol) for sending the XML data between applications. The data is sent over HTTP Request. The data which is sent from the web service to the application is called a SOAP message. The SOAP message is nothing but an XML document. Since the document is written in XML, the client application calling the web service can be written in any programming language.

There are mainly two types of web services.

1. Simple Object Access Protocol or SOAP web services.
1. Representational State Transfer or REST web services.

## Data Warehouse

Data Warehouse is a system used for reporting and data analysis and is considered a core component of business intelligence. Every modern application collects, stores, and analyzes data. DWs are central repositories of integrated data from one or more disparate sources. They store current and historical data in one single place that is used for performing business intelligence and for creating analytical reports for the enterprise.

The two main approaches used to build a data warehouse system are Extract, transform, load (ETL), and extract, load, transform (ELT).

These three required processes are —

 > 
 > **Extract**: Extract data from multiple sources.  
 > **Transform**: Transform the data including cleaning, margin, and categorizing.  
 > **Load**: Loading the data in storage for data warehousing.

There are only three models of web application components. It’s closely related to the number of services and databases used for a web application. Here they are:

* *One Web Server, One Database*
* *Multiple Web Servers, One Database*
* *Multiple Web Server, Multiple Databases*
* *Applicaton Services*

The three so-called “Monolithic” models are due to their server’s rigid and stable nature. In contrast, application services (microservices and serverless) tend to be agile since they simplify upgrades and scaling. Applying this model allows splitting up web servers into smaller parts: ‘services’ in microservices and ‘functions’ in serverless. Thus, modifying and scaling independently using each of them is easier.

The principal criteria for building a reliable application architecture:

* Efficient
* Flexible
* Reusable
* Easily testable
* Solves problems consistently and successfully
* With well-structured and understandable code
* Scalable in the development process
* Have fast response times
* Doesn’t crush
* Doesn’t have a single point of failure
* Simple
* Uses go-to security standards

Useful resources:

[https://www.youtube.com/watch?v=Z3SYDTMP3ME](https://www.youtube.com/watch?v=Z3SYDTMP3ME&list=WL&index=7&t=5s)

[https://en.wikipedia.org/wiki/Web\_application](https://en.wikipedia.org/wiki/Web_application)

*Backlinks:*

````dataview
list from [[Web Application Architecture]] AND -"Changelog"
````
