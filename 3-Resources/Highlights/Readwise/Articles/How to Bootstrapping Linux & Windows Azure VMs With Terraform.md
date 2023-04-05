# How to Bootstrapping Linux & Windows Azure VMs With Terraform

## Metadata

* Author: *Guillermo Musumeci*
* Full Title: How to Bootstrapping Linux & Windows Azure VMs With Terraform
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/c8fdaa457836

## Highlights

* We can use Packer to create an image and deploy software inside the image (this option it is particularly useful when the bootstrapping process takes lots of time or the VMs are part of an autoscaling group)
* We can use remote-exec provisioner to remotely execute a script or commands in Terraform (only useful if we can connect to the machine)
* We can use Custom Data and Cloud-Init to load a Bash script in Linux and the Azure Virtual Machine Extension load a PowerShell script in Windows at the boot time
* We can use a Template_File to load and update a bootstrapping script and execute it with a PowerShell command (only Windows).
* Create a file called app-variables.tf. We will use this Terraform file for variables shared between all modules, such as application name and environment. Add the following content to the file:
