# Powershell - Scripting - Tutorialspoint

## Metadata

* Author: *tutorialspoint.com*
* Full Title: Powershell - Scripting - Tutorialspoint
* Category: #Type/Highlight/Article
* URL: https://www.tutorialspoint.com/powershell/powershell_scripting.htm

## Highlights

* Windows PowerShell is a command-line shell and scripting language designed especially for system administration. Its analogue in Linux is called as Bash Scripting. Built on the .NET Framework, Windows PowerShell helps IT professionals to control and automate the administration of the Windows operating system and applications that run on Windows Server environment.
* Windows PowerShell commands, called cmdlets, let you manage the computers from the command line. Windows PowerShell providers let you access data stores, such as the Registry and Certificate Store, as easily as you access the file system.
* In addition, Windows PowerShell has a rich expression parser and a fully developed scripting language. So in simple words you can complete all the tasks that you do with GUI and much more. Windows PowerShell Scripting is a fully developed scripting language and has a rich expression parser
* Features
* Cmdlets − Cmdlets perform common system administration tasks, for example managing the registry, services, processes, event logs, and using Windows Management Instrumentation (WMI).
* Task oriented − PowerShell scripting language is task based and provide supports for existing scripts and command-line tools.
* Consistent design − As cmdlets and system data stores use common syntax and have common naming conventions, data sharing is easy. The output from one cmdlet can be pipelined to another cmdlet without any manipulation.
* Simple to Use − Simplified, command-based navigation lets users navigate the registry and other data stores similar to the file system navigation.
* Object based − PowerShell possesses powerful object manipulation capabilities. Objects can be sent to other tools or databases directly.
* Extensible interface. − PowerShell is customizable as independent software vendors and enterprise developers can build custom tools and utilities using PowerShell to administer their software.
* Variables
* PowerShell variables are named objects. As PowerShell works with objects, these variables are used to work with objects.
* Creating variable
  Variable name should start with $ and can contain alphanumeric characters and underscore in their names. A variable can be created by typing a valid variable name.
  Type the following command in PowerShell ISE Console. Assuming you are in D:\test folder.
  $location = Get-Location
  Here we've created a variable $location and assigned it the output of Get-Location cmdlet. It now contains the current location.
* ## Using variable
  Type the following command in PowerShell ISE Console.
  $location
  Output
  You can see following output in PowerShell console.
  Path
  
  D:\test
* Getting information of variable
  Get-Member cmdlet can tell the type of variable being used. See the example below.
  $location | Get-Member
