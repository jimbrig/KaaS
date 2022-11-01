---
Date: 2022-11-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/CMD", "#Topic/Dev/CLI"]
Alias: ["CMD - SQLPackage to DacPac"]
---

# CMD - SQLPackage to DacPac

*Source: *

```cmd
SET db="<database>"
SET pw="<password>"
SET server="<server>"
SET user="<dbuser>"
SET outfile=".\db.dacpac"

# Run SqlPackage
SqlPackage /a:extract /of:true /sdn:db /sp:pw /ssn:server /su:user /tf:outfile;
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
list from [[CMD - SQLPackage to DacPac]] AND -"Changelog"
```