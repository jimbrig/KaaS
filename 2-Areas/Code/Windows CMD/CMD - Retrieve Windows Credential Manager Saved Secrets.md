---
Date: 2022-02-09
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/CMD", "#Topic/Dev/CLI", "#Topic/Dev/Secrets"]
Alias: ["Retrieve Windows Credential Manager Saved Secrets"]
---

# Retrieve Windows Credential Manager Saved Secrets

*Source: *

Utilize the `cmdkey.exe` executable to retrieve secrets from `wincred`:

```powershell
cmdkey.exe /list
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
list from [[Retrieve Windows Credential Manager Saved Secrets]] AND -"Changelog"
```