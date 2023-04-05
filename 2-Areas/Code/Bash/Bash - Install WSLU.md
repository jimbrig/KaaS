# WSL - Install WSLU

*Source: [wslu Wiki (wslutiliti.es)](https://wslutiliti.es/wslu/install.html)*

## Ubuntu

````bash
sudo apt update
sudo apt install ubuntu-wsl
````

## Kali Linux

````bash
sudo apt install gnupg2 apt-transport-https
wget -O - https://pkg.wslutiliti.es/public.key | sudo tee -a /etc/apt/trusted.gpg.d/wslu.asc
echo "deb https://pkg.wslutiliti.es/kali kali-rolling main" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt install wslu
````

---

## Appendix: Links

* [Development](../../MOCs/Development.md)
* *Linux*
* [Bash](Bash.md)
* *Scripts*
* [WSL](../../../3-Resources/Tools/Developer%20Tools/Linux/Windows%20Subsystem%20for%20Linux.md)
* *Code*
* *Kali Linux*
* *Ubuntu*
* [WSL Initial Setup Notes](../../../0-Slipbox/WSL%20Initial%20Setup%20Notes.md)
* [Windows Developer Environment](../../Guides/Windows%20Developer%20Environment.md)

*Backlinks:*

````dataview
list from [[WSL - Install WSLU]] AND -"Changelog"
````
