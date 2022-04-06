---
Date: 2022-03-31
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/CMD", "#Topic/Dev/CLI"]
Alias: ["Batch - Python Virtual Environment"]
---

# Batch - Python Virtual Environment

*Source: [Windows batch file for quick virtualenv creation (github.com)](https://gist.github.com/bskinn/eb4a30aaac418b63e602ad3dba4c727c)*

```powershell
@echo off

for /f "tokens=*" %%C in ( 'python3.9 -c "import os, re; print(re.search(r'[^\\]+$', os.getcwd(), re.M).group(0))"' ) do (
    set DIRNAME=%%C
)

if [%2]==[] (
    python%1 -m virtualenv env --prompt="(%DIRNAME%) "    
) else (
    python%1 -m virtualenv env --prompt="(%2) "
)
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
list from [[Batch - Python Virtual Environment]] AND -"Changelog"
```