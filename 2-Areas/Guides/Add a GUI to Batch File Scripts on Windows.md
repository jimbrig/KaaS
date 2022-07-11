---
Date: 2022-02-12
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Guide", "#Topic/Dev/OS/Windows"]
Alias: "Add a GUI to Batch File Scripts on Windows"
---

# Add a GUI to Batch File Scripts on Windows

Callback: [[3-Resources/Highlights/Readwise 1/Articles/How to Enhance Your Windows Batch Files by Adding GUI]]

## Contents

- [[#Getting Started with the Basics|Getting Started with the Basics]]
- [[#Native Windows Notifications|Native Windows Notifications]]
- [[#Message Boxes|Message Boxes]]
- [[#Input Boxes|Input Boxes]]
- [[#Custom GUI elements|Custom GUI elements]]
- [[#Appendix: Links|Appendix: Links]]


## Getting Started with the Basics

The following command format is used to execute a code-block on PowerShell silently. Also, it could be added into any batch script to execute PowerShell snippets. Therefore, if the user is running the batch script on a Windows version that supports PowerShell scripting, the specific code-block will be executed in PowerShell via the command prompt application.

```powershell
powershell -Command "& {<PowerShell code-block goes here>}"
```

## Native Windows Notifications

Windows toast notification is a great way to show the completion of a task or a long-running process instead of printing some text in the console.

*Source: [Win_toastNotification.bat (github.com)](https://gist.github.com/shalithasuranga/4dce626ceb04e7bfc56b20eb0405e32f/)*

```batch
@echo off 

powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Hello world', 'This is called from a batch script.', [System.Windows.Forms.ToolTipIcon]::None)}"
```

Produces the following:

![](https://i.imgur.com/VjkbjcX.png)

## Message Boxes

Native GUI-based message boxes can be used for displaying error messages, information regarding tasks, and also for asking decisions from the user in a user-friendly manner. If we use old-fashioned batch script commands, we often have to ask the user to type a specific key for each decision. The following batch script will display a basic message box.

*Source: [Win_messageBox1.bat (github.com)](https://gist.github.com/shalithasuranga/440a5fcd4dfafe0e33b2e5f2d563503a/)*

```batch
@echo off 

powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Hello World', 'This is an example', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}"
```

Produces the following:

![](https://i.imgur.com/i4uLVBl.png)

Furthermore, we can also detect which button was clicked by saving the output from the PowerShell interpreter to a batch script variable. But, batch scripting is not supporting direct assignments like Bash scripting on Linux platforms. Therefore, the easiest way is to create a temporary file to hold the output value. The following batch script will display a message box with a “Yes” button and a “No” button. Thereafter, according to the button that was clicked by the user, it will perform later actions accordingly.

*Source: [Win_messageBox2.bat (github.com)](https://gist.github.com/shalithasuranga/aa5fc661dda192015cfeb26d02807cf6/)*

```batch
@echo off

powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Hello', 'Hey', 'YesNo', [System.Windows.Forms.MessageBoxIcon]::Warning);}" > %TEMP%\out.tmp
set /p OUT=<%TEMP%\out.tmp
if %OUT%==Yes (echo Clicked Yes)
```

## Input Boxes

The `set` command can the used to capture input from the user to a variable. But usability will be improved for nontechnical users if the input is captured from a GUI-based textbox because it will support basic features coming from the operating system such as undo, redo, and copy-paste. Let’s write a batch script to display a captured user input entirely using GUI elements.

*Source: [Win_InputBox.bat (github.com)](https://gist.github.com/shalithasuranga/6b0a3b9b5b1b7bb992fcd003e2db0e95/)*

```batch
@echo off 

powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter your name:', 'Input box example')}" > %TEMP%\out.tmp
set /p OUT=<%TEMP%\out.tmp
set msgBoxArgs="& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('You have entered: %OUT%', 'Hello');}"
powershell -Command %msgBoxArgs%
```

Produces:

![](https://i.imgur.com/zXmN78e.png)

## Custom GUI elements

All the above demonstrations use pre-built UI elements. Even though you need to build custom dialog boxes, it is possible to implement with PowerShell commands because it offers bindings to .NET methods. Anything accomplished with .NET also could be implemented in a batch script via PowerShell code-blocks using this approach. 

*Source: [Win_CustomWindow.bat (github.com)](https://gist.github.com/shalithasuranga/8e974c226e3f494addc2a7e559f68689/)*

```batch
@echo off 

powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; $mainForm = New-Object System.Windows.Forms.Form; $mainForm.Text = 'Main Window'; $lbl = New-Object System.Windows.Forms.Label; $lbl.Text = 'Hello World'; $mainForm.Controls.Add($lbl); $mainForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen; $mainForm.ShowDialog()}"
```

Produces:

![](https://i.imgur.com/ERRAw85.png)

There is a minor issue with this method. This approach may slow down your batch files a bit because each GUI element such as a parent window or notification will create a separate process. However, that slowness can be ignored with the computation power of modern computers.

## WinToast

See Also: [mohabouje/WinToast (github.com)](https://github.com/mohabouje/WinToast)

*WinToast is a lightly library written in C++ which brings a complete integration of the modern toast notifications of Windows 8 & Windows 10. Toast notifications allows your app to inform the users about relevant information and timely events that they should see and take action upon inside your app, such as a new instant message, a new friend request, breaking news, or a calendar event.*

***

## Appendix: Links

- [[2-Areas/Code/Windows/_README|Windows]]
- [[Microsoft DOS]]
- [[Batch Scripting Tips and Tricks]]
- [[2-Areas/MOCs/PowerShell]]
- [[Development]]
- [[CLI Tools List]]

*Backlinks:*

```dataview
list from [[Add a GUI to Batch File Scripts on Windows]] AND -"Changelog"
```