---
Date: 2022-02-09
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/CMD", "#Topic/Dev/CLI"]
Alias: ["DISM Commands"]
---

# DISM Commands

*Source: *

- `DISM` Scan Health:

```powershell
Dism /Online /Cleanup-Image /ScanHealth
```

- `DISM` component cleanup:

```powershell
Dism.exe /online /Cleanup-Image /StartComponentCleanup
```

- DISM online repair image

```powershell
Dism /Online /Cleanup-Image /RestoreHealth
```

- DISM online repair image with [[PowerShell]] cmdlet:

```powershell
Repair-WindowsImage -Online -RestoreHealth
```

- DISM online repair image

```powershell
Repair-WindowsImage -Online -RestoreHealth
```

- DISM online repair image

```powershell

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
list from [[DISM Commands]] AND -"Changelog"
```