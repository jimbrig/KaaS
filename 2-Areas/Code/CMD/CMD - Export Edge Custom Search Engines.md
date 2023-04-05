# CMD - Export Edge Custom Search Engines

*Source: [custom-search-engines-backup/Export Edge Custom Search Engines.cmd at main · erbanku/custom-search-engines-backup (github.com)](https://github.com/erbanku/custom-search-engines-backup/blob/main/Import%20Export%20Edge%20Custom%20Search%20Engines/Export%20Edge%20Custom%20Search%20Engines.cmd)*

NOTE: Assumes the following:

* You want to export to the current working directory to a file named: `Edgekeywords.sql`
* Your Edge User Profile Location is `%LOCALAPPDATA\Microsoft\Edge\User Data\Profile 1`
  * This also assumed you are using the default Edge installation and not Edge Dev, Edge Canary, or Edge Beta.
* You have `sqlite3` installed and on your PATH.

````powershell
@echo off

set CURRENT_DRIVE=%~d0
set CURRENT_DIR=%~p0
if "%1"=="" (
	set DESTINATION=%CURRENT_DRIVE%%CURRENT_DIR%Edgekeywords.sql
) else (
	set DESTINATION=%~f1
)

set DESTINATION=%DESTINATION:\=/%
set TEMP_SQL_SCRIPT=%TEMP%\sync_edge_sql_script

pushd
echo Exporting Edge keywords to %DESTINATION%...
cd /D "%HOMEDRIVE%%HOMEPATH%\AppData\Local\Microsoft\Edge\User Data\Profile 1"
echo .output "%DESTINATION%" > %TEMP_SQL_SCRIPT%
echo .dump keywords >> %TEMP_SQL_SCRIPT%
"%CURRENT_DRIVE%%CURRENT_DIR%\sqlite3.exe" -init %TEMP_SQL_SCRIPT% "Web Data" .exit
del %TEMP_SQL_SCRIPT%
popd

if errorlevel 1 pause
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
list from [[CMD - Export Edge Custom Search Engines]] AND -"Changelog"
````
