# A Preview of WSL in the Microsoft Store Is Now Available!

## Metadata

* Author: *devblogs.microsoft.com*
* Full Title: A Preview of WSL in the Microsoft Store Is Now Available!
* Category: #Type/Highlight/Article
* URL: https://devblogs.microsoft.com/commandline/a-preview-of-wsl-in-the-microsoft-store-is-now-available/

## Highlights

* We’ve already added in some new features that can be found in this preview such as:
  WSLg is now bundled as part of the WSL app!
  New wsl.exe --mount features!
  Add --mount --vhd to make mounting VHD files easier.
  Implement filesystem detection for wsl --mount. This change implements filesystem type detection if no --type is specified when using wsl.exe --mount.
  Add --name feature to wsl --mount. This change adds support for optionally naming a mountpoint when mounting a disk through WSL.
  Updated Linux kernel to 5.10.60.1
  Added progress indicator helper function used to show a Please Wait message with animated dots on the conversion process to show users that WSL is still running.
  Switched wsl --install to not require the --distribution argument. This change switches wsl --install to not require the --distribution argument but maintains support to avoid breaking existing scripts.
  Added wsl.exe --version command which displays relevant version information ([View Highlight](https://instapaper.com/read/1451971021/17708748))
* How to install and use WSL in the Microsoft Store
  First make sure you have these pre-requisites:
  Are using a Windows 11 build or higher (Windows build number 22000 or higher)
  Have the Virtual Machine Platform optional component enabled
  You can do this by running: dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all in an elevated PowerShell prompt
  Click on this link to go the WSL store page and click Install to install WSL, and then you can install a Linux distro of your choice to start using it. ([View Highlight](https://instapaper.com/read/1451971021/17708782))
* What are the future plans for WSL in the Windows image?
  Our goals are to make WSL in the Microsoft Store the best way to install and use WSL, as you’ll be able to get the latest updates fastest through that route, and in the long term we’d like to move WSL users to use the store version. However, in Windows 11 we are still supporting the inbox version of WSL as we keep developing WSL in the store. This means that if you’re using the inbox version you are still supported, and the WSL optional component is still present inside of Windows 11. We are going to be data driven, and will be using your feedback from this preview to help inform us for our future decisions with WSL in the Windows image in upcoming releases. ([View Highlight](https://instapaper.com/read/1451971021/17708785))
