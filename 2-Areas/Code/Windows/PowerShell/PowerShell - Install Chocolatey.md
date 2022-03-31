---
Date: 2022-03-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: ["PowerShell - Install Chocolatey"]
---

# PowerShell - Install Chocolatey

*Source: *

```powershell
Function Install-Choco {
  <#
  .SYNOPSIS
  Installs chocolatey package manager.
  .LINK
  https://chocolatey.org
  .EXAMPLE
  Install-Choco
  #>

  Write-Info "Checking for Chocolatey Installation..."
  if (Test-Command choco) {
    Write-Success "Chocolatey installation detected; Skipping installation..."
  }
  else {
    Write-Failure "Chocolatey installation not detected; Installing..."
    Write-Task "Checking for Administrative Priveledges..."
    # Ensure Admin Priveledges
    if (!(Test-Admin)) {
      Write-Failure "Admin priveledges not detected; Starting new process/shell as admin to install chocolatey..."
      Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit
    }
    Write-Host ""
    Write-Host "Installing Chocolatey for Windows..." -ForegroundColor Green
    Write-Host "------------------------------------" -ForegroundColor Green
    Write-Step "1" "Checking/Creating a PowerShell Profile First."
    if (!(Test-Path $PROFILE)) {
      New-Item -Path $PROFILE -Force
      Write-Success "Created new PowerShell Profile at $PROFILE."
    }
    Write-Step "2" "Installing Chocolatey from URL..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    Write-Step "3" "Updating Environment"
    Update-Environment
    if (Test-Command choco) {
      Write-Success "Successfully installed chocolatey to system."
    }
    else {
      Write-Failure "Failed to install chocolatey..."
    }
  }
}
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
list from [[PowerShell - Install Chocolatey]] AND -"Changelog"
```