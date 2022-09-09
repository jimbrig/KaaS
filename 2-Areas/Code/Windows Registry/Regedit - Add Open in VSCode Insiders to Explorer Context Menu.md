---
Date: 2022-09-09
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code", "#Topic/Dev"]
Alias: ["Regedit - Add Open in VSCode Insiders to Explorer Context Menu"]
---

# Regedit - Add Open in VSCode Insiders to Explorer Context Menu

*Source: [Adds 'Open in VS Code - Insiders' to context menu in Windows Explorer. (github.com)](https://gist.github.com/jimbrig/26b0b7788987215b466e36975b07e40c)*

```registry
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Directory\shell\VSCodeInsiders]
@="Open Folder as VS Code Insiders Project"
"Icon"="\"C:\\Users\\jimmy\\AppData\\Local\\Programs\\Microsoft VS Code Insiders\\Code - Insiders.exe\""

[HKEY_CLASSES_ROOT\Directory\shell\VSCodeInsiders\command]
@="\"C:\\Users\\jimmy\\AppData\\Local\\Programs\\Microsoft VS Code Insiders\\Code - Insiders.exe\" \"%1\""

; Adds 'Open in VS Code - Insiders' to context menu (when you right click) in Windows Explorer.
; Based on http://thisdavej.com/right-click-on-windows-folder-and-open-with-visual-studio-code/
; and 
; https://gist.github.com/kyle-ilantzis/c5a30fbabe8923130581

; Open files
[HKEY_CLASSES_ROOT\*\shell\VSCodeInsiders]
@="Edit with VS Code Insiders"
"Icon"="C:\\Users\\jimmy\\AppData\\Local\\Programs\\Microsoft VS Code Insiders\\Code - Insiders.exe"

[HKEY_CLASSES_ROOT\*\shell\VSCodeInsiders\command]
@="\"C:\\Program Files (x86)\\Microsoft VS Code Insiders\\Code - Insiders.exe\" \"%1\""


; This will make it appear when you right click ON a folder
; The "Icon" line can be removed if you don't want the icon to appear
[HKEY_CLASSES_ROOT\Directory\shell\VSCodeInsiders]
@="Open Folder as VS Code Insiders Project"
"Icon"="\"C:\\Program Files (x86)\\Microsoft VS Code Insiders\\Code - Insiders.exe\",0"
[HKEY_CLASSES_ROOT\Directory\shell\VSCodeInsiders\command]
@="\"C:\\Program Files (x86)\\Microsoft VS Code Insiders\\Code - Insiders.exe\" \"%1\""


; This will make it appear when you right click INSIDE a folder
; The "Icon" line can be removed if you don't want the icon to appear
[HKEY_CLASSES_ROOT\Directory\Background\shell\VSCodeInsiders]
@="Open Folder as VS Code Insiders Project"
"Icon"="\"C:\\Program Files (x86)\\Microsoft VS Code Insiders\\Code - Insiders.exe\",0"
[HKEY_CLASSES_ROOT\Directory\Background\shell\VSCodeInsiders\command]
@="\"C:\\Program Files (x86)\\Microsoft VS Code Insiders\\Code - Insiders.exe\" \"%V\""
```


***

## Appendix: Links

- [[Code]]
- [[Development]]

*Backlinks:*

```dataview
list from [[Regedit - Add Open in VSCode Insiders to Explorer Context Menu]] AND -"Changelog"
```