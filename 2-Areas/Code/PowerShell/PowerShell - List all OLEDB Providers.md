---
Date: 2022-10-26
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell", "#Topic/Dev/Databases"]
Alias: ["Get-OLEDBProviders"]
---

# List all OLEDB Providers with PowerShell

*Original Source: http://dbadailystuff.com/list-all-ole-db-providers-in-powershell*

See https://www.powershellgallery.com/packages/Get-OLEDBProvider/1.0.0 for my published version of this Script in the PowerShell Gallery.

## Contents

- [[#Snippet|Snippet]]
- [[#Example Output|Example Output]]
- [[#Function|Function]]
- [[#Filtering Output|Filtering Output]]
- [[#Appendix: Links|Appendix: Links]]


## Snippet

```powershell
#!/usr/bin/env pwsh

ForEach ($provider in [System.Data.OleDb.OleDbEnumerator]::GetRootEnumerator())
{
    $v = New-Object PSObject        
    for ($i = 0; $i -lt $provider.FieldCount; $i++) 
    {
        Add-Member -in $v NoteProperty $provider.GetName($i) $provider.GetValue($i)
    }
    $v
}
```

## Example Output

The above snippet will return a listing like the following:

<details><summary>Click to Expand Example Output</summary><p>

```powershell
SOURCES_NAME        : SQLOLEDB
SOURCES_PARSENAME   : {0C7FF16C-38E3-11d0-97AB-00C04FC2AD98}
SOURCES_DESCRIPTION : Microsoft OLE DB Provider for SQL Server
SOURCES_TYPE        : 1
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {0C7FF16C-38E3-11d0-97AB-00C04FC2AD98}

SOURCES_NAME        : MSOLEDBSQL19 Enumerator
SOURCES_PARSENAME   : {18F55F9E-D665-4D62-A6A8-D13FB46DA880}
SOURCES_DESCRIPTION : Microsoft OLE DB Driver 19 for SQL Server Enumerator
SOURCES_TYPE        : 2
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {18F55F9E-D665-4D62-A6A8-D13FB46DA880}

SOURCES_NAME        : SSISOLEDB
SOURCES_PARSENAME   : {1AD8F6DD-9411-4908-BF39-DAE7696EB426}
SOURCES_DESCRIPTION : OLE DB Provider for SQL Server Integration Services
SOURCES_TYPE        : 1
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {1AD8F6DD-9411-4908-BF39-DAE7696EB426}

SOURCES_NAME        : MSDataShape
SOURCES_PARSENAME   : {3449A1C8-C56C-11D0-AD72-00C04FC29863}
SOURCES_DESCRIPTION : MSDataShape
SOURCES_TYPE        : 1
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {3449A1C8-C56C-11D0-AD72-00C04FC29863}

SOURCES_NAME        : SQLNCLI11
SOURCES_PARSENAME   : {397C2819-8272-4532-AD3A-FB5E43BEAA39}
SOURCES_DESCRIPTION : SQL Server Native Client 11.0
SOURCES_TYPE        : 1
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {397C2819-8272-4532-AD3A-FB5E43BEAA39}

SOURCES_NAME        : Microsoft.ACE.OLEDB.12.0
SOURCES_PARSENAME   : {3BE786A0-0366-4F5C-9434-25CF162E475E}
SOURCES_DESCRIPTION : Microsoft Office 12.0 Access Database Engine OLE DB Provider
SOURCES_TYPE        : 1
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {3BE786A0-0366-4F5C-9434-25CF162E475E}

SOURCES_NAME        : Microsoft.ACE.OLEDB.16.0
SOURCES_PARSENAME   : {3BE786A2-0366-4F5C-9434-25CF162E475E}
SOURCES_DESCRIPTION : Microsoft Office 16.0 Access Database Engine OLE DB Provider
SOURCES_TYPE        : 1
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {3BE786A2-0366-4F5C-9434-25CF162E475E}

SOURCES_NAME        : ADsDSOObject
SOURCES_PARSENAME   : {549365d0-ec26-11cf-8310-00aa00b505db}
SOURCES_DESCRIPTION : OLE DB Provider for Microsoft Directory Services
SOURCES_TYPE        : 1
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {549365d0-ec26-11cf-8310-00aa00b505db}

SOURCES_NAME        : MSOLEDBSQL
SOURCES_PARSENAME   : {5A23DE84-1D7B-4A16-8DED-B29C09CB648D}
SOURCES_DESCRIPTION : Microsoft OLE DB Driver for SQL Server
SOURCES_TYPE        : 1
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {5A23DE84-1D7B-4A16-8DED-B29C09CB648D}

SOURCES_NAME        : MSOLEDBSQL Enumerator
SOURCES_PARSENAME   : {720818D5-1465-4812-839F-9F15C38A52CB}
SOURCES_DESCRIPTION : Microsoft OLE DB Driver for SQL Server Enumerator
SOURCES_TYPE        : 2
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {720818D5-1465-4812-839F-9F15C38A52CB}

SOURCES_NAME        : SQLNCLIRDA11
SOURCES_PARSENAME   : {726D00DE-837A-45EB-AE8C-EDD241F9079C}
SOURCES_DESCRIPTION : SQL Server Native Client RDA 11.0
SOURCES_TYPE        : 1
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {726D00DE-837A-45EB-AE8C-EDD241F9079C}

SOURCES_NAME        : SQLNCLI11 Enumerator
SOURCES_PARSENAME   : {8F612DD2-7E28-424f-A2FD-C2EECC314AA2}
SOURCES_DESCRIPTION : SQL Server Native Client 11.0 Enumerator
SOURCES_TYPE        : 2
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {8F612DD2-7E28-424f-A2FD-C2EECC314AA2}

SOURCES_NAME        : Windows Search Data Source
SOURCES_PARSENAME   : {9E175B8B-F52A-11D8-B9A5-505054503030}
SOURCES_DESCRIPTION : Microsoft OLE DB Provider for Search
SOURCES_TYPE        : 1
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {9E175B8B-F52A-11D8-B9A5-505054503030}

SOURCES_NAME        : SQLNCLIRDA11 Enumerator
SOURCES_PARSENAME   : {A740F26C-DBE0-4096-839B-9D56E951546B}
SOURCES_DESCRIPTION : SQL Server Native Client RDA 11.0 Enumerator
SOURCES_TYPE        : 2
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {A740F26C-DBE0-4096-839B-9D56E951546B}

SOURCES_NAME        : MSDASQL
SOURCES_PARSENAME   : {c8b522cb-5cf3-11ce-ade5-00aa0044773d}
SOURCES_DESCRIPTION : Microsoft OLE DB Provider for ODBC Drivers
SOURCES_TYPE        : 1
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {c8b522cb-5cf3-11ce-ade5-00aa0044773d}

SOURCES_NAME        : MSDASQL Enumerator
SOURCES_PARSENAME   : {c8b522cd-5cf3-11ce-ade5-00aa0044773d}
SOURCES_DESCRIPTION : Microsoft OLE DB Enumerator for ODBC Drivers
SOURCES_TYPE        : 2
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {c8b522cd-5cf3-11ce-ade5-00aa0044773d}

SOURCES_NAME        : MSOLAP
SOURCES_PARSENAME   : {DBC724B0-DD86-4772-BB5A-FCC6CAB2FC1A}
SOURCES_DESCRIPTION : Microsoft OLE DB Provider for Analysis Services 14.0
SOURCES_TYPE        : 1
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {DBC724B0-DD86-4772-BB5A-FCC6CAB2FC1A}

SOURCES_NAME        : MSOLAP
SOURCES_PARSENAME   : {DBC724B0-DD86-4772-BB5A-FCC6CAB2FC1A}
SOURCES_DESCRIPTION : Microsoft OLE DB Provider for Analysis Services 14.0
SOURCES_TYPE        : 3
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {DBC724B0-DD86-4772-BB5A-FCC6CAB2FC1A}

SOURCES_NAME        : SQLOLEDB Enumerator
SOURCES_PARSENAME   : {DFA22B8E-E68D-11d0-97E4-00C04FC2AD98}
SOURCES_DESCRIPTION : Microsoft OLE DB Enumerator for SQL Server
SOURCES_TYPE        : 2
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {DFA22B8E-E68D-11d0-97E4-00C04FC2AD98}

SOURCES_NAME        : MSDAOSP
SOURCES_PARSENAME   : {dfc8bdc0-e378-11d0-9b30-0080c7e9fe95}
SOURCES_DESCRIPTION : Microsoft OLE DB Simple Provider
SOURCES_TYPE        : 1
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {dfc8bdc0-e378-11d0-9b30-0080c7e9fe95}

SOURCES_NAME        : MSOLEDBSQL19
SOURCES_PARSENAME   : {EE5DE99A-4453-4C96-861C-F8832A7F59FE}
SOURCES_DESCRIPTION : Microsoft OLE DB Driver 19 for SQL Server
SOURCES_TYPE        : 1
SOURCES_ISPARENT    : False
SOURCES_CLSID       : {EE5DE99A-4453-4C96-861C-F8832A7F59FE}
```
  
</p>
</details>

## Function

If you want to *functionalize* the script, you can use the following:

```powershell
#!/usr/bin/env pwsh

Function Get-OLEDBProvider {
  <#
    .SYNOPSIS
    Returns a list of OLEDB providers installed on the system.
    .DESCRIPTION
    Returns a list of OLEDB providers installed on the system.
    .NOTES
    ## About
    
    OLE DB Providers are used to connect to different data sources. This function returns a list of OLE DB 
    Providers installed on the system.

    *NOTE: OLE DB providers are 32-bits and 64-bits aware/specific.*

    ## Properties
    The following properties are returned for each OLE DB Provider:
        
        - Name (`SOURCES_NAME`)  
        - Description (`SOURCES_DESCRIPTION`)  
        - CLSID (`SOURCES_CLSID`)  
        - Type (`SOURCES_TYPE`)  

    ## Types
    The following are the possible `SOURCES_TYPES` for an OLE DB Provider:
    
    - `0` - Binder
    - `1` - DataSource_MDP
    - `2` - DataSource_TDP
    - `3` - Enumerator

    .EXAMPLE
    Get-OLEDBProvider
    Default with no parameters. This will return the name, description, type, and CLSID (GUID) of each provider.    
    .EXAMPLE
    Get-OLEDBProvider | ?{$_.SOURCES_DESCRIPTION.IndexOf('SQL Server') -ge 0}
    Returns the same information as the default, but only for providers that have 'SQL Server' in the description.
    .EXAMPLE
    Get-OLEDBProvider | Format-Table -AutoSize
    Returns the same information as the default, but in a table format.
    .EXAMPLE
    Get-OLEDBProvider | Format-List
    Returns the same information as the default, but in a list format.
    .EXAMPLE
    Get-OLEDBProvider | Out-GridView
    Returns the same information as the default, but in a grid view format.
    .EXAMPLE
    Get-OLEDBProvider | ConvertTo-Csv > .\OLEDBProviders.csv
    Returns the same information as the default, but in a CSV file in the current working directory.  
    .LINK
    https://learn.microsoft.com/en-us/previous-versions/windows/desktop/ms711269(v=vs.85)
    .LINK
    https://learn.microsoft.com/en-us/dotnet/api/system.data.oledb.oledbenumerator.getrootenumerator?view=dotnet-plat-ext-6.0
    .LINK
    http://dbadailystuff.com/list-all-ole-db-providers-in-powershell
    .LINK
    https://github.com/josepmv/dbadailystuff/blob/master/list_all_OLEDB_Provider.ps1
  #>
  [CmdletBinding()]
  Param ()    
  $providers = [System.Data.OleDb.OleDbEnumerator]::GetRootEnumerator() # New-Object System.Data.OleDb.OleDbEnumerator
  ForEach ($provider in $providers) {
      $p = New-Object PSObject
      For ($i = 0; $i -lt $provider.FieldCount; $i++) {
          $p | Add-Member -MemberType NoteProperty -Name $provider.GetName($i) -Value $provider.GetValue($i)
      }

      $p | Select-Object SOURCES_NAME, SOURCES_DESCRIPTION, SOURCES_TYPE, SOURCES_CLSID
  }  
}
```

and then run by simply using the function `Get-OLEDBProvider`.

## Filtering Output

As an example, here's how one could filter for just "SQL Server" Providers:

```powershell
Get-OLEDBProvider | ?{$_.SOURCES_DESCRIPTION.IndexOf('SQL Server') -ge 0}
```

***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[Development]]
- [[Microsoft]]
- [[Microsoft DOS|Windows Command Line]]
- [[2-Areas/MOCs/PowerShell|PowerShell (MOC)]]
- [[3-Resources/Tools/Developer Tools/Languages/PowerShell/_README|PowerShell (Tools)]]
- [[2-Areas/Code/PowerShell/_README|PowerShell (Code)]]


*Backlinks:*

```dataview
list from [[PowerShell - Get-GitHubRelease]] AND -"Changelog"
```
