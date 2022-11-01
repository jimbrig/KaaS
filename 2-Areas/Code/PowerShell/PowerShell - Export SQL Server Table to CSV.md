---
Date: 2022-11-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: ["PowerShell - Export SQL Server Table to CSV"]
---

# PowerShell - Export SQL Server Table to CSV

*Source: *

```powershell
# TODO: Implement Get-Credential

$outputPath = 'C:\Users\jbriggs010\Dev\pwc\pwc-us-rms\renredb\data\CSV\'

$server = 'raphael.database.windows.net'
$user = 'renreadmin'
# $pw = ConvertTo-SecureString -String 'KjqekNwI85'  -AsPlainText -Force
$db = 'dev'
$pw = 'KjqekNwI85'

$tbls = (Invoke-Sqlcmd -Query "SELECT NAME FROM sys.tables" -ServerInstance $server -Database $db -Username $user -Password $pw).NAME

# TODO: Add With-Progress
# TODO: Figure out how to implment try-catch/error-handling
# TODO: Export as CSV or SQL (data and/or schema) - ideally would export schema as SQL and data as CSV

ForEach ($tbl in $tbls) {
    
    $qry = "SELECT * from [dev].[dbo].[$tbl];"
    
    $destFile = $outputPath + $tbl + '.csv'

    Write-Host "Exporting Table: $tbl to path: $destFile" -ForegroundColor Yellow
    Write-Host "Executing Query: $qry" -ForegroundColor Magenta

    Invoke-Sqlcmd -Query $qry -ServerInstance $server -Database $db -Username $user -Password $pw | Export-Csv -Path $destFile -NoTypeInformation

    Write-Host "Successfully exported $tbl!" -ForegroundColor Green
}

explorer.exe $outputPath

# TODO: Add a log output txt file with CSVs


```

***

## Appendix: Links and References

- [[2022-11-01]]

- [[2-Areas/Code/_README|Code]]
- [[Development]]
- [[Microsoft]]
- [[Microsoft DOS|Windows Command Line]]
- [[2-Areas/MOCs/PowerShell|PowerShell (MOC)]]
- [[3-Resources/Tools/Developer Tools/Languages/PowerShell/_README|PowerShell (Tools)]]
- [[2-Areas/Code/PowerShell/_README|PowerShell (Code)]]

***

*Backlinks:*

```dataview
list from [[PowerShell - Export SQL Server Table to CSV]] AND -"Changelog"
```

***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2022

***
