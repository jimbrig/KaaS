---
Date: 2022-08-11
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/Bash", "#Topic/Dev/Linux", "#Topic/Dev/WSL", "#Topic/Dev/HowTo"]
Alias: []
---

# Bash - WSL - Set Default Browser to Windows

*Source: [How to use the browser in Windows as WSL's default - Boring Time](https://akimon658.github.io/en/p/2021/wsl-default-browser/)*

```bash
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser path/to/browser priority
```

For example,

```bash
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe 1

sudo update-alternatives --config x-www-browser
```

sets [[Google Chrome]] as the browser.

for me I use [[Edge Canary]] as my default browser so I ran:

```bash
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /mnt/c/users/jimmy/appdata/local/microsoft/edge\ sxs/application/msedge.exe 1

sudo update-alternatives --config x-www-browser
```

***

## Appendix: Links and References

- [[2-AREAS/Code/_README|Code]]
- [[Development]]
- [[Linux]]
- [[2-AREAS/Code/Bash/_README|Bash]]

***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2022