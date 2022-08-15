---
Date: 2022-03-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: ["PowerShell - Scoop Import"]
---

# PowerShell - Scoop Import

*Source: https://gist.github.com/6f2a2368954e3df126a36da6684448cd#file-scoop-import-ps1*

```powershell
# useage:
# scoop-import <exported_list_file>
param(
    $exported
)

$apps = (
    Get-Content -Path $exported | Select-String '(?<app>.*)\s\(v:(?<version>.*)\)\s\[(?<bucket>.*)\]' -AllMatches | 
    Foreach-Object {$_.Matches} | 
    Foreach-Object {($_.Groups["bucket"].Value)+"/"+($_.Groups["app"].Value)}
)

$apps = ($apps | Out-String).Replace("`r`n"," ")
$cmd = "scoop install " + $apps.Trim(" ")
Invoke-Expression $cmd
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
list from [[PowerShell - Scoop Import]] AND -"Changelog"
```