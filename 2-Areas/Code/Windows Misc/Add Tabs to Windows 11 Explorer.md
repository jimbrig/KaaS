# Add Tabs to Windows 11 Explorer

*Source: [franzageek/Vapor (github.com)](https://github.com/franzageek/Vapor/)*

1. Download [ViveTool](https://github.com/thebookisclosed/ViVe) from GitHub: [Release ViveTool v0.2.1](https://github.com/thebookisclosed/ViVe/releases/tag/v0.2.1)

Using [GitHub CLI](../../../3-Resources/Tools/Developer%20Tools/Command%20Line%20Utilities/GitHub%20CLI.md):

````powershell
gh release download --pattern '*.zip' --dir "$HOME\Downloads" -R thebookisclosed/ViVe 
````

2. Add Configuration for `34370472` of value `2`:

````powershell
cd ViVeTool
vivetool add config 34370472 2
````

![](https://i.imgur.com/5A6yhsY.png)

3. Restart

````powershell
Restart-Computer
````

## Batch File

````batch
@echo off
mode 130, 30
title Vapor 0.19
echo.
echo    Vapor is a script which, with the help of ViveTool (github.com/thebookisclosed/ViVe), lets you enable Tabs in File Explorer.
echo    This is just a script made by FranzaGeek to automate the enablement process.
echo.
echo    For this to work, you need to have at least Windows 11 build 22572. With older versions this would not work.
echo.
echo.
echo All you need is to follow a few on-screen steps. You have to choose whether to confirm or not.
echo Press C to begin. Else, to quit this program just press Q.
echo.
choice /c cq /N /M ^>
if %errorlevel%==1 goto 1step
if %errorlevel%==2 exit
:1step
echo.
echo Great! You chose to continue. Now, we have to copy the ViveTool folder to the C:\ folder.
echo Press C to copy the folder to the C:\ folder. Else, to quit this program just press Q.
echo.
choice /c cq /N /M ^>
if %errorlevel%==1 goto 2step
if %errorlevel%==2 exit
:2step
echo.
echo Awesome, you still want to continue! One moment, we're copying the ViveTool folder...
start CopyTool
timeout /t 3 /nobreak > NUL
echo Perfect! The folder has been copied. Now, we have to execute some commands. 
echo Don't worry: none of these commands are dangerous.
echo Press C to execute the necessary commands. Else, to quit this program just press Q.
echo.
choice /c cq /N /M ^>
if %errorlevel%==1 goto 3step
if %errorlevel%==2 exit
:3step
echo.
echo Amazing, you chose again to proceed! Executing commands...
start ApplyConfig
timeout /t 3 /nobreak > NUL
echo Done!
echo.
echo Alright, now we are at the last step. You have to restart the computer.
echo Press C to restart your PC now. Else, to quit this program and restart your PC later just press Q.
echo.
choice /c cq /N /M ^>
if %errorlevel%==1 goto :restart
if %errorlevel%==2 exit

:restart
echo.
echo Thanks for using Vapor. Bye!
timeout /t 2 /nobreak > NUL
shutdown /r /c "Vapor has scheduled a restart at your request. Press "Close" to restart."
exit
````

---

## Appendix: Links

* *Code*
* [Development](../../MOCs/Development.md)
* *Windows*
* [Microsoft DOS](../../../3-Resources/Tools/Developer%20Tools/Shell/Microsoft%20DOS.md)
* *Command Line*
* [2-Areas/MOCs/PowerShell](../../MOCs/PowerShell.md)

*Backlinks:*

````dataview
list from [[Add Tabs to Windows 11 Explorer]] AND -"Changelog"
````
