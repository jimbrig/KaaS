# Unattended Install of the Latest SQL Server Management Studio Using PowerShell

## Metadata

* Author: *Guillermo Musumeci*
* Full Title: Unattended Install of the Latest SQL Server Management Studio Using PowerShell
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/e8003e583265

## Highlights

* $InstallerSQL = $env:TEMP + “\SSMS-Setup-ENU.exe”; 
  Invoke-WebRequest “https://aka.ms/ssmsfullsetup" -OutFile $InstallerSQL; 
  start $InstallerSQL /Quiet
  Remove-Item $InstallerSQL;
