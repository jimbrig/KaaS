# Backup Edge User Preferences PowerShell Script

\*Source: *

## Script

*Source: [jimbrig/jimsdots My personalized dotfiles and configs for Windows 10 ⚙️](https://github.com/jimbrig/jimsdots/blob/main/edge/backup-edge-settings.ps1)*

````powershell
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
````

---

## Appendix: Links and References

*Created on:*

* [2021-11-26](../../Daily-Notes/2021/2021-11/2021-11-26.md)

*Related*

* [Edge Search Engines](../../../0-Slipbox/Edge%20Search%20Engines.md)
* [Microsoft Edge](../../../3-Resources/Tools/Web%20Browsers/Microsoft%20Edge.md)

*See Also*

* *Code*
* [Development](../../MOCs/Development.md)
* [Microsoft](../../MOCs/Microsoft.md)
* [Windows Command Line](../../../3-Resources/Tools/Developer%20Tools/Shell/Microsoft%20DOS.md)
* [PowerShell (MOC)](../../MOCs/PowerShell.md)
* *PowerShell (Tools)*
* [PowerShell (Code)](_README.md)

---

*Backlinks:*

````dataview
list from [[Powershell - Backup Edge User Preferences PowerShell Script]] AND -"Changelog"
````

---

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2022
