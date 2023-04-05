# Unattended Install of 7-Zip Using PowerShell

## Metadata

* Author: *Guillermo Musumeci*
* Full Title: Unattended Install of 7-Zip Using PowerShell
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/1387ceb1e714

## Highlights

* Download and Install 7-Zip v19 for Windows 64-bit
* $Installer7Zip = $env:TEMP + "\7z1900-x64.msi"; 
  Invoke-WebRequest "https://www.7-zip.org/a/7z1900-x64.msi" -OutFile 
  $Installer7Zip; 
  msiexec /i $Installer7Zip /qb; 
  Remove-Item $Installer7Zip;
* \[Net.ServicePointManager\]::SecurityProtocol = \[Net.SecurityProtocolType\]::Tls12;
  Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force;
  Set-PSRepository -Name 'PSGallery' -SourceLocation "https://www.powershellgallery.com/api/v2" -InstallationPolicy Trusted;
  Install-Module -Name 7Zip4PowerShell -Force;
