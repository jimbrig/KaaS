---
Date: 2021-12-30
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev/PowerShell"]
Alias: "Developing PowerShell Modules and Functions"
---

# Developing PowerShell Modules and Functions

*Sources: 
	- [Writing Portable Modules - PowerShell | Microsoft Docs](https://docs.microsoft.com/en-us/powershell/scripting/dev-cross-plat/writing-portable-modules?view=powershell-7.2)
	- [Powershell Module: A Best Practice Guide - the Sysadmin Channel](https://thesysadminchannel.com/powershell-module/)*
	
## Notes Regarding PowerShell Versions

- Note the difference between [[Windows PowerShell]] and [[PowerShell Core]]
	- [[Windows PowerShell]] is written for the [[DotNet Framework|.NET Framework]] while [[PowerShell Core]] is written for [[DotNet Core|.NET Core]].

- Portable PowerShell Modules are modules that work in both [[Windows PowerShell]] and [[PowerShell Core]]

- One can install/utilize the PowerShell Standard Module Template via [[DotNet CLI|.NET CLI]] ([.NET CLI Download Link]()):

```powershell
dotnet new -i Microsoft.PowerShell.Standard.Module.Template
```




***

#### Related

- [[Development]]
- [[PowerShell]]

*Backlinks:*

```dataview
list from [[Developing PowerShell Modules and Functions]] AND -"Changelog"
```