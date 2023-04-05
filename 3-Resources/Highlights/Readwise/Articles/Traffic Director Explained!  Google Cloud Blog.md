# Traffic Director Explained! | Google Cloud Blog

## Metadata

* Author: *cloud.google.com*
* Full Title: Traffic Director Explained! | Google Cloud Blog
* Category: #Type/Highlight/Article
* URL: https://cloud.google.com/blog/topics/developers-practitioners/traffic-director-explained

## Highlights

* How does a typical service mesh work in Kubernetes?In a typical service mesh you deploy your services to a Kubernetes cluster.Each of the services' Pods has a dedicated proxy (usually Envoy) running as a sidecar container alongside the application container(s).Each sidecar proxy talks to the networking infrastructure (a control plane) that is installed in your cluster. The control plane tells the sidecar proxies about services, endpoints, and policies in your service mesh.When a Pod sends or receives a request, the request is intercepted by the Pod's sidecar proxy. The sidecar proxy handles the request, for example, by sending it to its intended destination.The control plane is connected to each proxy and provides information that the proxies need to handle requests. To understand the flow, if application code in Service A sends a request, the proxy handles the request and forwards it to Service B. This model enables you to move networking logic out of your application code. You can focus on delivering business value while letting the service mesh infrastructure take care of application networking.
* Traffic Director provides the information that the proxies need to route requests. For example, application code on a Pod that belongs to Service A sends a request. The sidecar proxy running alongside this Pod handles the request and routes it to a Pod that belongs to Service B.
