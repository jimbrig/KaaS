# Kubernetes Explained to Product Managers

## Metadata

* Author: *dev.to*
* Full Title: Kubernetes Explained to Product Managers
* Category: #Type/Highlight/Article
* URL: https://dev.to/strio/kubernetes-explained-to-product-managers-4b1a

## Highlights

* containers, Docker, Kubernetes or clusters ([View Highlight](https://instapaper.com/read/1354348908/14361539))
* some basic knowledge should allow you to collaborate more fluidly with your team, while being able to get an idea of the stakes, either because your company is considering migrating to Kubernetes, or because they already use this technology on a daily basis. ([View Highlight](https://instapaper.com/read/1354348908/14361542))
* Why is everyone talking about Kubernetes? ([View Highlight](https://instapaper.com/read/1354348908/14361545))
* Kubernetes is an open-source project initiated by Google, and launched in 2014. Google being praised for its high performing infrastructure and applications, an open-source project originating from the company is kind of a guarantee that it might be helpful to other organizations. Google has a tradition of open-source, with more than 2,000 projects launched to date. Some of them are particularly famous, like the Go language or Spinnaker (although launched by Netflix, it's been considerably extended by Google). ([View Highlight](https://instapaper.com/read/1354348908/14361549))
* Today, Kubernetes is no longer managed by Google, as the company passed the project to the Cloud Native Computing Foundation, or CNCF, a non-profit organization hosting critical infrastructure projects.
  Although launched only 6 years ago, Kubernetes is becoming a standard used by an increasing number of companies. 78% of companies using container orchestration have chosen Kubernetes, from tech companies, to large enterprises or rising startups. Think Google, Slack, The New York Times, BlaBlaCar or Huawei. ([View Highlight](https://instapaper.com/read/1354348908/14361552))
* So what exactly is Kubernetes? ([View Highlight](https://instapaper.com/read/1354348908/14361555))
* The name Kubernetes originates from Greek, meaning helmsman or pilot. ([View Highlight](https://instapaper.com/read/1354348908/14361566))
  * Note: Kubernetes=“Helmsman or Pilot” in Greek. Look towards Latin, Greek, or other ancient languages for cool names!
* Kubernetes defines itself as "an open-source system for automating deployment, scaling, and management of containerized applications." ([View Highlight](https://instapaper.com/read/1354348908/14361568))
* Since Kubernetes orchestrates containers, let's start by examining what containers actually are.
  Containers have been made popular by an open-source project called Docker, created in 2013 ([View Highlight](https://instapaper.com/read/1354348908/14361569))
* Think of the container as a standardized unit of software. It is a way to package software into standardized units for Development, Shipment and Deployment.
  You can imagine containers as same-sized boxes built around your code, which allow you to manipulate them much more easily than if the code was on its own, without any standard.
  Thanks to this standardization, containers allow complex architecture to be managed much more easily. ([View Highlight](https://instapaper.com/read/1354348908/14361570))
* A container is composed of several elements. To be precise, each container has its own filesystem, CPU, memory or process space. They are fully decoupled from the architecture, which allows them to be portable. ([View Highlight](https://instapaper.com/read/1354348908/14361571))
* Containers are great but they must be managed and orchestrated. For example, if a container goes down, another container needs to start instead to avoid downtime on the app.
  Instead of moving containers one by one, that's where orchestration tools such as Kubernetes comes in. Kubernetes is an orchestration tool, that takes care of the orchestration and scaling of containers. Without Kubernetes, containers would be handled by hand. As you can imagine, the more the containers the more the hand work, which is not compatible with the growth of an application.
  Kubernetes runs these containers for you and therefore is your best ally when your application is scaling. ([View Highlight](https://instapaper.com/read/1354348908/14361572))
* What makes K8S special? ([View Highlight](https://instapaper.com/read/1354348908/14361575))
* Kubernetes runs containers at scale and have the following features:
  Declarative: Declarative refers to a model where you don't have to specify and plan exactly how things will happen. Instead, you just state what your desired outcome is, without thinking at the way it is achieved. This allows Kubernetes users to forget about the complex details, to focus only on the outcome.
  Automation: Thanks to this declarative mode, Kubernetes achieves automation. Rather than spending countless hours working on the details of containers orchestration, Kubernetes abstracts it for you.
  Portable: Kubernetes can be used whatever the cloud provider or the kind of infrastructure used, which means it is portable. ([View Highlight](https://instapaper.com/read/1354348908/14361576))
* Kubernetes can run anywhere. It is cloud agnostic and can run on virtual machines, which means there is no vendor lock-in ([View Highlight](https://instapaper.com/read/1354348908/14361578))
* Kubernetes accompanies the scaling of applications and helps manage complex architectures and infrastructures ([View Highlight](https://instapaper.com/read/1354348908/14361580))
* Kubernetes allows developers to be more productive ([View Highlight](https://instapaper.com/read/1354348908/14361585))
* Kubernetes vocabulary ([View Highlight](https://instapaper.com/read/1354348908/14361587))
* Basically, Kubernetes is made of clusters, nodes and pods.
  When you deploy Kubernetes, you get a cluster.
  Inside this cluster, you can find nodes.
  You deploy pods on these nodes. ([View Highlight](https://instapaper.com/read/1354348908/14361589))
* Cluster: It is a collection of hosts (servers) that helps you to aggregate their available resources. That includes ram, CPU, ram, disk, and their devices into a usable pool. ([View Highlight](https://instapaper.com/read/1354348908/14361592))
* Nodes: Nodes are controlled by the control plane. Nodes are a virtual or physical machine. Nodes are the machinery needed to deploy pods. ([View Highlight](https://instapaper.com/read/1354348908/14361594))
* Pods: Pods are the smallest units in Kubernetes. A pod is a group of one or more containers, with shared storage/network resources, and a specification for how to run the containers. ([View Highlight](https://instapaper.com/read/1354348908/14361596))
* Want to go further? Here is a set of beginners resources about Kubernetes.
  Kubernetes documentation
  Why and when you should use Kubernetes
  More about Kubernetes components
  A Youtube Kubernetes tutorial for beginners
  The illustrated children's guide to Kubernetes ([View Highlight](https://instapaper.com/read/1354348908/14361598))
