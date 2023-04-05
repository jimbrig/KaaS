# PowerShell - Edge Scripts

## Contents

* [Backup Edge Profile Module](PowerShell%20-%20Edge%20Scripts.md#backup-edge-profile-module)
  * [Backup-EDGEProfiles](PowerShell%20-%20Edge%20Scripts.md#backup-edgeprofiles)
  * [Restore-EDGEProfiles](PowerShell%20-%20Edge%20Scripts.md#restore-edgeprofiles)
* [Personal Script](PowerShell%20-%20Edge%20Scripts.md#personal-script)
* [Appendix: Links](PowerShell%20-%20Edge%20Scripts.md#appendix-links)

## Backup Edge Profile Module

* `backup-edge-profile.psm1`

````powershell
<#
 .Synopsis
  Allows for easy backup and restore of Microsoft EDGE (Anaheim) Profiles.
  EDGE MUST BE CLOSED DURING!
 .Description
  Will backup all EDGE "User Data" for the current user. This data contains all the "Profiles" within the browser, and the corresponding registry keys will also be saved alongside the backup.
  Backups are zipped to allow for easy storage on locations like OneDrive.
  Before archiving the backup, all profiles have their Cache emptied.
  Restore will replace the current users EDGE data. The command requires that the user chooses how to handle existing data.
 .Example
   # Backup the current users EDGE Profiles to the _EdgeProfilesBackup folder in the users own OneDrive.
   Backup-EDGEProfiles
 .Example
   # Backup the current users EDGE Profiles to the users own TEMP folder.
   Backup-EDGEProfiles -Destination $env:TEMP
 .Example
   # Restore a previous backup and remove existing user data.
   Restore-EDGEProfiles -ZIPSource EDGE-UserData30July2021-MichaelMardahl.zip -REGSource EDGE-ProfilesRegistry30July2021-MichaelMardahl.reg -ExistingDataAction Remove
#>
#Requires -Version 5

function Backup-EDGEProfiles {

<#

.Synopsis

Backup current users Microsoft EDGE (Anaheim) Profiles.

.Description

Will backup all EDGE "User Data" for the current user.

.Parameter Verbose

Enables extended output

.Parameter Destination

(optional)

Location in which to save the backup ZIP and REG files

Defaults to the users OneDrive

.Parameter AddDate

(optional - $true/$false)

Applies a date stamp to the filenames.

Defaults to $true

.Example

# Backup the current users EDGE Profiles to the _EdgeProfilesBackup folder in the users own OneDrive.

Backup-EDGEProfiles

.Example

# Backup the current users EDGE Profiles to the users own TEMP folder.

Backup-EDGEProfiles -Destination $env:TEMP

.NOTES

This function backs up the following for an Edge User Profile:

- Compressed archive backup of folder: %LOCALAPPDATA%\Microsoft\Edge

- Registry backup of path: HKCU\Software\Microsoft\Edge\PreferenceMACs

#>

[CmdletBinding()]

param (

[Parameter(Mandatory = $false,

HelpMessage = "Destination of the EDGE profile backup (Defaults to OneDrive Backups folder: ~\OneDrive\Backups\EdgeProfilesBackup)")]

[string]$Destination = (Join-Path -Path $env:OneDrive -ChildPath "\Backups\EdgeProfilesBackup"),

[Parameter(Mandatory = $false,

HelpMessage = "Append the current date to the backup (Defaults to true)")]

[bool]$AddDate = $true

)

#region Execute

#Verify that the entered destination exists

if ((-not (Test-Path $Destination) -and ($Destination -eq (Join-Path -Path $env:OneDrive -ChildPath "\_EdgeProfilesBackup")))) {

#Create default destination

New-Item -ItemType Directory -Path $Destination -Force | Out-Null

}

elseif (-not (Test-Path $Destination)) {

Write-Warning "The entered destination path could not be validated ($Destination)"

break

}

#Verify EDGE is closed

if (Get-Process msedge -ErrorAction SilentlyContinue) {

Write-Error "EDGE is still running, please close any open EDGE Browsers and try again."

break

}

Write-Output "Starting EDGE profiles backup for $($env:USERNAME) to ($Destination) - DON'T OPEN EDGE! and please wait..."

Write-Verbose "Destination root : $Destination"

Write-Verbose "Append date : $AddDate"

#Date name addition check

if ($AddDate) {

$dateName = (get-date -Format ddMMMMyyyy).ToString()

}

else {

$dateName = ""

}

#Setting some important variables

$edgeProfilesPath = (Join-Path -Path $env:LOCALAPPDATA -ChildPath "\Microsoft\Edge")

$edgeProfilesRegistry = "HKCU\Software\Microsoft\Edge\PreferenceMACs"

#Export registry key

$regBackupDestination = (Join-Path -Path $Destination -ChildPath "\EDGE-ProfilesRegistry$($dateName)-$($env:USERNAME).reg")

Write-Verbose "Exporting Registry backup to $regBackupDestination"

#Remove any existing destination file, else the export will stall.

if (($regBackupDestination -ilike "*.reg") -and (Test-Path $regBackupDestination)) {

Remove-Item $regBackupDestination -Force -ErrorAction SilentlyContinue

}

$regCMD = Invoke-Command { reg export "$edgeProfilesRegistry" "$regBackupDestination" }

#Export user data

#Cleaning cache

Write-Verbose "Cleaning up cache before export."

if (Test-Path $edgeProfilesPath) {

$cacheFolders = Get-ChildItem -Path $edgeProfilesPath -r | Where-Object { $_.PsIsContainer -and $_.Name -eq "Cache" }

Foreach ($folder in $cacheFolders) {

$rmPath = Join-Path -Path $folder.fullname -ChildPath "\*"

Write-Verbose "Emptying $rmPath"

Remove-Item $rmPath -Recurse -Force

}

Write-Verbose "Cleanup completed."

}

else {

Write-Error "EDGE user data folder missing - terminating!"

break

}

#Creating ZIP Archive

$zipBackupDestination = (Join-Path -Path $Destination -ChildPath "\EDGE-UserData$($dateName)-$($env:USERNAME).zip")

Write-Verbose "Exporting user data backup to $zipBackupDestination"

#Remove any existing destination file, else the export will fail.

if (($zipBackupDestination -ilike "*.zip") -and (Test-Path $zipBackupDestination)) {

Remove-Item $zipBackupDestination -Force -ErrorAction SilentlyContinue

}

#Compressing data to backup location

try {

Get-ChildItem -Path $edgeProfilesPath | Compress-Archive -DestinationPath $zipBackupDestination -CompressionLevel Fastest

Write-Output "EDGE Profile export completed to: $Destination"

}

catch {

#Error out and cleanup

Write-Error $_

Remove-Item $zipBackupDestination -Force -ErrorAction SilentlyContinue

Remove-Item $regBackupDestination -Force -ErrorAction SilentlyContinue

Write-Error "EDGE Backup failed, did you forget to keep EDGE closed?!"

break

}

#endregion Execute

}

function Restore-EDGEProfiles {

<#

.Synopsis

Restore Microsoft EDGE (Anaheim) Profiles to the current users EDGE Browser.

.Description

Will restore all EDGE "User Data" for the current user from an archive created by the Backup-EDGEProfiles function.

.Parameter Verbose

Enables extended output

.Parameter ZIPSource

(Mandatory - file path)

Location of the User Data backup archive file.

.Parameter REGSource

(Mandatory - file path)

Location of the profile data registry file.

.Parameter ExistingDataAction

(Mandatory - Rename/Remove)

Choose wheather to have the existing User Data removed completely or just renamed. Renaming will add a datestamp to the existing USer Data folder.

.Example

# Restore a previous backup and remove existing user data.

Restore-EDGEProfiles -ZIPSource EDGE-UserData30July2021-MichaelMardahl.zip -REGSource EDGE-ProfilesRegistry30July2021-MichaelMardahl.reg -ExistingDataAction Remove

#>

#Add the -verbose parameter to commandline to get extra output.

[CmdletBinding()]

param (

[Parameter(Mandatory = $true,

HelpMessage = "Source of the EDGE User Data profile backup archive")]

[string]$ZIPSource,

[Parameter(Mandatory = $true,

HelpMessage = "Source of the EDGE Registry profile backup file")]

[string]$REGSource,

[Parameter(Mandatory = $true,

HelpMessage = "How to handle the existing profiles? Options are Backup or Remove")]

[ValidateSet('Rename', 'Remove')]

[string]$ExistingDataAction

)

#region Execute

#Verify that the entered sources exits and have the right fileextention

if (-not ((Test-Path $ZIPSource) -or (-not ($ZIPSource -ilike "*.zip")))) {

Write-Error "The entered source file could not be validated ($ZIPSource)"

break

}

if (-not ((Test-Path $REGSource) -or (-not ($REGSource -ilike "*.reg")))) {

Write-Error "The entered source file could not be validated ($REGSource)"

break

}

#Verify EDGE is closed

if (Get-Process msedge -ErrorAction SilentlyContinue) {

Write-Error "EDGE is still running, please close any open EDGE Browsers and try again."

Break

}

Write-Output "Starting EDGE profiles restore for $($env:USERNAME) - (DON'T OPEN EDGE!) please wait..."

Write-Verbose "Source archive : $ZIPSource"

Write-Verbose "Source registry : $REGSource"

#Define location of EDGE Profile for current user

$edgeProfilesPath = (Join-Path -Path $env:LOCALAPPDATA -ChildPath "\Microsoft\Edge")

#Handle existing User Data

$UserData = (Join-Path -Path $edgeProfilesPath -ChildPath "\User Data")

if (Test-Path $UserData) {

Write-Verbose "Existing User Data folder found in $edgeProfilesPath"

if ($ExistingDataAction -eq "Rename") {

$renameFolder = "$($UserData)-$((get-date -Format ddMMMMyyyy-HHmmss).ToString())"

Write-Verbose "Rename parameter set - Renaming folder to '$renameFolder'"

Rename-Item $UserData $renameFolder

}

else {

Write-Verbose "Remove parameter set - Deleting existing data."

Remove-Item $UserData -Recurse -Force

}

}

#Import registry key

Write-Verbose "Importing Registry backup from $REGSource"

$regCMD = Invoke-Command { reg import "$REGSource" }

#Import user data

#

Write-Verbose "Decompressing '$ZIPSource' to $edgeProfilesPath"

try {

Expand-Archive -Path $ZIPSource -DestinationPath $edgeProfilesPath -Force

Write-Output "EDGE Profile import completed to: $UserData"

}

catch {

#Error out and cleanup

Write-Error $_

Remove-Item $zipBackupDestination -Force -ErrorAction SilentlyContinue

Remove-Item $regBackupDestination -Force -ErrorAction SilentlyContinue

Write-Error "EDGE import failed, did you forget to keep EDGE closed?!"

break

}

#endregion Execute

}

Export-ModuleMember -Function Backup-EDGEProfiles, Restore-EDGEProfiles
````

### Backup-EDGEProfiles

````powershell
function Backup-EDGEProfiles {
  <#
   .Synopsis
    Backup current users Microsoft EDGE (Anaheim) Profiles.
   .Description
    Will backup all EDGE "User Data" for the current user.
   .Parameter Verbose
    Enables extended output
   .Parameter Destination
    (optional)
    Location in which to save the backup ZIP and REG files
    Defaults to the users OneDrive
   .Parameter AddDate
    (optional - $true/$false)
    Applies a date stamp to the filenames.
    Defaults to $true
   .Example
     # Backup the current users EDGE Profiles to the _EdgeProfilesBackup folder in the users own OneDrive.
     Backup-EDGEProfiles
   .Example
     # Backup the current users EDGE Profiles to the users own TEMP folder.
     Backup-EDGEProfiles -Destination $env:TEMP
   .NOTES
   This function backs up the following for an Edge User Profile:
    - Compressed archive backup of folder: %LOCALAPPDATA%\Microsoft\Edge
    - Registry backup of path: HKCU\Software\Microsoft\Edge\PreferenceMACs
  #>

  [CmdletBinding()]
  param (
    [Parameter(Mandatory = $false,
      HelpMessage = "Destination of the EDGE profile backup (Defaults to OneDrive Backups folder: ~\OneDrive\Backups\EdgeProfilesBackup)")]
    [string]$Destination = (Join-Path -Path $env:OneDrive -ChildPath "\Backups\EdgeProfilesBackup"),
    [Parameter(Mandatory = $false,
      HelpMessage = "Append the current date to the backup (Defaults to true)")]
    [bool]$AddDate = $true
  )

  #region Execute

  #Verify that the entered destination exists
  if ((-not (Test-Path $Destination) -and ($Destination -eq (Join-Path -Path $env:OneDrive -ChildPath "\_EdgeProfilesBackup")))) {
    #Create default destination
    New-Item -ItemType Directory -Path $Destination -Force | Out-Null
  }
  elseif (-not (Test-Path $Destination)) {
    Write-Warning "The entered destination path could not be validated ($Destination)"
    break
  }

  #Verify EDGE is closed
  if (Get-Process msedge -ErrorAction SilentlyContinue) {
    Write-Error "EDGE is still running, please close any open EDGE Browsers and try again."
    break
  }

  Write-Output "Starting EDGE profiles backup for $($env:USERNAME) to ($Destination) - DON'T OPEN EDGE! and please wait..."
  Write-Verbose "Destination root   : $Destination"
  Write-Verbose "Append date        : $AddDate"

  #Date name addition check
  if ($AddDate) {
    $dateName = (get-date -Format ddMMMMyyyy).ToString()
  }
  else {
    $dateName = ""
  }

  #Setting some important variables
  $edgeProfilesPath = (Join-Path -Path $env:LOCALAPPDATA -ChildPath "\Microsoft\Edge")
  $edgeProfilesRegistry = "HKCU\Software\Microsoft\Edge\PreferenceMACs"

  #Export registry key
  $regBackupDestination = (Join-Path -Path $Destination -ChildPath "\EDGE-ProfilesRegistry$($dateName)-$($env:USERNAME).reg")
  Write-Verbose "Exporting Registry backup to $regBackupDestination"
  #Remove any existing destination file, else the export will stall.
  if (($regBackupDestination -ilike "*.reg") -and (Test-Path $regBackupDestination)) {
    Remove-Item $regBackupDestination -Force -ErrorAction SilentlyContinue
  }
  $regCMD = Invoke-Command { reg export "$edgeProfilesRegistry" "$regBackupDestination" }

  #Export user data

  #Cleaning cache
  Write-Verbose "Cleaning up cache before export."
  if (Test-Path $edgeProfilesPath) {
    $cacheFolders = Get-ChildItem -Path $edgeProfilesPath -r  | Where-Object { $_.PsIsContainer -and $_.Name -eq "Cache" }
    Foreach ($folder in $cacheFolders) {
      $rmPath = Join-Path -Path $folder.fullname -ChildPath "\*"
      Write-Verbose "Emptying $rmPath"
      Remove-Item $rmPath -Recurse -Force
    }
    Write-Verbose "Cleanup completed."
  }
  else {
    Write-Error "EDGE user data folder missing - terminating!"
    break
  }

  #Creating ZIP Archive
  $zipBackupDestination = (Join-Path -Path $Destination -ChildPath "\EDGE-UserData$($dateName)-$($env:USERNAME).zip")
  Write-Verbose "Exporting user data backup to $zipBackupDestination"
  #Remove any existing destination file, else the export will fail.
  if (($zipBackupDestination -ilike "*.zip") -and (Test-Path $zipBackupDestination)) {
    Remove-Item $zipBackupDestination -Force -ErrorAction SilentlyContinue
  }
  #Compressing data to backup location
  try {
    Get-ChildItem -Path $edgeProfilesPath | Compress-Archive -DestinationPath $zipBackupDestination -CompressionLevel Fastest
    Write-Output "EDGE Profile export completed to: $Destination"
  }
  catch {
    #Error out and cleanup
    Write-Error $_
    Remove-Item $zipBackupDestination -Force -ErrorAction SilentlyContinue
    Remove-Item $regBackupDestination -Force -ErrorAction SilentlyContinue
    Write-Error "EDGE Backup failed, did you forget to keep EDGE closed?!"
    break
  }
  #endregion Execute
}

````

### Restore-EDGEProfiles

````powershell
function Restore-EDGEProfiles {
  <#
   .Synopsis
    Restore Microsoft EDGE (Anaheim) Profiles to the current users EDGE Browser.
   .Description
    Will restore all EDGE "User Data" for the current user from an archive created by the Backup-EDGEProfiles function.
   .Parameter Verbose
    Enables extended output
   .Parameter ZIPSource
    (Mandatory - file path)
    Location of the User Data backup archive file.
   .Parameter REGSource
    (Mandatory - file path)
    Location of the profile data registry file.
   .Parameter ExistingDataAction
    (Mandatory - Rename/Remove)
    Choose wheather to have the existing User Data removed completely or just renamed. Renaming will add a datestamp to the existing USer Data folder.
   .Example
     # Restore a previous backup and remove existing user data.
     Restore-EDGEProfiles -ZIPSource EDGE-UserData30July2021-MichaelMardahl.zip -REGSource EDGE-ProfilesRegistry30July2021-MichaelMardahl.reg -ExistingDataAction Remove
  #>

  #Add the -verbose parameter to commandline to get extra output.
  [CmdletBinding()]
  param (
    [Parameter(Mandatory = $true,
      HelpMessage = "Source of the EDGE User Data profile backup archive")]
    [string]$ZIPSource,
    [Parameter(Mandatory = $true,
      HelpMessage = "Source of the EDGE Registry profile backup file")]
    [string]$REGSource,
    [Parameter(Mandatory = $true,
      HelpMessage = "How to handle the existing profiles? Options are Backup or Remove")]
    [ValidateSet('Rename', 'Remove')]
    [string]$ExistingDataAction
  )

  #region Execute

  #Verify that the entered sources exits and have the right fileextention
  if (-not ((Test-Path $ZIPSource) -or (-not ($ZIPSource -ilike "*.zip")))) {
    Write-Error "The entered source file could not be validated ($ZIPSource)"
    break
  }
  if (-not ((Test-Path $REGSource) -or (-not ($REGSource -ilike "*.reg")))) {
    Write-Error "The entered source file could not be validated ($REGSource)"
    break
  }

  #Verify EDGE is closed
  if (Get-Process msedge -ErrorAction SilentlyContinue) {
    Write-Error "EDGE is still running, please close any open EDGE Browsers and try again."
    Break
  }

  Write-Output "Starting EDGE profiles restore for $($env:USERNAME) - (DON'T OPEN EDGE!) please wait..."
  Write-Verbose "Source archive   : $ZIPSource"
  Write-Verbose "Source registry  : $REGSource"

  #Define location of EDGE Profile for current user
  $edgeProfilesPath = (Join-Path -Path $env:LOCALAPPDATA -ChildPath "\Microsoft\Edge")

  #Handle existing User Data
  $UserData = (Join-Path -Path $edgeProfilesPath -ChildPath "\User Data")
  if (Test-Path $UserData) {
    Write-Verbose "Existing User Data folder found in $edgeProfilesPath"
    if ($ExistingDataAction -eq "Rename") {
      $renameFolder = "$($UserData)-$((get-date -Format ddMMMMyyyy-HHmmss).ToString())"
      Write-Verbose "Rename parameter set - Renaming folder to '$renameFolder'"
      Rename-Item $UserData $renameFolder
    }
    else {
      Write-Verbose "Remove parameter set - Deleting existing data."
      Remove-Item $UserData -Recurse -Force
    }
  }

  #Import registry key
  Write-Verbose "Importing Registry backup from $REGSource"
  $regCMD = Invoke-Command { reg import "$REGSource" }

  #Import user data
  #
  Write-Verbose "Decompressing '$ZIPSource' to $edgeProfilesPath"
  try {
    Expand-Archive -Path $ZIPSource -DestinationPath $edgeProfilesPath -Force
    Write-Output "EDGE Profile import completed to: $UserData"
  }
  catch {
    #Error out and cleanup
    Write-Error $_
    Remove-Item $zipBackupDestination -Force -ErrorAction SilentlyContinue
    Remove-Item $regBackupDestination -Force -ErrorAction SilentlyContinue
    Write-Error "EDGE import failed, did you forget to keep EDGE closed?!"
    break
  }
  #endregion Execute
}
````

## Personal Script

*Source: [jimbrig/jimsdots My personalized dotfiles and configs for Windows 10 ⚙️](https://github.com/jimbrig/jimsdots/blob/main/edge/backup-edge-settings.ps1)*

````powershell
# Edge Backup Script (PowerShell Core)

$dotdir = "$env:DOTDIR"
$edge_backup_dir = "$dotdir\edge\backups\edge"
$edge_dev_backup_dir = "$dotdir\edge\backups\edge_dev"

$edge_appdata_dir = "$env:LocalAppData\Microsoft\Edge"
$edge_dev_appdata_dir = "$env:LocalAppData\Microsoft\Edge Dev"

Copy-Item $edge_appdata_dir -Destination $env:TEMP\edge -Force -Recurse
Copy-Item $edge_dev_appdata_dir -Destination $env:TEMP\edge_dev -Force -Recurse

Compress-Archive -Path "$env:TEMP\edge\User Data" -DestinationPath "$edge_backup_dir\UserData.zip" -Update
Compress-Archive -Path "$env:TEMP\edge_dev\User Data" -DestinationPath "$edge_dev_backup_dir\UserData.zip" -Update

Invoke-Command { reg export 'HKCU\Software\Microsoft\Edge\PreferenceMACs' $dotdir\edge\backups\edge\edge_registry_settings.reg }
Invoke-Command { reg export 'HKCU\Software\Microsoft\Edge Dev\PreferenceMACs' $dotdir\edge\backups\edge_dev\edge_dev_registry_settings.reg }
````

---

## Appendix: Links

*Related*

* [Edge Search Engines](../../../0-Slipbox/Edge%20Search%20Engines.md)

*Backlinks:*

* [Microsoft Edge](../../../3-Resources/Tools/Web%20Browsers/Microsoft%20Edge.md)
