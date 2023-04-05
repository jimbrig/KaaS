# PowerShell - Reset Windows Update Registry Settings

*Source: [WinRice/ResetWindowsUpdate.ps1 at main · pratyakshm/WinRice (github.com)](https://github.com/pratyakshm/WinRice/blob/main/files/ResetWindowsUpdate.ps1)*

````powershell
Remove-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Recurse 
Write-Host "Windows Update settings have been reset."
````

---

## Appendix: Links

* *Code*
* [Development](../../MOCs/Development.md)
* *Windows*
* [Microsoft DOS](../../../3-Resources/Tools/Developer%20Tools/Shell/Microsoft%20DOS.md)
* *Command Line*
* [2-Areas/MOCs/PowerShell](../../MOCs/PowerShell.md)

*Backlinks:*

````dataview
list from [[PowerShell - Reset Windows Update Registry Settings]] AND -"Changelog"
````
