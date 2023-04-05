# VBA - Optimize Speed

\*Source: *

## Contents

* [OptimizeCodeSpeed](VBA%20-%20Optimize%20Speed.md#optimizecodespeed)
* [OptimizeCodeSpeedRestore](VBA%20-%20Optimize%20Speed.md#optimizecodespeedrestore)
* [LudicrousMode](VBA%20-%20Optimize%20Speed.md#ludicrousmode)
* [Example](VBA%20-%20Optimize%20Speed.md#example)
* [Appendix: Links](VBA%20-%20Optimize%20Speed.md#appendix-links)

## OptimizeVBA

````VBA
Sub OptimizeVBA(isOn As Boolean)
    Application.Calculation = IIf(isOn, xlCalculationManual, xlCalculationAutomatic)
    Application.EnableEvents = Not (isOn)
    Application.ScreenUpdating = Not (isOn)
    ActiveSheet.DisplayPageBreaks = Not (isOn)
End Sub
````

## OptimizeCodeSpeed

````VBA
Public Sub OptimizeCodeSpeed()

  On Error Resume Next

    Application.EnableEvents = False
    Application.DisplayAlerts = False
    Application.ScreenUpdating = False
    Application.EnableAnimations = False
    ActiveSheet.DisplayPageBreaks = False
    Application.DisplayStatusBar = False
    Application.Calculation = xlCalculationManual
         
  On Error GoTo 0
                   
End Sub
````

## OptimizeCodeSpeedRestore

````VBA
Public Sub OptimizeCodeSpeedRestore()

  On Error Resume Next

    Application.EnableEvents = True
    Application.DisplayAlerts = True
    Application.ScreenUpdating = True
    ActiveSheet.DisplayPageBreaks = False
    Application.DisplayStatusBar = True
    Application.Calculation = xlCalculationAutomatic

  On Error GoTo 0

End Sub
````

## LudicrousMode

````VBA
'Adjusts Excel settings for faster VBA processing
Public Sub LudicrousMode(ByVal Toggle As Boolean)
    Application.ScreenUpdating = Not Toggle
    Application.EnableEvents = Not Toggle
    Application.DisplayAlerts = Not Toggle
    Application.EnableAnimations = Not Toggle
    Application.DisplayStatusBar = Not Toggle
    Application.PrintCommunication = Not Toggle
    Application.Calculation = IIf(Toggle, xlCalculationManual, xlCalculationAutomatic)
End Sub
````

## Example

````VBA
Sub example()
	'Stop automatic calculation of excel cells
	Application.Calculation = xlCalculationManual
	'Stop screen updating
	Application.ScreenUpdating = False

	'Some code

	'Put it back to "normal"
	Application.Calculation = xlCalculationAutomatic
	Application.ScreenUpdating = True
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
list from [[VBA - Optimize Speed]] AND -"Changelog"
````
