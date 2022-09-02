---
Date: 2022-08-31
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: ["PowerShell - Fix WSL Network behind GlobalProtect VPN"]
---

# PowerShell - Fix WSL Network behind GlobalProtect VPN

*Source: https://live.paloaltonetworks.com/t5/globalprotect-discussions/globalprotect-blocks-the-network-traffic-of-wsl2/td-p/354962*

> I use WSL2 with an Ubuntu image. It works fine but when I establish a VPN connection by GlobalProtect, it cut the connection from the WSL image to the outside. We have no split tunneling and the connection to the devices behind the tunnel works fine from the Windows environment but not from WSL. And I'm unable to access the internet from WSL as well. Can somebody help me with this issue?

```powershell
Get-NetIPInterface -InterfaceAlias "vEthernet (WSL)" | Set-NetIPInterface -InterfaceMetric 1
Get-NetAdapter | Where-Object {$_.InterfaceDescription -Match "PANGP Virtual Ethernet Adapter #2"} | Set-NetIPInterface -InterfaceMetric 6000
```

***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[Development]]
- [[Windows Links]]
- [[Microsoft DOS]]
- [[2-Areas/Code/Windows CMD/_README|Windows Command Line]]
- [[2-Areas/Code/Linux/WSL/_README|WSL]]
- [[Scripts]]
- [[2-Areas/MOCs/PowerShell]]
- [[Microsoft]]

*Backlinks:*

```dataview
list from [[PowerShell - Fix WSL Network behind GlobalProtect VPN]] AND -"Changelog"
```