# CMD - SQLPackage to DacPac

\*Source: *

````cmd
SET db="<database>"
SET pw="<password>"
SET server="<server>"
SET user="<dbuser>"
SET outfile=".\db.dacpac"

# Run SqlPackage
SqlPackage /a:extract /of:true /sdn:db /sp:pw /ssn:server /su:user /tf:outfile;
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
list from [[CMD - SQLPackage to DacPac]] AND -"Changelog"
````
