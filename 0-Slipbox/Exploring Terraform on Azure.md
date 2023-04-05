# Exploring Terraform on Azure

## Authenticate Terraform with Azure

Terraform supports several different methods for authenticating to Azure. You can use:

* The Azure CLI
* A Managed Service Identity (MSI)
* A service principal and a client certificate
* A service principal and a client secret

When running Terraform as part of a continuous integration pipeline, you can use either an Azure service principal or MSI to authenticate.

To configure Terraform to use your Azure Active Directory (Azure AD) service principal, set the following environment variables:

* ARM_SUBSCRIPTION_ID
* ARM_CLIENT_ID
* ARM_CLIENT_SECRET
* ARM_TENANT_ID
* ARM_ENVIRONMENT

The Azure Terraform modules then use these variables. You can also set the environment if you work with an Azure cloud other than an Azure public cloud.

Use the following sample shell script to set these variables:

````bash
#!/bin/sh
echo "Setting environment variables for Terraform"
export ARM_SUBSCRIPTION_ID=your_subscription_id
export ARM_CLIENT_ID=your_appId
export ARM_CLIENT_SECRET=your_password
export ARM_TENANT_ID=your_tenant_id

# Not needed for public, required for usgovernment, german, china
export ARM_ENVIRONMENT=public
````

## Sample Terraform .tf File

Take a moment to skim through the following example of a terraform **.tf** file. Try to identify the different elements within the file. The file does the following actions on Azure:

* Authenticates.
* Creates a resource group.
* Creates a virtual network.
* Creates a subnet.
* Creates a public IP address.
* Creates a network security group and rule.
* Creates a virtual network interface card.
* Generates random text for use as a unique storage account name.
* Creates a storage account for diagnostics.
* Creates a virtual machine.

````hcl
# Configure the Microsoft Azure Provider
provider "azurerm" {
    subscription_id = "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    client_id      = "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    client_secret  = "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    tenant_id      = "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

# Create a resource group if it does not exist
resource "azurerm_resource_group" "myterraformgroup" {
    name    = "myResourceGroup"
    location = "eastus"

    tags {
        environment = "Terraform Demo"
    }
}

# Create virtual network
resource "azurerm_virtual_network" "myterraformnetwork" {
    name                = "myVnet"
    address_space      = ["10.0.0.0/16"]
    location            = "eastus"
    resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"

    tags {
        environment = "Terraform Demo"
    }
}

# Create subnet
resource "azurerm_subnet" "myterraformsubnet" {
    name                = "mySubnet"
    resource_group_name  = "${azurerm_resource_group.myterraformgroup.name}"
    virtual_network_name = "${azurerm_virtual_network.myterraformnetwork.name}"
    address_prefix      = "10.0.1.0/24"
}

# Create public IPs
resource "azurerm_public_ip" "myterraformpublicip" {
    name                        = "myPublicIP"
    location                    = "eastus"
    resource_group_name          = "${azurerm_resource_group.myterraformgroup.name}"
    public_ip_address_allocation = "dynamic"

    tags {
        environment = "Terraform Demo"
    }
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "myterraformnsg" {
    name                = "myNetworkSecurityGroup"
    location            = "eastus"
    resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"

    security_rule {
        name                      = "SSH"
        priority                  = 1001
        direction                  = "Inbound"
        access                    = "Allow"
        protocol                  = "Tcp"
        source_port_range          = "*"
        destination_port_range    = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags {
        environment = "Terraform Demo"
    }
}

# Create network interface
resource "azurerm_network_interface" "myterraformnic" {
    name                      = "myNIC"
    location                  = "eastus"
    resource_group_name      = "${azurerm_resource_group.myterraformgroup.name}"
    network_security_group_id = "${azurerm_network_security_group.myterraformnsg.id}"

    ip_configuration {
        name                          = "myNicConfiguration"
        subnet_id                    = "${azurerm_subnet.myterraformsubnet.id}"
        private_ip_address_allocation = "dynamic"
        public_ip_address_id          = "${azurerm_public_ip.myterraformpublicip.id}"
    }

    tags {
        environment = "Terraform Demo"
    }
}

# Generate random text for a unique storage account name
resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = "${azurerm_resource_group.myterraformgroup.name}"
    }

    byte_length = 8
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "mystorageaccount" {
    name                        = "diag${random_id.randomId.hex}"
    resource_group_name        = "${azurerm_resource_group.myterraformgroup.name}"
    location                    = "eastus"
    account_tier                = "Standard"
    account_replication_type    = "LRS"

    tags {
        environment = "Terraform Demo"
    }
}

# Create virtual machine
resource "azurerm_virtual_machine" "myterraformvm" {
    name                  = "myVM"
    location              = "eastus"
    resource_group_name  = "${azurerm_resource_group.myterraformgroup.name}"
    network_interface_ids = ["${azurerm_network_interface.myterraformnic.id}"]
    vm_size              = "Standard_DS1_v2"

    storage_os_disk {
        name              = "myOsDisk"
        caching          = "ReadWrite"
        create_option    = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer    = "UbuntuServer"
        sku      = "16.04.0-LTS"
        version  = "latest"
    }

    os_profile {
        computer_name  = "myvm"
        admin_username = "azureuser"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path    = "/home/azureuser/.ssh/authorized_keys"
            key_data = "ssh-rsa AAAAB3Nz{snip}hwhqT9h"
        }
    }

    boot_diagnostics {
        enabled = "true"
        storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
    }

    tags {
        environment = "Terraform Demo"
    }
}
````

---

## Appendix: Links

* *Azure*
* [Terraform](../3-Resources/Tools/Developer%20Tools/Infrastructure/Terraform.md)
* [Azure CLI](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/Azure/Azure%20CLI.md)
* [Terraform and VSCode](Terraform%20and%20VSCode.md)

*Backlinks:*

````dataview
list from [[Exploring Terraform on Azure]] AND -"Changelog"
````
