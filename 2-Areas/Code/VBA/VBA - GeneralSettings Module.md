# VBA - GeneralSettings Module

\*Source: *

## Contents

* [Declarations](VBA%20-%20GeneralSettings%20Module.md#declarations)
* [GetGeneralSettings Function](VBA%20-%20GeneralSettings%20Module.md#getgeneralsettings-function)
* [SaveGeneralSettings Function](VBA%20-%20GeneralSettings%20Module.md#savegeneralsettings-function)
* [Appendix: Links](VBA%20-%20GeneralSettings%20Module.md#appendix-links)

## Declarations

````VBA
Public Const AppName = "OptimizeExcel"
Public Const SettingsName = "General Settings"
Public Const Setting_MaximumRunningTime = "Maximum running time [seconds]"
Dim GeneralSettingsDict As Object
````

## GetGeneralSettings Function

````VBA
Function GetGeneralSettings() As Object
    If GeneralSettingsDict Is Nothing Then
        Set GeneralSettingsDict = CreateObject("Scripting.Dictionary")
        GeneralSettingsDict.Add Setting_MaximumRunningTime, GetSetting(AppName, SettingsName, Setting_MaximumRunningTime, 10 * 60)
    End If
    Set GetGeneralSettings = GeneralSettingsDict
End Function
````

## SaveGeneralSettings Function

````VBA
Sub SaveGeneralSettings()
    Dim key
    For Each key In GeneralSettingsDict.Keys
       Call SaveSetting(GeneralSettings.AppName, SettingsName, key, GeneralSettingsDict(key))
    Next key
End Sub
````

---

## Appendix: Links

* *Code*
* [Development](../../MOCs/Development.md)
* [Excel](../Excel/Excel.md)
* [Microsoft Office](../../../3-Resources/Tools/Microsoft%20Office/Microsoft%20Office.md)
* [Excel - VBA](../../../3-Resources/Tools/Microsoft%20Office/Excel/Excel%20-%20VBA.md)

*Backlinks:*

````dataview
list from [[VBA - GeneralSettings Module]] AND -"Changelog"
````
