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

## PowerShell Functions

First, one must understand the concept of PowerShell functions before attempting to create and bundle a PowerShell Module.

A Function, which is what a module is comprised of, can be best described as *a block of code that will run a specific task*. They're especially useful for running repetitive blocks of code without having to necessarily write the same code multiple times.

Furthermore, Functions are not specific to Powershell so we can think of it as something universal to any programming language. It is one of the most basic fundamental concepts you learn when getting into the programming world.

*See Also: [Powershell Template For Creating The Perfect Function (thesysadminchannel.com)](https://thesysadminchannel.com/powershell-template/)*

## Importing PowerShell Functions

To import a function (or any Powershell source file) into the current session you utilize what is called *dot sourcing*:

```powershell
# import the function from file: test.ps1
. .\test.ps1

# run the function
test
```

*Note: Be weary of Relative vs Absolute Paths when dot-sourcing *


## Notes Regarding PowerShell Versions

- Note the difference between [[Windows PowerShell]] and [[PowerShell Core]]
	- [[Windows PowerShell]] is written for the [[DotNet Framework|.NET Framework]] while [[PowerShell Core]] is written for [[DotNet Core|.NET Core]].

- Portable PowerShell Modules are modules that work in both [[Windows PowerShell]] and [[PowerShell Core]]

- One can install/utilize the PowerShell Standard Module Template via [.NET CLI](https://docs.microsoft.com/en-us/dotnet/core/tools/?tabs=netcore2x):

```powershell
dotnet new -i Microsoft.PowerShell.Standard.Module.Template
```

Output:

```powershell
Restoring packages for C:\Users\Steve\.templateengine\dotnetcli\v2.1.302\scratch\restore.csproj...
  Installing Microsoft.PowerShell.Standard.Module.Template 0.1.3.
  Generating MSBuild file C:\Users\Steve\.templateengine\dotnetcli\v2.1.302\scratch\obj\restore.csproj.nuget.g.props.
  Generating MSBuild file C:\Users\Steve\.templateengine\dotnetcli\v2.1.302\scratch\obj\restore.csproj.nuget.g.targets.
  Restore completed in 1.66 sec for C:\Users\Steve\.templateengine\dotnetcli\v2.1.302\scratch\restore.csproj.

Usage: new [options]

Options:
  -h, --help          Displays help for this command.
  -l, --list          Lists templates containing the specified name. If no name is specified, lists all templates.
  -n, --name          The name for the output being created. If no name is specified, the name of the current directory is used.
  -o, --output        Location to place the generated output.
  -i, --install       Installs a source or a template pack.
  -u, --uninstall     Uninstalls a source or a template pack.
  --nuget-source      Specifies a NuGet source to use during install.
  --type              Filters templates based on available types. Predefined values are "project", "item" or "other".
  --force             Forces content to be generated even if it would change existing files.
  -lang, --language   Filters templates based on language and specifies the language of the template to create.


Templates                        Short Name         Language          Tags
-----------------------------------------------------------------------------------------------
Console Application              console            [C#], F#, VB      Common/Console
Class library                    classlib           [C#], F#, VB      Common/Library
PowerShell Standard Module       psmodule           [C#]              Library/PowerShell/Module
...
```




***

#### Related

- [[Development]]
- [[PowerShell]]

*Backlinks:*

```dataview
list from [[Developing PowerShell Modules and Functions]] AND -"Changelog"
```