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
- [[Windows CMD]]
- [[Command Line]]
- [[PowerShell]]

*Backlinks:*

```dataview
list from [[Delete Windows Update Leftover Files]] AND -"Changelog"
```