---
Date: 2022-09-09
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code", "#Topic/Dev"]
Alias: ["Regedit - Add Open in VSCode Insiders to Explorer Context Menu"]
---

# Regedit - Add Open in VSCode Insiders to Explorer Context Menu

*Source: [Adds 'Open in VS Code - Insiders' to context menu in Windows Explorer. (github.com)](https://gist.github.com/jimbrig/26b0b7788987215b466e36975b07e40c)*

![[Pasted image 20220909182538.png]]

Adds the following context menu items:
- Open Folder as VS Code Insiders Project (for clicking on a folders background in explorer)
- Open Folder as VS Code Insiders Project (for clicking on a folder directly)
- Edit with VS Code Insiders (for clicking on a file directly)

```registry
Windows Registry Editor Version 5.00

; ----------------------------------------------------------
; Open Folders (Background)
; ----------------------------------------------------------

[HKEY_CLASSES_ROOT\Directory\Background\shell\VSCodeInsiders]
@="Open Folder as VS Code Insiders Project"
"Icon"="C:\\Users\\jimmy\\AppData\\Local\\Programs\\Microsoft VS Code Insiders\\Code - Insiders.exe"

[HKEY_CLASSES_ROOT\Directory\Background\shell\VSCodeInsiders\command]
@="\"C:\\Users\\jimmy\\AppData\\Local\\Programs\\Microsoft VS Code Insiders\\Code - Insiders.exe\" \"%V\""

; ----------------------------------------------------------
; Open Folders (Normal)
; ----------------------------------------------------------

[HKEY_CLASSES_ROOT\Directory\shell\VSCodeInsiders]
@="Open Folder as VS Code Insiders Project"
"Icon"="C:\\Users\\jimmy\\AppData\\Local\\Programs\\Microsoft VS Code Insiders\\Code - Insiders.exe"

[HKEY_CLASSES_ROOT\Directory\shell\VSCodeInsiders\command]
@="\"C:\\Users\\jimmy\\AppData\\Local\\Programs\\Microsoft VS Code Insiders\\Code - Insiders.exe\" \"%1\""

; ----------------------------------------------------------
; Open File
; ----------------------------------------------------------

[HKEY_CLASSES_ROOT\*\shell\VSCodeInsiders]
@="Edit with VS Code Insiders"
"Icon"="C:\\Users\\jimmy\\AppData\\Local\\Programs\\Microsoft VS Code Insiders\\Code - Insiders.exe"

[HKEY_CLASSES_ROOT\*\shell\VSCodeInsiders\command]
@="\"C:\\Users\\jimmy\\AppData\\Local\\Programs\\Microsoft VS Code Insiders\\Code - Insiders.exe\" \"%1\""
```


***

## Appendix: Links

- [[Code]]
- [[Development]]

*Backlinks:*

```dataview
list from [[Regedit - Add Open in VSCode Insiders to Explorer Context Menu]] AND -"Changelog"
```