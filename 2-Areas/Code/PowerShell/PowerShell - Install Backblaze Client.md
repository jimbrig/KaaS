---
Date: 2022-03-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: ["PowerShell - Install Backblaze Client"]
---

# PowerShell - Install Backblaze Client

*Source: https://gist.github.com/be28121bdd9d2b8b637f932a110b6f53#file-instbbc-ps1*

```powershell
<#
	powershell script to install backblaze backup client
	-groupID <groupID>
	-groupToken <groupToken>
	-userEmail <userEmail>c
	-password <password>
	-sso 
    -adfs
	-csvMapfile <mapfile>
	-emailHeader <email_header_value>
	-hostHeader <host_header_value>
	-installSrc <src_directory>

<# no positional parameters accepted #>
[CmdletBinding(PositionalBinding=$false)]

param( [string]$groupID,
    [string]$groupToken,
    [string]$userEmail,
    [string]$password = "none",
    [string]$csvMapfile,
    [string]$emailHeader = "Email",
    [string]$hostHeader = "Hostname",
    [string]$installSrc,
	[switch]$sso,
	[switch]$adfs
)

$LOGNAME="Backblaze Powershell Installation Script"

<# false will turn off host console messages #>
#$debug = $false
<# true will turn host console messages on and some additional stuff #>
$debug = $true
$BACKBLAZE_INSTALLER = 'install_backblaze.exe'

#############

<# ############################# 
# This is specific to my testing environment
# Feel free to test & develop, but these may need other values
#>

# $env:COMPUTERNAME returns the netbios name, limited to 15 characters
# This returns the full hostname.
$localMachineHostname = [system.net.dns]::gethostname()


<# ################################ #>

<#   All events are logged to the Application log regardless #>
<# register this as a source in the system Application log #>

if ( -not ( [System.Diagnostics.EventLog]::SourceExists($LOGNAME) ) ) {
    New-EventLog -LogName Application -Source $LOGNAME
}
	<# event numbering for Application log, specify namespace as is referenced in a function #>
[int]$global:eventIx = 1

<# explicitly set this to empty string as it is tested in doCleanup #>
$tempDirName = ""

<# need to remove the temporary directory? #>
$flagNeedDirCleanup = $false

<# if and only if the author's setup vars #>
if ( ("MYTHOS" -eq $localMachineHostname)  -or 
     ("DESKTOP-3D2E2U1" -eq $localMachineHostname) -or 
     ("MythosLotus" -eq $localMachineHostname) ) {
    $groupID = "zodmo"
    $groupToken = "pismo"
    $csvMapFile = "c:\tmp\testfile.csv"
    $installSrc = "c:\tools\gowork\bin"
    $password = "none"
    $BACKBLAZE_INSTALLER = 'testinstall.exe'
    MyOutput " *** THIS IS THE AUTHOR'S PRIVATE DEBUG MODE *** "
}

# Either the value is passed in, or it can be hardcoded
# has to be there, though. If it's just left as a value
# it will throw an error eventually
if ( $installSrc ) {
    $BACKBLAZE_INSTALL_DIR = $installSrc
} else {
    $BACKBLAZE_INSTALL_DIR = join-path $localMachineHostname "\tmp\backblaze_install_dir"
    MyOutput "WARNING: BACKBLAZE INSTALL DIRECTORY MAY NOT BE SET CORRECTLY (set to ${localMachineHostname})"
}



##################################################
# functions called multiple places or to clarify program logic 
##################################################
function ScriptUsage {
    write-host "TODO: helpful usage message here"
}
##################################################
function DebugOutput {
    param( [string]$out )
    if ( $debug ) {
        write-host "[debug[${global:eventIx}]] $out"
    }
}
##################################################
function MyOutput {
    param( [string]$out )

    # Everything to the applog
    Write-EventLog –LogName Application –Source $LOGNAME –EntryType Information –EventID $eventIX –Message $out
    DebugOutput "event ${global:eventIx}: $out"
    $global:eventIx = $global:eventIx + 1
}
##################################################
function MyThrow {
    param( [string]$throwMessage )
    MyOutput $throwMessage
    Throw $throwMessage
} 
##################################################
function directoryCleanup {
    # name exists and the directory exists?
    if ( ( $tempDirName ) -and (test-path $tempDirName) ) {
        # work around an error in Remove-Item's *recurse* functionality
        # remove the install data copied from the network IN the directory
        Get-ChildItem -path $tempDirName -recurse | Remove-Item -force -recurse
        # and then remove the directory itself
        Remove-Item $tempDirName -force -recurse
        $flagNeedDirCleanup = $false
    }
}
##################################################
function doCleanup {
    if ($flagNeedDirCleanup) {
        directoryCleanup
    }
}
##################################################
function isValidEmail {
    param($test)
    <# ###########################################
		Trying to validate an email address by form
		is beyond painful. Fortunately, Microsoft will
		do it for us. Cast the string into a [mailaddress]
		and if the cast works, it is syntactically legal
	############################################ #>
    try {
        $rc = [mailaddress]$test
        return $true
    } catch {
        return $false
    }
    return $false
}
#####################################
function isMissing {
    param ($list, $value)
    if ($debug) {
        write-host "looking for $value in variable list"
        write-host $list
    }
    foreach ($val in $list) {        
        if ($val -eq $value) {
           return $false
        }
    } 
    return $true
}
#####################################
function checkPermissions {
    param($thing)

    if ( $debug ) {
        write-host $thing
        (get-acl ${thing}).access | ft IdentityReference,FileSystemRights,AccessControlType,IsInherited,InheritanceFlags -auto
    }
}
#######################################
function testFileLock {
  param ( [parameter(Mandatory=$true)][string]$Path)

  $oFile = New-Object System.IO.FileInfo $Path
  if (-not (Test-Path -Path $Path) ) {
    return $false
  }

  try {
    $oStream = $oFile.Open([System.IO.FileMode]::Open, [System.IO.FileAccess]::ReadWrite, [System.IO.FileShare]::None)
    if ($oStream) {
      $oStream.Close()
    }
    return $false
  } catch {
    # file is locked by a process.
    return $true
  }
}
#############################################
function Is-Installed( $program ) {
    
    $installed86 = ((Get-ChildItem "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall") |
        Where-Object { $_.GetValue( "DisplayName" ) -like "*$program*" } ).Length -gt 0;

    $installed64 = ((Get-ChildItem "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall") |
        Where-Object { $_.GetValue( "DisplayName" ) -like "*$program*" } ).Length -gt 0;

    return $installed86 -or $installed64;
}
#############################################



if ( Is-Installed( "Backblaze" ) ) {
	MyThrow( "Backblaze is already installed on $localMachineHostname" )
	#exits, does not return
}

<# test for SSO #>
if ( $sso ) {
	$password = "sso"
}

<# This sets $emailAddress #>
if ( $adfs ) {
	$dotNetPath=[System.IO.Path]::GetDirectoryName([Object].GetType().Assembly.Location)
	[Reflection.Assembly]::LoadFile($dotNetPath  + '\System.DirectoryServices.AccountManagement.dll')
	$emailAddress = [System.DirectoryServices.AccountManagement.UserPrincipal]::Current.EmailAddress
	MyOutput( "got this email from ADFS: $emailAddress" )
}

#if the author's system || a testsystem ;-)
if ( $debug -or  
        ( ("MYTHOSLOTUS" -eq $localMachineHostname) -or 
          ("MYTHOS" -eq $localMachineHostname)  -or 
          ("DESKTOP-3D2E2U1" -eq $localMachineHostname) ) ) {
    # Using the $PSVersionTable.PSVersion.Major 
    #     directly doesn't work correctly. Why? 
    $pmPlus = $PSVersionTable.PSVersion.Major
    $pmPlusRev = $PSVersionTable.PSVersion.MajorRevision
    $pmNeg = $PSVersionTable.PSVersion.Minor
    $pmNegRev = $PSVersionTable.PSVersion.MinorRevision
    $thisVersion = "${pmPlus}.${pmPlusRev}.${pmNeg}.${pmNegRev}"
    $zod = $debug
    $debug = $true
    MyOutput	"PowershellVersion: ${thisVersion}"
    MyOutput	"arg groupID:       $groupID"
    MyOutput	"arg groupToken:    $groupToken"
    MyOutput	"arg userEmail:     $userEmail"
    MyOutput	"arg password:      $password"
    $debug = $zod
}

MyOutput "localMachineHostname: $localMachineHostname`r`n"

<# Validate assumptions #>

#Install path exists?
$ret = test-path $BACKBLAZE_INSTALL_DIR
MyOutput "BACKBLAZE_INSTALL_DIR [$BACKBLAZE_INSTALL_DIR] existence returned as ret [$ret]"
if( -not $ret ) {
    $parent = Split-Path -parent $BACKBLAZE_INSTALL_DIR
    Get-ChildItem $parent
    MyThrow "Panic: $BACKBLAZE_INSTALL_DIR does not exist? Check sharing of network directory!"
}

$BBFUPATH = join-path $BACKBLAZE_INSTALL_DIR $BACKBLAZE_INSTALLER

#Backblaze installer is present?
if ( -not ( test-path -path "$BBFUPATH" ) ) {
    Get-ChildItem $BACKBLAZE_INSTALL_DIR
    MyThrow "Panic: BBUPATH [$BBUPATH] does not exist? Where is the installer?"
}

MyOutput "Full path of installer [ $BBFUPATH ] existence returned as ret [$ret]"

<# Validate parameters, throw error.#>
<# **Do not mark params as mandatory** (this may cause a user prompt) #>

# doesn't matter if they are passed in or hardcoded
if( -not $groupID ) {
    ScriptUsage
    MyThrow "Error: value for -groupID missing"
}

if( -not $groupToken ) {
    ScriptUsage
    MyThrow "Error: value for -groupToken missing"
}

if ( -not $userEmail -and -not $csvMapfile ) {
    ScriptUsage
    MyThrow "Error: missing a value for -userEmail [$userEmail], -csvMapfile [$csvMapfile], or -sso [$sso] (should have exactly one of these)"
}

if( (-not $userEmail) -and -not ([System.IO.File]::Exists($csvMapfile)) ) {
    scriptUsage
    MyThrow "File $csvMapfile does not exist or cannot be accessed"
}

if ( -not $userEmail ) {

	$dbFile =  import-csv $csvMapfile
	$dbHeaders = $dbFile[0].psobject.Properties.name
	#if ( -not $dbHeaders -contain $emailHeader )  { #works in PSVersion 6, fails in PSVersion 5
	if ( isMissing $dbHeaders $hostHeader ) {
	    write-host "dbHeaders are: "
	    write-host $dbheaders
	    write-host $dbHeaders = $dbFile[0].psobject.Properties.name
	    write-host "csvfile contents are"
	    write-host $dbfile
	    MyThrow "Panic: $csvMapfile does not contain the expected host machine header [$hostHeader]"
	}

	#if ( -not $dbHeaders -contain $emailHeader ) { #works in PSVersion 6, fails in PSVersion 5
	if ( isMissing $dbHeaders $emailHeader ) {
	    write-host "dbHeaders are: "
	    write-host $dbheaders
	    write-host $dbFile[0].psobject.Properties.name
	    write-host "csvfile contents are"
	    write-host $dbfile
	    MyThrow "Panic: $csvMapfile does not contain the expected user email header [$hostEmail]"
	}

	if ($dbFile.Count -le 0 ) {
	    MyThrow "File $csvMapfile did not import correctly (no members found)"
	}

	$ix=0;
	# is there better way to lookup values other than O(n) search?
	# -- answer appears to be 'no'
	foreach ($row in $dbFile) {
	    $ix = $ix+1
	    # don't log this to the ApplicationLog in non-debug mode
	    if ($debug) {
	        $thisHost = $row.$hostHeader
	        MyOutput "processing row $ix looking for ${hostHeader}::${localMachineHostname} | found host $thisHost"
	    }
	    if ($row.$hostHeader -eq $localMachineHostname) {
	        $userEmail = $row.$emailHeader.trim()
	        MyOutput "found [$emailHeader]$userEmail in row $ix -- array starts at 1"
	        break
	    }
	}

	# possibility: we did not match a username for this host in the loop above.
	# The host might not be there, email might be invalid, test for this when 
	# testing $userMail validity

}

$userEmail = $userEmail.trim()

if (-not($userEmail)) {
    MyThrow "Panic: csv file $csvMapfile did not contain an email for this host [ $localMachineHostname ] and no valid emailUser parameter passed in"
}

# at this point, there is a nonempty string for email, but is it useful?
if (!(isValidEmail $userEmail )) {
    MyThrow "Panic: email address [ $userEmail ] is invalid"
}

# find a place to copy the installation directory
$tempDir = [system.io.path]::gettemppath()
MyOutput "    tempDir: [$tempDir]"

# get random names until one of them is available
do {
    $tempName = [system.io.path]::getrandomfilename()
    $tempDirName = join-path -path $tempDir -childpath $tempName
    MyOutput "tempDirName: [ $tempDirName ]"
} while ( test-path $tempDirName )

# NEW-ITEM won't create intervening directories
#   but System.IO.Directory::CreateDirectory(<dirname>) will
# new-item -itemtype directory -path $tempDirName
$ret = [system.io.directory]::createdirectory($tempDirName)
# capture return object in $ret to prevent its display
# (unless we are in debug mode, of course 
DebugOutput $ret

# make certain temp dir was created
if ( !( test-path $TempDirName )) {
    MyThrow "Unable to create temp directory [ $tempDirName ] - check permissions and disk space"
}

# make sure we can write to those places
checkPermissions $BACKBLAZE_INSTALL_DIR
checkPermissions $tempDirName

# created directory, remove it afterward
$flagNeedDirCleanup = $true

DebugOutput "about to copy $BACKBLAZE_INSTALL_DIR to $tempDirName"
try {
    copy-item $BACKBLAZE_INSTALL_DIR -destination $tempDirName -recurse
} catch {
    doCleanup
    MyThrow "failed to recursively copy [$BACKBLAZE_INSTALL_DIR] to [$tempDirName] on $localMachineHostname"
    #Leaves '$tempDirName' in a bad state, OK because script exits on throw
}

#put our current directory on the location stack
push-location

$final_dir = split-path -leaf $BACKBLAZE_INSTALL_DIR

$localBackblazeInstallDir = join-path -path $tempDirName -child $final_dir

MyOutput "localBackblazeInstallDir: $localBackblazeInstallDir"

CheckPermissions ${localBackblazeInstallDir}


# attempt to cd to our temporary directory
try {
    set-location $localBackblazeInstallDir
} catch {
    pop-location
    doCleanup
    MyThrow "Panic: could not change directory to [${localBackblazeInstallDir}] although it existed?"
}

$BCMD = join-path $localBackblazeInstallDir $BACKBLAZE_INSTALLER

if ( -not [System.IO.File]::Exists($BCMD) ) {
    MyThrow "Panic: $BCMD doesn not exist? Did not erase directory $localBackblazeInstallDir please check permissions and disk size"
}

checkPermissions $BCMD

$installCommand = "${BCMD} -nogui -createaccount $userEmail $password $groupID $groupToken"
$thisDirectory = (Get-Item -Path ".\").FullName

MyOutput "about to execute command: [ $installCommand ] currently in directory $thisDirectory"

$ierc = Invoke-Expression $installCommand

# do not use $LastErrorCode following invoke-expression
# the installer returns 1001 on success. historical reasons. 
$ret = $LASTEXITCODE

# return to our initial directory
pop-location

$thisDirectory = (Get-Item -Path ".\").FullName
MyOutput "Returned to directory ${thisDirectory}"

# For an unknown reason the system holds the
# install_backblaze.exe file LOCKED for some time, and the 
# script must pause until the system unlocks the file
$sCount = 0
$tUnit = "second"
do {
    start-sleep 1
    $sCount = $sCount + 1
    if ( $debug ) { 
        if (testFileLock $BCMD) {
            write-host "file $BCMD has been locked for $sCount $tUnit (but should unlock shortly ...) "
        } else {
            write-host "`r`nfile $BCMD is unlocked after $sCount ${tUnit} `r`n"
        }
        $tUnit = "seconds"
    }
} while ((testFileLock $BCMD) -and ($sCount -le 120) )
# do not wait longer than 120 seconds for file unlock

# cleanup & remove any downloaded files ... if the lock is open
if ( -not (testFileLock $BCMD) )  {
	doCleanup
}

# did the installer return with the correct error code? If not, complain
# if there is no return code, do not bother with this at all
if ( $ret -and $ret -ne 1001 ) {
    MyDebug "invoke-expression returned value [${ierc}] and rc [${ret}]"
    MyThrow "Error: backblaze_install [${BCMD}] exited with error code [${ret}]"
}
```

***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[Development]]
- [[Windows]]
- [[Microsoft DOS]]
- [[Command Line]]
- [[2-Areas/MOCs/PowerShell]]

*Backlinks:*

```dataview
list from [[PowerShell - Install Backblaze Client]] AND -"Changelog"
```