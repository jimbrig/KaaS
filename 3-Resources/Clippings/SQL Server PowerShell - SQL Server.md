---
Date: 2022-08-26
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Clipping"]
Alias: "SQL Server PowerShell - SQL Server"
---

# SQL Server PowerShell - SQL Server

*Source: [SQL Server PowerShell - SQL Server](https://docs.microsoft.com/en-us/sql/powershell/sql-server-powershell?view=sql-server-ver16&ns-enrollment-id=peyph4gpmzd0yn&viewFallbackFrom=sql-server-ver16%3Fns-enrollment-type%3DCollection)*

There are two SQL Server PowerShell modules; **[SqlServer](https://docs.microsoft.com/en-us/powershell/module/sqlserver)** and **[SQLPS](https://docs.microsoft.com/en-us/powershell/module/sqlps)**.

The **SqlServer** module is the current PowerShell module to use.

The **SqlServer** module contains updated versions of the cmdlets in **SQLPS** and includes new cmdlets to support the latest SQL features.

Previous versions of the **SqlServer** module _were_ included with [SQL Server Management Studio (SSMS)](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16), but only with the 16.x versions of SSMS.

To use PowerShell with SSMS 17.0 and later, install the **SqlServer** module from the [PowerShell Gallery](https://www.powershellgallery.com/packages/SqlServer).

You can also use [PowerShell with Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/extensions/powershell-extension?view=sql-server-ver16).

**Why did the module change from SQLPS to SqlServer?**

To ship SQL PowerShell updates, we had to change the identity of the SQL PowerShell module, and the wrapper known as _SQLPS.exe_. Because of this change, there are now two SQL PowerShell modules, the **SqlServer** module, and the **SQLPS** module.

**Update your PowerShell scripts if you import the SQLPS module.**

If you have any PowerShell scripts that run `Import-Module -Name SQLPS`, and you want to take advantage of the new provider functionality and new cmdlets, you must change them to `Import-Module -Name SqlServer`. The new module is installed to `%ProgramFiles%\WindowsPowerShell\Modules\SqlServer` folder. As such, you don't have to update the $env:PSModulePath variable. If you have scripts that use a third-party or community version of a module named **SqlServer**, use the Prefix parameter to avoid name collisions.

It is recommended to start your script with _Import-Module SQLServer_ to avoid side-by-side issues if the SQLPS module is installed on the same machine.

This section applies to scripts executed from PowerShell and not the SQL Agent. The new module can be used with SQL Agent job steps using [NOSQLPS](https://docs.microsoft.com/en-us/sql/powershell/sql-server-powershell?view=sql-server-ver16&ns-enrollment-id=peyph4gpmzd0yn&viewFallbackFrom=sql-server-ver16%3Fns-enrollment-type%3DCollection#sql-server-agent).

## Cmdlet reference

-   [SqlServer cmdlets](https://docs.microsoft.com/en-us/powershell/module/sqlserver)
-   [SQLPS cmdlets](https://docs.microsoft.com/en-us/powershell/module/sqlps)

***

## Appendix: Links

- [[JavaScript - Obsidian Web Clipper Bookmarklet|Obsidian Web Clipper Bookmarklet]]
- [[3-Resources/Clippings/_README|Clippings]]
