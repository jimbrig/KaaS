---
Date: 2022-02-09
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/CMD", "#Topic/Dev/CLI"]
Alias: ["Delete Windows Update Leftover Files"]
---

# Delete Windows Update Leftover Files

*Source: *

```powershell
del /s /q /f "%SYSTEMROOT%\Logs\WindowsUpdate\*"
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
list from [[Delete Windows Update Leftover Files]] AND -"Changelog"
```