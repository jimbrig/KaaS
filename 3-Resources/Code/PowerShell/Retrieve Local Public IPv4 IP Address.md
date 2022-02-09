---
Date: 2022-02-09
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code", "#Topic/Dev"]
Alias: ["Retrieve Local Public IPv4 IP Address"]
---

# Retrieve Local Public IPv4 IP Address

*Source: *

Retrieve Local Public IPv4 IP Address via <https://ipify.org>'s API:

```powershell
(Invoke-WebRequest -uri "https://api.ipify.org/").Content
```

***

## Appendix: Links

- [[3-Resources/Code/_README|Code]]
- [[Development]]
- [[PowerShell]]

*Backlinks:*

```dataview
list from [[Retrieve Local Public IPv4 IP Address]] AND -"Changelog"
```