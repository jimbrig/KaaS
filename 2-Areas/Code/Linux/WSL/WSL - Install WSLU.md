---
Date: 2022-03-25
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/Linux", "#Type/Code/Bash", "#Type/Code/Script" "#Topic/Dev/Linux", "#Topic/Dev/WSL"]
Alias: ["WSL - Install WSLU"]
---

# WSL - Install WSLU

*Source: [wslu Wiki (wslutiliti.es)](https://wslutiliti.es/wslu/install.html)*

## Ubuntu

```bash
sudo apt update
sudo apt install ubuntu-wsl
```

## Kali Linux

```bash
sudo apt install gnupg2 apt-transport-https
wget -O - https://pkg.wslutiliti.es/public.key | sudo tee -a /etc/apt/trusted.gpg.d/wslu.asc
echo "deb https://pkg.wslutiliti.es/kali kali-rolling main" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt install wslu
```

***

## Appendix: Links

- [[Development]]
- [[3-Resources/Tools/Developer Tools/Linux/_README|Linux]]
- [[Bash]]
- [[Scripts]]
- [[Windows Subsystem for Linux|WSL]]
- [[2-Areas/Code/_README|Code]]
- [[Kali Linux]]
- [[Ubuntu]]
- [[WSL Initial Setup Notes]]
- [[Windows Developer Environment]]

*Backlinks:*

```dataview
list from [[WSL - Install WSLU]] AND -"Changelog"
```