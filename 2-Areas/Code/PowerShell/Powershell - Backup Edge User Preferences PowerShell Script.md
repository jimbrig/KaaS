---
Date: 2022-09-24
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: ["Backup Edge User Preferences PowerShell Script"]
---

# Backup Edge User Preferences PowerShell Script

*Source: *

## Script

*Source: [jimbrig/jimsdots My personalized dotfiles and configs for Windows 10 ⚙️](https://github.com/jimbrig/jimsdots/blob/main/edge/backup-edge-settings.ps1)*

```powershell
# Edge Backup Script (PowerShell Core)

$dotdir = "$env:DOTDIR"
$edge_backup_dir = "$dotdir\edge\backups\edge"
$edge_dev_backup_dir = "$dotdir\edge\backups\edge_dev"

$edge_appdata_dir = "$env:LocalAppData\Microsoft\Edge"
$edge_dev_appdata_dir = "$env:LocalAppData\Microsoft\Edge Dev"

Copy-Item $edge_appdata_dir -Destination $env:TEMP\edge -Force -Recurse
Copy-Item $edge_dev_appdata_dir -Destination $env:TEMP\edge_dev -Force -Recurse

Compress-Archive -Path "$env:TEMP\edge\User Data" -DestinationPath "$edge_backup_dir\UserData.zip" -Update
Compress-Archive -Path "$env:TEMP\edge_dev\User Data" -DestinationPath "$edge_dev_backup_dir\UserData.zip" -Update

Invoke-Command { reg export 'HKCU\Software\Microsoft\Edge\PreferenceMACs' $dotdir\edge\backups\edge\edge_registry_settings.reg }
Invoke-Command { reg export 'HKCU\Software\Microsoft\Edge Dev\PreferenceMACs' $dotdir\edge\backups\edge_dev\edge_dev_registry_settings.reg }
```

***

## Appendix: Links and References

*Created on:*

- [[2021-11-26]]

*Related*

- [[Edge Search Engines]]
- [[Microsoft Edge]]

*See Also*

- [[2-Areas/Code/_README|Code]]
- [[Development]]
- [[Microsoft]]
- [[Microsoft DOS|Windows Command Line]]
- [[2-Areas/MOCs/PowerShell|PowerShell (MOC)]]
- [[3-Resources/Tools/Developer Tools/Languages/PowerShell/_README|PowerShell (Tools)]]
- [[2-Areas/Code/PowerShell/_README|PowerShell (Code)]]

***

*Backlinks:*

```dataview
list from [[Powershell - Backup Edge User Preferences PowerShell Script]] AND -"Changelog"
```

***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2022
