```powershell
Function Get-ExeIcon {

	<#
    .SYNOPSIS
    Get-ExeIcon extracts the icon image from an exe file and saves it as an Icon (.ico)
    file in the defined `-OutputDir`.

    .DESCRIPTION
    Get-DiskInventory will run on the .exe file and then save the .ico file for and images discovered.

    .PARAMETER ExePath
    Path to the .exe file
    
    .PARAMETER OutputDir
    Directory to output the extracted ico.
    
    .EXAMPLE
    # Extract Google Chrome's Icon and Save under ~/Pictures/Icons:
    Get-ExeIcon -ExePath "C:\Program Files\Google\Chrome\Application\chrome.exe" -OutputDir "$env:USERPROFILE\Pictures\Icons"
	#>

    Param ( 
    [Parameter(Mandatory=$true)]
    [string]$ExePath,
    [Parameter(Mandatory=$true)]
    [string]$OutputDir
    )

    [System.Reflection.Assembly]::LoadWithPartialName('System.Drawing')  | Out-Null

    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($ExePath)

    $outputFile = Join-Path $OutputDir "$baseName.ico"

    [System.Drawing.Icon]::ExtractAssociatedIcon($ExePath).ToBitmap().Save("$outputFile")

}
```


```powershell
Function Get-ExeIcon {
	<#
		.SYNOPSIS
		Get-Icon extracts the icon image from an exe file 			and saves it as a .ico file in the same directory as
the .exe file.
.DESCRIPTION
Get-DiskInventory will run on every .exe file in the specified
directory by the folder PARAMETER then save a .ico file for
every .exe discovered.
.PARAMETER folder
The directory containing the .exe files.
.EXAMPLE
Get-Icon -folder c:\exelocation -name
	#>

    Param ( 
    [Parameter(Mandatory=$true)]
    [string]$folder
    )

    [System.Reflection.Assembly]::LoadWithPartialName('System.Drawing')  | Out-Null

    md $folder -ea 0 | Out-Null

    dir $folder *.exe -ea 0 -rec |
      ForEach-Object { 
        $baseName = [System.IO.Path]::GetFileNameWithoutExtension($_.FullName)
        Write-Progress "Extracting Icon" $baseName
        [System.Drawing.Icon]::ExtractAssociatedIcon($_.FullName).ToBitmap().Save("$folder\$BaseName.ico")
    }

}
```