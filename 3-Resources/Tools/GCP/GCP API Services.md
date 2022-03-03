# GCP Service Accounts

```bash

gcloud services enable [SERVICE]

```

## Compute Instance Permissions

1. `Navigation Menu > Compute Engine > VM Instances` then click `Create`
2. Notice `Identity and API Access` section
3. Select Service Account
4. Select Access Scope - will not be visible if a custom Service Account is chosen

## Create Service Account - Best Practice

- Navigation Menu > IAM & Admin > Service Accounts > Create Service Account
- Enter details for `Name` and `Description`
- Grant `Roles`
- Grant yourself permission to use the service account