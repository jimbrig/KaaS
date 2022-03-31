---
Date: 2022-03-29
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: ["PowerShell - Reset Windows Update Registry Settings"]
---

# PowerShell - Reset Windows Update Registry Settings

*Source: [WinRice/ResetWindowsUpdate.ps1 at main · pratyakshm/WinRice (github.com)](https://github.com/pratyakshm/WinRice/blob/main/files/ResetWindowsUpdate.ps1)*

```powershell
Remove-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Recurse 
Write-Host "Windows Update settings have been reset."
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
list from [[PowerShell - Reset Windows Update Registry Settings]] AND -"Changelog"
```