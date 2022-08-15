---
Date: 2022-08-15
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/VBA", "#Topic/Dev"]
Alias: ["VBA - GeneralSettings Module"]
---

# VBA - GeneralSettings Module

*Source: *

## Contents

- [[#Declarations|Declarations]]
- [[#GetGeneralSettings Function|GetGeneralSettings Function]]
- [[#SaveGeneralSettings Function|SaveGeneralSettings Function]]
- [[#Appendix: Links|Appendix: Links]]


## Declarations

```VBA
Public Const AppName = "OptimizeExcel"
Public Const SettingsName = "General Settings"
Public Const Setting_MaximumRunningTime = "Maximum running time [seconds]"
Dim GeneralSettingsDict As Object
```

## GetGeneralSettings Function

```VBA
Function GetGeneralSettings() As Object
    If GeneralSettingsDict Is Nothing Then
        Set GeneralSettingsDict = CreateObject("Scripting.Dictionary")
        GeneralSettingsDict.Add Setting_MaximumRunningTime, GetSetting(AppName, SettingsName, Setting_MaximumRunningTime, 10 * 60)
    End If
    Set GetGeneralSettings = GeneralSettingsDict
End Function
```

## SaveGeneralSettings Function

```VBA
Sub SaveGeneralSettings()
    Dim key
    For Each key In GeneralSettingsDict.Keys
       Call SaveSetting(GeneralSettings.AppName, SettingsName, key, GeneralSettingsDict(key))
    Next key
End Sub
```

***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[Development]]
- [[Excel]]
- [[Microsoft Office]]
- [[Excel - VBA]]

*Backlinks:*

```dataview
list from [[VBA - GeneralSettings Module]] AND -"Changelog"
```