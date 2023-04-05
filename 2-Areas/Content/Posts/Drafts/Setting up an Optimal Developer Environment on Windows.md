# Setting up an Optimal Developer Environment on Windows

![](https://i.imgur.com/WJGkrj1.png)

Setting up a fully featured, fluent, yet minimal developer environment tailored to your personal needs can be a daunting task in Windows 10 or 11.

This article attempts to provide a template checklist for anyone who desires a clean, optimized workstation running on Windows 10 or 11.

## Overview

Setting up the proper system on Windows 10/11 involves many various, interdependent steps, including but not limited to:

* Clean Installation of the latest Windows Update; optional, but recommend creating your own slimmed down version of the provided ISOs from Microsoft (can use tools such as [NTLITE](), [Hyper-V](), and custom setup configuration files)
* Updating the OS, Manufacturer Drivers, Security, and Runtimes
* Debloating unnecessary software and apps
* Installing and configuring core developer tools
* Enabling optional windows features for developers: specifically:
* Maintaining and decluttering
* Implementing a full-proof backup system
* Tracking scripts, configs, and dotfiles via Version Controlled dotfiles
* Taking thorough notes and documenting decisions made throughout the process

## Getting Started

Initially, you will need to walkthrough the steps to install the Windows OS onto your machine and set certain settings such as Wi-Fi, Privacy, and OneDrive. I will leave these out of the context of this document but would recommend disabling and reviewing the privacy settings. It is also common to initially utilize an offline user account instead of a linked Microsoft account to avoid linking your windows account and pre-existing settings/OneDrive.

### Update Windows and Enable Developer Mode

1. In Settings run Windows Update to update to the latest released Windows OS, restarting when necessary.
1. Enable Developer Mode from Settings > Update and Security > Developer Mode
1. Initialize Windows Insider Program, Dev Channel
1. Re-run windows updates, restarting when necessary.
1. Open Windows Store and update all necessary apps to latest versions

### Install Microsoft's Latest Open-Source Developer Tools

Microsoft has provided some amazing new open-source developer tools which we will install via `winget` the new Microsoft package manager.

In order to ease the process of implementing all of our commands, let’s improve our terminal and default shell by installing Microsoft’s open-source versions of [PowerShell](https://github.com/PowerShell) (Core) and [Windows Terminal](https://github.com/microsoft/terminal).

````powershell
winget install Microsoft.Powershell-Preview
winget install Microsoft.WindowsTerminalPreview
````

This is also a good time to install various other developer related software:

*Core Developer Tools from Microsoft:*

* Windows Package Manager `winget`
* Powershell Core (Preview)
* Windows Terminal (Preview)
* PowerToys (Preview)
* Visual Studio Code (Stable or Insiders)
* .NET/Visual Studio/NuGet and necessary runtimes.
* Azure Tools and Azure CLI

*Other Essentials*

* Git (for Windows) + LFS + Crypt + Secret
* Docker Desktop (Beta)
* WSL + Ubuntu
* Python
* Node.js
* R, RTools, RStudio
* GitKraken
* Github-CLI
* GCloud SDK

*Utilities:*

* SysEssentials

* Autoruns

* ProcessExplorer

* 7Zip

* Teracopy

* *Web Browsers:*

* Edge (Developer Edition)

* Firefox (Developer Edition)

* Chrome (Developer Edition)

## Debloating Pre-Installed CrapWare

\#Status/Todo 

---

## Appendix: Links

**See Also:**
