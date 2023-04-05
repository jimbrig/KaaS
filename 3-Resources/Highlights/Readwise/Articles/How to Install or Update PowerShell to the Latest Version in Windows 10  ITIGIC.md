# How to Install or Update PowerShell to the Latest Version in Windows 10 | ITIGIC

## Metadata

* Author: 
* Full Title: How to Install or Update PowerShell to the Latest Version in Windows 10 | ITIGIC
* Category: #Type/Highlight/Article
* URL: https://itigic.com/install-or-update-powershell-in-windows-10/

## Highlights

* When we install Windows 10 from scratch, this console is installed and enabled by default. However, even the latest version of Windows 10 brings an outdated version of PowerShell , usually 5.1. We can check the version that we have right now installed on our computer by opening a console window and executing the following command:
  Get-Host | Select-Object Version
* What’s New in PowerShell 7
  PowerShell 5 , the version that is installed by default in Windows 10, is a very powerful tool, and for most users more than enough. However, there is always room for improvement, especially for advanced users and developers who work with these types of scripts.
  Therefore, in the new versions of PowerShell we can find functions and features that, until now, were not available in this tool, such as:
  Parallelism pipeline.
  New operators.
  New cmdlet (ConciseView and Get-Error).
  New version notifications.
  Compatibility layers to invoke modules in implicit sessions.
  Ability to invoke resources directly from the console window.
* Automatic method
  If we do not want to download and install the new version manually, we can also update PowerShell from the program itself. For this, what we must do is open a PS window with administrator permissions, and execute the following command in it:
  iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI"
* How to use the new PowerShell
  Regardless of the method we have chosen, this version acts as an independent program, so in Windows 10 we will continue to have version 5 of it installed, along with this new version. We can find the new PowerShell in the following path (by default): C> Program Files> PowerShell.
* Check the new installed version
  When we have the new PowerShell installed, it will appear as ” PowerShell 7 ” within the search engine and from the launchers we use. However, if we want to be sure of the version that we have installed, we can check it very easily by running the following command again:
  Get-Host | Select-Object Version
  From now on, when there are new versions, the PowerShell window itself will notify us of its availability. And we can use either of the two previous methods to install that new version.
