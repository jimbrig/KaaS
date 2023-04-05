# GCP Service Accounts

````bash

gcloud services enable [SERVICE]

````

## Compute Instance Permissions

1. `Navigation Menu > Compute Engine > VM Instances` then click `Create`
1. Notice `Identity and API Access` section
1. Select Service Account
1. Select Access Scope - will not be visible if a custom Service Account is chosen

## Create Service Account - Best Practice

* Navigation Menu > IAM & Admin > Service Accounts > Create Service Account
* Enter details for `Name` and `Description`
* Grant `Roles`

# GCP Service Accounts

* Grant yourself permission to use the service account
