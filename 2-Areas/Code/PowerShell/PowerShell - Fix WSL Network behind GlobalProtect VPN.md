# PowerShell - Fix WSL Network behind GlobalProtect VPN

*Source: https://live.paloaltonetworks.com/t5/globalprotect-discussions/globalprotect-blocks-the-network-traffic-of-wsl2/td-p/354962*

 > 
 > I use WSL2 with an Ubuntu image. It works fine but when I establish a VPN connection by GlobalProtect, it cut the connection from the WSL image to the outside. We have no split tunneling and the connection to the devices behind the tunnel works fine from the Windows environment but not from WSL. And I'm unable to access the internet from WSL as well. Can somebody help me with this issue?

````powershell
Get-NetIPInterface -InterfaceAlias "vEthernet (WSL)" | Set-NetIPInterface -InterfaceMetric 1
Get-NetAdapter | Where-Object {$_.InterfaceDescription -Match "PANGP Virtual Ethernet Adapter #2"} | Set-NetIPInterface -InterfaceMetric 6000
````

---

## Appendix: Links

* *Code*
* [Development](../../MOCs/Development.md)
* [Windows Links](../../../0-Slipbox/INBOX/Windows%20Links.md)
* [Microsoft DOS](../../../3-Resources/Tools/Developer%20Tools/Shell/Microsoft%20DOS.md)
* *Windows Command Line*
* *WSL*
* *Scripts*
* [2-Areas/MOCs/PowerShell](../../MOCs/PowerShell.md)
* [Microsoft](../../MOCs/Microsoft.md)

*Backlinks:*

````dataview
list from [[PowerShell - Fix WSL Network behind GlobalProtect VPN]] AND -"Changelog"
````
