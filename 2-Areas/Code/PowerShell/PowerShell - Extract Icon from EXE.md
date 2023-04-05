# PowerShell - Extract Icon from EXE

## Contents

* [Function](PowerShell%20-%20Extract%20Icon%20from%20EXE.md#function)
* [Extract Multiple Icons from Exe’s in a Folder:](PowerShell%20-%20Extract%20Icon%20from%20EXE.md#extract-multiple-icons-from-exe-s-in-a-folder)
* [Appendix: Links](PowerShell%20-%20Extract%20Icon%20from%20EXE.md#appendix-links)

## Function

*Source: Originally from [Extract Icon from .EXE Powershell (spiceworks.com)](https://community.spiceworks.com/topic/592770-extract-icon-from-exe-powershell) but altered for my needs.*

````powershell
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
````

## Extract Multiple Icons from Exe’s in a Folder:

````powershell
Function Get-ExeIconsFromFolder {
	<#
	.SYNOPSIS
	Retrieves icons for each exe file in a folder and saves it as an icon (.ico) file in the same directory as the .exe file.
	.DESCRIPTION
	Get-DiskInventory will run on every .exe file in the specified directory by the folder PARAMETER then save a .ico file for every .exe discovered.
	.PARAMETER Folder
	The directory containing the .exe files.
	.EXAMPLE
	Get-ExeIconsFromFolder -Folder "C:\Program Files\Google\Chrome\Application"
	#>

    Param ( 
    [Parameter(Mandatory=$true)]
    [string]$Folder
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
````

---

## Appendix: Links

* *Code*
* [Development](../../MOCs/Development.md)
* [Microsoft](../../MOCs/Microsoft.md)
* [Microsoft DOS](../../../3-Resources/Tools/Developer%20Tools/Shell/Microsoft%20DOS.md)
* [Windows Command Line](../../../3-Resources/Tools/Developer%20Tools/Shell/Microsoft%20DOS.md)
* [2-Areas/MOCs/PowerShell](../../MOCs/PowerShell.md)
* [Batch Scripting Tips and Tricks](../../../0-Slipbox/Batch%20Scripting%20Tips%20and%20Tricks.md)

*Backlinks:*

````dataview
list from [[PowerShell - Extract Icon from EXE]] AND -"Changelog"
````
