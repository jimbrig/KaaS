---
Date: 2021-12-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev"]
Alias: "Azure Setup Guide"
---

# Azure Setup Guide

*Source: [Azure setup guide overview - Cloud Adoption Framework | Microsoft Docs](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-setup-guide/)*


## Organize Planned Resources

![](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-setup-guide/media/organize-resources/scope-levels.png)


1. Management Groups: Manage multiple subscriptions
2. Subscriptions: associate users and resources
3. Resource Groups: hold resources that share permissions and policies
4. Resources: Instances of individual Azure services

***

Organize your cloud-based resources to secure, manage, and track costs related to your workloads. To organize your resources, define a management group hierarchy, consider and follow a naming convention, and apply resource tagging.

-   **Management groups** help you manage access, policy, and compliance for multiple subscriptions. All subscriptions in a management group automatically inherit the conditions applied to the management group.
    
-   **Subscriptions** logically associate user accounts with the resources they create. Each subscription has limits or quotas on the amount of resources it can create and use. Organizations can use subscriptions to manage costs and the resources created by users, teams, or projects.
    
-   **Resource groups** are logical containers where you can deploy and manage Azure resources like web apps, databases, and storage accounts.
    
-   **Resources** are instances of services that you can create, like virtual machines, storage, or SQL databases.


### Specify Naming Standards

#### Taxonomy of Naming Components



| Entity | Scope | Pattern | Example |
| ------ | ----- | ------- | ------- |
| Resource Groups       | Subscription      | `<service abbreviation>-<environment>-rg`        | ``        |

**:** 


## Setup Subscriptions

*Source: [Create your initial Azure subscriptions - Cloud Adoption Framework | Microsoft Docs](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/initial-subscriptions)*






*Backlinks:*

```dataview
list from [[Azure Setup Guide]] AND -"Changelog"
```