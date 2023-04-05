# How to ‘DevOps’ as a Software Developer

## Metadata

* Author: *Komal Venkatesh Ganesan*
* Full Title: How to ‘DevOps’ as a Software Developer
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/d428821ae681

## Highlights

* If your application runs on Docker, these certificates will have to be loaded into your container.
* These are usually enforced by the security team in your organization. Be aware of these and evaluate what your software might need beforehand.
* Your application might need client-certs to be installed on the machine to connect and trust remote HTTPS endpoints. Or if you are a server, you might require a server-cert signed by your organization’s root CA.
* Understand key concepts such as IP subnets, routing policies, firewall and DNS rules. These determine external connectivity — to and from your application.
* Most modern apps work by exposing HTTP APIs. The webserver that handles this needs to have limits set on important parameters like — incoming_payload_size, max_conncurrent_connectionsand connection-timeoutvalues.
