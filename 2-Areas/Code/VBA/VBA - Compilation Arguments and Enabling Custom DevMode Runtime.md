# VBA - Compilation Arguments and Enabling Custom DevMode Runtime

\*Source: *

## Contents

## Overview

When developing complex, production-grade [VBA](VBA.md) applications, a common caveat is separating development vs. test vs. production / user-facing runtime environments for your code to run in.

For example, during development you utilize extra functionalities such as:

* Logging
* Debugging
* Assertions and Validations
* Performance Benchmarking and Code Profiling
* Linting and Formatting
* Modularization
* Documentation
* Testing
* Version Control
* Builds
* Distribution and Deployments
* Configurations
* Compilation
* etc.

A best practice is to only implement these extra features if you are in the development phase of the project’s lifecycle, and remove them when distributing to the end user.

This can be accomplished in VBA by using the VBA Project’s Custom Compilation Arguments Feature alongside `#IF ...` conditional compile statements in the code, or by implementing a custom solution such as a ribbon toggle, registry setting, `CustomDocumentProperties`, or simply a `DebugMode.txt` file.

### VBA Project Properties - Custom Compilation Arguments

1. Setup Custom Compile Arguments in the VBA Project Properties.
1. Add `#IF DEV_MODE_ENABLED`, etc. conditions to VBA code.

![](https://i.imgur.com/3iMxEm0.png)

Add custom argument for `DEBUG_MODE` and set it to `-1`. 

 > 
 > \[!NOTE\] VBA True and False Integers
 > In VBA `-1` is `True` and `0` is `False`. Switching the Compile Argument `DEV_MODE = -1` will switch `DEV_MODE` in the whole VBA project.

![](https://i.imgur.com/aH9qdUl.png)

````VBA
' Check for DEV_MODE Compile Condition Argument 
' Note: `#If` is used to detect a compile condition
#If DEBUG_MODE Then
	' This is only Compiled in DEBUG_MODE
	Debug.Print "[INFO]: DEBUG_MODE is set to: ON"
#Else
	' This is only Compiled in Production Mode (i.e. not DEBUG_MODE)
	Debug.Print "[INFO]: DEBUG_MODE is set to: OFF"
#End If
````

````VBA
Function IsDebugMode() As Boolean

Const DebugOptionFileName As String = "DebugMode.txt" 
Const DebugIsOnString As String = "DebugMode:On"
Const ForReading as Long = 1

Dim txtStream As Object
Dim DebugOptionFilePath As String

IsDebugMode = False
DebugOptionFilePath = ThisWorkbook.Path & "\" & DebugOptionFileName

With CreateObject("Scripting.Filesystemobject")
    If .FileExists(DebugOptionFilePath) Then
        Set txtStream = .OpenTextFile(DebugOptionFilePath, ForReading, False)
        Do Until txtStream.AtEndOfStream
            If txtStream.ReadLine = DebugIsOnString Then
                IsDebugMode = True
                Exit Do
            End If
        Loop
    End If
End With

End Function
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
list from [[VBA - Compilation Arguments and Enabling Custom DevMode Runtime]] AND -"Changelog"
````
