---
Date: 2022-02-27
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: ["PowerShell - Useful Profile Utility Functions"]
---

# PowerShell - Useful Profile Utility Functions

*Source: [PowerShell/functions.ps1 at main · jimbrig/PowerShell (github.com)](https://github.com/jimbrig/PowerShell/blob/main/Profile/functions.ps1)*

## Automation Utility Helper Functions

### Custom Application Launchers

- `Open-Todoist`: Open Todoist Application
- `Open-GitHub`: Open <https://github.com> using your Default Browser
- `Open-Docker`: Start up [[Docker Desktop]]
- `Open-RProject`: Invoke my custom `jimstools::open_project()` R function (See [jimstools/addin-open_project.R at master · jimbrig/jimstools (github.com)](https://github.com/jimbrig/jimstools/blob/master/R/addin-open_project.R))

```powershell
# ----------
# Launchers
# ----------

Function Open-Todoist { start-process -PassThru 'C:\Users\jimmy\AppData\Local\Programs\todoist\Todoist.exe' }

Function Open-GitHub { start-process -PassThru 'https://github.com/' }

Function Open-Docker { start-process -PassThru 'C:\Program Files\Docker\Docker\frontend\Docker Desktop.exe' }

Function Open-RProject { Rscript -e 'jimstools::open_project()' }
```

***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[Development]]
- [[Windows]]
- [[Microsoft DOS]]
- [[Command Line]]
- [[PowerShell]]

*Backlinks:*

```dataview
list from [[PowerShell - Usefule Profile Utility Functions]] AND -"Changelog"
```