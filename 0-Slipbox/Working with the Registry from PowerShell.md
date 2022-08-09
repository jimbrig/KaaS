---
Date: 2022-08-09
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev/PowerShell"]
Alias: "Working with the Registry from PowerShell"
---

# Working with the Registry from PowerShell

Sources:
- https://docs.microsoft.com/en-us/powershell/scripting/samples/working-with-registry-entries?view=powershell-7.2
- https://docs.microsoft.com/en-us/powershell/scripting/samples/working-with-registry-keys?view=powershell-7.2
- https://docs.microsoft.com/en-us/powershell/scripting/samples/working-with-files-folders-and-registry-keys?view=powershell-7.2

## Contents

- [[#Creating New Registry Entries|Creating New Registry Entries]]
- [[#Renaming Registry Entries|Renaming Registry Entries]]
- [[#Deleting Registry Entries|Deleting Registry Entries]]
		- [[#Related|Related]]


## Creating New Registry Entries

To add a new entry to the [[Registry]], use `New-ItemProperty` with the path to the key, the entry name, and the value of the entry. 

For this example, to add a new entry for `$PSHOME` (The [[Windows PowerShell]] variable `$PSHome` stores the path to the installation directory for [[Windows PowerShell]]), use the following command. Not that the command also returns information about the new entry:

```powershell
New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion -Name PowerShellPath -PropertyType String -Value $PSHome
```

Returns:

```powershell
PSPath         : Microsoft.PowerShell.Core\Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion
PSParentPath   : Microsoft.PowerShell.Core\Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
PSChildName    : CurrentVersion
PSDrive        : HKLM
PSProvider     : Microsoft.PowerShell.Core\Registry
PowerShellPath : C:\Program Files\Windows PowerShell\v1.0
```

The **PropertyType** must be the name of a **Microsoft.Win32.RegistryValueKind** enumeration member from the following table:

| PropertyType Value | Meaning                                                                       |
| ------------------ | ----------------------------------------------------------------------------- |
| Binary             | Binary data                                                                   |
| DWord              | A number that is a valid UInt32                                               |
| ExpandString       | A string that can contain environment variables that are dynamically expanded |
| MultiString        | A multiline string                                                            |
| String             | Any string value                                                              |
| QWord              | 8 bytes of binary data                                                        |

```ad-note

You can add a registry entry to multiple locations by specifying an array of values for the **Path** parameter.

```

```powershell
New-ItemProperty -Name PowerShellPath -PropertyType String -Value $PSHome `
  -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion, HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion
```

You can also overwrite a pre-existing registry entry value by adding the Force parameter to any `New-ItemProperty` command.


## Renaming Registry Entries

To rename a specific [[Registry]] entry use the `Rename-ItemProperty` cmdlet:

```powershell
# rename the **PowerShellPath** entry to "PSHome"
Rename-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion -Name PowerShellPath -NewName PSHome

# To display the renamed value, add the **PassThru** parameter to the command
Rename-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion -Name PowerShellPath -NewName PSHome -passthru
```

## Deleting Registry Entries

To delete a key/entry from a specific path in the [[2-Areas/Code/Windows/Registry/_README|Registry]] use the `Remove-ItemProperty` cmdlet:

```powershell
Remove-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion -Name PSHome
Remove-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion -Name PowerShellPath
```



***

##  Appendix: Links

- [[Development]]
- [[PowerShell]]
- [[2-Areas/Code/Windows/Windows PowerShell/_README|Windows PowerShell]]
- [[2-Areas/Code/PowerShell/_README|PowerShell Code Snippets]]
- [[2-Areas/Code/Windows/_README|Windows]]
- [[2-Areas/Code/Windows/Registry/_README|Registry]]

*Backlinks:*

```dataview
list from [[Working with the Registry from PowerShell]] AND -"Changelog"
```