**Prerequisites**

* Install Terraform [https://www.terraform.io/downloads](https://www.terraform.io/downloads)
* Install Azure Terrafy [https://github.com/Azure/aztfy](https://github.com/Azure/aztfy)
* PowerShell 7 [https://github.com/PowerShell/PowerShell](https://github.com/PowerShell/PowerShell)
* Azure CLI [https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-powershell](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-powershell)
* VSCode [https://code.visualstudio.com/](https://code.visualstudio.com/)
* Windows Terminal [https://github.com/microsoft/terminal](https://github.com/microsoft/terminal)

1. Install and download prerequisites
1. Configure VS Code (Extensions)
1. Configure Terraform \ Azure Terrafy (Extract Terraform executable to "c:\terraform", extract Azure Terrafy to "c:\aztfy")
   * To add the Terraform\ Azure Terrafy executable directory's to your PATH variable:
     
     * Click on the Start menu and search for Settings. Open the Settings app.
     * Select the System icon, then on the left menu, select the About tab. Under Related settings on the right, select Advanced system settings.
     * On the System Properties window, select Environment Variables.
     * Select the PATH variable, then click Edit.
     * Click the New button, then type in the path where the Terraform & Terrafy executable is located.

* Documentation: [https://code.visualstudio.com/docs/setup/windows](https://code.visualstudio.com/docs/setup/windows)

## Authenticate to Azure

We need to authenticate to Azure in order for Terrafy to read our target subscriptions \ resource groups.

### Azure Subscription Configuration:

#### Azure CLI

````powershell
az login
set azure subscription reference az account set --subscription "<subscription_name/id>"
````

#### Azure PowerShell

````powershell
Connect-AzAccount
Set-AzContext -Subscription "<Subscription String>"
````

## Azure Terrafy

Create a new directory and use the tool to generate the supporting [Terraform](../3-Resources/Tools/Developer%20Tools/Infrastructure/Terraform.md) code to recreate all of those resources: example:

````powershell
mkdir temp
cd temp 
````

### Terraform Demo Plan Config Example:

See below an example terraform state list that was outputted from the demo terraform configuration files included in this repo. We will use the below state list to verify our imported Azure configuration into Terraform state using *Azure Terrafy*.

* Run `terraform state list` in your working directory after a successful `terraform apply` to your Azure environment.
  * This will output a similar resource list below for cross-reference.

````powershell
azurerm_network_interface.res-7
azurerm_network_security_group.res-0
azurerm_network_security_rule.res-4
azurerm_network_security_rule.res-5
azurerm_public_ip.res-1
azurerm_resource_group.res-8
azurerm_subnet.res-6
azurerm_virtual_network.res-2
````

### Run Azure Terrafy

In our working directory run the following command:

````powershell
aztfy "your Azure external resource group name"
````

[![](https://github.com/andreipintica/azure-terrafy-handsonlab/raw/master/assets/img/image1.png "Terrafy Initialize Screenshot")](https://github.com/andreipintica/azure-terrafy-handsonlab/blob/master/assets/img/image1.png)

### Accept the defaults, in this example which included all of the resources.

[![](https://github.com/andreipintica/azure-terrafy-handsonlab/raw/master/assets/img/image2.png "Terrafy Import List Screenshot")](https://github.com/andreipintica/azure-terrafy-handsonlab/blob/master/assets/img/image2.png)

### The import process will begin as depicted here:

[![](https://github.com/andreipintica/azure-terrafy-handsonlab/raw/master/assets/img/image3.png "Terrafy Import Screenshot")](https://github.com/andreipintica/azure-terrafy-handsonlab/blob/master/assets/img/image3.png)

### Once the process is complete you will be greeted with a similar message's below:

[![](https://github.com/andreipintica/azure-terrafy-handsonlab/raw/master/assets/img/image4.png "Terrafy End Of Process Screenshot")](https://github.com/andreipintica/azure-terrafy-handsonlab/blob/master/assets/img/image4.png)

````
Azure Terrafy
 Terraform state and the config are generated at: C:\Temp\
````

### Imported Terraform working directory configuration:

````
Directory: C:\Temp

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d----            5/5/2022  8:51 AM                .terraform
-a---            5/5/2022  8:56 AM           1565 .aztfyResourceMapping.json
-a---            5/5/2022  8:51 AM           1183 .terraform.lock.hcl
-a---            5/5/2022  8:56 AM           3353 main.tf
-a---            5/5/2022  8:51 AM            181 provider.tf
-a---            5/5/2022  8:56 AM          14764 terraform.tfstate
-a---            5/5/2022  8:56 AM          13839 terraform.tfstate.backup
````

### The provider.tf file contains the Terraform block and provider block:

````
terraform {
  backend "local" {}
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.3.0"
    }
  }
}

provider "azurerm" {
  features {}
}
````

### The main.tf file contains definitions for 7 different resources which make up the demo VM deployment:

````hcl
resource "azurerm_network_security_rule" "res-5" {
  access                      = "Allow"
  description                 = "ASC JIT Network Access rule created by an initiation request for policy 'default' of VM 'WIN'."
  destination_address_prefix  = "10.0.0.4"
  destination_port_range      = "3389"
  direction                   = "Inbound"
  name                        = "SecurityCenter-JITRule-1170687618-8C18BF8921F041989344B4F1E3A0C370"
  network_security_group_name = "WIN-nsg"
  priority                    = 100
  protocol                    = "*"
  resource_group_name         = "terraformtesting"
  source_address_prefix       = "xx.xx.xx.xxx"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.res-0,
  ]
}
resource "azurerm_subnet" "res-6" {
  address_prefixes     = ["10.0.0.0/24"]
  name                 = "default"
  resource_group_name  = "terraformtesting"
  virtual_network_name = "terraformtesting-vnet"
  depends_on = [
    azurerm_virtual_network.res-2,
  ]
}
resource "azurerm_network_interface" "res-7" {
  location            = "westeurope"
  name                = "win548"
  resource_group_name = "terraformtesting"
  ip_configuration {
    name                          = "ipconfig1"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxxxxxxxx/resourceGroups/terraformtesting/providers/Microsoft.Network/publicIPAddresses/WIN-ip"
    subnet_id                     = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxxxxxxxx/resourceGroups/terraformtesting/providers/Microsoft.Network/virtualNetworks/terraformtesting-vnet/subnets/default"
  }
  depends_on = [
    azurerm_public_ip.res-1,
    azurerm_subnet.res-6,
    azurerm_network_security_group.res-0,
  ]
}
resource "azurerm_resource_group" "res-8" {
  location = "westeurope"
  name     = "terraformtesting"
}
resource "azurerm_network_security_group" "res-0" {
  location            = "westeurope"
  name                = "WIN-nsg"
  resource_group_name = "terraformtesting"
  depends_on = [
    azurerm_resource_group.res-8,
  ]
}
resource "azurerm_public_ip" "res-1" {
  allocation_method   = "Dynamic"
  location            = "westeurope"
  name                = "WIN-ip"
  resource_group_name = "terraformtesting"
  depends_on = [
    azurerm_resource_group.res-8,
  ]
}
resource "azurerm_virtual_network" "res-2" {
  address_space       = ["10.0.0.0/16"]
  location            = "westeurope"
  name                = "terraformtesting-vnet"
  resource_group_name = "terraformtesting"
  depends_on = [
    azurerm_resource_group.res-8,
  ]
}
resource "azurerm_network_security_rule" "res-4" {
  access                      = "Deny"
  description                 = "ASC JIT Network Access rule for policy 'default' of VM 'WIN'."
  destination_address_prefix  = "10.0.0.4"
  destination_port_range      = "3389"
  direction                   = "Inbound"
  name                        = "SecurityCenter-JITRule_1170687618_62799A5740DE464DB71C4F619369BBAD"
  network_security_group_name = "WIN-nsg"
  priority                    = 4096
  protocol                    = "*"
  resource_group_name         = "terraformtesting"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.res-0,
  ]
}
````

### Terraform plan seal test:

lets run a terraform plan on our recently imported terraform configuration (terraformtesting) to verify the import was a success, hopefully you will be greeted by the below message. Don't forget to run terraform init and terraform plan against imported resource group working directory.

````
No changes. Your infrastructure matches the configuration.
````

Thanks for taking time to read this Azure Terrafy guide for Windows.

## Mandatory cleanup

If you do not plan to continue to use the resources created in these labs, please clean up by deleting the resources created.

By cleaning up you also save your money.
