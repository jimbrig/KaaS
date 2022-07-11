---
Date: 2022-06-07
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool"]
Alias: ["Terraform"]
---

# Terraform

**HashiCorp Terraform** is an open-source tool that allows you to provision, manage, and version cloud infrastructure. It codifies infrastructure in configuration files that describes the topology of cloud resources such as VMs, storage accounts, and networking interfaces.

![Terraform icon](https://docs.microsoft.com/en-us/learn/wwl-azure/implement-terraform/media/terraform-icon-30fbaf58.png)

Terraform's command-line interface (CLI) provides a simple mechanism to deploy and version the configuration files to Azure or any other supported cloud service.

The CLI also allows you to validate and preview infrastructure changes before you deploy them.

Terraform also supports multi-cloud scenarios. It means developers can use the same tools and configuration files to manage infrastructure on multiple cloud providers.

You can run Terraform interactively from the CLI with individual commands. Or non-interactively as part of a continuous integration pipeline.

There's also an enterprise version of Terraform available, **Terraform Enterprise**.

You can view more details about Terraform on the [HashiCorp Terraform](https://www.terraform.io/) website.

## Terraform Components

Some of Terraform's core components include:

-   Configuration files. Text-based configuration files allow you to define infrastructure and application configuration. These files end in the .tf or .tf.JSON extension. The files can be in either of the following two formats:
    
    -   Terraform. The Terraform format is more accessible for users to review, in that way making it more user-friendly. It supports comments and is the recommended format for most Terraform files. Terraform files end in .tf
    -   JSON. Machines mainly use the JSON format for creating, modifying, and updating configurations. However, it can also be used by Terraform operators if you prefer. JSON files end in .tf.JSON.
    
    The order of items (variables and resources) defined within the configuration file doesn't matter because Terraform configurations are declarative.
    
-   Terraform CLI. It's a command-line interface from which you run configurations. You can command such as **Terraform apply** and **Terraform plan**, along with many others. A CLI configuration file that configures per-user settings for the CLI is also available. However, this is separate from the CLI infrastructure configuration. In Windows operating system environments, the configuration file is named **terraform.rc** and is stored in the relevant user's %APPDATA% directory. On Linux systems, the file is named **.terraformrc** (note the leading period) and is stored in the home directory of the relevant user.
    
-   Modules. **Modules** are self-contained packages of Terraform configurations that are managed as a group. You use modules to create reusable components in Terraform and for basic code organization. A list of available modules for Azure is available on the [Terraform Registry Modules](https://registry.terraform.io/) webpage.
    
-   Provider. The provider is responsible for understanding API interactions and exposing resources.
    
-   Overrides. Overrides are a way to create configuration files that are loaded last and merged into (rather than appended to) your configuration. You can create overrides to modify Terraform behavior without having to edit the Terraform configuration. They can also be used as temporary modifications that you can make to Terraform configurations without changing the configuration itself.
    
-   Resources. **Resources** are sections of a configuration file that define components of your infrastructure, such as VMs, network resources, containers, dependencies, or DNS records. The resource block creates a resource of the given _TYPE_ (first parameter) and _NAME_ (second parameter). However, the combination of the type and name must be unique. The resource's configuration is then defined and contained within braces.
    
-   Execution plan. You can issue a command in the Terraform CLI to generate an execution plan. The _execution plan_ shows what Terraform will do when a configuration is applied. It enables you to verify changes and potential flag issues. The command for the execution plan is **Terraform plan**.
    
-   Resource graph. Using a resource graph, you can build a dependency graph of all resources. You can then create and modify resources in parallel. It helps provision and configures resources more efficiently.

***

## Appendix: Links

- [[Tools]]
- [[Infrastructure as Code]]
- [[3-Resources/Highlights/Readwise 1/Podcasts/Infrastructure as Code with Christian Tragesser]]
- [[Azure Terraform Bootstrap Walkthrough]]
- [[Exploring Terraform on Azure]]

*Backlinks:*

```dataview
list from [[Terraform]] AND -"Changelog"
```