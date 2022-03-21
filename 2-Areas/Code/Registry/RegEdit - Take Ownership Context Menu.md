---
Date: 2022-03-12
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/Registry", "#Topic/Dev/OS/Windows"]
Alias: ["RegEdit - Take Ownership Context Menu"]
---

# RegEdit - Take Ownership Context Menu

*Source: [Add Take Ownership Context Menu in Windows 10 (winaero.com)](https://winaero.com/add-take-ownership-context-menu-windows-10/?utm_source=software&utm_medium=in-app&utm_campaign=winaerotweaker&utm_content=contextmenutakeownership)*

Add a simple context menu entry to Take Ownership of a selected file or directory from within Windows File Explorer:

![](https://i.imgur.com/SGf6VlL.png)

For other Context Menu Registry Edits see [[RegEdit - Customizing Windows Explorer Context Menu]].


## Registration File

- [Add_Take_Ownership_context_menu.reg · jimbrig/jimsdots (github.com)](https://github.com/jimbrig/jimsdots/blob/main/registry/take_ownership_context_menu/Add_Take_Ownership_context_menu.reg):

```registry
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\*\shell\TakeOwnership]
@="Take Ownership"
"HasLUAShield"=""
"NoWorkingDirectory"=""
"NeverDefault"=""

[HKEY_CLASSES_ROOT\*\shell\TakeOwnership\command]
@="powershell -windowstyle hidden -command \"Start-Process cmd -ArgumentList '/c takeown /f \\\"%1\\\" && icacls \\\"%1\\\" /grant *S-1-3-4:F /t /c /l & pause' -Verb runAs\""
"IsolatedCommand"= "powershell -windowstyle hidden -command \"Start-Process cmd -ArgumentList '/c takeown /f \\\"%1\\\" && icacls \\\"%1\\\" /grant *S-1-3-4:F /t /c /l & pause' -Verb runAs\""


[HKEY_CLASSES_ROOT\Directory\shell\TakeOwnership]
@="Take Ownership"
"HasLUAShield"=""
"NoWorkingDirectory"=""
"NeverDefault"=""

[HKEY_CLASSES_ROOT\Directory\shell\TakeOwnership\command]
@="powershell -windowstyle hidden -command \"Start-Process cmd -ArgumentList '/c takeown /f \\\"%1\\\" /r /d y && icacls \\\"%1\\\" /grant *S-1-3-4:F /t /c /l /q & pause' -Verb runAs\""
"IsolatedCommand"="powershell -windowstyle hidden -command \"Start-Process cmd -ArgumentList '/c takeown /f \\\"%1\\\" /r /d y && icacls \\\"%1\\\" /grant *S-1-3-4:F /t /c /l /q & pause' -Verb runAs\""
```

***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[Development]]
- [[Windows]]
- [[Microsoft DOS]]
- [[Command Line]]
- [[2-Areas/MOCs/PowerShell]]
- [[Microsoft]]
- [[2-Areas/Code/Registry/_README|Registry]]

*Backlinks:*

```dataview
list from [[RegEdit - Take Ownership Context Menu]] AND -"Changelog"
```