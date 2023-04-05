# Batch - Python Virtual Environment

*Source: [Windows batch file for quick virtualenv creation (github.com)](https://gist.github.com/bskinn/eb4a30aaac418b63e602ad3dba4c727c)*

````powershell
@echo off

for /f "tokens=*" %%C in ( 'python3.9 -c "import os, re; print(re.search(r'[^\\]+$', os.getcwd(), re.M).group(0))"' ) do (
    set DIRNAME=%%C
)

if [%2]==[] (
    python%1 -m virtualenv env --prompt="(%DIRNAME%) "    
) else (
    python%1 -m virtualenv env --prompt="(%2) "
)
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
list from [[Batch - Python Virtual Environment]] AND -"Changelog"
````
