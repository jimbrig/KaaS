---
Date: 2022-03-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: ["PowerShell - Open Obsidian Vault"]
---

# PowerShell - Open Obsidian Vault

*Source: *

```powershell
# NOTE: Assumes Windows for locating the `obsidian.json` configuration file

Function Open-ObsidianVault {

    $ObsidianConfig = "$env:APPDATA\Obsidian\obsidian.json"    
    $VaultKeys = cat $ObsidianConfig | jq .vaults | jq keys | ConvertFrom-Json    
    $VaultPaths = cat $ObsidianConfig | jq '.vaults' | jq 'map(.path)' | ConvertFrom-Json    
    $VaultNames = $VaultPaths | Split-Path -Leaf
    
    If (!($VaultNames.Count -gt 1)) { throw }
    
    Write-Host "Select a Vault:" -ForeGroundColor Yellow
    for($i = 0; $i -lt $VaultNames.count; $i++) {
        Write-Host "$($i): $($VaultNames[$i]) | $($VaultNames[$i])"
    }
    $selection = Read-Host -Prompt "Enter the Number for the Vault to Open:"
    
    $selectedVault = $VaultNames[$selection]
    
    $openstring = 'obsidian://open?vault=' + $selectedVault
    Start-Process $openstring -PassThru
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
list from [[PowerShell - Open Obsidian Vault]] AND -"Changelog"
```