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

| Naming component            | Description                                                                                                                                                                                                                                                                                                                                                  |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Resource type               | An abbreviation that represents the type of Azure resource or asset. This component is often used as a prefix or suffix in the name. For more information, see [Recommended abbreviations for Azure resource types](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations). Examples: `rg`, `vm` |
| Business unit               | Top-level division of your company that owns the subscription or workload the resource belongs to. In smaller organizations, this component might represent a single corporate top-level organizational element. Examples: `fin`, `mktg`, `product`, `it`, `corp`                                                                                            |
| Application or service name | Name of the application, workload, or service that the resource is a part of. Examples: `navigator`, `emissions`, `sharepoint`, `hadoop`                                                                                                                                                                                                                     |
| Subscription type           | Summary description of the purpose of the subscription that contains the resource. Often broken down by deployment environment type or specific workloads. Examples: `prod`, `shared`, `client`                                                                                                                                                              |
| Deployment environment      | The stage of the development lifecycle for the workload that the resource supports. Examples: `prod`, `dev`, `qa`, `stage`, `test`                                                                                                                                                                                                                           |
| Region                      | The Azure region where the resource is deployed. Examples: `westus`, `eastus2`, `westeu`, `usva`, `ustx`                                                                                                                                                                                                                                                     |

| Entity          | Scope                        | Pattern                                                   | Example                   |
| --------------- | ---------------------------- | --------------------------------------------------------- | ------------------------- |
| Subscriptions   | Management Group / Directory | `sub-<division>-<environment>-<numeric padding>`          | `sub-finance-dev-001`     |
| Resource Groups | Subscription                 | `rg-<division | <initiative>-<project>-<service types>-<environment>-<numeric padding>` | `rg-reserving-db-dev-001` |
| Resources                | Resource Group                             |  `<service abbreviation>-<project>-<`                                                         |                           |

**:** 


## Setup Subscriptions

*Source: [Create your initial Azure subscriptions - Cloud Adoption Framework | Microsoft Docs](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/initial-subscriptions)*






*Backlinks:*

```dataview
list from [[Azure Setup Guide]] AND -"Changelog"
```