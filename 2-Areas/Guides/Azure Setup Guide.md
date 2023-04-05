# Azure Setup Guide

*Source: [Azure setup guide overview - Cloud Adoption Framework | Microsoft Docs](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-setup-guide/)*

## Organize Planned Resources

![](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-setup-guide/media/organize-resources/scope-levels.png)

1. Management Groups: Manage multiple subscriptions
1. Subscriptions: associate users and resources
1. Resource Groups: hold resources that share permissions and policies
1. Resources: Instances of individual Azure services

---

Organize your cloud-based resources to secure, manage, and track costs related to your workloads. To organize your resources, define a management group hierarchy, consider and follow a naming convention, and apply resource tagging.

* **Management groups** help you manage access, policy, and compliance for multiple subscriptions. All subscriptions in a management group automatically inherit the conditions applied to the management group.

* **Subscriptions** logically associate user accounts with the resources they create. Each subscription has limits or quotas on the amount of resources it can create and use. Organizations can use subscriptions to manage costs and the resources created by users, teams, or projects.

* **Resource groups** are logical containers where you can deploy and manage Azure resources like web apps, databases, and storage accounts.

* **Resources** are instances of services that you can create, like virtual machines, storage, or SQL databases.

### Specify Naming Standards

Example Hierarchy:

|Entity|Scope|Pattern|Example|
|------|-----|-------|-------|
|Subscriptions|Management Group / Directory|`sub-<division>-<environment>-<numeric padding>`|`sub-finance-dev-001`|
|Resource Groups|Subscription|`rg-<initiative>-<project>-<service types>-<environment>-<numeric padding>`|`rg-rezmod-network-dev-001`|
|Resources|Resource Group|`<service abbreviation>-<project>-<numeric padding>`|`webapp-rezmod-test-001`|

#### Taxonomy of Naming Components

|Naming component|Description|
|----------------|-----------|
|Resource type|An abbreviation that represents the type of Azure resource or asset. This component is often used as a prefix or suffix in the name. For more information, see [Recommended abbreviations for Azure resource types](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations). Examples: `rg`, `vm`|
|Business unit|Top-level division of your company that owns the subscription or workload the resource belongs to. In smaller organizations, this component might represent a single corporate top-level organizational element. Examples: `fin`, `mktg`, `product`, `it`, `corp`|
|Application or service name|Name of the application, workload, or service that the resource is a part of. Examples: `navigator`, `emissions`, `sharepoint`, `hadoop`|
|Subscription type|Summary description of the purpose of the subscription that contains the resource. Often broken down by deployment environment type or specific workloads. Examples: `prod`, `shared`, `client`|
|Deployment environment|The stage of the development lifecycle for the workload that the resource supports. Examples: `prod`, `dev`, `qa`, `stage`, `test`|
|Region|The Azure region where the resource is deployed. Examples: `westus`, `eastus2`, `westeu`, `usva`, `ustx`|

#### Resource and Service Abbreviations

*Source: [Recommended abbreviations for Azure resource types - Cloud Adoption Framework | Microsoft Docs](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)*

##### General

|Asset type|Resource provider namespace/Entity|Abbreviation|
|----------|----------------------------------|------------|
|API management service instance|`Microsoft.ApiManagement/service`|`apim-`|
|Managed Identity|`Microsoft.ManagedIdentity/userAssignedIdentities`|`id-`|
|Management group|`Microsoft.Management/managementGroups`|`mg-`|
|Policy definition|`Microsoft.Authorization/policyDefinitions`|`policy-`|
|Resource group|`Microsoft.Resources/resourceGroups`|`rg-`|

##### Networking

|Asset type|Resource provider namespace/Entity|Abbreviation|
|----------|----------------------------------|------------|
|Application gateway|`Microsoft.Network/applicationGateways`|`agw-`|
|Application security group (ASG)|`Microsoft.Network/applicationSecurityGroups`|`asg-`|
|Bastion|`Microsoft.Network/bastionHosts`|`bas-`|
|CDN profile|`Microsoft.Cdn/profiles`|`cdnp-`|
|CDN endpoint|`Microsoft.Cdn/profiles/endpoints`|`cdne-`|
|Connections|`Microsoft.Network/connections`|`con-`|
|DNS|`Microsoft.Network/dnsZones`|`dnsz-`|
|DNS zone|`Microsoft.Network/privateDnsZones`|`pdnsz-`|
|Firewall|`Microsoft.Network/azureFirewalls`|`afw-`|
|Firewall policy|`Microsoft.Network/firewallPolicies`|`afwp-`|
|ExpressRoute circuit|`Microsoft.Network/expressRouteCircuits`|`erc-`|
|Front Door instance|`Microsoft.Network/frontDoors`|`fd-`|
|Front Door firewall policy|`Microsoft.Network/frontdoorWebApplicationFirewallPolicies`|`fdfp-`|
|Load balancer (internal)|`Microsoft.Network/loadBalancers`|`lbi-`|
|Load balancer (external)|`Microsoft.Network/loadBalancers`|`lbe-`|
|Load balancer rule|`Microsoft.Network/loadBalancers/inboundNatRules`|`rule-`|
|Local network gateway|`Microsoft.Network/localNetworkGateways`|`lgw-`|
|NAT gateway|Microsoft.Network/natGateways|`ng`|
|Network interface (NIC)|`Microsoft.Network/networkInterfaces`|`nic-`|
|Network security group (NSG)|`Microsoft.Network/networkSecurityGroups`|`nsg-`|
|Network security group (NSG) security rules|`Microsoft.Network/networkSecurityGroups/securityRules`|`nsgsr-`|
|Network Watcher|`Microsoft.Network/networkWatchers`|`nw-`|
|Private Link|`"Microsoft.Network/privateLinkServices`|`pl-`|
|Public IP address|`Microsoft.Network/publicIPAddresses`|`pip-`|
|Public IP address prefix|`Microsoft.Network/publicIPPrefixes`|`ippre-`|
|Route filter|`Microsoft.Network/routeFilters`|`rf-`|
|Route table|`Microsoft.Network/routeTables`|`rt-`|
|Service endpoint|`Microsoft.serviceEndPointPolicies`|`se-`|
|Traffic Manager profile|`Microsoft.Network/trafficManagerProfiles`|`traf-`|
|User defined route (UDR)|`Microsoft.Network/routeTables/routes`|`udr-`|
|Virtual network|`Microsoft.Network/virtualNetworks`|`vnet-`|
|Virtual network peering|`Microsoft.Network/virtualNetworks/virtualNetworkPeerings`|`peer-`|
|Virtual network subnet|`Microsoft.Network/virtualNetworks/subnets`|`snet-`|
|Virtual WAN|`Microsoft.Network/virtualWans`|`vwan-`|
|VPN Gateway|`Microsoft.Network/vpnGateways`|`vpng-`|
|VPN connection|`Microsoft.Network/vpnGateways/vpnConnections`|`vcn-`|
|VPN site|`Microsoft.Network/vpnGateways/vpnSites`|`vst-`|
|Virtual network gateway|`Microsoft.Network/virtualNetworkGateways`|`vgw-`|
|Web Application Firewall (WAF) policy|`Microsoft.Network/firewallPolicies`|`waf`|
|Web Application Firewall (WAF) policy rule group|`Microsoft.Network/firewallPolicies/ruleGroups`|`wafrg`|

## Setup Subscriptions

*Source: [Create your initial Azure subscriptions - Cloud Adoption Framework | Microsoft Docs](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/initial-subscriptions)*

|Asset type|Resource provider namespace/Entity|Abbreviation|
|----------|----------------------------------|------------|
|Azure Analysis Services server|`Microsoft.AnalysisServices/servers`|`as`|
|Azure Databricks workspace|`Microsoft.Databricks/workspaces`|`dbw-`|
||||
||||

*Backlinks:*

````dataview
list from [[Azure Setup Guide]] AND -"Changelog"
````

\| Asset type | Resource provider namespace/Entity | Abbreviation |

\| --- | --- | --- |

\| Azure Analysis Services server | `Microsoft.AnalysisServices/servers` | `as` |

\| Azure Databricks workspace | `Microsoft.Databricks/workspaces` | `dbw-` |
