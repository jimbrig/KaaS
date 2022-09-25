---
Date: 2022-03-16
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/CMD", "#Topic/Dev/CLI"]
Alias: ["CMD - Restart Explorer and Start Menu"]
---

# CMD - Restart Explorer and Start Menu

*See Also: [[Regedit - Restart Explorer and StartMenu Context Bar]]*

## Contents

- [[#Explorer|Explorer]]
	- [[#Enhanced Solution|Enhanced Solution]]
	- [[#Original Solution|Original Solution]]
- [[#Start Menu|Start Menu]]
- [[#Appendix: Links|Appendix: Links]]



## Explorer

*Source: Originally from [How to Restart File Explorer in Windows 11 (winaero.com)](https://winaero.com/how-to-restart-file-explorer-in-windows-11/?utm_source=software&utm_medium=in-app&utm_campaign=winaerotweaker&utm_content=contextmenurestartexplorer#Restart_Explorerexe_in_Windows_11_using_a_script), but I enhanced some.*

### Enhanced Solution

- Add `/fi` flag for calling `ShellCommon.dll` to ensure I am only killing to main shell, and not any other Explorer Windows.

```powershell
cmd.exe /c taskkill /f /im explorer.exe /fi "modules eq Windows.Internal.ShellCommon.dll" & start explorer.exe
```

If you want to restart with a pause then:

```powershell
cmd.exe /c @echo off & 
    echo The explorer.exe process will be terminated & echo. &
    taskkill /f /im explorer.exe /fi "modules eq Windows.Internal.ShellCommon.dll" & echo. & 
    echo Done & echo. & 
    echo Press any key to start explorer.exe process & pause>NUL & start explorer.exe & 
    exit
```

### Original Solution

- Using a [[2-Areas/Code/Windows Batch/_README|Batch]] File: `restart-explorer.bat`:

```powershell
taskkill /f /im explorer.exe
start explorer.exe
exit
```

- Using Command Line:

```powershell
taskkill /f /im explorer.exe
start explorer.exe
```

## Start Menu

As you may already know, the Start menu in previous Windows 10 releases has been hosted by a system process called `ShellExperienceHost.exe`.

In Windows 10 May 2019 Update Microsoft has separated it into its own process, called **`StartMenuExperienceHost.exe`**.

This gives the Start menu a performance boost and resolves a number of issues like delays in launching some Win32 apps. Users will notice measurable improvements in Start reliability. The Start menu is now opening significantly faster.

Full Path: `C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe`

Restart Command:

```powershell
taskkill /im StartMenuExperienceHost.exe /f\
start C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe
```


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
list from [[CMD - Restart Explorer and Start Menu]] AND -"Changelog"
```