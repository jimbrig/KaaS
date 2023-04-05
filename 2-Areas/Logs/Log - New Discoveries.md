# Log - New Discoveries

 > 
 > This document serves the purpose of logging newly discovered tools, technologies, websites, notes, etc. in a centralized location by date.

## Contents

* [Logged Discoveries](Log%20-%20New%20Discoveries.md#logged-discoveries)
* [Prior Discoveries Worth Noting](Log%20-%20New%20Discoveries.md#prior-discoveries-worth-noting)
  * [Organize CLI](Log%20-%20New%20Discoveries.md#prior-discoveries-worth-noting-organize-cli)
  * [Map Network Drive with PowerShell](Log%20-%20New%20Discoveries.md#prior-discoveries-worth-noting-map-network-drive-with-powershell)
  * [Set Default Browser in WSL to Windows Host](Log%20-%20New%20Discoveries.md#prior-discoveries-worth-noting-set-default-browser-in-wsl-to-windows-host)
* [Appendix: Links and References](Log%20-%20New%20Discoveries.md#appendix-links-and-references)

## Logged Discoveries

* *2022-08-26*:
  
  * https://addons.mozilla.org/en-US/firefox/addon/obsidian-clipper/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search
* [2022-08-12](../Daily-Notes/2022/2022-08/2022-08-12.md): 
  
  * Discovered a new *Command Line Utility* built with [Python](../Code/Python/Python.md) called [organize](../../3-Resources/Tools/Developer%20Tools/Command%20Line%20Utilities/organize.md). This is a great tool and I have already implemented it to run various cleanup commands on my work machine.
* [2022-08-11](../Daily-Notes/2022/2022-08/2022-08-11.md): 
  
  * Discovered how to map a network drive and assign it a drive letter using [PowerShell](../Code/PowerShell/PowerShell.md). See the corresponding note here: [PowerShell - Map Network Drive](../Code/PowerShell/PowerShell%20-%20Map%20Network%20Drive.md).
  * Discovered how to set the default browser in [WSL](../../3-Resources/Tools/Developer%20Tools/Linux/Windows%20Subsystem%20for%20Linux.md) to utilize the Window's host machines browser via `x-www-browser`: See corresponding note here: [Bash - WSL - Set Default Browser to Windows Host](../Code/Bash/Bash%20-%20WSL%20-%20Set%20Default%20Browser%20to%20Windows%20Host.md).

## Prior Discoveries Worth Noting

* *dbdiagram.io* / *DBML* / *dbdocs*
* [ffsend](../../3-Resources/Tools/Developer%20Tools/Command%20Line%20Utilities/ffsend.md) / *send.vis.ee*
* [topgrade](../../3-Resources/Tools/Utility/Topgrade.md)
* [git-cliff](../../3-Resources/Tools/Developer%20Tools/Documentation/Utility/Git-Cliff.md)
* *git-crypt*

### Organize CLI

* *2022-08-12 1*: Discovered a new *Command Line Utility* built with [Python](../Code/Python/Python.md) called [organize](../../3-Resources/Tools/Developer%20Tools/Command%20Line%20Utilities/organize.md). This is a great tool and I have already implemented it to run various cleanup commands on my work machine.

### Map Network Drive with PowerShell

* Discovered how to map a network drive and assign it a drive letter using [PowerShell](../Code/PowerShell/PowerShell.md). See the corresponding note here: [PowerShell - Map Network Drive](../Code/PowerShell/PowerShell%20-%20Map%20Network%20Drive.md).

````powershell
(New-Object -ComObject WScript.Network).MapNetworkDrive('Z:','\\server\folder')
````

### Set Default Browser in WSL to Windows Host

Discovered how to set the default browser in *WSL* to utilize the Window's host machines browser via `x-www-browser`. 

See corresponding note here: [Bash - WSL - Set Default Browser to Windows Host](../Code/Bash/Bash%20-%20WSL%20-%20Set%20Default%20Browser%20to%20Windows%20Host.md).

---

## Appendix: Links and References

*Backlinks:*

````dataview
list from [[Log - New Discoveries]] AND -"Changelog"
````

---

Jimmy Briggs | *2022-08-12 1*
