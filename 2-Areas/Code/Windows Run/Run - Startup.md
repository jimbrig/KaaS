# Run Startup

*Source: N/A*

## Contents

* [Open Startup Folders from Shell Commands or Paths](Run%20-%20Startup.md#open-startup-folders-from-shell-commands-or-paths)
  * [Examples](Run%20-%20Startup.md#examples)
* [Open Startup Apps from Task Manager](Run%20-%20Startup.md#open-startup-apps-from-task-manager)
  * [Examples](Run%20-%20Startup.md#examples)
* [Appendix: Links](Run%20-%20Startup.md#appendix-links)

## Open Startup Folders from Shell Commands or Paths

|System or User|Shell Command|Folder Path|
|:------------:|:-----------:|:---------:|
|Startup (System)|`shell::common startup`|`%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup`|
|Startup (User)|`shell::startup`|`%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup`|

### Examples

![](https://i.imgur.com/wsAFFrO.png)

![](https://i.imgur.com/L2l5UiM.png)

## Open Startup Apps from Task Manager

*Source: N/A*

Use *Task Manager*'s `Taskmgr.exe` (a Windows32 executable located under path `%WINDIR%\System32\`) with the flags `/0` and `/startup` telling the executable to open the Startup Tab.

````powershell
%windir%\System32\Taskmgr.exe /0 /startup
````

### Examples

![](https://i.imgur.com/RfwdH0w.png)

opens this:

![](https://i.imgur.com/fdg7FYO.png)

---

## Appendix: Links

* [Code](../Code.md)
* [Development](../../MOCs/Development.md)
* *Windows*
* *Command Line*
* [PowerShell](../PowerShell/PowerShell.md)

*Backlinks:*

````dataview
list from [[Run Startup]] AND -"Changelog"
````
