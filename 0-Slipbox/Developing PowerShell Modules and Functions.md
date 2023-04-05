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

````powershell
# import the function from file: test.ps1
. .\test.ps1

# run the function
test
````

*Note: Be weary of Relative vs Absolute Paths when dot-sourcing functions into the session.*

Once the function is dot sourced (loaded into memory) you can now call the function with the intended parameters.

## PowerShell Modules

Microsoft describes a module as a package that contains Powershell members, such as cmdlets, providers, functions, workflows, variables, and aliases. The members of this package can be implemented in a PowerShell script, a compiled DLL, or a combination of both. These files are usually grouped together in a single directory.

In simple terms, it's a way to group existing code into a consolidated format for easier use.

## Creating PowerShell Modules

Creating a PowerShell module can be very simple, one simply needs to convert their `.ps1` file into a `.psm1` module file by changing its extension.

However, proper modules should do more than simply define functions, they should:

* Declare and document function parameters and parameter types
* Bind `cmdlet`s to functions
* Declare and dependencies or required versions in a module manifest file

## Notes Regarding PowerShell Versions

* Note the difference between [Windows PowerShell](../3-Resources/Tools/Developer%20Tools/Languages/PowerShell/Windows%20PowerShell.md) and [PowerShell Core](../3-Resources/Tools/Developer%20Tools/Languages/PowerShell/PowerShell%20Core.md)
  
  * [Windows PowerShell](../3-Resources/Tools/Developer%20Tools/Languages/PowerShell/Windows%20PowerShell.md) is written for the *.NET Framework* while [PowerShell Core](../3-Resources/Tools/Developer%20Tools/Languages/PowerShell/PowerShell%20Core.md) is written for *.NET Core*.
* Portable PowerShell Modules are modules that work in both [Windows PowerShell](../3-Resources/Tools/Developer%20Tools/Languages/PowerShell/Windows%20PowerShell.md) and [PowerShell Core](../3-Resources/Tools/Developer%20Tools/Languages/PowerShell/PowerShell%20Core.md)

* One can install/utilize the PowerShell Standard Module Template via [.NET CLI](https://docs.microsoft.com/en-us/dotnet/core/tools/?tabs=netcore2x):

````powershell
dotnet new -i Microsoft.PowerShell.Standard.Module.Template
````

Output:

````powershell
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
````

---

#### Related

* [Development](../2-Areas/MOCs/Development.md)
* [2-Areas/MOCs/PowerShell](../2-Areas/MOCs/PowerShell.md)

*Backlinks:*

````dataview
list from [[Developing PowerShell Modules and Functions]] AND -"Changelog"
````
