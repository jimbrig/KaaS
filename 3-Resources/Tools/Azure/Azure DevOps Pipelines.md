---
Date: 2021-11-16
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool/Cloud/Azure", "#Topic/Dev/CICD"]
Alias: "Azure DevOps Pipelines"
---

# Azure DevOps Pipelines

## Configuration

#Topic/Dev/Cloud/Azure  

Backlink: [[Azure DevOps]]
See also: [[Microsoft Azure]]


## Contents

- [[#Trigger|Trigger]]
- [[#Pool|Pool]]
- [[#Variables|Variables]]
- [[#Steps|Steps]]
- [[#MAKING CHANGES|MAKING CHANGES]]
- [[#SUMMARY|SUMMARY]]


## CONFIG

- `azure-pipelines.yml`:

```yaml
trigger:
	- master
	- main

pool:
	vmImage: 'windows-latest'
	
variables:
	ServerName: 'PLACEHOLDER.database.windows.net'
	DatabaseName: '<name of database>'
	AdminUser: 'PLACEHOLDER'
	AdminPassword: 'PLACEHOLDER'
	
steps:

	- task: PowerShell@2
	  inputs:
	  	targetType: 'inline'
		script: |
			import-module $(Build.SourceDirectory)\Deploy\MigrationRunner\Migration.dll
			Get-MigrationRunner -s $(ServerName) -d $(DatabaseName) -f $(Build.SourcesDirectory)\Sources\Migrations -u $(AdminUser) -p $(AdminPassword)
```

### Trigger

This part indicates that deployment should start automatically if there are changes in the **master** or **main** branch.

### Pool

*windows-latest*:

The deployment agent should use the latest available virtual machine image with the Windows operating system to download source files and execute deployment steps.

### Variables

A list of variables that will be used later in the script:

-   **ServerName** - a SQL Server name where the database should be created/updated
-   **DatabaseName** - a SQL database name to be created or updated
-   **AdminUser** - a username for SQL Server to perform changes to the database
-   **AdminPassword** - a password for SQL Server user

Note that the credentials could be stored securely using encrypted secrets using pipeline variables.

### Steps

There is a single step that executes inline Powershell script (as described in the [Migration runner documentation](https://dbversioncontrol.com/pages/migration-runner)):

-   first, import the module from the Migrations.dll
-   next, execute Get-MigrationRunner with parameters 

Do not forget to save **azure-pipelines.yml** and commit it to the repository.

That's it - the deployment script has been set up. To verify that everything works as expected, we can manually execute the pipeline by clicking the **Run pipeline** button.

## MAKING CHANGES

Once the deployment was set up, the database development process could be as simple as:

-   making changes to the AdventureWorks database
-   applying changes using the DB Version Control
-   committing and pushing the scripted files
-   the deployment will start automatically and will deploy changes to the AdventureWorksAzureDeploy database

## SUMMARY

In this tutorial, we showed that Azure SQL databases can be version controlled using DB Version Control in a similar way as on-premises databases. Also, [[Azure DevOps]] (pipelines) can be used to deploy changes automatically to the [[Azure SQL Databases]].

*Backlinks:*

```dataview
list from [[Azure DevOps Pipelines]] AND -"Changelog"
```