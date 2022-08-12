---
Date: 2022-08-12
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: ["PowerShell - Map Network Drive"]
---

# PowerShell - Map Network Drive

*Source: https://powershellmagazine.com/2014/07/21/pstip-create-mapped-network-drive-using-wscript-network/*
*See Also: https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/wscript*
*Backlink: [[Log - New Discoveries#Map Network Drive with PowerShell]]*

```powershell
$drv = $(New-Object -Com WScript.Network)
$drv.MapNetworkDrive("Y:", "\\<server>\<path\to\folder>")
```

or a one-liner:

```powershell
(New-Object -ComObject WScript.Network).MapNetworkDrive('Z:','\\server\folder')
```

This will not map the drive persistently. In other words, the drive will disappear after reboot or when a user logs out. To ensure the drive mapping is persistent a third argument should be added–a _Boolean_ value set to true:

```powershell
(New-Object -ComObject WScript.Network).MapNetworkDrive('Z:','\\server\folder',$true)
```

It is also possible to specify a username and password. Unfortunately, both the username and password have to be supplied as plain text. An example of how to map a drive using alternate credentials:

```powershell
(New-Object -ComObject WScript.Network).MapNetworkDrive('Z:','\\server\folder',$true,'domain\user','password')
```

A drive mapping might already be present using the drive letter that we want to use for the new mapped drive. The _RemoveNetworkDrive_ method of the _WScript.Network_ object can be utilized to remove a mapped network drive:

```powershell
(New-Object -ComObject WScript.Network).RemoveNetworkDrive('Z:')
```

When there are open connections to the mapped drive, an error will be thrown when executing the previous command. To forcefully disconnect a drive mapping add _$true_ as the second argument.

```powershell
(New-Object -ComObject WScript.Network).RemoveNetworkDrive('Z:',$true)
```

For more details about these two methods and available arguments see the following articles on MSDN:
- **MapNetworkDrive**: <http://msdn.microsoft.com/en-us/library/8kst88h6(v=vs.84).aspx>
- **RemoveNetworkDrive**: <http://msdn.microsoft.com/en-us/library/d16d7wbf(v=vs.84).aspx>

***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[Development]]
- [[Windows]]
- [[Microsoft DOS]]
- [[Command Line]]
- [[2-Areas/MOCs/PowerShell]]

*Backlinks:*

```dataview
list from [[PowerShell - Map Network Drive]] AND -"Changelog"
```