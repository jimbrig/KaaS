---
Date: 2022-08-12
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Log", "#Type/Tool", "#Topic/Dev", "#Topic/Dev/Tools"]
Alias: "Log - New Discoveries"
---

# Log - New Discoveries

> This document serves the purpose of logging newly discovered tools, technologies, websites, notes, etc. in a centralized location by date.

## Contents

- [[#Contents|Contents]]
- [[#Logged Discoveries|Logged Discoveries]]
	- [[#Logged Discoveries#Organize CLI|Organize CLI]]
	- [[#Logged Discoveries#Map Network Drive with PowerShell|Map Network Drive with PowerShell]]
	- [[#Logged Discoveries#Set Default Browser in WSL to Windows Host|Set Default Browser in WSL to Windows Host]]
- [[#Appendix: Links and References|Appendix: Links and References]]

## Logged Discoveries

- [[2022-08-12]]: 
	- Discovered a new [[3-Resources/Tools/Developer Tools/Command Line Utilities/_README|Command Line Utility]] built with [[Python]] called [[3-Resources/Tools/Developer Tools/Command Line Utilities/organize|organize]]. This is a great tool and I have already implemented it to run various cleanup commands on my work machine.
- [[2022-08-11]]: 
	- Discovered how to map a network drive and assign it a drive letter using [[PowerShell]]. See the corresponding note here: [[PowerShell - Map Network Drive]].
	- Discovered how to set the default browser in [[WSL]] to utilize the Window's host machines browser via `x-www-browser`: See corresponding note here: [[Bash - WSL - Set Default Browser to Windows Host]].
- **PRIOR**:
	- [[dbdiagram.io]] / [[DBML]] / [[dbdocs]]
	- [[ffsend]] / [[send.vis.ee]]
	- [[topgrade]]
	- [[git-cliff]]
	- [[git-crypt]]

### Organize CLI

- [[2022-08-12]]: Discovered a new [[3-Resources/Tools/Developer Tools/Command Line Utilities/_README|Command Line Utility]] built with [[Python]] called [[3-Resources/Tools/Developer Tools/Command Line Utilities/organize|organize]]. This is a great tool and I have already implemented it to run various cleanup commands on my work machine.

### Map Network Drive with PowerShell

- Discovered how to map a network drive and assign it a drive letter using [[PowerShell]]. See the corresponding note here: [[PowerShell - Map Network Drive]].

```powershell
(New-Object -ComObject WScript.Network).MapNetworkDrive('Z:','\\server\folder')
```

### Set Default Browser in WSL to Windows Host

Discovered how to set the default browser in [[WSL]] to utilize the Window's host machines browser via `x-www-browser`. 

See corresponding note here: [[Bash - WSL - Set Default Browser to Windows Host]].



***

## Appendix: Links and References



*Backlinks:*

```dataview
list from [[Log - New Discoveries]] AND -"Changelog"
```

***

Jimmy Briggs | [[2022-08-12]]
