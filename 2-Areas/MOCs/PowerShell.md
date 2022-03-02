---
Date: 2021-12-07
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/MOC", "#Topic/Dev/PowerShell"]
Alias: "PowerShell"
---

# PowerShell

*PowerShell* Map of Content houses all notes related to PowerShell in general.

## PowerShell Related Notes 

- [[Documenting PowerShell Modules]]
- [[PowerShell - Edge Scripts]]

## Modules

- [[PowerShell Modules]]

- [[PowerShell Module - psake]]
- [[PowerShell Module - Stucco]]
- [[PowerShell Module - Pester]]
- [[PowerShell Module - Plaster]]
- [[PowerShell Module - PoshCode]]
- [[PowerShell Module - PSScaffold]]
- [[PowerShell Module - devblackops]]
- [[PowerShell Module - ModuleBuilder]]

## Module Development

A PowerShell Module is a set of related PowerShell functions.

Use a `*.psm1` file to create a module.

Split module into parts:
- [[PowerShell Module - Pester|Pester]] Tests
- [[Documenting PowerShell Modules]]

Use [[PowerShell Module - Plaster|Plaster]] to create manifest files - `*.psd1*`.

Other modules aiding in module development:
- [[PowerShell Module - Stucco]]
- [[PowerShell Module - devblackops]]
- [[PowerShell Module - psake]]
- [[PowerShell Module - PoshCode]]
- [[PowerShell Module - ModuleBuilder]]
- [[PowerShell Module - PSScaffold]]

### Tagged as *Topic/Dev/PowerShell*

```dataview
list from #Topic/Dev/PowerShell AND -"Templates" AND -"MOCs" AND -"Changelog"
```

### Links to this File

```dataview
list from [[PowerShell]] AND -"Changelog"
```