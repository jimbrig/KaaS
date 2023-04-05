# What Is Cloud CDN and How Does It Work? | Google Cloud Blog

## Metadata

* Author: *cloud.google.com*
* Full Title: What Is Cloud CDN and How Does It Work? | Google Cloud Blog
* Category: #Type/Highlight/Article
* URL: https://cloud.google.com/blog/topics/developers-practitioners/what-cloud-cdn-and-how-does-it-work

## Highlights

* Cloud CDN is a content delivery network that accelerates your web and video content delivery by using Google's global edge network to bring content as close to your users as possible. As a result latency, cost, and load on your backend servers is reduced, making it easier to scale to millions of users. Global anycast IP provides a single IP for global reach. It enables Google Cloud to route users to the nearest edge cache automatically and avoid DNS propagation delays that can impact availability. It supports HTTP/2 end-to-end and the QUIC protocol from client to cache. QUIC is a multiplexed stream transport over UDP, which reduces latency and makes it ideal for lossy mobile networks.
* You can set up Cloud CDN through gCloud CLI, Cloud Console, or the APIs. Since Cloud CDN uses Cloud Load Balancing to provide routing, health checking, and anycast IP support, it can be enabled by easily selecting a checkbox while setting up your backends or origins. Cloud CDN makes it easy to serve web and media content using Google Cloud Storage. You just upload your content to a Cloud Storage bucket, set up your load balancer, and enable caching. To enable hybrid architectures spanning across clouds and on-premises, Cloud CDN and HTTP(S) Load Balancing also support external backends.
