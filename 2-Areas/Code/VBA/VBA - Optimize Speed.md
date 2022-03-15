---
Date: 2022-03-15
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/VBA", "#Topic/Dev"]
Alias: ["VBA - Optimize Speed"]
---

# VBA - Optimize Speed

*Source: *

```VBA
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
```

```VBA
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
list from [[VBA - Optimize Speed]] AND -"Changelog"
```