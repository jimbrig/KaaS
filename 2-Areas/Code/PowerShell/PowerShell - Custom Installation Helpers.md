# PowerShell - Custom Installation Helpers

*Source: https://gist.github.com/014f18d00bea1c63ca5da34fa66a71e0#file-mapdrives-psm1*

## Contents

* [Install-fromURL](PowerShell%20-%20Custom%20Installation%20Helpers.md#install-fromurl)
* [Github Helpers](PowerShell%20-%20Custom%20Installation%20Helpers.md#github-helpers)
* [Install Cascadia Code Nerd Fonts](PowerShell%20-%20Custom%20Installation%20Helpers.md#install-cascadia-code-nerd-fonts)
* [Invoke Remote Script](PowerShell%20-%20Custom%20Installation%20Helpers.md#invoke-remote-script)
* [Appendix: Links](PowerShell%20-%20Custom%20Installation%20Helpers.md#appendix-links)

## Test-ProgramInstalled

````powershell
function Test-ProgramInstalled( $programName ) {

  $localmachine_x86_check = ((Get-ChildItem "HKLM:Software\Microsoft\Windows\CurrentVersion\Uninstall") | Where-Object { $_.GetValue('DisplayName') -like "*$programName*" } ).Length -gt 0;

  if (Test-Path 'HKLM:Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall') {
    $localmachine_x64_check = ((Get-ChildItem "HKLM:Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall") | Where-Object { $_.GetValue('DisplayName') -like "*$programName*" } ).Length -gt 0;
  }

  $user_x86_check = ((Get-ChildItem "HKCU:Software\Microsoft\Windows\CurrentVersion\Uninstall") | Where-Object { $_.GetValue('DisplayName') -like "*$programName*" } ).Length -gt 0;

  if (Test-Path 'HKCU:Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall') {
    # $user_x64_check = ((Get-ChildItem "HKCU:Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall") | Where-Object { $_.GetValue('DisplayName') -like "*$programName*" } ).Length -gt 0;
  }

  $localmachine_check = $localmachine_x86_check -or $localmachine_x64_check;
  $user_check = $user_x86_check -or $user__x64_check;

  return $localmachine_check -or $user_check;
}

````

## Install-fromURL

````powershell
# Install-fromURL
# example: Install-fromURL "<url>" "program-name"
function Install-fromURL($uri, $name) {
  $out = "$env:USERPROFILE\Downloads\$name.exe"
  Invoke-WebRequest -Uri $uri -OutFile $out
  Start-Process $out
}
````

## Github Helpers

````powershell
# get gh download URL
# example: Get-GHDownloadURL "user/repo" "*.exe"
function Get-GHDownloadURL($repo, $pattern) {
  $releasesUri = "https://api.github.com/repos/$repo/releases/latest"
  ((Invoke-RestMethod -Method GET -Uri $releasesUri).assets | Where-Object name -like $pattern ).browser_download_url
}

# Download from github
# example: Save-fromGH "user/repo" "*.exe" "program-name"
function Save-fromGH($repo, $pattern, $name) {
  $uri = Get-GHDownloadURL $repo $pattern
  $extension = $pattern.Replace("*", "")
  $out = $name + $extension
  Invoke-WebRequest -Uri $uri -OutFile "$env:USERPROFILE\Downloads\$out"
  explorer.exe "$env:USERPROFILE\Downloads"
}

# install from github
# example: Install-Github "user/repo" "*.exe" "program-name"
function Install-Github($repo, $pattern, $name) {
  Save-fromGH $repo $pattern $name
  $extension = $pattern.Replace("*", "")
  $installfile = $name + $extension
  $installpath = "$env:USERPROFILE\Downloads\" + $installfile
  Start-Process $installpath
}

````

## Install Cascadia Code Nerd Fonts

````powershell
# Install Cascadia Code from Nerd Fonts
function Install-CascadiaCode {

  $address = Get-GHDownloadURL "ryanoasis/nerd-fonts" "CascadiaCode.zip"
  $archive = "$($Env:TEMP)\CascadiaCode.zip"
  $folder = "$($Env:TEMP)\CascadiaCode"
  $shell = New-Object -ComObject Shell.Application
  $obj = $shell.Namespace(0x14)
  $systemFontsPath = $obj.Self.Path

  Invoke-RestMethod -Method Get -Uri $address -OutFile $archive
  Expand-Archive -Path $archive -DestinationPath $folder -Force

  # $shouldReboot = $false

  Get-ChildItem -Path $folder | ForEach-Object {
    $path = $_.FullName
    $fontName = $_.Name

    $target = Join-Path -Path $systemFontsPath -ChildPath $fontName

    if (test-path $target) {
      Write-Host "Ignoring $($path) as it already exists." -ForegroundColor Magenta
    }
    else {
      Write-Host "Installing $($path)..." -ForegroundColor Cyan
      $obj.CopyHere($path)
    }
  }

  Remove-Item -Path $folder -Recurse -Force -EA SilentlyContinue
}

````

## Invoke Remote Script

````powershell
# invoke remote script
# example: Invoke-RemoteScript
Function Invoke-RemoteScript {
  [CmdletBinding()]
  param(
    [Parameter(Position = 0)]
    [string]$address,
    [Parameter(ValueFromRemainingArguments = $true)]
    $remainingArgs
  )

  Invoke-Expression "& { $(Invoke-RestMethod $address) } $remainingArgs"
}
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
list from [[PowerShell - Custom Installation Helpers]] AND -"Changelog"
````
