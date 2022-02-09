---
Date: 2022-02-09
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/CMD", "#Topic/Dev/CLI"]
Alias: ["Windows CMD - Extended Disk Cleanup"]
---

# Windows CMD - Extended Disk Cleanup

*Source: *

An alternative version of `cleanmgr` with deeper cleaning capabilities, administrative privileges, and runs in the background:

```cmd
cmd.exe /c Cleanmgr /sageset:65535 & Cleanmgr /sagerun:65535
```

***

## Appendix: Links

- [[3-Resources/Code/_README|Code]]
- [[Development]]
- [[Windows]]
- [[Windows CMD]]
- [[Command Line]]
- [[PowerShell]]

*Backlinks:*

```dataview
list from [[Windows CMD - Extended Disk Cleanup]] AND -"Changelog"
```