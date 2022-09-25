---
Date: 2022-08-26
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Clipping"]
Alias: "using dacpac functions to clone sql server databases"
---

# using dacpac functions to clone sql server databases

*Source: [using dacpac functions to clone sql server databases](https://dbatools.io/clone/)*

Hey all! Kirill Kravtsov, here. I’m a SQL Server DBA that is passionate about automation and PowerShell. I’m also a major contributor to dbatools and creator of the [dbops](https://github.com/dataplat/dbops) module, which provides continuous database deployments at any scale.

This week, I wrote an article [on my blog](https://nvarscar.wordpress.com/2018/08/24/using-dacpac-packages-to-clone-sql-server-databases/) and Chrissy asked me to mirror it on dbatools, so here we go.

## Introduction

Many SQL Server DBAs know that there is a very convenient way of delivering a full copy of the database structure to a different SQL Server: it’s called dacpac, or a Data-tier Application package. You can extract the database any time using SQL Server Management Studio context menu: **Tasks** -> **Extract Data-tier Application**, which would guide you through the extraction options and output a compressed package file that would contain all necessary schema definitions, as well as table data. This package can be further on deployed on a completely different server using a **Deploy** **Data-tier Application** context menu item.

What people do not widely know, however, is how much fine-tuning a simple deployment might require, and how difficult it is sometimes to force the deployment operation to behave in a certain way. Good thing is, now we have a convenient way of automating this process using dacpac-related functions from the dbatools module:

-   [Export-DbaDacPackage](https://docs.dbatools.io/Export-DbaDacPackage/)
-   [Publish-DbaDacPackage](https://docs.dbatools.io/Publish-DbaDacPackage/)
-   [New-DbaDacProfile](https://docs.dbatools.io/New-DbaDacProfile/)

This article would explain how to:

-   Extract dacpac from a database
-   Choose whether you want to include data or not
-   Deploy the dacpac package on **any** version of SQL Server higher than 2008 SP2
-   Exclude object types from the deployment process
-   Generate deployment scripts
-   Create a Jenkins job that will take care of this whole process for you

## Extracting dacpac package

Let’s use this simple script to extract dacpac from an existing database:

```powershell
Param (
    $Server,
    $Database,
    $Path,
    \[switch\]$IncludeData
)
# Prepare extraction properties string
$exportProperties = "/p:IgnorePermissions=True /p:IgnoreUserLoginMappings=True" # Ignore permissions definition
if ($IncludeData) {
    $exportProperties += " /p:ExtractAllTableData=True" #Extract data
}
Export-DbaDacPackage -SqlInstance $Server -Database $Database -Path C:\\temp -ExtendedProperties $exportProperties
```

Export properties here are defined to control the extract process:

-   Ignore database permissions, as there is rarely a need to add permissions into the mix
-   Define an option to include data into the package

[Export-DbaDacPackage](https://docs.dbatools.io/Export-DbaDacPackage/) function will take care of the extraction process and will return all details about the extraction, including the .**Path** property that would direct us to the extracted file:

![](https://dbatools.io/wp-content/uploads/2018/08/2018-08-24_15-01-10.jpg?resize=653%2C49&ssl=1)

output from Export-DbaDacPackage

You can check all other available properties (which are basically command line parameters) in a corresponding article: [https://msdn.microsoft.com/en-us/library/hh550080.aspx](https://msdn.microsoft.com/en-us/library/hh550080.aspx)

## Deploying dacpac package

There is one important note about dacpac deployment: it requires a so called Publish Profile for the deployment. Publish profile is an xml file that contains deployment parameters that you want to enable during the deployment. You can create such profile by using one of the following options:

-   Run [New-DbaDacProfile](https://docs.dbatools.io/New-DbaDacProfile/), specifying the connection parameters. The resulting file will enable you to run the deployment, but it is highly recommended that you modify it according to your needs
-   From Visual Studio SSDT project, select **Build** \-> **Publish**. It would open a dialog, that allows you to load, save and modify the Publish profile. Make sure to take a look at the **Advanced** **Publish** **Settings** dialog, as it provides access to dozens of configuration items that you might want to review
-   Manually, using documentation from **Publish parameters** section of the same [article](https://msdn.microsoft.com/en-us/library/hh550080.aspx)

The parameters that we’re going to use during deployment are as follows:

-   **AllowIncompatiblePlatform** – would enable me to deploy to an earlier version of SQL Server.
-   **CreateNewDatabase** – will re-create the database every time
-   **ExcludeObjectTypes** – semicolon-separated list of objects that will be excluded from the deployment.
    
-   **ExcludeLogins** and **ExcludeUsers** – somehow, these two ended up being independent parameters, not included in the previously mentioned **ExcludeObjectTypes**. Excludes logins and/or users from the deployment.
-   **IgnorePermissions** – ignores object permissions during the deployment.
    
-   **DropObjectsNotInSource** – boolean value, which is True by default, that controls whether existing objects in the database are going to be **dropped** if they are not present in the package. This is a very important parameter if you are planning to deploy dacpac to a non-empty database.
    
-   **IgnoreRoleMembership** – ignores role membership
    

This is an example of the Publish profile file that we’re going to use in this exercise:

```xml
<?xml version="1.0" ?>
<Project ToolsVersion="14.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <TargetConnectionString></TargetConnectionString>
    <ProfileVersionNumber>1</ProfileVersionNumber>
    <AllowIncompatiblePlatform>True</AllowIncompatiblePlatform>
    <CreateNewDatabase>False</CreateNewDatabase>
    <ExcludeObjectTypes>Permissions;RoleMembership</ExcludeObjectTypes>
    <ExcludeLogins>True</ExcludeLogins>
    <IgnorePermissions>True</IgnorePermissions>
    <DropObjectsNotInSource>False</DropObjectsNotInSource>
    <IgnoreUserSettingsObjects>True</IgnoreUserSettingsObjects>
    <IgnoreLoginSids>True</IgnoreLoginSids>
    <IgnoreRoleMembership>True</IgnoreRoleMembership>
  </PropertyGroup>
</Project>
```

Once we have a Publish profile ready we can start the deployment by using [Publish-DbaDacPackage](https://docs.dbatools.io/Publish-DbaDacPackage/) function, specifying:

-   **SqlInstance** – target server
-   **Database** – target database
-   **Path** – path to the dacpac package
-   **PublishXml** – path to the publish profile

![Publish-DbaDacPackage in action](https://dbatools.io/wp-content/uploads/2018/08/2018-08-24_15-44-08.jpg?resize=800%2C379&is-pending-load=1#038;ssl=1)

Publish-DbaDacPackage in action

Other parameters of [Publish-DbaDacPackage](https://docs.dbatools.io/Publish-DbaDacPackage/) that you might find useful:

-   **GenerateDeploymentScript** – will generate a deployment script prior to deployment
-   **ScriptOnly** – will not perform the deployment, generating a deployment script instead

## Full script

This script below would extract the dacpac from an existing database and deploy it to a different server using the publish.xml file we created above. Feel free to modify it to your own liking!

```powershell
[Cmdletbinding()]
Param (
    $SourceServer,
    $TargetServer = $SourceServer,
    $SourceDatabaseName,
    $TargetDatabaseName,
    $Path,
    $PublishXml = '.\\publish.xml',
    \[switch\]$IncludeData
)

#Stop on any error by default
$ErrorActionPreference = 'Stop'

# Construct export parameters
$exportProperties = "/p:IgnorePermissions=True /p:IgnoreUserLoginMappings=True"
if ($IncludeData) {
    $exportProperties += " /p:ExtractAllTableData=True"
}

#Export database to path
Write-Verbose "Starting the export from $SourceServer.$SourceDatabaseName to $Path"
$exportFile = Export-DbaDacPackage -SqlInstance $SourceServer -Database $SourceDatabaseName -Path $Path -ExtendedProperties $exportProperties -EnableException
Write-Verbose "Export completed\`: $exportFile"

#publish dacpac with defined publish xml file
Write-Verbose "Starting the publication from $($exportFile.Path) to $TargetServer.$TargetDatabaseName"
$xml = (Get-Item $PublishXml).FullName
Publish-DbaDacPackage -SqlInstance $TargetServer -Database $TargetDatabaseName -PublishXml $xml -Path $exportFile.Path -EnableException

#remove dacpac file
if (Test-Path $exportFile.Path) {
    Write-Verbose "Removing dacpac file $($exportFile.Path)"
    Remove-Item $exportFile.Path
}
```

## Creating a Jenkins job

In order to create an interface and a scheduler at the same time, I would definitely recommend to make this scenario available on your Jenkins instance, similar to how it is described in a SQL Server Jenkins Lab series: [Refresh database & keep permissions – SQL Server Jenkins labs (Part 2)](https://nvarscar.wordpress.com/2018/08/08/jenkins-labs-part-2/).

![](https://dbatools.io/wp-content/uploads/2018/08/2018-08-24_15-55-30.jpg?resize=668%2C502&is-pending-load=1#038;ssl=1)

## Conclusion

Dacpac packages are a convenient way of copying a full database when other methods are unavailable for whatever reason. It has some learning curve associated with it, but it can be a great help when used in an automated manner.

It is also a perfect workaround for database copying, when a source server has a higher SQL Server version than the target server: this will work even between 2017 and 2008, if all the objects are compatible with the target database version.

It also work pretty well as an alternative for a snapshot replication, being much less restrictive in its approach.

\- Kirill  
Twitter: [@nvarscar](https://twitter.com/nvarscar)  
Blog: [nvarscar.wordpress.com](https://nvarscar.wordpress.com/)

***

## Appendix: Links

- [[JS - Obsidian Web Clipper Bookmarklet|Obsidian Web Clipper Bookmarklet]]
- [[3-Resources/Clippings/_README|Clippings]]
