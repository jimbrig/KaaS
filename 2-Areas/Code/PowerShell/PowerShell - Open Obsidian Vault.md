# PowerShell - Open Obsidian Vault

\*Source: *

````powershell
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
list from [[PowerShell - Open Obsidian Vault]] AND -"Changelog"
````
