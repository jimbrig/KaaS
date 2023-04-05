# Bash - WSL - Set Default Browser to Windows

*Source: [How to use the browser in Windows as WSL's default - Boring Time](https://akimon658.github.io/en/p/2021/wsl-default-browser/)*

````bash
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser path/to/browser priority
````

For example,

````bash
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe 1

sudo update-alternatives --config x-www-browser
````

sets [Google Chrome](../../../3-Resources/Tools/Web%20Browsers/Chrome/Google%20Chrome.md) as the browser.

for me I use *Edge Canary* as my default browser so I ran:

````bash
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /mnt/c/users/jimmy/appdata/local/microsoft/edge\ sxs/application/msedge.exe 1

sudo update-alternatives --config x-www-browser
````

---

## Appendix: Links and References

* *Code*
* [Development](../../MOCs/Development.md)
* [Linux](../../../3-Resources/Tools/Linux/Linux.md)
* *Bash*

---

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2022
