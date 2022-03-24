---
Date: 2022-03-21
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code", "#Topic/Dev"]
Alias: ["Run Startup"]
---

# Run Startup

*Source: N/A*

## Contents

- [[#Open Startup Folders from Shell Commands or Paths|Open Startup Folders from Shell Commands or Paths]]
	- [[#Examples|Examples]]
- [[#Open Startup Apps from Task Manager|Open Startup Apps from Task Manager]]
	- [[#Examples|Examples]]
- [[#Appendix: Links|Appendix: Links]]


## Open Startup Folders from Shell Commands or Paths

|  System or User  |      Shell Command      |                          Folder Path                          |
|:----------------:|:-----------------------:|:-------------------------------------------------------------:|
| Startup (System) | `shell::common startup` | `%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup` |
|  Startup (User)  |    `shell::startup`     |   `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup`   |

### Examples

![](https://i.imgur.com/wsAFFrO.png)

![](https://i.imgur.com/L2l5UiM.png)

## Open Startup Apps from Task Manager

*Source: N/A*

Use [[Task Manager]]'s `Taskmgr.exe` (a Windows32 executable located under path `%WINDIR%\System32\`) with the flags `/0` and `/startup` telling the executable to open the Startup Tab.

```powershell
%windir%\System32\Taskmgr.exe /0 /startup
```

### Examples

![](https://i.imgur.com/RfwdH0w.png)

opens this:

![](https://i.imgur.com/fdg7FYO.png)


***

## Appendix: Links

- [[Code]]
- [[Development]]
- [[Windows]]
- [[Command Line]]
- [[PowerShell]]


*Backlinks:*

```dataview
list from [[Run Startup]] AND -"Changelog"
```