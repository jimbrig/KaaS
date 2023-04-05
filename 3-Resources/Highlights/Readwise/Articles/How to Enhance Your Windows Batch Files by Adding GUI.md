# How to Enhance Your Windows Batch Files by Adding GUI

## Metadata

* Author: *Shalitha Suranga*
* Full Title: How to Enhance Your Windows Batch Files by Adding GUI
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/7287d89ebad6

## Highlights

**Basics**

The following command format is used to execute a code-block on PowerShell silently. Also, it could be added into any batch script to execute PowerShell snippets. Therefore, if the user is running the batch script on a Windows version that supports PowerShell scripting, the specific code-block will be executed in PowerShell via the command prompt application.

````powershell
powershell -Command "& {<PowerShell code-block goes here>}"
````

**Notifications**

*Source: [Win_toastNotification.bat (github.com)](https://gist.github.com/shalithasuranga/4dce626ceb04e7bfc56b20eb0405e32f/)*

````batch
@echo off 

powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Hello world', 'This is called from a batch script.', [System.Windows.Forms.ToolTipIcon]::None)}"
````

Produces the following:

![](https://i.imgur.com/VjkbjcX.png)
