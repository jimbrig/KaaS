---
Date: 2022-03-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/Batch", "#Topic/Dev"]
Alias: ["MediaCreationTool.bat"]
---

# MediaCreationTool.bat

*Source: https://gist.github.com/155b79dba8b8082445cc8587057f932a*

```batch
	@call :start MediaCreationTool.bat - latest version at pastebin.com/bBw0Avc4 or git.io/MediaCreationTool.bat
:: Universal MCT wrapper script by AveYo - for all Windows 10 versions from 1507 to 21H1!
:: Nothing but Microsoft-hosted source links and no third-party tools - script just configures a xml and starts MCT!
:: Ingenious support for business editions (Enterprise / VL) selecting language, x86, x64 or AiO inside the MCT GUI!
:: Changelog: 2021.08.04 done fiddling
:: - create iso directly; enhanced dialogs; args from script name or commandline; older MCT quirks ironed out!
:: - 21H1: 19043.928 / 20H2: 19042.631 / 2004: 19041.572 / 1909: 18363.1139 / 1903: 18362.356 / 1809: 17763.379

:: uncomment to skip gui dialog for MCT choice: 1=1507 to 12=21H1 - or rename script:  "21H1 MediaCreationTool.bat"
rem set MCT=2104

:: uncomment to start auto setup directly using suitable options  - or rename script:  "auto MediaCreationTool.bat"
rem set/a AUTO=1

:: uncomment to start iso file creation directly with options - or rename script:  "iso 20H2 MediaCreationTool.bat"
rem set/a ISO=1

:: uncomment and change autodetected MediaEdition - or rename script:   "enterprise iso 1909 MediaCreationTool.bat"
rem set EDITION=Enterprise

:: uncomment and change autodetected MediaLangCode - or rename script:  "de-DE home 19H2 iso MediaCreationTool.bat"
rem set LANGCODE=en-US

:: uncomment and change autodetected MediaArch - or rename script:  "x64 auto 21H1 Education MediaCreationTool.bat"
rem set ARCH=x64

:: uncomment and change autodetected KEY - or rename script / provide via commandline - not needed for generic keys
rem set KEY=NPPR9-FWDCX-D2C8J-H872K-2YT43

:: uncomment to disable online dynamic update on upgrade - or rename script: "no_update auto MediaCreationTool.bat"
rem set/a NO_UPDATE=1

:: uncomment to disable Windows.old undo [fast] - or rename script:  "no_undo no_update auto MediaCreationTool.bat"
rem set/a NO_UNDO=1

:: uncomment to not add $OEM$\ + auto.cmd to media - or rename script:  "no_oem iso Pro 2004 MediaCreationTool.bat"
rem set/a NO_OEM=1

:: comment to not use recommended windows 10 setup options that give the least amount of issues when doing upgrades
set OPTIONS=%OPTIONS% /Compat IgnoreWarning /CompactOS Disable /MigrateDrivers All /ResizeRecoveryPartition Disable /ShowOOBE None

:: comment to not postpone key entering / disable setup telemetry - note that /Eula is already handled in AUTO or ISO modes
set OPTIONS=%OPTIONS% /Pkey Defer /Telemetry Disable

:: comment to not unhide Enterprise for 1709+ in products.xml
set/a UNHIDE_BUSINESS=1

:: comment to not insert Enterprise esd links for 1607,1703 or update links for 1909,2004 in products.xml
set/a INSERT_BUSINESS=1

:: MCT Version choice dialog items
set VERSIONS= 1507, 1511, 1607, 1703, 1709, 1803, 1809, 1903 [19H1], 1909 [19H2], 2004 [20H1], 2009 [20H2], 2104 [21H1]

:: MCT Action choice dialog items
set ACTIONS= Auto Setup, Create ISO, Select in MCT

:begin
:: parse MCT choice from script name or commandline - accepts both formats: 1909 or 19H2 etc.
set V=1.1507 2.1511 3.1607 4.1703 5.1709 6.1803 7.1809 8.1903 9.1909 10.2004 11.2009 12.2104 8.19H1 9.19H2 10.20H1 11.20H2 12.21H1
for %%V in (%V%) do for %%/ in (%MCT% %~n0 %*) do if /i %%~xV equ .%%~/ set "MCT=%%~nV" & set "VID=%%~/"
if defined MCT if not defined VID set "MCT="

:: parse AUTO from script name or commandline - starts unnatended upgrade / in-place repair / cross-edition
for %%/ in (%~n0 %*) do if /i %%/ equ auto set/a AUTO=1
if defined AUTO set/a ACT=1 & if not defined MCT set/a MCT=12

:: parse ISO from script name or commandline - starts media creation with selection
for %%/ in (%~n0 %*) do if /i %%/ equ iso set/a ISO=1
if defined ISO if not defined AUTO set/a ACT=2 & if defined MCT set/a CREATE=1 

:: parse EDITION from script name or commandline - accepts one of the staged editions in MCT install.esd - see sources\product.ini 
set _=%EDITION% %~n0 %* & rem :: also accepts the alternative names: Home, HomeN, Pro, ProN, Edu, EduN
for %%/ in (%_:Home=Core% %_:Pro =Professional % %_:ProN=ProfessionalN% %_:Edu =Education % %_:EduN=EducationN%) do (
for %%E in ( ProfessionalEducation ProfessionalEducationN ProfessionalWorkstation ProfessionalWorkstationN 
 Core CoreN CoreSingleLanguage CoreCountrySpecific Professional ProfessionalN Education EducationN Enterprise EnterpriseN
) do if /i %%/ equ %%E set "EDITION=%%E")

:: parse LANGCODE from script name or commandline - accepts any words starting with xy-
for %%/ in (%~n0 %*) do set ".=%%~/" & for /f %%C in ('cmd/q/v:on/recho;!.:~2^,1!') do if "%%C" equ "-" set "LANGCODE=%%/"

:: parse ARCH from script name or commandline - no, it does not accept "both"
for %%/ in (%~n0 %*) do for %%A in (x86 x64) do if /i %%/ equ %%A set "ARCH=%%A"

:: parse KEY from script name or commandline - accepts the format: AAAAA-VVVVV-EEEEE-YYYYY-OOOOO
for %%/ in (%KEY% %~n0 %*) do for /f "tokens=1-5 delims=-" %%a in ("%%/") do if "%%e" neq "" set "PKEY=%%/"
if defined PKEY set "PKEY1=%PKEY:~-1%" & set "PKEY28=%PKEY:~28,1%"
if defined EDITION if "%PKEY1%" equ "%PKEY28%" set "KEY=%PKEY%"

:: parse NO_UPDATE from script name or commandline - dont download and apply latest LCU on upgrade [more C:\ space and might fail] 
for %%/ in (%~n0 %*) do if /i %%/ equ no_update set "NO_UPDATE=1"
if defined NO_UPDATE (set UPDATE=/DynamicUpdate Disable) else (set UPDATE=/DynamicUpdate Enable)

:: parse NO_UNDO from script name or commandline - dont create Windows.old undo data on upgrade [faster but less reliable] 
for %%/ in (%~n0 %*) do if /i %%/ equ no_undo set "NO_UNDO=1"
if defined NO_UNDO (set UNDO=/Uninstall Disable) else (set UNDO=/Uninstall Enable)

:: parse NO_OEM from script name or commandline - dont include $OEM$\ subfolder and auto.cmd in the created media
for %%/ in (%~n0 %*) do if /i %%/ equ no_oem set "NO_OEM=1"
:: hint: setup can run a tweaking script before first logon, if present at $OEM$\$$\Setup\Scripts\setupcomplete.cmd

:: detect current os_arch, os_langcode, os_edition, os_product, os_version
set "OS_ARCH=x64" & if "%PROCESSOR_ARCHITECTURE:~-2%" equ "86" if not defined PROCESSOR_ARCHITEW6432 set "OS_ARCH=x86"
call :reg_query "HKU\S-1-5-18\Control Panel\Desktop\MuiCached" "MachinePreferredUILanguages" OS_LANGCODE
for %%s in (%OS_LANGCODE%) do set "OS_LANGCODE=%%s"
call :reg_query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" "EditionID" OS_EDITION
call :reg_query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" "ProductName" OS_PRODUCT
call :reg_query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" "CurrentBuildNumber" OS_VERSION
for %%/ in (1507.10240 1511.10586 1607.14393 1703.15063 1709.16299 1803.17134 1809.17763 1903.18362 1909.18363 2004.19041
2009.19042 2104.19043) do if .%OS_VERSION% equ %%~x/ set/a OS_VERSION=%%~n/

:: show more responsive MCT + ACT pseudo-menu dialog or separate choice dialog instances if either MCT or ACT are set 
if "%MCT%;%ACT%"==";" call :choice.2x MCT "%VERSIONS%" 12 "MCT Version"  ACT "%ACTIONS%" 2 "MCT Action"  11 white dodgerblue 360
if %MCT%0 lss 1 if %ACT%0 gtr 1 call :choice MCT "%VERSIONS%" 12 "MCT Version"   11 white dodgerblue 360
if %MCT%0 gtr 1 if %ACT%0 lss 1 call :choice ACT "%ACTIONS%"   2 "%VID% Action"  11 white dodgerblue 360
if %MCT%0 gtr 1 if %ACT%0 lss 1 goto choice-0 = cancel
goto choice-%MCT%

:choice-12
set "VER=2104" & set "VID=21H1" & set "CB=19043.928.210409-1212.21h1_release_svc_refresh" & set "CD=2021/04/" & set "CC=1.4.1"
set "CAB=%\\%download.microsoft.com/download/f/d/d/fddbe550-0dbf-44b4-9e60-6f0e73d654c0/products_20210415.cab"
set "EXE=%\\%download.microsoft.com/download/d/5/2/d528a4e0-03f3-452d-a98e-3e479226d166/MediaCreationTool21H1.exe"
:: refreshed 19041 base with integrated 21H1 enablement package - release
goto process

:choice-11
set "VER=2009" & set "VID=20H2" & set "CB=19042.631.201119-0144.20h2_release_svc_refresh" & set "CD=2020/11/" & set "CC=1.4.1"
set "CAB=%\\%download.microsoft.com/download/4/3/0/430e9adb-cf08-4b68-9032-eafca8378d42/products_20201119.cab"
set "EXE=%\\%download.microsoft.com/download/4/c/c/4cc6c15c-75a5-4d1b-a3fe-140a5e09c9ff/MediaCreationTool20H2.exe"
:: refreshed 19041 base with integrated 20H2 enablement package to mainly bundle ChrEdge
goto process

:choice-10
set "VER=2004" & set "VID=20H1" & set "CB=19041.508.200907-0256.vb_release_svc_refresh" & set "CD=2020/09/" & set "CC=1.4"
if %INSERT_BUSINESS%0 gtr 1 set "CB=19041.572.201009-1946.vb_release_svc_refresh" & set "CD=2020/11/"
set "CAB=%\\%download.microsoft.com/download/7/4/4/744ccd60-3203-4eea-bfa2-4d04e18a1552/products.cab"
set "EXE=%\\%software-download.microsoft.com/download/pr/8d71966f-05fd-4d64-900b-f49135257fa5/MediaCreationTool2004.exe"
:: visible improvements to windows update, defender, search, dx12, wsl, sandbox
goto process

:choice-9
set "VER=1909" & set "VID=19H2" & set "CB=18363.592.200109-2016.19h2_release_svc_refresh" & set "CD=2020/01/" & set "CC=1.3"
if %INSERT_BUSINESS%0 gtr 1 set "CB=18363.1139.201008-0514.19h2_release_svc_refresh" & set "CD=2020/11/"
set "CAB=%\\%download.microsoft.com/download/8/2/b/82b12fa5-cab6-4d37-8167-16630c6151eb/products_20200116.cab"
set "EXE=%\\%download.microsoft.com/download/c/0/b/c0b2b254-54f1-42de-bfe5-82effe499ee0/MediaCreationTool1909.exe"
:: refreshed 18362 base with integrated 19H2 enablement package to activate usability and security fixes
goto process

:choice-8
set "VER=1903" & set "VID=19H1" & set "CB=18362.356.190909-1636.19h1_release_svc_refresh" & set "CD=2019/09/" & set "CC=1.3"
set "CAB=%\\%download.microsoft.com/download/4/e/4/4e491657-24c8-4b7d-a8c2-b7e4d28670db/products_20190912.cab"
set "EXE=%\\%download.microsoft.com/download/9/8/8/9886d5ac-8d7c-4570-a3af-e887ce89cf65/MediaCreationTool1903.exe"
:: modern windows 10 starts here with proper memory allocation, cpu scheduling, security features
goto process

:choice-7
set "VER=1809" & set "VID=1809" & set "CB=17763.379.190312-0539.rs5_release_svc_refresh" & set "CD=2019/03/" & set "CC=1.3"
set "CAB=%\\%download.microsoft.com/download/8/E/8/8E852CBF-0BCC-454E-BDF5-60443569617C/products_20190314.cab"
set "EXE=%\\%software-download.microsoft.com/download/pr/MediaCreationTool1809.exe"
:: rather mediocre considering it is the base for ltsc 2019; less smooth than 1803 in games; intel pre-4th-gen still buggy
goto process

:choice-6
set "VER=1803" & set "VID=1803" & set "CB=17134.112.180619-1212.rs4_release_svc_refresh" & set "CD=2018/07/" & set "CC=1.2"
set "CAB=%\\%download.microsoft.com/download/5/C/B/5CB83D2A-2D7E-4129-9AFE-353F8459AA8B/products_20180705.cab"
set "EXE=%\\%software-download.microsoft.com/download/pr/MediaCreationTool1803.exe"
:: update available to finally fix most standby memory issues that were present since 1703; intel pre-4th-gen still buggy
goto process

:choice-5
set "VER=1709" & set "VID=1709" & set "CB=16299.125.171213-1220.rs3_release_svc_refresh" & set "CD=2018/01/" & set "CC=1.1"
set "CAB=%\\%download.microsoft.com/download/3/2/3/323D0F94-95D2-47DE-BB83-1D4AC3331190/products_20180105.cab"
set "EXE=%\\%download.microsoft.com/download/A/B/E/ABEE70FE-7DE8-472A-8893-5F69947DE0B1/MediaCreationTool.exe"
:: plagued by standby and other memory allocation bugs, fullscreen optimisation issues, worst version of windows 10 by far
goto process

:choice-4
set "VER=1703" & set "VID=1703" & set "CB=15063.0.170317-1834.rs2_release" & set "CD=2017/03/" & set "CC=1.0"
if %INSERT_BUSINESS%0 gtr 1 set "CB=15063.0.170710-1358.rs2_release_svc_refresh" & set "CD=2017/07/"
rem set "XML=%\\%download.microsoft.com/download/2/E/B/2EBE3F9E-46F6-4DB8-9C84-659F7CCEDED1/products20170727.xml"
rem above refreshed xml often fails decrypting dual x86 + x64 - using rtm instead; the added enterprise + cloud are refreshed
set "CAB=%\\%download.microsoft.com/download/9/5/4/954415FD-D9D7-4E1F-8161-41B3A4E03D5E/products_20170317.cab"
set "EXE=%\\%download.microsoft.com/download/1/F/E/1FE453BE-89E0-4B6D-8FF8-35B8FA35EC3F/MediaCreationTool.exe"
:: some gamers still find it the best despite unfixed memory allocation bugs and exposed cpu flaws; can select Cloud (S)
goto process

:choice-3
set "VER=1607" & set "VID=1607" & set "CB=14393.0.161119-1705.rs1_refresh" & set "CD=2017/01/" & set "CC=1.0"
set "CAB=%\\%wscont.apps.microsoft.com/winstore/OSUpgradeNotification/MediaCreationTool/prod/Products_20170116.cab"
set "EXE=%\\%download.microsoft.com/download/C/F/9/CF9862F9-3D22-4811-99E7-68CE3327DAE6/MediaCreationTool.exe"
:: snappy and stable for legacy hardware
goto process

:choice-2
set "VER=1511" & set "VID=1511" & set "CB=10586.0.160426-1409.th2_refresh" & set "CD=2016/05/" & set "CC=1.0"
set "XML=%\\%wscont.apps.microsoft.com/winstore/OSUpgradeNotification/MediaCreationTool/prod/Products05242016.xml"
set "EXE=%\\%download.microsoft.com/download/1/C/4/1C41BC6B-F8AB-403B-B04E-C96ED6047488/MediaCreationTool.exe"
rem 1511 MCT exe works and can select Education - using 1607 one instead anyway for unified products.xml catalog 1.0 format
set "EXE=%\\%download.microsoft.com/download/C/F/9/CF9862F9-3D22-4811-99E7-68CE3327DAE6/MediaCreationTool.exe"
:: most would rather go with 1507 or 1607 instead as with a little effort can apply latest ltsb updates on all editions
goto process

:choice-1
set "VER=1507" & set "VID=1507" & set "CB=10240.16393.150909-1450.th1_refresh" & set "CD=2015/09/" & set "CC=1.0"
set "XML=%\\%wscont.apps.microsoft.com/winstore/OSUpgradeNotification/MediaCreationTool/prod/Products09232015_2.xml"
set "EXE=%\\%download.microsoft.com/download/1/C/8/1C8BAF5C-9B7E-44FB-A90A-F58590B5DF7B/v2.0/MediaCreationToolx64.exe"
set "EXE32=%\\%download.microsoft.com/download/1/C/8/1C8BAF5C-9B7E-44FB-A90A-F58590B5DF7B/v2.0/MediaCreationTool.exe"
if /i "%PROCESSOR_ARCHITECTURE%" equ "x86" if not defined PROCESSOR_ARCHITEW6432 set "EXE=%EXE32%"
rem 1507 MCT exe works but cant select Education - using 1607 one instead anyway for unified products.xml catalog 1.0 format
set "EXE=%\\%download.microsoft.com/download/C/F/9/CF9862F9-3D22-4811-99E7-68CE3327DAE6/MediaCreationTool.exe"
:: fastest for potato PCs
goto process

:choice-
:choice-0
%<%:e1 " CANCELED "%>% & popd & timeout /t 5 >nul & EXIT/B

:start
@echo off & title %~nx0 & color 1f & mode 120,30 & set "__COMPAT_LAYER=Installer"
:: self-echo top 1-20 lines of script
<"%~f0" (set/p \=&for /l %%/ in (1,1,22) do set \=& set/p \=& call echo;%%\%%)
:: lean xp+ color macros by AveYo:  %<%:af " hello "%>>%  &  %<%:cf " w\"or\"ld "%>%    for single \ / " use .%|%\  .%|%/  \"%|%\"
for /f "delims=:" %%\ in ('echo;prompt $h$s$h:^|cmd/d') do set "|=%%\" &set ">>=\..\c nul &set/p \=%%\%%\%%\%%\%%\%%\%%\<nul&popd"
set "<=pushd "%allusersprofile%"&2>nul findstr /c:\ /a" &set ">=%>>%&echo;" &set "|=%|:~0,1%" &set/p \=\<nul>"%allusersprofile%\c"
:: generate a latest_MCT_script.url file for manual update - could have made the script to update itself, but decided against it
for %%s in (latest_MCT_script.url) do if not exist %%s (echo;[InternetShortcut]&echo;URL=git.io/MediaCreationTool.bat)>%%s
:: baffling pastebin url filters..
for %%s in (tp://) do set "\\=ht%%s"
:: (un)define main variables
for %%v in (NO_UPDATE NO_UNDO NO_OEM ACT AUTO CREATE ISO DEFAULT EDITION KEY ARCH LANGCODE VID MCT XML CAB EXE) do set "%%v="
set OPTIONS=/Selfhost& exit/b
:process

:: parse gui / cmdline action
if %ACT% equ 1 set "ACTION=Auto Setup"    & set "AUTO=1" & set "ISO="  & set "CREATE="
if %ACT% equ 2 set "ACTION=Create ISO"    & set "AUTO="  & set "ISO=1" & set "CREATE=1"
if %ACT% equ 3 set "ACTION=Select in MCT" & for %%v in (CREATE AUTO ISO EDITION LANGCODE ARCH KEY) do set "%%v="  

:: cleanup MCT workfolder / temporary ESD
pushd "%~dp0" & mkdir MCT >nul 2>nul & pushd MCT 
del /f /q products.* 2>nul & set/a latest=0 & if exist latest set/p latest=<latest
echo,20210621>latest & if %latest% lss 20210531 del /f /q products*.* MediaCreationTool*.exe 2>nul

:: pre-run test of the built-in :DIR2ISO lean and mean snippet to automate iso creation, or fallback to manual selection in MCT 
if defined CREATE (mkdir test\iso & copy /y "%~f0" test\iso\tmp.txt & call :DIR2ISO "test" "test.iso") >nul 2>nul 
if defined CREATE for %%/ in (test.iso) do (rd/s/q test & del/f/q test.iso & if %%~z/0 lss 300000 set "CREATE=") >nul 2>nul
set FREE=0& for /f %%s in ('powershell -nop -c "[Math]::Round((Get-PSDrive $pwd.Path[0]).Free/1073741824)"') do set "FREE=%%~s"  
if defined CREATE if %FREE% LSS 5 set CREATE=& %<%:1e "INFO: Run from a drive with 5GB+ free to create iso directly "%>% &echo;
if defined ISO if not defined CREATE set/a ACT=3 & set "ACTION=Select in MCT" 

:: initial detected / selected media preset
if defined EDITION (set MEDIA_EDITION=%EDITION%) else (set MEDIA_EDITION=%OS_EDITION%)
if defined LANGCODE (set MEDIA_LANGCODE=%LANGCODE%) else (set MEDIA_LANGCODE=%OS_LANGCODE%)
if defined ARCH (set MEDIA_ARCH=%ARCH%) else (set MEDIA_ARCH=%OS_ARCH%)

:: edition fallback per MCT support and script choices - finally corrected
(set MEDIA_EDITION=%MEDIA_EDITION:Embedded=Enterprise%)
(set MEDIA_EDITION=%MEDIA_EDITION:EnterpriseS=Enterprise%)
if defined CREATE (set MEDIA_EDITION=%MEDIA_EDITION:ProfessionalWorkstation=Enterprise%)
if defined CREATE (set MEDIA_EDITION=%MEDIA_EDITION:ProfessionalEducation=Education%)
if %VER% leq 1709 (set MEDIA_EDITION=%MEDIA_EDITION:ProfessionalWorkstation=Enterprise%)
if %VER% leq 1709 (set MEDIA_EDITION=%MEDIA_EDITION:ProfessionalEducation=Education%)
if %VER% leq 1511 (set MEDIA_EDITION=%MEDIA_EDITION:Enterprise=Professional%)
if %VER% leq 1703 if %INSERT_BUSINESS%0 lss 1 (set MEDIA_EDITION=%MEDIA_EDITION:Enterprise=Professional%)
if %VER% leq 1511 if %UNHIDE_BUSINESS%0 lss 1 (set MEDIA_EDITION=%MEDIA_EDITION:Education=Professional%)
if not defined EDITION if "%MEDIA_EDITION%" neq "%OS_EDITION%" set "EDITION=%MEDIA_EDITION%"

:: generic key preset - only staged editions in MCT install.esd - see sources\product.ini
for %%/ in (%MEDIA_EDITION%) do for %%K in ( 
  YTMG3-N6DKC-DKB77-7M9GH-8HVX7.Core                      4CPRK-NM3K3-X6XXQ-RXX86-WXCHW.CoreN
  BT79Q-G7N6G-PGBYW-4YWX6-6F4BT.CoreSingleLanguage        N2434-X9D7W-8PF6X-8DV9T-8TYMD.CoreCountrySpecific
  VK7JG-NPHTM-C97JM-9MPGT-3V66T.Professional              2B87N-8KFHP-DKV6R-Y2C8J-PKCKT.ProfessionalN
  8PTT6-RNW4C-6V7J2-C2D3X-MHBPB.ProfessionalEducation     GJTYN-HDMQY-FRR76-HVGC7-QPF8P.ProfessionalEducationN
  DXG7C-N36C4-C4HTG-X4T3X-2YV77.ProfessionalWorkstation   WYPNQ-8C467-V2W6J-TX4WX-WT2RQ.ProfessionalWorkstationN    
  YNMGQ-8RYV3-4PGQ3-C8XTP-7CFBY.Education                 84NGF-MHBT6-FXBX8-QWJK7-DRR8H.EducationN
  NPPR9-FWDCX-D2C8J-H872K-2YT43.Enterprise                DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4.EnterpriseN
) do if /i %%~xK equ .%%/ set MEDIA_EDITION=%%~xK& call set MEDIA_EDITION=%%MEDIA_EDITION:.=%%& set "MEDIA_KEY=%%~nK"

:: detected / selected media preset
set MEDIA=& for %%s in (%EDITION%%LANGCODE%%ARCH%%KEY%) do (set MEDIA=%%s)
if defined MEDIA for %%s in (%MEDIA_EDITION%) do (set EDITION=%%s)
if defined MEDIA for %%s in (%MEDIA_LANGCODE%) do (set LANGCODE=%%s)
if defined MEDIA for %%s in (%MEDIA_ARCH%) do (set ARCH=%%s)
if defined MEDIA for %%s in (%MEDIA_KEY%) do (if not defined KEY set KEY=%MEDIA_KEY%)

:: show media preset label
%<%:f0 " Windows 10 Version "%>>%  &  %<%:2f " %VID% "%>>%  &  %<%:f1 " %CB% "%>>%
%<%:8f " %MEDIA_LANGCODE% "%>>%  &  %<%:3f " %MEDIA_EDITION% "%>>%  &  %<%:5f " %MEDIA_ARCH% "%>>%
%<%:11 ~%>% & echo;

:: download MCT and CAB / XML
set "DOWN=function dl($u,$f){$w=new-object Net.WebClient; $w.Headers.Add('user-agent','ipad'); try{$w.DownloadFile($u,$f)}"
set "LOAD=catch [Net.WebException] {write-host -non ';('; del $f -force -ea 0} finally{$w.Dispose()} } ; dl"
if defined EXE echo;%EXE%
if not exist MediaCreationTool%VER%.exe powershell -nop -c "%DOWN% %LOAD% $env:EXE 'MediaCreationTool%VER%.exe'" 2>nul
if not exist MediaCreationTool%VER%.exe %<%:1e " MediaCreationTool%VER%.exe download failed "%>%
if defined XML echo;%XML%
if defined XML if not exist products%VER%.xml powershell -nop -c "%DOWN% %LOAD% $env:XML 'products%VER%.xml'" 2>nul
if defined XML if not exist products%VER%.xml %<%:1e " products%VER%.xml download failed "%>%
if defined XML if exist products%VER%.xml copy /y products%VER%.xml products.xml >nul 2>nul
if defined CAB echo;%CAB%
if defined CAB if not exist products%VER%.cab powershell -nop -c "%DOWN% %LOAD% $env:CAB 'products%VER%.cab'" 2>nul
if defined CAB if not exist products%VER%.cab %<%:1e " products%VER%.cab download failed "%>%
if exist products%VER%.cab del /f /q products%VER%.xml 2>nul
if exist products%VER%.cab expand.exe -R products%VER%.cab -F:* . >nul 2>nul
echo; & set "err=" & for %%s in (products.xml MediaCreationTool%VER%.exe) do if not exist %%s set err=1
if defined err %<%:4f " ERROR "%>>% & %<%:0f " Check urls in browser | del MCT dir | unblock powershell | enable BITS serv "%>%
if defined err del /f /q products%VER%.* MediaCreationTool%VER%.exe 2>nul & pause & EXIT/B
if not defined err %<%:0f " %ACTION% "%>% . . .

:: configure products.xml in one go via powershell snippet
call :PRODUCTS_XML

:: repack XML into CAB
makecab products.xml products.cab >nul

:: pause couple seconds before launching MCT directly / via powershell runas admin
timeout /t 5 >nul

:: ===================================================================================================
:: "Auto Setup"    : after MCT authors sources, script starts auto.cmd setup (setupprep with OPTIONS)
:: "Create ISO"    : after MCT authors sources, script creates iso via built-in :DIR2ISO snippet
:: "Select in MCT" : script just provides products.xml and OPTIONS to MCT for processing, then quits
:: ===================================================================================================
if "Select in MCT" equ "%ACTION%" (start MediaCreationTool%VER%.exe %OPTIONS%& EXIT/B)

set OPTIONS=%OPTIONS% /Eula Accept /SkipSummary& set "LABEL=%VID%" & set "DIR=%SystemDrive%\ESD\Windows"
for %%s in (%EDITION% %LANGCODE% %ARCH%) do call set "LABEL=%%LABEL%% %%s"
(if %OS_VERSION% geq 2600 set "UNDO=") & (if %OS_VERSION% lss 1709 set "UNDO=")
set ACTION=/Action CreateUpgradeMedia %UPDATE% %UNDO% /MediaPath %SystemDrive%\ESD\Windows

:: not using /MediaEdition setup option in MCT version 1703 and older - handled via products.xml
if defined MEDIA for %%s in (%EDITION%)  do if %VER% gtr 1703 (set OPTIONS=%OPTIONS% /MediaEdition %%s)
if defined MEDIA for %%s in (%LANGCODE%) do if %VER% gtr 1703 (set OPTIONS=%OPTIONS% /MediaLangCode %%s)
if defined MEDIA for %%s in (%ARCH%)     do if %VER% gtr 1703 (set OPTIONS=%OPTIONS% /MediaArch %%s)

:: generate sources\PID.txt to preset EDITION on boot media - MCT install.esd indexes only, ProWS/ProEdu auto upgrade ONLY
if not defined AUTO for %%/ in (Workstation WorkstationN Education EducationN) do if "Professional%%/" equ "%EDITION%" set "KEY="
if not defined KEY (del /f /q PID.txt 2>nul) else (echo;[PID]& echo;Value=%KEY%& echo;;Edition=%EDITION%) >PID.txt

:: generate auto.cmd for auto upgrade 2nd stage - more reliably pass OPTIONS via setupprep and workaround to keep files and apps
 >auto.cmd echo;@echo off ^& title MediaCreationTool.bat: auto upgrade Windows 10 directly with suitable options
>>auto.cmd echo;
>>auto.cmd echo;set "MediaBuild=%VER%" ^& set "MediaEdition=%EDITION%" ^& set "dir=" ^& pushd "%%~dp0"
>>auto.cmd echo;for %%%%i in ("x86\" "x64\" "") do if exist "%%%%~isources\setupprep.exe" set "dir=%%%%~i"
>>auto.cmd echo;pushd "%%dir%%sources" ^|^| (pause ^& exit/b)
>>auto.cmd echo;set MediaEdition ^|^| goto upgrade
>>auto.cmd echo;
>>auto.cmd echo;:: cross-edition in-place / upgrade / downgrade check
>>auto.cmd echo;set CV64="HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
>>auto.cmd echo;set CV32="HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion"
>>auto.cmd echo;for /f "tokens=2*" %%%%R in ('reg query %%CV64%% /v EditionID   2^^^>nul') do set "EditionID=%%%%S"
>>auto.cmd echo;for /f "tokens=2*" %%%%R in ('reg query %%CV64%% /v ProductName 2^^^>nul') do set "ProductName=%%%%S"
>>auto.cmd echo;for /f "tokens=2*" %%%%R in ('reg query %%CV64%% /v CurrentBuildNumber 2^^^>nul') do set "Build=%%%%S"
>>auto.cmd echo;if /i "%%EditionID%%" equ "%%MediaEdition%%" goto upgrade
>>auto.cmd echo;if /i "%%EditionID%%" neq "Embedded" if "%%Build%%" gtr "1909" if "%%MediaBuild%%" gtr "1909" goto upgrade 
>>auto.cmd echo;if /i "%%EditionID%%" neq "Embedded" if "%%Build%%" gtr "2600" goto upgrade
>>auto.cmd echo;if /i "%%EditionID%%" equ "Embedded" set "MediaEdition=Enterprise"
>>auto.cmd echo;fltmc^>nul ^|^| (echo EditionID=%%EditionID%% [MISMATCH] - Run as administrator to bypass ^& timeout /t 10)
>>auto.cmd echo;
>>auto.cmd echo;:: cross-edition in-place / upgrade workaround to keep files and apps - 20H1/20H2/21H1 also supports downgrade
>>auto.cmd echo;(reg query %%CV64%% /v ProductName_UNDO ^|^| reg add %%CV64%% /v ProductName_UNDO /d "%%ProductName%%"  /f
>>auto.cmd echo; reg query %%CV64%% /v EditionID_UNDO   ^|^| reg add %%CV64%% /v EditionID_UNDO   /d "%%EditionID%%" /f
>>auto.cmd echo; reg add %%CV64%% /v EditionID /d "%%MediaEdition%%" /f ^& reg delete %%CV64%% /v ProductName /f  
>>auto.cmd echo; reg query %%CV32%% /v EditionID ^&^& (
>>auto.cmd echo;  reg query %%CV32%% /v ProductName_UNDO ^|^| reg add %%CV32%% /v ProductName_UNDO /d "%%ProductName%%" /f
>>auto.cmd echo;  reg query %%CV32%% /v EditionID_UNDO   ^|^| reg add %%CV32%% /v EditionID_UNDO   /d "%%EditionID%%" /f
>>auto.cmd echo;  reg add %%CV32%% /v EditionID /d "%%MediaEdition%%" /f ^& reg delete %%CV32%% /v ProductName /f
>>auto.cmd echo;)) ^>nul 2^>nul
>>auto.cmd echo;
>>auto.cmd echo;:upgrade
>>auto.cmd echo;start "auto" setupprep.exe %OPTIONS% %UPDATE% %UNDO% /MigChoice Upgrade /Auto Upgrade

:: run MCT /Action CreateUpgradeMedia with edition, then include auto.cmd / PID.txt / $OEM$ and start auto.cmd (if needed)
set "mct=%__cd__:'=''%mct.ps1"
 >mct.ps1 echo;cd -Lit(split-path '%mct%'); $AUTO='%AUTO%'-ne''; $OEM='%NO_OEM%'-eq''   
>>mct.ps1 echo;$DIR='%DIR:'=''%'; cmd "/c del /f/q $DIR & rd /s/q $DIR"
>>mct.ps1 echo;
>>mct.ps1 echo;$CV64='HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion'
>>mct.ps1 echo;$CV32='HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion'
>>mct.ps1 echo;if (%VER% -le 1703 -and '%EDITION%'-ne'') {
>>mct.ps1 echo;  sp $CV64 EditionID "%EDITION%" -force; rp $CV64 ProductName -force
>>mct.ps1 echo;  if (test-path $CV32) {sp $CV32 EditionID "%EDITION%" -force; rp $CV32 ProductName -force}
>>mct.ps1 echo;}
>>mct.ps1 echo;
>>mct.ps1 echo;$MCT=start -wait MediaCreationTool%VER%.exe '%OPTIONS:'=''% %ACTION:'=''%'
>>mct.ps1 echo;
>>mct.ps1 echo;"$DIR\x86\sources","$DIR\x64\sources","$DIR\sources" ^|%% {
>>mct.ps1 echo;  if (Test-Path "$_\setupprep.exe") {
>>mct.ps1 echo;    if (Test-Path "PID.txt") {copy -Path "PID.txt" -Dest $_ -force}
>>mct.ps1 echo;    if ($OEM -and (Test-Path '..\$OEM$')) {xcopy /CYBERHIQ '..\$OEM$' $($_+'\$OEM$')}
>>mct.ps1 echo;  }
>>mct.ps1 echo;}
>>mct.ps1 echo;if (%VER% -le 1703 -and '%EDITION%'-ne'') {
>>mct.ps1 echo;  sp $CV64 EditionID "%OS_EDITION%" -force; sp $CV64 ProductName "%OS_PRODUCT%" -force
>>mct.ps1 echo;  if (test-path $CV32) {sp $CV32 EditionID "%OS_EDITION%" -force; sp $CV32 ProductName "%OS_PRODUCT%" -force}
>>mct.ps1 echo;}
>>mct.ps1 echo;if ($OEM) {copy "auto.cmd" "$DIR\auto.cmd" -force} 
>>mct.ps1 echo;if ($AUTO) {start "auto.cmd" -WorkingDirectory $DIR}
powershell -win 1 -nop -c start -wait -verb runas powershell \""-win 1 -nop -c iex([io.file]::ReadAllText('%mct%'))\"" 2>nul
if defined AUTO (EXIT/B) else if not defined CREATE (EXIT/B) else (dir /b /s "%DIR%\*setupprep.exe" >nul 2>nul || EXIT/B)
powershell -win 0 -nop -c ";"

:: Create-ISO action via :DIR2ISO lean and mean snippet - only in automation scenario with "iso" argument set / parsed
call :DIR2ISO -dir "%DIR%" -iso "..\%LABEL%.iso"
if not errorlevel 1 rd /s/q "%DIR%" 2>nul
timeout /t 5 >nul

EXIT/B "ALL DONE!"
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:reg_query [USAGE] call :reg_query "HKCU\Volatile Environment" Value variable
(for /f "tokens=2*" %%R in ('reg query "%~1" /v "%~2" /se "," 2^>nul') do set "%~3=%%S")& exit/b


$:DIR2ISO: #,# [PARAMS] directory file.iso
set ^ #="$f0=[io.file]::ReadAllText($env:0);$0=($f0-split'\$%0:.*')[1];$1=$env:1-replace'([`@$])','`$1';iex(\"$0 `r`n %0 $1\")"
set ^ #=& set "0=%~f0"& set 1=%*& powershell -nop -c %#%& exit/b %errorcode%
function :DIR2ISO ($dir, $iso) { if (!(test-path -Path $dir -pathtype Container)) {"[ERR] $dir\ :DIR2ISO";exit 1}; $dir2iso=@"
 using System; using System.IO; using System.Runtime.Interop`Services; using System.Runtime.Interop`Services.ComTypes;
 public class dir2iso {public int AveYo=2021; [Dll`Import("shlwapi",CharSet=CharSet.Unicode,PreserveSig=false)]
 internal static extern void SHCreateStreamOnFileEx(string f,uint m,uint d,bool b,IStream r,out IStream s);
 public static void Create(string file, ref object obj, int bs, int tb) { IStream dir=(IStream)obj, iso;
 try {SHCreateStreamOnFileEx(file,0x1001,0x80,true,null,out iso);} catch(Exception e) {Console.WriteLine(e.Message); return;}
 int d=tb>1024 ? 1024 : 1, pad=tb%d, block=bs*d, total=(tb-pad)/d, c=total>100 ? total/100 : total, i=1, MB=(bs/1024)*tb/1024;
 Console.Write("{0,3}%  {1}MB {2}  :DIR2ISO",0,MB,file); if (pad > 0) dir.CopyTo(iso, pad * block, Int`Ptr.Zero, Int`Ptr.Zero);
 while (total-- > 0) {dir.CopyTo(iso, block, Int`Ptr.Zero, Int`Ptr.Zero); if (total % c == 0) {Console.Write("\r{0,3}%",i++);}}
 iso.Commit(0); Console.WriteLine("\r{0,3}%  {1}MB {2}  :DIR2ISO", 100, MB, file); } }
"@; & { $cs=new-object CodeDom.Compiler.CompilerParameters; $cs.GenerateInMemory=1 #,# no`warnings
 $compile=(new-object Microsoft.CSharp.CSharpCodeProvider).CompileAssemblyFromSource($cs, $dir2iso) 
 $BOOT=@(); $bootable=0; $mbr_efi=@(0,0xEF); $images=@('boot\etfsboot.com','efi\microsoft\boot\efisys.bin') #,# efisys_noprompt
 0,1|% { $bootimage=join-path $dir -child $images[$_]; if (test-path -Path $bootimage -pathtype Leaf) {
 $bin=new-object -ComObject ADODB.Stream; $bin.Open(); $bin.Type=1; $bin.LoadFromFile($bootimage)
 $opt=new-object -ComObject IMAPI2FS.BootOptions; $opt.AssignBootImage($bin.psobject.BaseObject); $opt.Manufacturer='Microsoft' 
 $opt.PlatformId=$mbr_efi[$_]; $opt.Emulation=0; $bootable=1; $BOOT += $opt.psobject.BaseObject } }
 $fsi=new-object -ComObject IMAPI2FS.MsftFileSystemImage; $fsi.FileSystemsToCreate=4; $fsi.FreeMediaBlocks=0
 if ($bootable) {$fsi.BootImageOptionsArray=$BOOT}; $CONTENT=$fsi.Root; $CONTENT.AddTree($dir,$false); $fsi.VolumeName='DVD_ROM'
 $obj=$fsi.CreateResultImage(); [dir2iso]::Create($iso,[ref]$obj.ImageStream,$obj.BlockSize,$obj.TotalBlocks) };[GC]::Collect()
} $:DIR2ISO: #,# export directory as (bootable) udf iso - lean and mean snippet by AveYo, 2021


$:CHOICE: #,# [PARAMS] indexvar "c,h,o,i,c,e,s"  [OPTIONAL]  default-index "title" fontsize backcolor forecolor winsize
set ^ #="$f0=[io.file]::ReadAllText($env:0);$0=($f0-split'\$%0:.*')[1];$1=$env:1-replace'([`@$])','`$1';iex(\"$0 `r`n %0 $1\")"
set ^ #=& set "0=%~f0"& set 1=%*& (for /f "usebackq" %%/ in (`powershell -nop -c %#%`) do set "%1=%%/")& exit/bat/ps1
function :CHOICE ($index,$choices,$def=1,$title='Choices',[int]$sz=12,$bc='MidnightBlue',$fc='Snow',[string]$win='300') {
 [void][Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); $f=new-object Windows.Forms.Form; $global:ret=''
 $bt=@(); $i=1; $ch=($choices+',Cancel').split(','); $ch |foreach {$b=New-Object Windows.Forms.Button; $b.Font='Tahoma,'+$sz
 $b.Name=$i; $b.Text=$_;  $b.Margin='0,0,9,9'; $b.Location='9,'+($sz*3*$i-$sz); $b.MinimumSize=$win+',18'; $b.AutoSize=1
 $b.add_GotFocus({$this.BackColor=$fc; $this.ForeColor=$bc}); $b.add_LostFocus({$this.BackColor=$bc; $this.ForeColor=$fc})
 $b.FlatStyle=0; $b.Cursor='Hand'; $b.add_Click({$global:ret=$this.Name;$f.Close()}); $f.Controls.Add($b); $bt+=$b; $i++}
 $f.Text=$title; $f.BackColor=$bc; $f.ForeColor=$fc; $f.StartPosition=4; $f.AutoSize=1; $f.AutoSizeMode=0; $f.MaximizeBox=0
 $f.AcceptButton=$bt[$def-1]; $f.CancelButton=$bt[-1]; $f.Add_Shown({$f.Activate();$bt[$def-1].focus()})
 $null=$f.ShowDialog(); $index=$global:ret; if ($index -eq $ch.length) {return 0} else {return $index}
} $:CHOICE: #,# gui dialog with inverted focus returning selected index - lean and mean snippet by AveYo, 2018 - 2021


$:CHOICE.2x: #,# [INTERNAL]
set ^ #="$f0=[io.file]::ReadAllText($env:0);$0=($f0-split'\$%0:.*')[1];$1=$env:1-replace'([`@$])','`$1';iex(\"$0 `r`n %0 $1\")"
set ^ #=&set "0=%~f0"&set 1=%*&(for /f "tokens=1,2 usebackq" %%i in (`powershell -nop -c %#%`) do set %1=%%i&set %5=%%j)& exit/b
function :CHOICE.2x { if (!(get-command :CHOICE -ea 0)) {iex($f0-split'\$\:CHOICE\:.*')[1]}; function :LOOP { $a=$args
 $c1 = @($a[0], $a[1], $a[2], $a[3],  $a[-4], $a[-3], $a[-2], $a[-1]); $1= :CHOICE @c1; if ($1 -lt 1) {return "0 0"}
 $c2 = @($a[4], $a[5], $a[6], $a[7],  $a[-4], $a[-3], $a[-2], $a[-1]); $2= :CHOICE @c2; if ($2 -ge 1) {return "$1 $2"}
 if ($2 -lt 1) {$a[2]=$1; :LOOP @a} }; :LOOP @args #,# index1 choices1 def1 title1  index2 choices2 def2 title2  font bc tc win
} $:CHOICE.2x: #,# MediaCreationTool.bat gui pseudo-menu via :CHOICE snippet, streamlined in a single powershell instance


$:PRODUCTS_XML: #,# [INTERNAL]
set ^ #="$f0=[io.file]::ReadAllText($env:0);$0=($f0-split'\$%0:.*')[1];$1=$env:1-replace'([`@$])','`$1';iex(\"$0 `r`n %0 $1\")"
set ^ #=& set "0=%~f0"& set 1=%*& powershell -nop -c %#%& exit/bat/ps1
function :PRODUCTS_XML { [xml]$xml = [IO.File]::ReadAllText("$pwd\products.xml",[Text.Encoding]::UTF8)
 $ver = $env:VER; $vid = $env:VID; ${\\}='ht'+'tp://'; $url = "${\\}fg.ds.b1.download.windowsupdate.com/"
#,# apply/insert Catalog version attribute for MCT compatibility
 if ($null -ne $xml.MCT) {
   $xml.MCT.Catalogs.Catalog.version = $env:CC; $root = $xml.SelectSingleNode('/MCT/Catalogs/Catalog/PublishedMedia')
 } else {
   $temp = [xml]('<?xml version="1.0" encoding="UTF-8"?><MCT><Catalogs><Catalog version="' + $env:CC + '"/></Catalogs></MCT>')
   $null = $temp.SelectSingleNode('/MCT/Catalogs/Catalog').AppendChild($temp.ImportNode($xml.PublishedMedia,$true))
   $xml = $temp; $root = $xml.SelectSingleNode('/MCT/Catalogs/Catalog/PublishedMedia')
 }
#,# apply/insert EULA url fix to prevent MCT timing out while downloading it (likely TLS issue under naked Windows 7 host)
 $eula = "${\\}download.microsoft.com/download/C/0/3/C036B882-9F99-4BC9-A4B5-69370C4E17E9/EULA_MCTool_";$rtf='_6.27.16.rtf'
 if ($null -ne $root.EULAS) {
   foreach ($i in $root.EULAS.EULA) {$i.URL = $eula + $i.LanguageCode.ToUpper() + $rtf}
 } else {
 $tmp = [xml]('<EULA><LanguageCode/><URL/></EULA>'); $el = $xml.CreateElement('EULAS'); $node = $xml.ImportNode($tmp.EULA,$true)
   foreach ($lang in ($root.Languages.Language |where {$_.LanguageCode -ne 'default'})) {
     $i = $el.AppendChild($node.Clone()); $lc = $lang.LanguageCode; $i.LanguageCode = $lc; $i.URL = $eula + $lc.ToUpper() + $rtf
   }
   $null = $root.AppendChild($el)
 }
#,# friendlier version + combined consumer editions label (not doing it for business too here as it would be ignored by mct)
 if ($null -ne $root.Languages) {
   if ($ver -gt 1703) {$CONSUMER = "$vid Home | Pro | Edu"} else {$CONSUMER = "$vid Home | Pro"} #,# 1511
   foreach ($i in $root.Languages.Language) {
     foreach ($l in $i.ChildNodes) {$label = $i.$($l.LocalName); $i.$($l.LocalName) = $label.replace("Windows 10", "$vid")}
     if ($null -ne $i.CLIENT)    {$i.CLIENT   = "$CONSUMER"}    ;  if ($null -ne $i.CLIENT_K)  {$i.CLIENT_K  = "$CONSUMER K"}
     if ($null -ne $i.CLIENT_N)  {$i.CLIENT_N = "$CONSUMER N"}  ;  if ($null -ne $i.CLIENT_KN) {$i.CLIENT_KN = "$CONSUMER KN"}
   }
 }
#,# unhide combined business editions in xml that include them: 1709 - 21H1; unhide Education on 1507 - 1511; better edition label
 if ($env:UNHIDE_BUSINESS -ge 1) {
   $BUSINESS = "$vid Enterprise | Pro vl | Edu vl" 
   foreach ($f in $root.Files.File) {
     if ($f.Architecture -eq 'ARM64') {continue} ; $edi =  $f.Edition; $loc = $f.Edition_Loc
     if ($edi -eq 'Enterprise' -or $edi -eq 'EnterpriseN') {$f.IsRetailOnly = 'False'; $f.Edition_Loc = $BUSINESS}
     if ($ver -le 1703 -and ($edi -eq 'Education' -or $edi -eq 'EducationN')) {$f.IsRetailOnly = 'False'} #,# 1511
   }
 }
#,# insert individual business editions in xml that never included them: 1607, 1703
 $lines = ([io.file]::ReadAllText($env:0)-split':PS_INSERT_BUSINESS_CSV\:')[1]
 if ($null -ne $lines -and $env:INSERT_BUSINESS -ge 1 -and 2104,2004,1909,1703,1607 -contains $ver) {
   $csv = ConvertFrom-CSV -Input $lines.replace('sr-rs','sr-latn-rs') |where {$_.Ver -eq $ver}
   $edi = @{ent='Enterprise';enN='EnterpriseN';pro='Professional';prN='ProfessionalN';edu='Education';edN='EducationN';
            clo='Cloud';clN='CloudN'}
  #,# insert business entries for 1607, 1703
   if ($ver -le 1703) {
     $files = $root.Files.File |where {$_.Edition -eq "Education" -and $_.Architecture -ne 'ARM64'}
     foreach ($e in 'ent','enN','pro','prN','edu','edN','clo','clN') {
       $items = $csv |where {$_.Client -eq $e}  |group Lang -AsHashTable -AsString; if ($null -eq $items) {continue}
       $cli = '_CLIENT' + $edi[$e]; $up = '/upgr/'; if ($ver -eq 1607 -and $e -like 'en*') {$up = '/updt/'} #,# .toupper();
       if ($e -like 'cl*') {$cli += '_RET_'} elseif ($e -like 'p*') {$cli += 'VL_VOL_'} else {$cli += '_VOL_'}
       if ($e -like 'cl*') {$BUSINESS = $edi[$e] -replace 'Cloud','S'} else {$BUSINESS = $edi[$e] -creplace 'N',' N'}
       foreach ($f in $files) {
         $arch = $f.Architecture; $lang = $f.LanguageCode; $item = $items[$lang]; if ($null -eq $item) {continue}
         $i = @(); "Size_$arch","Sha1_$arch","Dir_$arch" |foreach {$i += [string]($item |select -exp $_)}
         $c = $f.Clone(); $c.RemoveAttribute('id'); $c.IsRetailOnly = 'False'; $c.Edition = $edi[$e]
         $name = $env:CB + $cli + $arch + 'FRE_' + $lang; $c.Size = $i[0]; $c.Sha1 = $i[1]
         $c.FileName = $name + '.esd'; $c.FilePath = $url + $i[2] + $up + $env:CD + $name.tolower() + '_' + $i[1] + '.esd'
         $c.Edition_Loc = "$vid $BUSINESS"
         $null = $root.Files.AppendChild($c)
       }
     }
   }
  #,# update existing FilePath entries for 1909, 2004
   if ($ver -gt 1703) {
     $items = $csv |group Client,Lang -AsHashTable -AsString
     if ($null -ne $items) {
       foreach ($f in $root.Files.File) {
         if ($f.Architecture -eq 'ARM64' -or $f.Edition_Loc -eq '%BASE_CHINA%') {continue}
         $cli = '_CLIENTCONSUMER_'; $chan = 'ret'; if ($f.Edition -like 'Enterprise*') {$cli= '_CLIENTBUSINESS_'; $chan = 'vol'}
         $arch = $f.Architecture; $lang = $f.LanguageCode; $item = $items["$chan, $lang"]; if ($null -eq $item) {continue}
         $i = @(); "Size_$arch","Sha1_$arch","Dir_$arch" |foreach {$i += [string]($item |select -exp $_)}
         $name = $env:CB + $cli + $chan.ToUpper() + '_' + $arch + 'FRE_' + $f.LanguageCode; $f.Size = $i[0]; $f.Sha1 = $i[1]
         $f.FileName = $name + '.esd'; $f.FilePath = $url + $i[2] + '/upgr/' + $env:CD + $name.tolower() + '_' + $i[1] + '.esd'
       }
     }
   }
 }
#,# clone Professional / Enterprise to work around MCT quirks when host OS is ProEdu / ProWS / EnterpriseS / Embedded 
 if ($env:UNHIDE_BUSINESS -ge 1) {
   if ($ver -le 1709) {
     $clone  = 'ProfessionalEducation','ProfessionalWorkstation';   if ($ver -le 1511) {$clone  += 'Enterprise'}
     $cloneN = 'ProfessionalEducationN','ProfessionalWorkstationN'; if ($ver -le 1511) {$cloneN += 'EnterpriseN'}
     $pro = $root.Files.File |where {$_.Edition -eq "Professional" -and $_.Architecture -ne 'ARM64'}
     foreach ($f in $pro) {
       $clone |% {
         $c = $f.Clone(); $c.RemoveAttribute('id'); $c.IsRetailOnly='False'; $c.Edition="$_"; $null = $root.Files.AppendChild($c)
       }
     }
     $proN = $root.Files.File |where {$_.Edition -eq "ProfessionalN" -and $_.Architecture -ne 'ARM64'}
     foreach ($f in $proN) {
       $cloneN |% { 
         $c = $f.Clone(); $c.RemoveAttribute('id'); $c.IsRetailOnly='False'; $c.Edition="$_"; $null = $root.Files.AppendChild($c)
       }
     }
   }
   $ent = $root.Files.File |where {$_.Edition -eq "Enterprise" -and $_.Architecture -ne 'ARM64'}
   foreach ($f in $ent) {
     'EnterpriseS','Embedded' |% { 
       $c = $f.Clone(); $c.RemoveAttribute('id'); $c.IsRetailOnly='False'; $c.Edition="$_"; $null = $root.Files.AppendChild($c)
     }
   }
   $entN = $root.Files.File |where {$_.Edition -eq "EnterpriseN" -and $_.Architecture -ne 'ARM64'}
   foreach ($f in $entN) {
     'EnterpriseSN' |% { 
       $c = $f.Clone(); $c.RemoveAttribute('id'); $c.IsRetailOnly='False'; $c.Edition="$_"; $null = $root.Files.AppendChild($c)
     }
   }
 }
 $xml.Save("$pwd\products.xml")
} $:PRODUCTS_XML: #,# MediaCreationTool.bat configuring products.xml in one go


:: Insert business esd links in 1607,1703; UPDATE 1909 and 2004 by hand until an updated products.xml from microsoft
:: Following are condensed ver,edition,lang,sizes,hashes,dirs to be recomposed into full official ESD links for MCT
:: I have chosen to generate them on-the-fly here instead of linking to third-party hosted pre-edited products.xml
:: Can skip copy-pasting some or all entries if not interested in updating the esd links for specific versions
:: [Dev] ESD name has all except size; can get it with (Invoke-WebRequest -Uri $url -Method Head).Headers['Content-Length']
:PS_INSERT_BUSINESS_CSV:_,Ver,Client,Lang,Size_x64,Size_x86,Sha1_x64,Sha1_x86,Dir_x64,Dir_x86
::#,2004,ret,ar-sa,3424376474,2443826666,b318889964b75cef3a69ec75d28c7ef174157fac,34627c10a75e32440b8655fce3fa160b2561f81e,d,d
::#,2004,ret,bg-bg,3497891524,2461077962,89768c1292bb00d8bc59cc93a8bd31bf86fd0d60,b445575585fafced162431c8e491f35b20541083,c,d
::#,2004,ret,cs-cz,3489284116,2457579642,47089fda0dbd90725a7de74dcbe18edd8b10ffd5,b5a47c13798de6d47e39d82795d300c826e3e9b6,c,c
::#,2004,ret,da-dk,3507001682,2477282274,e4ce114cfd03048e730bd4662295ce780709392e,a59bd93c879daa86f99a1197de1ed1bbc9fab01a,d,d
::#,2004,ret,de-de,3614862366,2589284516,eac7aba66e17eed1405be412261ab2d232db0ac4,356c83719c01fa5bf454f6440a447dc226d354b2,c,c
::#,2004,ret,el-gr,3498039924,2468809106,e0ae333f9116e87cd0bc8cd6323bcfd18d793a79,26128c308750746770e9fa52a467dbebec6cd67b,c,d
::#,2004,ret,en-gb,3613068719,2567539510,f84e99690cc7b91e32ea810c5066a66d41d068b4,158d6aaffcbc3f05447d54bc29e0c87230e9a2e1,d,d
::#,2004,ret,en-us,3597848148,2571735054,06bd415350b963311586e1de57febcf257d9cff3,0f1b95cd0d53ba38bbcdc8c458ebfb87542d8451,c,c
::#,2004,ret,es-es,3609765180,2573133188,0f1a4d2a5a834ea061c0b181eae9222f41a1e7b2,755ac3d14b36876e382b8d889acfbb6d77c26447,c,d
::#,2004,ret,es-mx,3424062694,2442840954,db62d745b53bcc84ddea45736a2f49e7a44dbdf9,07c5d9d9a8c17d4ed831ca3e507c99e89226c05f,c,c
::#,2004,ret,et-ee,3456503784,2435272710,2ef7c92f0309c275f614b1575f25102c7ee16b84,f9e2a0dde19ce5a98ef62fa23850f2a1ea54fa7c,d,c
::#,2004,ret,fi-fi,3497923336,2464566905,43868003191ab607fd43a178379c322a0783355a,ea5f551e2b431bd528c7082e5f8aa80367ec9818,c,c
::#,2004,ret,fr-ca,3429493680,2463208232,e2f735e257f54396aad2d1fe3edb7d0b93503a58,a89f8c102b88384b797d8701a024af0959eb7860,c,c
::#,2004,ret,fr-fr,3609809548,2575907042,e054e10ceea4e5a745fa8af161b3cdb7e3b30ca0,97f0ac8d2938c959a40aff51fb00b015b13b31fb,c,c
::#,2004,ret,he-il,3387641100,2417997396,dbee3f52a33a1fa047e0ae2107cd1234b24b1bed,9744d0a39b5208975084d88bc62d13b85c8d8ab2,c,d
::#,2004,ret,hr-hr,3470072329,2438864354,75c479cde45f0947f1ba888ff43dc21645a60ba2,22068deb67b8f86e91242000158e3cf7c59f4743,d,c
::#,2004,ret,hu-hu,3479965078,2454964320,49af470384f50367f0da283b0a3cc8786c2ac579,66b3d6535d454ae1b46fc2cf1fc745cec4226096,c,c
::#,2004,ret,it-it,3545049736,2505035143,4c77371c4400e740a2c9587df2d9df702e634ef5,885c59294149196767752dc51cdada5f4e2436f0,d,c
::#,2004,ret,ja-jp,3567937591,2599663537,1a2dd0ed6cb646e9625542a85ffef6a3b85b6be2,5212ad20aaad1a86ec48ec74bf2401ea148e1f67,c,c
::#,2004,ret,ko-kr,3408943290,2428297516,309fcf1e62d221ef4aa46605720e4c98b3ebdf19,90f326a15fa2262821be32051d51f564738a8ab8,c,c
::#,2004,ret,lt-lt,3458060502,2434258738,3f58ab5dfd4d22c7608a53e4df20e09283120a85,0339147d76114c30afc8c534dd467b94d1f4061c,c,c
::#,2004,ret,lv-lv,3459293591,2433334878,82789facd7f365ac9b30c1ab817d0d2763eeedd3,d3a2550e3c9f1aff8145a407b9cfcd929275aa47,c,c
::#,2004,ret,nb-no,3486726744,2454241385,e7801f8aad13c147edaf4b81305cc903db1eac64,e706a4b35f245dad58cbe4a9995f4108863a3119,c,d
::#,2004,ret,nl-nl,3496217572,2459007239,fe71082799ca39b135ef9f79cbcd7f1c474ed2c9,bb5ced629bd6c4c355cba039f74390f96900b218,d,c
::#,2004,ret,pl-pl,3516672629,2478972583,6875b4cd91967e2ae66daf4bdb7b63b791fe1123,b4f1a225c49b01ead6f7ee29cea62f76d2fce28d,d,c
::#,2004,ret,pt-br,3429740362,2450903030,2860a35cb85fb005ccefe32227e5460f6dcd09b0,a096a5d0a35d4bf7e87f2a707f7cfc30998b5bd6,d,d
::#,2004,ret,pt-pt,3535617631,2494949674,ede953f70ab3486a942028aedcbf4b278db4d90b,bd8f218be4507c2dd628aba2bc1348041102d113,c,c
::#,2004,ret,ro-ro,3467100688,2438425587,5ecb0f93491e6b365452b098178b535f21700c3a,42d1e3d076ef3abc34881c910a235803230ed945,d,d
::#,2004,ret,ru-ru,3427409638,2445672042,958a2a4e08ef80cc8f51a6a2ec2e7cea9c1bdb46,ce67b93cc8a8607fcee480375180f98679d4f457,c,d
::#,2004,ret,sk-sk,3475940590,2440236480,2bc732a2e7f32361a5e5a8dfd8ef668a7e799021,4222b825ac5fd5f1d584f0a2b08d033fb3295a45,d,d
::#,2004,ret,sl-si,3479491576,2437397846,93b922173be1d4a1bd3e8deef75c4c2d677eb4ef,e98d3a38454a20a2d40ffae26d570b0be05e6a70,d,d
::#,2004,ret,sr-rs,3354336144,2378312436,94c1218ad5a0647e26f101bafa8fcc5aeb3a643d,90ccbf8f7809b15597ce3c81785b19c96c165a20,d,d
::#,2004,ret,sv-se,3495995024,2461632144,733d5a06b3a7e3b6d323f3de60d81358b37be3d5,a7f9db399893b571517a601d79ecebe2c3bc25ca,c,c
::#,2004,ret,th-th,3365441667,2391686522,536fcad0f98c0b33b9e4302262a11a53f0fb3341,107b585ad05e2ff14bbc179d893552a13da6d869,c,c
::#,2004,ret,tr-tr,3369376330,2388513330,e6bd2aa2fbc021259f0323565e161952f3e5ed87,0427edb24429c374e3578fd8353d96bca16e572d,d,d
::#,2004,ret,uk-ua,3371962482,2394813378,db50269f01b65a268b2d50315b6a0f930f8c36c5,e5633184a45a024e8823df4b16b43273df20f5bc,c,d
::#,2004,ret,zh-cn,3626392090,2639420517,97217085684d332e0e757b14a8aafb83ed4f9228,836fee7e6da1702baff5b1b70a31dbae282d073c,d,c
::#,2004,ret,zh-tw,3578643890,2599924262,357631c425711dfb56a056c83ede2fbf1f4b5ed4,4de762ee553d1215946f34a0ca151134dc99f524,c,d
::#,2004,vol,ar-sa,3337049672,2382164264,282a18b176760f7e4f558333b3b7fa5ca1160424,2d83c65b40d8541246a74347ea8f814f154fccd4,c,c
::#,2004,vol,bg-bg,3420008948,2405808668,7a5f62a3f9398759e0f8f9cd6082f5e7f6ed204b,e5502e4a3f055cc1302e46afe2c1606b68f3fa57,c,c
::#,2004,vol,cs-cz,3415536976,2403592642,295396d53ebd6b11f32f09221555f86136976128,fc6063ece178a987949b2ce467edb12fe3c00e09,c,d
::#,2004,vol,da-dk,3432382840,2418055684,cf4178a959823c7793da72655b112ed896aadcfc,36986250d3d4d7d23fa183fffb9b045304fe8588,d,d
::#,2004,vol,de-de,3545981312,2526462682,d8622fa89122a2e0e2c122bec7c7faab6552e981,a4b0cf2430fc5fb5d09f5929ba4e93299efc84d0,d,d
::#,2004,vol,el-gr,3421657688,2413797186,24be059f14afe6b7ee8b12c21fded81eec7eeb33,5d4021dd4c99d5abcbb9ca66fd6f5478e5554e14,c,c
::#,2004,vol,en-gb,3495718032,2489614296,a4d3fc298be25a876749f4d5c6adbb87adca612b,661023c661e83076134fb2076dbef1b13007e5ee,c,c
::#,2004,vol,en-us,3500119894,2494569638,a48a1cfc278325ab8a1c42ceedb987bbb80eda56,77dfcb554d1ae7c917ab15c1e9d0c2f4856ba9f5,c,c
::#,2004,vol,es-es,3515058812,2497868122,81da7db75f5a7489c94f3d4b6e9fe5a678763278,296d4ead8ac4560bae0fc2f23141c3b4628c8f82,c,c
::#,2004,vol,es-mx,3333388370,2381523108,12faa311404c11e48f0197c7301160055588421e,a33ee7767183bc5213e68948607546eb66ff36c2,d,d
::#,2004,vol,et-ee,3386938516,2374267332,48108700b1a40d847428d4306702eeb89ffdc122,87fe2d4d5371de17867db4e19578e1fb88d572b2,d,d
::#,2004,vol,fi-fi,3417568380,2404857436,93979b462f6e38fe7a3061848e13bcf3d7134a49,c7ca32216d18b1ac2296e26989106fce8aeb8adc,d,d
::#,2004,vol,fr-ca,3372327488,2406723436,c24875ff7d899d5d25ab2cc3161b29df93ceb907,88f10025b3fe0b3e6a4e88263942aae4e2425490,d,c
::#,2004,vol,fr-fr,3502615664,2494868554,78ac1b908a741e1c199843b1d178297befc53bef,24842f5b457f1588ab9d5d135b1c5399843a7242,d,c
::#,2004,vol,he-il,3326291904,2363110634,5e3e09ab97d25ebd43b7c7c64c3b2f6042a20a44,65f629dea18993e7e268a8ec219f57744e664281,c,c
::#,2004,vol,hr-hr,3394485528,2386293690,3957393bdc6a390b8ad8319a009482d634e9360e,8a2720641aed985b93418efade15b54f6fc4f6ef,d,c
::#,2004,vol,hu-hu,3410378170,2398604217,c0fd037cb6e71b3d8ff1c65cd0709ad4be70766b,8a515e58998334e61bc7da0e7575798303cf552d,c,c
::#,2004,vol,it-it,3456571166,2449850778,146c91ea307ae320d92fe1de52ea6dc1c21ef9ed,e46d46f366ca52a55a333446346fa44ce9ca4b92,c,d
::#,2004,vol,ja-jp,3516513370,2555241626,0d240e868c78b6657f386764bd64c1c0af2928b3,a4deb7d5ae34fb573c2e2608c6f03949ebdb3912,c,d
::#,2004,vol,ko-kr,3340000358,2382413742,67249288c44f559383c965f29aa7345c2ab4986c,ad31a542bb8ba7ab4f3d588fd1724e5077396480,d,d
::#,2004,vol,lt-lt,3374755582,2381555458,89158b640c7abf5d6ca555128e5a79315937be82,1a0392412c4686e8a2bb7b03414f6573c2c7cae0,d,d
::#,2004,vol,lv-lv,3376297534,2378948437,745fbbb5342bc0faf920933b5765cd46d0a4158e,cb956ea1f98a3b7abdf08cc8d8f46da1518a1e36,d,d
::#,2004,vol,nb-no,3412829848,2393852905,7ab759beab49fca69bbe4a237f8b22b0ad727e5a,69484d076fa1c02dcc65aefee68c0185f9de0357,c,d
::#,2004,vol,nl-nl,3410125156,2403615762,8174ede338619dae1d12ef2598cfc7efd5252e04,90238ad4dfdf83e9ebb532c56c54b6a3998dbd0f,d,c
::#,2004,vol,pl-pl,3434908644,2423333360,19edb7eb5299ad68084f81195fa71a8c138f0928,3984fc3d439902a6a9036d37a38c3c164470971d,c,c
::#,2004,vol,pt-br,3338185264,2384769636,0d9440dc88ac9bc801bd7bd2447d2c0b8a522794,ced8909d445026b240c7ae8bba928876d1592dae,d,d
::#,2004,vol,pt-pt,3431843388,2419892541,c393edfb10954926d28d52524ae46564a9e30313,1dbd60386a2ebe8c55bb7ef768ebc6899c570120,d,d
::#,2004,vol,ro-ro,3388179067,2387319172,770d4f485f0ef4d1cb2ef308bce57dab25b6b356,072034bfe8b6bc8c3091c81a601189106c8a6244,d,c
::#,2004,vol,ru-ru,3337179298,2379751666,ab11d756a8df20207fb54bda40844d4c24578bdf,0df5eadfb28ce196f9537c1538f49310f5aa0795,d,c
::#,2004,vol,sk-sk,3393372124,2390659820,c811826b28d6b5fcac627af8f9f17b9ec1d2b44d,ada3ae7425e811bebcbe37578360ad614e21e720,d,d
::#,2004,vol,sl-si,3398150744,2390916654,0bd241b3581f18103e5666acacbfa2192dc40939,75810797378b6617af7ce70bb6c7c3f128d15c29,d,d
::#,2004,vol,sr-rs,3258181170,2317685258,9bed7c7572427f5799d344e084857ea804f50c2e,2cc9fdef0b0e1cb0f88059007bb89dbc1890f6ac,c,d
::#,2004,vol,sv-se,3416343626,2402913840,a539d19e9b7ed95f1964c52475c79bcf3e37ef7c,015b5031c9179fcb9bebb12fb3459eac450fa5c4,d,c
::#,2004,vol,th-th,3290469514,2333566872,5176637227958a753c31ee24b058c6b22a8577fa,5c3af190420d84d4fdc2d7df0ce7cfa0d1ac0a4f,c,d
::#,2004,vol,tr-tr,3284251716,2324670322,5bdb765df04960bfa3485620915bbb70250b884e,697ade3f5f60e132efb440ec4b39829daa6d072b,c,c
::#,2004,vol,uk-ua,3286815020,2331143230,d661873706320af9226e0e9d94eebbc0fadc46ef,d3ca8eac86fa768f46e38af53dcec7b7c4c3450d,c,c
::#,2004,vol,zh-cn,3535283706,2584167773,f3515d1cb0ab219628c2a18e03fc75cb7dc11b86,b9a4cd37887f3fdf0715f2e0a5126b11e8f7575c,c,d
::#,2004,vol,zh-tw,3515637448,2554871592,4cda25b41f80e6d091135c43d90075bea1ebb8e9,746713766579000c9f9882179e8e907bfd995e67,c,d
::#,1909,ret,ar-sa,3534195534,2503681828,52fabba21d833ca1746fe01a9e140edc2384d2f8,b919ebda0e93697c8e07f45715c34d53a4550e18,c,c
::#,1909,ret,bg-bg,3616720365,2536193716,ecbaddb64333432ff362ba648a047126dc6d86a4,cf73a79d3e648c099b00a95b765967a2ab568f6e,c,c
::#,1909,ret,cs-cz,3596259408,2539164455,c6d216e87897543cd93c3849a2bfe1ea43f5a196,ca51e4668344315fdf76e1699885f80f7526915a,c,d
::#,1909,ret,da-dk,3626744664,2557337496,00986cd4dc16a7c63a9c38301aa99dc43b6da7fc,4539ccc6ec355dc9f6f9cc9f1bfea9b93ff06625,c,c
::#,1909,ret,de-de,3753625660,2653304701,d8be4510cda39d81db1db6a48cf55de0a48bb29b,9e20b40d3b3f1772d2e948a69de7580f16dc8c03,c,c
::#,1909,ret,el-gr,3625490491,2558937416,9644e53938815aca6294cc831c79200e4047c337,0d72241839cf34efe3633131a83656b4e92d579b,d,c
::#,1909,ret,en-gb,3726999678,2634727632,b58c7afb818787d7b637e0fa0536c290cb954b7c,d0a833ac07840929914661ed9c2c4e152a0aa43e,d,d
::#,1909,ret,en-us,3746732457,2646270866,170e462a455d70ca336bf4675c1fec02a21a9d67,c8393ee4bcb304ec61b5a8fb0198b60db36b4435,d,d
::#,1909,ret,es-es,3756800607,2650060364,ba78c4d274f2d81261a8a7f21217db93e11381e4,d7716927da2cea74807d080fbccb491ba1d8a897,d,c
::#,1909,ret,es-mx,3521473841,2523667818,10691b1f9528f21057bd3f8ff6a7e0a73dc3a6e6,95b379a02a112dee64bcdd5835fa06e8486e3b4f,d,d
::#,1909,ret,et-ee,3594420935,2517716050,e616b862e1c6889c7866fd288de94e1784f0b495,7cbded82f7c385535e50d471fba962ae009b4a38,c,d
::#,1909,ret,fi-fi,3598140463,2541038274,89647853e0a23b424df7c5d72b4ae20b3c41571d,a0552a455e7787aa5b874bc48310f844f8f65df8,c,d
::#,1909,ret,fr-ca,3547183350,2518932854,d02e9629c75a8668b1159bfaf67b64154e5a4a10,f4e2819c95f5bb788af96460b6e233adabafdaa4,c,d
::#,1909,ret,fr-fr,3757903522,2641536922,b52adfb7c2df14fbaaa1e7d3a8e6e8148283fb61,707ea14c6d9df9ec5f65927ea40bf6ff5f010b4c,d,d
::#,1909,ret,he-il,3499149195,2466957942,d73481b14d2a7edf88684e796fbdefce13e83865,4da96e9cb07d752ffee259c3f73c8e7fb277f9c9,c,c
::#,1909,ret,hr-hr,3601816053,2518725064,700f00793805cf91ee1433df7c47cf9938cd8c6a,d7fbc5fcc4ba5f87e5e27e5beb051ca41e34c717,c,c
::#,1909,ret,hu-hu,3606339666,2527574058,e0ece35475ef451705b078c8dfb87ce5b208c456,7f2fcbfbb210f071ccec0231af6ff061c4eb0927,d,d
::#,1909,ret,it-it,3659368504,2586153428,e4df1283e85ee82ca3e6a4ff8454709d0619e886,4a9c58e4a503502422b0df5d5f557b6d3e33e206,c,d
::#,1909,ret,ja-jp,3717942762,2722824559,940c15520159b71a4f902598b6fb11412aef03e8,2c2163574fb5e92b703b121a3f41f735e0eaed9c,c,c
::#,1909,ret,ko-kr,3509599307,2507662974,c6a9f46be961b555b02157f6d6564855d4ac2087,0c9f2e5c98a0772ec30d5e1a12a21abaa53ec14d,c,d
::#,1909,ret,lt-lt,3605328560,2525623222,77068837398c1bd8745a0fff7912bdd7a5af5f5a,09cf2972e2d643829bdcf0df2c4c31244a16a042,c,c
::#,1909,ret,lv-lv,3603336860,2524075145,b32fcc646c5903fe5f2cb0965064b7b4db41deaa,d9e922761da4550f3b2c067533e7f72664183818,c,d
::#,1909,ret,nb-no,3598008516,2537410248,d5823fadefe86de56f3b9e4ed82d2f537ffe6930,c1cc612b2d082e78e45c394ef45bbcdb2eea5851,d,c
::#,1909,ret,nl-nl,3602015901,2540847107,f16c02cd37e28d62d7cbae068b3665d711974498,8ead85f9e8ffb92f780ac4af6568972328224fe1,c,d
::#,1909,ret,pl-pl,3623954742,2562478387,32a2f20346023e15d3012c9b763f085d96d8cea3,5b2eabda21109a11d40c75d682e19580cff75e76,c,c
::#,1909,ret,pt-br,3526360750,2511295626,45dc921d718f454552f594a5118f1eff50e980ec,dba75f476ef36f27500ba89dd79e5e6a168e1dc5,c,c
::#,1909,ret,pt-pt,3654633787,2580822457,58dea38a0acc405ed3ff7d7f0bf57c971057ab5f,150b11cd62240290eef26234a9f940b4b9741f94,c,c
::#,1909,ret,ro-ro,3608412362,2517617112,775499dcfef68773c0981a601f3e750eb163a78e,0ee4b2af13c06d5baec4b2d3313baefb73a34df5,d,c
::#,1909,ret,ru-ru,3526653960,2520449336,7b09780c580b31b6c029f8bab6fdcd38300edb7a,d4d68912161ba7e774c1ae8bc2fb9b409f26ee37,c,c
::#,1909,ret,sk-sk,3592875792,2532722296,4b0519c5d29cd14ee60d569a63a61210714446ac,7d076f20902518c79e5c164db884ffd428e747ad,c,c
::#,1909,ret,sl-si,3590885252,2531509710,5d0a0450f5e812bd34f64d8baa329036cd57e218,db93a8696baf9f82099a08514186201db10b58fe,d,c
::#,1909,ret,sr-rs,3473762820,2459536778,46c0560c00a8d1610e80855989d3f82d613e949c,56f8d491ca221c6c24397cf575e0072edb62fbcb,d,d
::#,1909,ret,sv-se,3607556388,2539084928,a9150141b66cc5f777d1d25df41aaace1b6e7e4c,3a6733a0e6e671c39ce01330b67e7dd458b3b4db,c,c
::#,1909,ret,th-th,3473959714,2470289032,136e0b238ad6c9f68d8949b4e66e0a5ab824fd72,658a7a457de843392ab1412df9d36901dec962b2,d,d
::#,1909,ret,tr-tr,3454874782,2473688877,22a6aabed8919305484c64b721765594f22ce3bf,93782a360ca1ca008d02d3c564972eb4a98b37a8,c,d
::#,1909,ret,uk-ua,3480799111,2480365333,231667487f5d1ee0b628eb8f37e431e7f0b8d320,8cee39824bafe5385d537ea19634610571bc3a84,c,d
::#,1909,ret,zh-cn,3743699182,2727802108,2fab0741463c85d6c98e29942e1164aece5ea4a6,35aefd6712b6c9e4af8962c4a66dc147ca854fa3,c,c
::#,1909,ret,zh-tw,3695699407,2682296155,2fee332a79cf34665d0f828ccaf4516d28b0c85b,71f255dde4f7bf187d0ab6993b92afbc73870396,d,c
::#,1909,vol,ar-sa,3438487182,2463877856,44b7508dbd428c3770a4c6541a22e771880023f7,f6e7e559babf4b340dadd9167b7bd44b3392b48a,c,c
::#,1909,vol,bg-bg,3555503804,2478427478,18abc38b8244bd1983f0df9ccfed2fcae93dd5c4,43bd73e4967a0ffff46fdc30cb129cbcf21ec5b8,c,c
::#,1909,vol,cs-cz,3544206016,2456114546,7ea76b661002d51092d305d121a11bf3caf95ce7,18172af53696c48b87c88fe71890a1dcca493ae9,d,d
::#,1909,vol,da-dk,3548513556,2479829852,da3d602521690d82a22f169819951aea50674aa1,531fac95b3bc738e1c76fb13eec030c903e17819,d,c
::#,1909,vol,de-de,3688176224,2616340732,12d01c5ba4a9e496d113e4b16f407255c724ba72,8b65ec3845877f004ed1b024aa378c803c0d710a,d,d
::#,1909,vol,el-gr,3558884298,2481087098,7bb6a3ac13772230b607a4e483452a3d3e3e2756,53be030536e98a2c8131e3a40f53de117adc2c16,c,c
::#,1909,vol,en-gb,3624244211,2565433673,1afd7d55f9980e95c968699fb9d6a83f7fc1ca02,d098c781e57d62a9a9fd43afd0d5b8d4a50907ba,d,d
::#,1909,vol,en-us,3626567900,2586064754,6e83a5e8f3ca99b74467e51cc9f5cf4f8e5de476,d29c815c75e7d1e5ab9937704596f0bd97b45e2d,d,d
::#,1909,vol,es-es,3650584272,2599419212,2891d81c1a3690dac9dd62ce89977f94712db24e,c5855501e2374986e43c31172c3f1b8baf6e3a93,d,c
::#,1909,vol,es-mx,3430336908,2436459674,57503381aeb77cccf8294f4dafeab74cbe0ef950,e4d9102abc0f75c7c9c32c8395a39f41e07474c0,c,c
::#,1909,vol,et-ee,3518112390,2449000822,cbafb8998c1defd62edcf948d86117f3f5b4203a,4c4f949134b0e9d76203a78f3a9534c4c1749a11,c,c
::#,1909,vol,fi-fi,3543527114,2459816940,1c4873c5a5530be8b5a76fa5b3fe2fd60f5140cb,b587bfee033d54417305058f17a253be7ad57eb1,d,d
::#,1909,vol,fr-ca,3464877292,2486610154,751ad373801a67360eba3f7592c31f22715ca093,34928d27c7896afcd52b5df00cd8826beefc254f,c,d
::#,1909,vol,fr-fr,3625088635,2566787963,ebb8d09cc257a72fec8af3b672c0fffdefaac9eb,f4bdb4451d69216d4257b9bbbbdd246423b94118,d,d
::#,1909,vol,he-il,3418411702,2457925586,dfdb260ac42541834d64fba7c92fe9a3f44433a8,600f2217cf78951733e3c42f42ce768b357a2949,d,d
::#,1909,vol,hr-hr,3527137724,2460277762,be0e2ae7e64ab3e2f2cc887387137f26a23445ce,6a2b171dce7a6dac99b3351e1b4d9a6f06df3b77,d,c
::#,1909,vol,hu-hu,3539765872,2476271612,a8d08956fcea906d14a729927b9a4ff972c29351,017a35c75bb3691ef95d2012dbcbe19625fe48da,c,c
::#,1909,vol,it-it,3589744297,2511290334,3e5388a5b88a58f91fa46da5c0fc7127fe2a7529,4eb11a6b4213ed880da40e5d58002e4f27e30cfb,c,c
::#,1909,vol,ja-jp,3659614104,2658113529,47e797fef4015a2f8a8e047aac1bca08c959defb,bd3d9d8f4075959429984111c46abab750ca0ee2,c,c
::#,1909,vol,ko-kr,3449851782,2461608809,9cb9303f4adbe0fdd6fd6ea0e4c65fc574678e8b,6f9aeeb5c04ab2f2c4aae5135cd8137189c67f3d,d,d
::#,1909,vol,lt-lt,3518768755,2449382022,b5a117d824cb8694d41a45d97aa29b3a4911e602,c3d0b1200b17f4488fa506de4acdbc92b9980555,c,c
::#,1909,vol,lv-lv,3523056680,2449409594,2c5f7d4b65b276b27e6e2f0ca2e410e029492af4,0e4ac0ca473c37ca50ee9479793622b43a192fc6,c,c
::#,1909,vol,nb-no,3544730789,2461847874,aa05a78d662e07c5228e0191facb1dd9ac9f04a9,bb68b82b2dfa3f458fbd10a3c29443ffc58bb917,c,d
::#,1909,vol,nl-nl,3549561116,2458069947,9fe135842f500555cdd2bed9f0c1cd9286fe012b,dc2d1656a1f8999411858c30540c46fac671ccc1,c,d
::#,1909,vol,pl-pl,3572337138,2478124343,abc4abfacf682d93208e0bd3bd04977747dedfc9,febfc49e741b801910a02d670ab9b46f96237da0,d,c
::#,1909,vol,pt-br,3428726552,2444163246,4352b59c2bcdabfc0b7dc59e24174fe4ebf38abc,e4f04d8368d3598e2daf0a38039310d2697b0d15,d,d
::#,1909,vol,pt-pt,3565350068,2476180920,de29f9da02628ea8586c19c4931af73e07aa7dde,ae2a83effcd146aed0316252c94ef578c69801c9,d,d
::#,1909,vol,ro-ro,3517478570,2462901786,2beec4e4a9370638d81be6c13477047918781ccd,57872ac72196c4c262de113cd9c5b7c34db4f5a0,c,c
::#,1909,vol,ru-ru,3433382344,2444495902,e3b374d1718c3e59da1a3d0788ed931f8ba8b33a,11223ce1458f8bfd5e661a6db874387d4667aa1c,c,c
::#,1909,vol,sk-sk,3540286278,2457158107,232c2a415bc96faee36ecb1784aa424106e75d55,414f6ae918bc2fc54427685450a439c27c4e37c6,c,c
::#,1909,vol,sl-si,3541863904,2455048708,8cdd2535fb674cc31bf4d90534c510f20a74f0ba,ee84549e0c62fc4f115a5740a4cef7ce87f33632,c,c
::#,1909,vol,sr-rs,3370534021,2392943153,09b4929a17e4003fc49412bb66a15f63230d70b3,7a28f56020f0b1cbaa1337db93eb7a7addbbcc73,c,d
::#,1909,vol,sv-se,3549130526,2458325268,b107a4df6f20fad705ea537a7e5dc941d71f2186,ff0d69a33fde4e69806bc0b63b478e4188ceb44f,c,c
::#,1909,vol,th-th,3387929126,2411207900,a567f0a903a66963ec322ce724496a6597e14ea1,00c35ea978df4d6d85301077537c655c7410ecca,d,d
::#,1909,vol,tr-tr,3392986710,2389635164,9a2ba606d93ce2cdd3ae3911939435d1a088d5fb,ec4b9540928fa08e869434c27544b1fe2539f377,d,d
::#,1909,vol,uk-ua,3392754222,2413347222,2d69506768fdcea8dbba9db817f3061abf185147,b07a76669c2b2a7e90b0810d0c95f8719946392b,d,d
::#,1909,vol,zh-cn,3649266478,2647047456,47102873fd333e715f06c840e08a149963cfb6a4,8e1f607553ab7980c0c9ded018d8352b529320a4,d,d
::#,1909,vol,zh-tw,3629284727,2627531775,c4e3cea8745b894726133b81b9ad63c7344272b9,845b5ce812931b1cfcd665ee11b223549721bbee,d,c
::#,1703,clo,en-us,3315033420,2546331272,7e8eae476222bbb48de04862a8ac85bdd563461c,9d92ec014d1dcc4d1968b33e9cc9bc0748e07bcd,d,d
::#,1703,clN,en-us,3144657572,2437732564,e69925fec9aebc5fbf3852086ecb4c3fe00dfc2e,0fcc1248ab6ac55cae7ec24be5b21ff163d34fc1,c,c
::#,1703,enN,bg-bg,3063703618,2343397300,859fd1064516d2d86970313e20682c3f2da3b0f7,3f2d95b5af40290989b42d7e85fb73c2deecb107,c,c
::#,1703,enN,cs-cz,3063480034,2339478712,5885cef1a0a88972eafbf3240a91944a5bbaef0c,ebb7e9db690c146503c1470f6431ebb3b9f90b8d,d,d
::#,1703,enN,da-dk,3064590226,2359187156,049db05e06fc85f2e4fa47daf620a91219f94da7,bc154a20faed8cb135617ea5f7c804a78b041663,c,c
::#,1703,enN,de-de,3175541170,2469646676,8114e5eade5115f06e87cc63d82a56e6da4e9d71,829e8e3a44ee0793a6c10b76d6fc0180cca52c60,c,c
::#,1703,enN,el-gr,3068824274,2359266864,b02813b4225d89cb685c75b0d13950e9f5af90db,1731ca121d36bb3115282277de3f467dee4eee2b,c,c
::#,1703,enN,en-gb,3137564572,2426801288,10b79168087eedc6f574af4c6c6893313702ec85,d45cfdcc6d7227a8ed12ad24d718df17709fa8fb,c,c
::#,1703,enN,en-us,3140230812,2433137092,3e2111b94ad40b063d6fc224da72f83205c374c8,b17b8827e6954672d2bd85276b73770801a3bf6a,c,c
::#,1703,enN,es-es,3147765694,2438326380,9bbfcdebcd28939d5463630e0938ba6a82c69387,87974fab21f2e4ffc783ee6de4e6942a6bcb943e,c,c
::#,1703,enN,et-ee,3032725650,2320212652,577a6202ef0105c44fa46e852f02cadeb4d8d9a3,4e55f61f68aaa863f3e98bd1159d09fe90508a7c,c,c
::#,1703,enN,fi-fi,3059882946,2342513800,d9c35e5ba0889424e10bd1391f482270b3c40853,70e4f643e220a70547bc75cafd358e5c247a918d,d,d
::#,1703,enN,fr-fr,3130815842,2428304540,34e9d32c32d40b6fa1bffb9d5e43b7ee52ccc8a4,61eaf46743223466e066c77c0563ad46501378d5,d,d
::#,1703,enN,hr-hr,3033535336,2328147230,80fc1b08c6b4d89b65ab5d4aff5b8c4460120800,ad15cd4f66559bdbe0c42552f4d9ff645fcc5151,d,d
::#,1703,enN,hu-hu,3056933946,2340664250,ff090817737eabc45aab729654e73446c79b053b,5bdb5d7c487fc0fb37b8b76c66c1f3e8e2682f06,c,c
::#,1703,enN,it-it,3100499922,2384586126,9f8316c823d069842e8cc52d9ced8b6915bfd612,4089301a2ea267526b974aae278aa5e0fc0134ae,c,c
::#,1703,enN,lt-lt,3025353026,2325646266,9aef261cd6fffa9d1db2ab1ab7cd52678ef06094,d1725c85939679dd82fb8d551909e8686773e53f,c,c
::#,1703,enN,lv-lv,3029332916,2325624994,7fa4685a86839f3d8093be889e7dcb14b99a4581,cdf68b52a97795d3bbddb17e08f5153868423082,c,c
::#,1703,enN,nb-no,3058404996,2337861734,17ec8c4db6dd115fc45050205d4ee391d55847a8,ab6a56a1e544b30cda33601f60ffdfe4b7a7c010,c,c
::#,1703,enN,nl-nl,3058285820,2340806626,9af5d931ed90868395e94fa99e15ce723153e7b4,202eed2dd65dab2791ec1a4b04afbb1a28ca997a,c,c
::#,1703,enN,pl-pl,3082538930,2365075840,3b8c6e1273d2d65562b81b0b1b63a8ce9ecdb3aa,5292273b4477d413dcec2533ad2459ba1821891b,c,c
::#,1703,enN,pt-pt,3074473316,2356933976,763b5bb74b702c18ba80f770dfa25a7af4dc4f91,5659133bec9806a48096068ee53c2838beae6f6c,c,c
::#,1703,enN,ro-ro,3035031152,2329162166,d9883e4a8242398402383ae47e4015a8c724b2f7,efa8623d089f7df5c41453b862c9e686d0b0b157,c,c
::#,1703,enN,sk-sk,3036114496,2330022126,c705871aa637455dbf04532b5ca462539d466d6d,b9b1705f81a7120a2bad78ffda154182814d53e9,c,c
::#,1703,enN,sl-si,3026544424,2326113308,cb1485805fa62f1ed18d28a0418e45c5d612b31a,8cccac3b248a6e6879bb8f5baeb06a375bc8fe68,c,c
::#,1703,enN,sv-se,3061594264,2339127740,6cb6b740c9f5390f0e1bd29cd33890a78f20775e,2e1c69c5a253cd7b7ed381e8a7d9ff02350ca8f2,c,c
::#,1703,ent,ar-sa,3269761758,2494711944,8efb029378cd955809e67baf2cc71c53c632e32c,489191d8cc329b9721ff26287bc71ff4cf02115a,d,d
::#,1703,ent,bg-bg,3221290404,2450825804,64316f68725e92c2567dcf86981e5eb1c635fd09,117a347347deaa73dce186af781b7eda8e4fc62f,d,d
::#,1703,ent,cs-cz,3231413240,2450581096,5d0fa9367cbc1ce83ceb9ec130af97000e89b150,30aa6d6caee1e882fd88018c7ddb9a747499b891,c,c
::#,1703,ent,da-dk,3248303690,2469352822,3005a5859d2010da9fd1a77e6aab14ca233d73dd,5451990e566561a587a8fd44bf81f3236fb27a8b,c,c
::#,1703,ent,de-de,3348816134,2577096876,f813662c59c2a382a940d82b96e825de80da7089,a19f69452edb66da0591a63ae7a2f9b319bedad3,c,c
::#,1703,ent,el-gr,3245990678,2468826000,f2f713a69c342e4b6513bdb8974213530f37d6ee,da04cef145557e500060759c3b759c03adf0580c,c,c
::#,1703,ent,en-gb,3312981002,2541092494,a7100680c5718d34474579b0154819e2e528ffd7,c4371bd42a1d3463c40ad05b4f328471e8be80c4,c,c
::#,1703,ent,en-us,3312849564,2542115274,5477ecbdb80b477d3cb049d0d64831b72797be8b,65162f45583f38d53d01c5e5a64a69d1e73cc005,d,d
::#,1703,ent,es-es,3319718002,2547575630,cf78240f01de56403f3ab7066cf061178a90ef3f,000f7839c99dfc3e883c9c41a2e7e1f9b9d1049c,c,c
::#,1703,ent,es-mx,3273904408,2496325838,8b4f2f3b2bf76a6ee78339332bb18e0476669b4d,9315c4f7cdbacac86b47aa2637e90b1820c1e0b5,d,d
::#,1703,ent,et-ee,3200923112,2429782490,2be6d35081b25a3e808343ea0aae69fbe781f506,1bb3b0c7df189c3cf2504a6c7b3044592991f510,c,c
::#,1703,ent,fi-fi,3230886556,2455546618,5bde9ca7461591e51af74416335694ecc4b1ca5f,32a72a1c0d4e70f7940e91c3e60aa10b6326d618,c,c
::#,1703,ent,fr-ca,3294268308,2520878858,cccbccd532887d278fa922fd09f56bfdca5088bb,904abb865818ee7ef3259129f49fde9464efd4cd,d,d
::#,1703,ent,fr-fr,3309828430,2542088822,64ff0e97c469fdd3b591ae226a16ebaa75c7e8d1,b2d1ccaca7117637ccc74c86876d6289ec2499a3,d,d
::#,1703,ent,he-il,3232690912,2455101288,d85a04e8c72279d00889be97fa9aa79e88964a89,8a6662b13ceb703d8ccc874351843fd6f9918ee1,c,c
::#,1703,ent,hr-hr,3212042850,2433083014,b07812c974941b314884778654da1831f41d838e,22b5565943863d9a82f6f0af17d0d8796e40dca9,c,c
::#,1703,ent,hu-hu,3222250300,2443754316,3eec65d51e8c24e8b0c823071ef246df465270c9,b50222d340eb136fd736f2eb256c97072ed74f14,c,c
::#,1703,ent,it-it,3272240844,2500145118,12c773f8db4c66d1a7d039e689a53e711f55b23b,1833f47a8968d2b31a8c90672dfb76d57a5ab022,c,c
::#,1703,ent,ja-jp,3391347078,2622699920,e214f6797b2f174db15901b79ae0285a0859e5e5,e7c95f7ecfc9a46f1a66479ead6c6fa6194c0e28,c,c
::#,1703,ent,ko-kr,3287839184,2511245616,801a09ef5a8b28a98b620bdb83472f2a17265e17,a7e52b0652ad20c351d8d5a79cc4e7904f48390a,c,c
::#,1703,ent,lt-lt,3204395822,2429457908,11584883f422bbd13394a3b7aa502572bf204ba7,14be449da61677562b2f49de9f401a84d6d2c88b,c,c
::#,1703,ent,lv-lv,3202719722,2429484246,c29e06c7e338df384fa4d0ec1798b07b4175056c,1b85049cb4f85c0a50723a17f2b566c3ae05aa9f,c,c
::#,1703,ent,nb-no,3224730246,2447487494,9b80ea391601f5eaa2dc82a86b51e4e8a5ef00d6,dfd2952d9ee50ffdaf70729577655fb52bbded02,d,d
::#,1703,ent,nl-nl,3233989634,2453608998,9d79d2877e7015039b7795311ee33b12e82103d4,db4d9998e2891a2c11af49e8edf864c4d669bee8,c,c
::#,1703,ent,pl-pl,3254871838,2474897208,78b3c876618557bccee0e9437466d70c0c136dcf,be5d2f555cdde8925c1ebd08a7f7a3222c9e612e,c,c
::#,1703,ent,pt-br,3271500426,2503336302,01c57b64de3a66b7795c363ce0b80ca3567bcb49,ffde6034bdc95b6b3d4e651a8677ddc6bb2d180c,d,d
::#,1703,ent,pt-pt,3240619572,2472391446,6fdb16fb6bfd01cc846818eac4bbd468731137d3,4d41383f7e149f8f332683a803e80913bc9b1dc2,d,d
::#,1703,ent,ro-ro,3213373488,2434175900,3b61d2d6592bf7172b20b6c087465e4e201a1b12,d150722d68fe7eeab6584e6b91ce40a51f6e83b9,c,c
::#,1703,ent,ru-ru,3276687624,2500599630,702da7305af22183af857b1d92f225ba89c846b1,e4925023ca2a7c875a257542177f51adef9ac00a,d,d
::#,1703,ent,sk-sk,3209901276,2428270146,2a76f3cf95bb8816bf2a4a77f60e5500eb0260df,2062f6e7a1cb1ae6dcc8755b6afec3cf92aaaeba,c,c
::#,1703,ent,sl-si,3205356168,2430123934,45c67e340e223378aa8aa6aa5678d1ac5e3285a1,5edf9bc85d7893d5f8489693be58606ffd0733ce,c,c
::#,1703,ent,sr-rs,3211056238,2432563554,59d39830461b47692ecb8d8b3d3d5b5510bd2b41,905b282702bd35a24335e13b7532bebdd6500577,c,c
::#,1703,ent,sv-se,3225016350,2456236258,d5bd28ea94a57f48c5dd9be95eaa77e1af5b879b,fdec6fe68064a5863424adbb88b1f3fab2f8f9ab,c,c
::#,1703,ent,th-th,3225739176,2452122006,10e7d1628d17f175c7be22b9cbfc31b0f4d6cf11,7e6804bb22e995c8d7fda7bf17003f1a598923c5,d,d
::#,1703,ent,tr-tr,3223779720,2446042716,2bf79ce9f82e719816523039c6219fcb1681f211,440ca442a89e088530739ad7b1fb911aa4455a06,c,c
::#,1703,ent,uk-ua,3231204960,2453614364,4689166d55d8b658144c219da32025ace59071be,e45c9e3569ab5763f1aa8fb3363256278a665d19,d,d
::#,1703,ent,zh-cn,3475307584,2693601882,ff6a432a6ee8204153cc057074fb07b5a41f201b,feaf7891cc55c6f2716923a5e5aad8c9edccbba3,c,c
::#,1703,ent,zh-tw,3402457552,2621863118,4b15f3fa006b472788efda8daae41dcc1cdc6335,ee8a66c1d34e68ba480b017f9aeed538a7847b05,c,c
::#,1607,enN,bg-bg,2773448902,2111500580,d090ecc0e32e05a6c075eb8384f577315ac35ee2,f2206f926561fd89b69d6e7e61aa98956966dfd6,c,c
::#,1607,enN,cs-cz,2775734726,2113434488,3979b107d1af43aae3cc79bd7a2a081def5d04cf,e773288e71f7a17ec8e1525415134acbfa13a803,d,d
::#,1607,enN,da-dk,2799132592,2137434148,f0a667d9584f10c47b3db96b0e6700f1a47021c3,9defa59a1627b3440684ce9605a43a0c4e88c770,d,d
::#,1607,enN,de-de,2888504080,2219030252,e8a1023f0f21a7c99d1b5006ef520323238833cd,e62e766faffcd25ebce37b758aeac6e63208c332,d,d
::#,1607,enN,el-gr,2798418934,2123659240,8bd00622321661b9ca1eb7289d907a9056c713ce,880756cb261c7a7b32289e549011d9bb968d2706,d,d
::#,1607,enN,en-gb,2861883002,2200050658,f145a8eff3121dc8fb020c5a1750a0f2c117ecb3,7c3415af341630a1f01f2f0983e44579d6a23487,d,d
::#,1607,enN,en-us,2859877184,2201813278,fab646ab44b5d956a91e0d2aa0e4a37f22ddf7cd,5166cb73561f9c1190f9d6f8a35fe444877318f9,c,c
::#,1607,enN,es-es,2848523494,2196489320,7386e7b352e080a15f6a565feeace4c6e854703d,191a58383195e53864fcacb41313043a5ea77663,d,d
::#,1607,enN,et-ee,2748248864,2095947306,b487809fa9f137624e4bb205e389f0e599d17093,d9f88ee10c3f41e5e152b24c78a35ab1f15d6af4,d,d
::#,1607,enN,fi-fi,2796624854,2137783028,dc40703bd5eca75ce2d234e367f23db5a71c807f,d3ed9db8b398eda4497c6b9d897555f5a5663d84,c,c
::#,1607,enN,fr-fr,2852055774,2193600366,5838ee4f277ebd8ab33f3d40bbcc380a95f9e69b,36286ca54f121ca1247e1026e0c76bf3fdc4f2be,c,c
::#,1607,enN,hr-hr,2765426784,2100724714,f8d5c52045248839329634468038b184b7e9a491,742c2541073a78be847cbe684651b7fcab6b6fdb,c,c
::#,1607,enN,hu-hu,2780468248,2122154560,65b67804be6e6a5e66f0046a8c779fc9599b571e,444ac3b15980f3ef4f911fa2f920891e230118ca,d,d
::#,1607,enN,it-it,2798572882,2144445692,162bbba0399ed2e0cc12569676f4afcc685f08a0,f4deb16739ba26ec597725cc5a9a2580b33e7ca2,d,d
::#,1607,enN,lt-lt,2755834506,2094863630,11c047008667638f72cfa7391b0ac14ce954a427,0a1d7d1bd8456251c623d5c3f3e7e6f0a9c00e86,d,d
::#,1607,enN,lv-lv,2752316336,2093716546,230ac84bf1c669d375fd05159a8d26edb87cf264,98948912070a686f3b7060b9f80446faba677b2d,d,d
::#,1607,enN,nb-no,2773039326,2113695528,7939fcefabeed9a8cebf6ca04984e9c0f8470f50,ba8c7be3fb2a12ae3a227ac60b69ce225f367933,c,c
::#,1607,enN,nl-nl,2775118184,2130921230,fbb84419e1b8618b83b91873ed5cc7fa1365a009,40d9d1a599a5266947f337fa6acfcaeeece8a865,c,c
::#,1607,enN,pl-pl,2778912686,2125591884,7ea026557e632da890a64e0fcf72f3672ef12e53,487eab83f1e6f67058b50b9a889d790f49384567,d,d
::#,1607,enN,pt-pt,2787935254,2125017148,0afce496d59bbfc1f1c6580dfb49bf0ca1e30275,40a28c0263920c0e13a1c450511718f61f2c67e1,d,d
::#,1607,enN,ro-ro,2763055438,2101442992,d88e0b470995cc081f9e73d06baf0ce6080445c9,5452de2544692ba234c744cb18676f1cbc3c7c3c,d,d
::#,1607,enN,sk-sk,2763328164,2096292986,be661b5d237a8a93259d64754b09ae29f26cb42b,6322ebdfaea5955e28ec0edba5595e6ecc3eabba,c,c
::#,1607,enN,sl-si,2754008752,2096786702,73a4a166b1eedff7c7465eed4ce3daa8eec1c051,882e91a3c1e7a239ac4d39288c19228b8ba20c8d,c,c
::#,1607,enN,sv-se,2799778090,2130127248,70e0831a0c4078705b6699e8662d6cb0dc4875a0,66c58033888d81d9e914463d941a525ef1f1c29b,d,d
::#,1607,ent,ar-sa,2955820350,2253811598,672bb229c831b84e95a6dbff94818528894540d3,c6daaa38f3eb589e8654a266320032ed3aa3a6f5,d,d
::#,1607,ent,bg-bg,2911551848,2218360574,97d613cdfb2ded4df2f71ef29fc93ca3656c6ed8,2c0063b9f769ba2307f84717ac2b915206a9d4a3,d,d
::#,1607,ent,cs-cz,2918785956,2214354874,7542eab92328937b8d09ee02cf8fa9cc6a196830,3108854bb25b7c75bac13289db5c2a2e9c920578,d,d
::#,1607,ent,da-dk,2946222420,2240352350,bb9da04cd47d7973597386ffd203ed56e19d4d65,297f5fb65fa79f3ed1d0a6dcad202d863b71e9bc,c,c
::#,1607,ent,de-de,3019388686,2321843034,c9b01f8eceb84ea2e7abf8c8823a623d759a61d0,8af78913db117260a888d57c5376470cfc109670,d,d
::#,1607,ent,el-gr,2933879638,2226440968,14e182c6ed9ba36c720fbd0c3f5ce7d64ed38ca5,b8bad577e15fbfaa27b8bdb53d1c6724fe64357a,d,d
::#,1607,ent,en-gb,3002224046,2305860070,b972022ec65c9205195833b842983e527f287d0a,6d0466628b39e192bd675fae1dfafded7fff94d9,d,d
::#,1607,ent,en-us,3012544034,2310343386,cbf97f9ee545d6bbff70c7fb9740e9fe5d6f4d77,72e16690f022fde1c59abc93457a1c6b8bd4c5dc,c,c
::#,1607,ent,es-es,3002625924,2298493682,d6b21213c81c83c46965baf0c1da2f14d4f3eff2,4b3999d40e9ac39c1ba4c1dec301c51aacc50f28,c,c
::#,1607,ent,es-mx,2943527594,2249633892,e7bb91c6aa0c9295718f0ea2761005ac4c556cc8,3341b800403bb93375745ea4c3a4529ae5472fe3,c,c
::#,1607,ent,et-ee,2889988048,2192782608,ca9eba2953c9aed39e051f5d984e4a58c945d17d,06e7a360daba3388edefbdf56d958e98b2cae2d2,c,c
::#,1607,ent,fi-fi,2932564162,2235053854,b250bb11cbbea356417993455d639582ca4fd052,3d13bc3b7ca9411cd791c5c861e022bfbf2db2ce,d,d
::#,1607,ent,fr-ca,2970085652,2267316492,e33bc497cc5ef1a2ef362c23d2814d580aa22e26,2200c921718cf3b8246cf4e82ae7127668790444,d,d
::#,1607,ent,fr-fr,2996998394,2297031996,b599b3275302e57b8e1ad25271da68c299c4de39,8b6805f55fd7c6641d182131f500c0340887c0b6,d,d
::#,1607,ent,he-il,2927278142,2224939840,b82d6122d55c838393c5645520692acd101834a9,4011de9ecdf53b41fdb2ea9e0910bc6a0bca7939,c,c
::#,1607,ent,hr-hr,2898184950,2202588894,bc2cbd1d92e60598115098238f12e8dac2c2166f,c689528beb00b9157cc3d08c2409ffaec84ea56c,c,c
::#,1607,ent,hu-hu,2918877960,2223268852,a0453e7dc3d34716caac2cacb473aa65ccecea3e,47e181c321033ac99850fb222047635a83d71d43,c,c
::#,1607,ent,it-it,2953574274,2247219130,9b48a0fef984b867e8018708785a6c70a696a469,4e68dba7258c1af508d8c180564749b5b1b9b3fc,c,c
::#,1607,ent,ja-jp,3063387292,2355095860,ec30e2dfa29223fbeda28feeed89f7ed6d2911fd,24d900e9937c520b10056e53775e6a5934a916a2,c,c
::#,1607,ent,ko-kr,2979348462,2265728512,8b9af5c684e639b1787c901baddb33e3ec1f17d5,296956b802ccf9a76083e6398db20d2b67186fd0,c,c
::#,1607,ent,lt-lt,2890387644,2196863664,97f81a28fa526e57e2e38235ce7103aa0fca0ff5,1636c7532f21ebf6282e785f35840201ed6cb81c,c,c
::#,1607,ent,lv-lv,2897092188,2196617270,26775e677727ad2296e7de0620be132d144abd55,aa16e2b2f317ab45e43885bb700a428d74244ef3,d,d
::#,1607,ent,nb-no,2922664364,2218857478,7c42bfed895f37cf86153ee75325b5d4b71e3eab,a9bbff5197b258a37d4639a9699e938f86030777,d,d
::#,1607,ent,nl-nl,2934556272,2223733356,81b8974317b76417ae102951ec191f90fdfc00f9,c1ad0d57e0ba595e81ef7820f9db2b7c12114629,c,c
::#,1607,ent,pl-pl,2929138222,2228062654,7ddc4be2c46d3aa5b562bc593936b7bac33c6a4a,165494554c7fdb1be55e4399b6372515c2d6b1ab,c,c
::#,1607,ent,pt-br,2953378710,2264016962,71de2e5a288324151bec24830bcedca5ad77a1ad,a5006f26410655f0efa3a42c0ff63b6c9acf4d74,d,d
::#,1607,ent,pt-pt,2941611330,2229207498,52dc57e4107dec547e68a9e74eec10244cea4f92,0b1a60b57e687aba766001a8b306870c9e7241b3,d,d
::#,1607,ent,ro-ro,2887834662,2201439796,24950dd0d69cd50fe01f8e9309583772ef231518,f1d43e2cbf3006e034b64eca9bc94de7ffa8cf94,c,c
::#,1607,ent,ru-ru,2957770620,2261034630,8ce69e0236a2b5269c08a67edab908211585b3c1,50f2f76e8a0e62f26a6238fd9471b16ca1b26186,c,c
::#,1607,ent,sk-sk,2888894912,2197855320,14accd88aa808e900ba902ac6509a5786d41be79,1796ddb7072d64e971b3f7ef7c3c3ecadfc7dd00,d,d
::#,1607,ent,sl-si,2881745984,2196163006,c1ac7d37d86e4dbdbb2992acc8d3b6e60e52919a,2bcc0dd24a8fcf85e041d29c27be612d20f6c39a,d,d
::#,1607,ent,sr-rs,2910809030,2204793922,f8d80cb91733aa8b48c6b84327494e210b8e5494,242810176bd2c17e25c94b5478762bacd04f0c2c,c,c
::#,1607,ent,sv-se,2931748080,2231055130,d6196f5e660ef7055a0a5efad8892045131a7f9b,14642e83ecd3d000bfc10d5bcea08de83ca1fe39,c,c
::#,1607,ent,th-th,2910791934,2218450936,1286f4fef88b41884d8083aad666d63ca232be42,5660b3c566e05bbb58504c392470916996988bf5,c,c
::#,1607,ent,tr-tr,2915633822,2215962556,871cf4807375a39b335468d44407023f19bade5f,2dbe29adf9297d98e66e42558fa673c0e76b4cf8,d,d
::#,1607,ent,uk-ua,2915857130,2219357380,5b88fcd4211676ced3350a9bdf5abe0a37707991,02a14a526045c75cbbc1aa279d01f1f23686dd93,c,c
::#,1607,ent,zh-cn,3131493920,2421427008,e78e04e6204b107ffa36d898d58232c86e98199d,2ddd95d076810d788d63082cffcbbd75bf921243,d,d
::#,1607,ent,zh-tw,3059396808,2361521848,4b4e82301a37192b69d70496fcf57c16aad681eb,589eb269e0666134c1d31d67c665da50ea9b2a66,d,d
```


***

## Appendix: Links

- [[Code]]
- [[Development]]

*Backlinks:*

```dataview
list from [[MediaCreationTool.bat]] AND -"Changelog"
```