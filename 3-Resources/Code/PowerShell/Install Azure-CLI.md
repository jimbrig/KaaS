---
Date: 2022-02-09
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code", "#Topic/Dev"]
Alias: ["Install Azure-CLI"]
---

# Install Azure-CLI

*Source: *

```powershell
$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi
Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'
Remove-Item .\AzureCLI.msi
```
***

## Appendix: Links

- [[3-Resources/Code/_README|Code]]
- [[PowerShell]]
- [[Azure CLI]]
- [[Development]]

*Backlinks:*

```dataview
list from [[Install Azure-CLI]] AND -"Changelog"
```