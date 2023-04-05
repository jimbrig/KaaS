# RegEdit - Restart Explorer and StartMenu Context Bar

*Source: [How to Restart File Explorer in Windows 11 (winaero.com)](https://winaero.com/how-to-restart-file-explorer-in-windows-11/?utm_source=software&utm_medium=in-app&utm_campaign=winaerotweaker&utm_content=contextmenurestartexplorer#Restart_Explorerexe_in_Windows_11_using_a_script)*

![](https://i.imgur.com/1IZelYa.png)

* `Add-Restart-Explorer-Context-Menu.reg`:

````regedit
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\DesktopBackground\Shell\RestartExplorer]
"Icon"="explorer.exe"
"Position"="Bottom"
"SubCommands"=""
"MUIVerb"="Restart Explorer"

[HKEY_CLASSES_ROOT\DesktopBackground\Shell\RestartExplorer\shell]

[HKEY_CLASSES_ROOT\DesktopBackground\Shell\RestartExplorer\shell\01Restart]
"MUIVerb"="Restart Explorer"
"Icon"="explorer.exe"

[HKEY_CLASSES_ROOT\DesktopBackground\Shell\RestartExplorer\shell\01Restart\command]
@=hex(2):63,00,6d,00,64,00,2e,00,65,00,78,00,65,00,20,00,2f,00,63,00,20,00,74,\
  00,61,00,73,00,6b,00,6b,00,69,00,6c,00,6c,00,20,00,2f,00,66,00,20,00,2f,00,\
  69,00,6d,00,20,00,65,00,78,00,70,00,6c,00,6f,00,72,00,65,00,72,00,2e,00,65,\
  00,78,00,65,00,20,00,20,00,26,00,20,00,73,00,74,00,61,00,72,00,74,00,20,00,\
  65,00,78,00,70,00,6c,00,6f,00,72,00,65,00,72,00,2e,00,65,00,78,00,65,00,00,\
  00

[HKEY_CLASSES_ROOT\DesktopBackground\Shell\RestartExplorer\shell\02RestartWithPause]
"MUIVerb"="Restart Explorer with pause"
"Icon"="explorer.exe"

[HKEY_CLASSES_ROOT\DesktopBackground\Shell\RestartExplorer\shell\02RestartWithPause\command]
@=hex(2):63,00,6d,00,64,00,2e,00,65,00,78,00,65,00,20,00,2f,00,63,00,20,00,40,\
  00,65,00,63,00,68,00,6f,00,20,00,6f,00,66,00,66,00,20,00,26,00,20,00,65,00,\
  63,00,68,00,6f,00,20,00,54,00,68,00,65,00,20,00,65,00,78,00,70,00,6c,00,6f,\
  00,72,00,65,00,72,00,2e,00,65,00,78,00,65,00,20,00,70,00,72,00,6f,00,63,00,\
  65,00,73,00,73,00,20,00,77,00,69,00,6c,00,6c,00,20,00,62,00,65,00,20,00,74,\
  00,65,00,72,00,6d,00,69,00,6e,00,61,00,74,00,65,00,64,00,20,00,26,00,20,00,\
  65,00,63,00,68,00,6f,00,2e,00,20,00,26,00,20,00,74,00,61,00,73,00,6b,00,6b,\
  00,69,00,6c,00,6c,00,20,00,2f,00,66,00,20,00,2f,00,69,00,6d,00,20,00,65,00,\
  78,00,70,00,6c,00,6f,00,72,00,65,00,72,00,2e,00,65,00,78,00,65,00,20,00,26,\
  00,20,00,65,00,63,00,68,00,6f,00,2e,00,20,00,26,00,20,00,65,00,63,00,68,00,\
  6f,00,20,00,44,00,6f,00,6e,00,65,00,20,00,26,00,20,00,65,00,63,00,68,00,6f,\
  00,2e,00,20,00,26,00,20,00,65,00,63,00,68,00,6f,00,20,00,50,00,72,00,65,00,\
  73,00,73,00,20,00,61,00,6e,00,79,00,20,00,6b,00,65,00,79,00,20,00,74,00,6f,\
  00,20,00,73,00,74,00,61,00,72,00,74,00,20,00,65,00,78,00,70,00,6c,00,6f,00,\
  72,00,65,00,72,00,2e,00,65,00,78,00,65,00,20,00,70,00,72,00,6f,00,63,00,65,\
  00,73,00,73,00,20,00,26,00,20,00,70,00,61,00,75,00,73,00,65,00,3e,00,4e,00,\
  55,00,4c,00,20,00,26,00,20,00,73,00,74,00,61,00,72,00,74,00,20,00,65,00,78,\
  00,70,00,6c,00,6f,00,72,00,65,00,72,00,2e,00,65,00,78,00,65,00,20,00,26,00,\
  20,00,65,00,78,00,69,00,74,00,00,00
````

* `Remove-Restart-Explorer-Context-Menu.reg`:

````regedit
Windows Registry Editor Version 5.00

[-HKEY_CLASSES_ROOT\DesktopBackground\Shell\RestartExplorer]
````

---

## Appendix: Links

* *Code*
* [Development](../../MOCs/Development.md)
* *Windows*
* [Microsoft DOS](../../../3-Resources/Tools/Developer%20Tools/Shell/Microsoft%20DOS.md)
* *Command Line*
* [2-Areas/MOCs/PowerShell](../../MOCs/PowerShell.md)
* [Microsoft](../../MOCs/Microsoft.md)
* *Registry*

*Backlinks:*

````dataview
list from [[RegEdit - Restart Explorer and StartMenu Context Bar]] AND -"Changelog"
````
