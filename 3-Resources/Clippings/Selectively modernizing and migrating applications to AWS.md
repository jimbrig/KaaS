---
Date: 2022-03-24
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Clipping"]
Alias: "Selectively modernizing and migrating applications to AWS"
---

# Selectively modernizing and migrating applications to AWS

*Source: [Selectively modernizing and migrating applications to AWS](https://www.pwc.com/us/en/tech-effect/cloud/aws-migration-strategy.html)*

AWS adoption has become the go-to move for businesses seeking to adapt to today’s rapidly changing climate. AWS advantages include potential operational cost reductions, access to advanced technologies and a built-in pathway to innovation. Architecture that offers high availability, low latency and increased resiliency while also providing more agility, automation and faster time to market can deliver a significant competitive advantage. The question has shifted. You might have wondered in years past, “Does my business really need to migrate to cloud?” Now you’re thinking, “What’s the most efficient way to migrate and maximize ROI?”

There is no ideal, one-size-fits-all AWS migration strategy that works for every organization. Instead, you’ll find several approaches that can be mixed and matched — in other words, carefully selected for different aspects of your company’s IT environment.

Every organization faces a unique set of challenges when migrating legacy systems to AWS. By adopting a “selective modernization” approach to your migration, your business can choose which application stacks are well suited to significant modernization to support AWS functionality. PwC clients have garnered many benefits by following this hybrid AWS modernization strategy and investing only in applications where value is likely to be realized.

Any business embarking on an AWS migration and application modernization journey should have a sound understanding of its “technical debt” — that is, where significant investment to rework apps is required for them to support and take advantage of AWS functionality. To build an efficient strategy for AWS migration, PwC considers each application’s technical debt against the application’s business value.

Think of technical debt this way: How much expense and effort will be entailed in refactoring an existing application stack to the level of support it needs to function at least as well as it did on premises. Measure that against the business value the app delivers or might deliver in AWS. The chart that follows tells the story.

![Thumbnail for Julien Furioli](https://www.pwc.com/content/dam/pwc/us/en/contacts/j/julien-furioli.jpg)

Julien Furioli

Principal, Financial Services Technology, PwC US

![Thumbnail for Joe Kennedy](https://www.pwc.com/content/dam/pwc/us/en/people/photos/joe-kennedy.jpg)

Joe Kennedy

Financial Services Technology Consulting Leader, Greater Boston Area, PwC US

![Thumbnail for Connor McCrory](https://www.pwc.com/content/dam/pwc/us/en/contacts/c/connor-mccrory.jpg)

Connor McCrory

Senior Associate, Cloud and Digital Transformation, PwC US

AWS adoption has become the go-to move for businesses seeking to adapt to today’s rapidly changing climate. AWS advantages include potential operational cost reductions, access to advanced technologies and a built-in pathway to innovation. Architecture that offers high availability, low latency and increased resiliency while also providing more agility, automation and faster time to market can deliver a significant competitive advantage. The question has shifted. You might have wondered in years past, “Does my business really need to migrate to cloud?” Now you’re thinking, “What’s the most efficient way to migrate and maximize ROI?”

There is no ideal, one-size-fits-all AWS migration strategy that works for every organization. Instead, you’ll find several approaches that can be mixed and matched — in other words, carefully selected for different aspects of your company’s IT environment.

Every organization faces a unique set of challenges when migrating legacy systems to AWS. By adopting a “selective modernization” approach to your migration, your business can choose which application stacks are well suited to significant modernization to support AWS functionality. PwC clients have garnered many benefits by following this hybrid AWS modernization strategy and investing only in applications where value is likely to be realized.

Any business embarking on an AWS migration and application modernization journey should have a sound understanding of its “technical debt” — that is, where significant investment to rework apps is required for them to support and take advantage of AWS functionality. To build an efficient strategy for AWS migration, PwC considers each application’s technical debt against the application’s business value.

Think of technical debt this way: How much expense and effort will be entailed in refactoring an existing application stack to the level of support it needs to function at least as well as it did on premises. Measure that against the business value the app delivers or might deliver in AWS. The chart that follows tells the story.

##### Decision tree that shows how you should adapt legacy apps to AWS  

 ![](https://www.pwc.com/us/en/tech-effect/content/images/websphere-migration-1.svg) 

Applications that generate high business value are better suited to full-fledged rearchitecting and modernization. Applications with low business value and high technical debt are frequently built on legacy platforms and written in language versions past end-of-life. Such applications have lower portability and reliability, often fail to scale rapidly and come bundled with the burden of maintaining on-prem infrastructure. When these applications aren’t major sources of business value for the organization, they don’t cost-justify the high spend entailed in a bespoke application rearchitecture.

A selective modernization strategy recommends a different approach: Place low-criticality applications and their dependencies in containers, deploying them with minimal changes to their core code. This initial approach saves money upfront while also paving the way for additional modernization in the future. Here are two use cases illustrating how to handle selective modernization and migration of legacy applications. The first is a containerize-and-shift approach and the second utilizes AWS-native services to refactor the application.

## Approach 1: Containerize-and-shift

Containers form the backbone of selective modernization. Abstracting the application’s infrastructure and OS layers allows security and networking rules to be consistently applied as part of configuration. The portability of a containerized application simplifies continuous integration/continuous delivery (CI/CD) to boost resiliency and time to market. 

##### Sample application with ‘technical debt’

 ![](https://www.pwc.com/us/en/tech-effect/content/images/websphere-migration-2.svg) 

In one client example, an application was performing a needed function but not providing substantial business value (see chart above). The application was running on IBM WebSphere Application Server (WAS) 8.0 and was connected to an IBM DB2 database, IBM MQ for service integration and SiteMinder for identity and access management (IAM). The path of least resistance to containerizing the application was to upgrade and customize the application environment to WAS 8.5.5 through vendor available Dockerfiles.

The resulting image could be deployed in different ways, such as provisioning and running Kubernetes on Amazon EC2 instances or running Kubernetes utilizing EKS without managing the control plane or master instances. In this instance the client needed complete control and the better hosting strategy was determined to be a single Kubernetes Pod on AWS EC2.

It’s better to use CI/CD solutions like AWS CodeBuild, CodeDeploy and CodePipeline to first compile and test the application and then build and deploy a new container image. This approach yields the target architecture shown in the next illustration.

##### The application was selectively modernized with a containerize-and-shift approach

 ![](https://www.pwc.com/us/en/tech-effect/content/images/websphere-migration-3.svg) 

A containerize-and-shift modernization and migration approach yields several quick wins.

-   Configure networking centrally via the AWS Console, CLI, or IaC (through CloudFormation), promoting a common configuration interface across the application environment.
-   Running the application in a container ensures consistency between development, test and production environments, increasing the reliability of deployments.
-   Automating the build and deployment via AWS-native CI/CD pipelines allows for faster time-to-market of application changes.
-   A multi-pod environment enables faster lifecycle management (start/stop/restart).
-   Compliance standards are built into on-prem IAM or databases remain in place.
-   Applications in AWS offer greater built-in resilience that more quickly adapts and recovers from downtime compared to on-prem infrastructure.

One drawback to this approach is that the application is unable to leverage the agility that container runtimes can offer due to the organization’s hosting strategy in choosing EC2 and not opting for the EKS or ECS environments. This hosting strategy also can’t take advantage of AWS’ dynamic scaling benefits for the architecture that remains on-premises. It suits cases in which the main objective of AWS migration is to maintain status quo from an architectural standpoint while eliminating some of the reliance upon on-prem infrastructure.

## Approach 2: AWS-native services

Architects aiming to achieve greater elasticity and availability of services can augment containerized applications with AWS-native services. Swapping out discrete on-prem components such as databases and identity providers for AWS-native solutions can provide the benefits of AWS infrastructure while limiting any required code changes to the application’s core components

In our example (see chart below), there are many opportunities for selective modernization to AWS-native services including the message broker, identity provider and container/compute management. Utilizing the AWS Schema Conversion Tool (SCT) and AWS Database Migration Service (DMS), you can migrate the on-premises IBM DB2 to an Amazon Aurora database. Similarly, you could substitute AWS-native Amazon MQ for IBM MQ to handle service integration and message broker services. And you should tap AWS Cognito for identity management of the application. Utilizing AWS-native services EKS and ECR will reduce overhead and increase ease of use and security by allowing AWS to manage the Kubernetes control plane through EKS and ECR. They will reliably distribute, deploy and secure container images and artifacts. Using Fargate as the deployment service for EKS worker nodes provides an additional layer of abstraction from the management of underlying servers for the application.

Introducing the use of AWS-native services removes the overhead of maintaining on-prem servers for legacy applications while simultaneously providing a more available, scalable and secure solution.

##### The application was selectively modernized with AWS-native services enabled

 ![](https://www.pwc.com/us/en/tech-effect/content/images/websphere-migration-4.svg) 

The second approach carries the same benefits of configuration, development and time to market as the first approach, but it adds advantages from adopting AWS-native services. 

-   AWS-native services improve the reliability of the application without the cost of rewriting the cores of monolithic legacy applications.
-   Simplify the overall application ecosystem by plugging selectively-modernized apps into AWS-native solutions. 
-   Increase agility and elasticity of applications designed to scale to match demand.
-   You can abstract and subtract the maintenance of infrastructure by using AWS managed services.

Enabling AWS-native services may require an increase in scoping and application rework during the selective modernization and migration process. IT organizations will have to balance these considerations against the benefits of greater elasticity and reduced technical debt that a selective modernization will bring. Keep in mind that not every application stands to benefit from selective modernization. Legacy applications that require traditional infrastructure to perform operations are less ideal candidates for modernization and may need to be phased out in later modernization cycles. To increase business value, you should first prioritize those applications that are likely to produce the greatest benefit through selective modernization and AWS adoption.

## When to selectively modernize

For most applications that generate less business value and come saddled with deep technical debt, selective modernization presents a trade-off between full modernization and strict lift-and-shift migration to AWS. Selectively modernizing through containerization can greatly extend the life of an application through improved resiliency, reduced overhead from on-prem services and faster time-to-market of application changes due to the use of native CI/CD pipelines. Businesses that search for opportunities to selectively modernize can keep the full application ecosystem healthy while freeing resources to rearchitect apps that drive the greatest business value. The result is a simpler, smoother and potentially less expensive path to AWS.

*PwC strives to provide business and technology leaders with up-to-date, informed and insightful information about AWS solutions. Amazon's highest recognition of AWS expertise is the AWS Partner Ambassador designation. PwC currently has nine AWS Ambassadors globally, including six in the US. Ambassadors enjoy access to AWS Partner Solution Architects for their region, participate in dedicated Ambassador sessions at Amazon AWS events, receive technical briefings, take part in roadmap conversations with AWS service teams and have access to betas.*

***

## Appendix: Links

- [[JS - Obsidian Web Clipper Bookmarklet|Obsidian Web Clipper Bookmarklet]]
- [[3-Resources/Clippings/_README|Clippings]]
