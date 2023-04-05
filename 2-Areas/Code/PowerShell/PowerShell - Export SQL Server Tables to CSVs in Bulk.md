# Export SQL Server Tables to CSVs in Bulk

*Source: Personal PowerShell Code*

`Export-SQLTablesToCSV`

````powershell
Function Export-SQLTablesToCSV {
    <#
    .DESCRIPTION
    Exports all tables from a fiven database and server to CSVs into a supplied output path.

    .SYNOPSIS
    Utility for Exporting CSV tables from SQL Server Databases.

    .INPUTS
    Database connection arguments and an output path.

    .OUTPUTS
    Exported CSVs.

    .PARAMETER OutputPath
    Path to export CSVs to

    .PARAMETER Server
    Database Server

    .PARAMETER User
    Database User

    .PARAMETER Password
    Database Password

    .PARAMETER Database
    Server Database

    .LINK

    .NOTES

    .EXAMPLE    
        $outputPath = 'C:\CSV\'
        $server = 'myserver.database.windows.net'
        $user = 'admin'
        $pw = Read-Host -AsSecureString
        $db = 'dev'

        Export-SQLTableToCSV $outputPath $server $user $pw $db
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0, HelpMessage = 'Destination Path for Exported CSV Files.')]
        [string]
        $OutputPath,

        [Parameter(Position = 1, HelpMessage = 'Database Server')]
        [string]
        $Server,

        [Parameter(Position = 2, HelpMessage = 'Database Username to login with')]
        [string]
        $User,

        [Parameter(Position = 3, HelpMessage = 'Database Password to login with.')]
        [string]
        $Password,

        [Parameter(Position = 4, HelpMessage = 'Database on the server to connect to.')]
        [string]
        $Database
    )
    
    # validate OutputPath
    If (!(Test-Path $OutputPath)) {
        Write-Warning 'Specified OutputPath does not exist.'
        New-Item -ItemType Directory -Path $OutputPath -Force
    }

    # decrypt password
    # $passwordString = ConvertFrom-SecureString -SecureString $Password

    # collect tables
    $tbls = (Invoke-Sqlcmd -Query 'SELECT NAME FROM sys.tables' -ServerInstance $server -Database $db -Username $user -Password $Password).NAME

    # setup counter
    $counter = 1
    $total = $tbls.Count
    
    ForEach ($tbl in $tbls) {
    
        $qry = "SELECT * from [dev].[dbo].[$tbl];"
        $destFile = $outputPath + $tbl + '.csv'
        
        Write-Host "Exporting Table $counter of $total" -ForegroundColor Cyan

        try {
            Write-Host "Exporting Table: $tbl to path: $destFile" -ForegroundColor Yellow
            Write-Host "Executing Query: $qry" -ForegroundColor Magenta
                
            Invoke-Sqlcmd -Query $qry -ServerInstance $server -Database $db -Username $user -Password $Password | `
                    Export-Csv -Path $destFile -NoTypeInformation -ErrorAction Continue

        } catch {

            Write-Host "Error exporting table: $tbl. Skipping and continuing to next export..." -ForegroundColor Red
            
        } finally {
            
            If (Test-Path $destFile) {
                Write-Host "Successfully exported $tbl to CSV file at path $destFile!" -ForegroundColor Green
            }

            $counter = $counter + 1
            
        }
        
    }

    Explorer.exe $OutputPath

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
list from [[Export SQL Server Tables to CSVs in Bulk]] AND -"Changelog"
````
