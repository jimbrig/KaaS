# VBA - Page Setup and Print Macros

## Contents

* [Individual Sub Modules](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#individual-sub-modules)
  * [Setup and Optimization](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#setup-and-optimization)
  * [Set Print DPI](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#set-print-dpi)
  * [Set Print to Black and White](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#set-print-to-black-and-white)
  * [Unhide All Sheets](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#unhide-all-sheets)
  * [All Read Only](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#all-read-only)
* [Entire Print and Page Module](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#entire-print-and-page-module)
* [Appendix: Links](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#appendix-links)

## Individual Sub Modules

The following Sub's are included:

* [Setup and Optimization](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#setup-and-optimization)
* [Set Print DPI](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#set-print-dpi)
* [Set Print to Black and White](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#set-print-to-black-and-white)
* [Unhide All Sheets](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#unhide-all-sheets)
* [All Read Only](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#all-read-only)

### Setup and Optimization

* Setup & `InitGlobalFastApp()`

````VBA
Option Explicit

' These are used to speed up vba code
Public DefCalcState As Integer
Public DefEventState As Integer
Public DefScrUpdState As Integer

Sub InitGlobalFastApp()
' Used to speed up vba code.
' Created on: 3/26/12
' By: S Conrad

' Stores default settings and changes them to speed up code
With Application
    DefCalcState = .Calculation
    DefEventState = .EnableEvents
    DefScrUpdState = .ScreenUpdating
    .Calculation = xlCalculationManual
    .EnableEvents = False
    .ScreenUpdating = False
    End With
    
End Sub
````

### Set Print DPI

* `SetPrintDPI()`

````VBA
Sub SetPrintDPI()
' Allows the user to select from a list of available print qualities and changes
' all pages in the current workbook.
' Created on: 3/14/12
' By: S Conrad

Dim bExitLoop As Boolean
Dim oldStatusBar As Boolean
Dim i As Double
Dim sDefDPI As Double
Dim dDPI As Double
Dim vDPI As Variant
Dim wsWkSheet As Worksheet
Dim wsAW As Worksheet
Dim Ans As Double
Dim sAnsMsg As String
Dim SampleDPI As String
Dim sFormQuest As String

' Cancels procedure if no workbooks are open
If Workbooks.Count = 0 Then
    MsgBox "No workbooks are open.", , "Change Print Resolution"
    Exit Sub
    End If
    
' Stores initial settings
'InitGlobalFastApp
Set wsAW = ActiveSheet
sDefDPI = CStr(wsAW.PageSetup.PrintQuality(1))
oldStatusBar = Application.DisplayStatusBar

' Sets print quality to 600 if available
On Error Resume Next
ActiveSheet.PageSetup.PrintQuality = 600
If Err = 0 Then
    Application.DisplayStatusBar = True
    For Each wsWkSheet In Sheets
        Application.StatusBar = wsWkSheet.Name & "'s print quality is being changed to 600 DPi."
        wsWkSheet.PageSetup.PrintQuality = 600
        wsWkSheet.DisplayPageBreaks = False
        Next
    wsAW.Activate
    Application.StatusBar = False
    Application.DisplayStatusBar = oldStatusBar
    Exit Sub
    Else
    sAnsMsg = "This printer does not have a print setting of 600 DPi." & vbCrLf & _
        "Would you like to see a list of available resolutions?"
    Ans = MsgBox(sAnsMsg, vbOKCancel, "Setting Print Resolution")
    If Ans = vbCancel Then Exit Sub
    End If

Application.DisplayStatusBar = True
Application.StatusBar = "Please wait. A list of available print qualities is being populated"

' Populate a list of possible print qualities
SampleDPI = ""
For i = 100 To 1200 Step 50
    On Error Resume Next
    ActiveSheet.PageSetup.PrintQuality = i
    If Err = 0 Then SampleDPI = SampleDPI & i & vbCrLf
    Next
    
ActiveSheet.DisplayPageBreaks = False
' Returns status bar to original state
Application.StatusBar = False
Application.DisplayStatusBar = oldStatusBar
        
' Construction of messages to send to the user
SampleDPI = Left(SampleDPI, Len(SampleDPI) - 2)
        
sFormQuest = "Please choose a print quality.  The drop down list "
sFormQuest = sFormQuest & "contains some available print qualities.  "
sFormQuest = sFormQuest & "Other print qualities are allowed.  Refer "
sFormQuest = sFormQuest & "to the page setup form of the page layout tab "
sFormQuest = sFormQuest & "for other available qualities."

' This loop shows the combo form and waits for the user to enter an acceptable answer
bExitLoop = False
Do
    vDPI = ComboForm(SampleDPI, sFormQuest, "Print Quality", sDefDPI, _
    "DPI")
    ' Exits if the user cancels
    If vDPI = vbCancel Or cmbCancel = vbCancel Then
'        With Application
'            .Calculation = DefCalcState
'            .ScreenUpdating = DefScrUpdState
'            .EnableEvents = DefEventState
'            End With
        wsAW.Activate
        wsAW.PageSetup.PrintQuality = sDefDPI
        wsAW.DisplayPageBreaks = False
        Unload FmComboBox
        Exit Sub
        End If
    
    ' Only allows integers
    If WorksheetFunction.IsNumber(vDPI) Or vDPI > 1 Then
        dDPI = CDbl(vDPI)
        Else
        MsgBox "Please enter a value greater than one.", vbOKOnly, "Print Settings"
        dDPI = 0
        End If

    ' Checks if the DPI is available
    On Error Resume Next
    ActiveSheet.PageSetup.PrintQuality = dDPI
    If Err <> 0 Then
        dDPI = 0
        MsgBox "The selected pring quality is not availabe for this printer.", vbOKOnly, _
            "Print Quality"
        Else
        bExitLoop = True
        End If
        Unload FmComboBox
    Loop Until bExitLoop = True
    
' Change each pages print quality and hide page breaks
Application.DisplayStatusBar = True
For Each wsWkSheet In Sheets
    Application.StatusBar = wsWkSheet.Name & "'s print quality is being changed to " & dDPI & " DPi."
    wsWkSheet.PageSetup.PrintQuality = dDPI
    wsWkSheet.DisplayPageBreaks = False
    Next

' Returns status bar to original state
Application.StatusBar = False
Application.DisplayStatusBar = oldStatusBar

' Return application to original state
wsAW.Activate
'With Application
'    .Calculation = DefCalcState
'    .ScreenUpdating = DefScrUpdState
'    .EnableEvents = DefEventState
'    End With

End Sub
````

### Set Print to Black and White

* `SetPrintBlackandWhite()`

````VBA
Sub SetPrintBlackandWhite()
' Changes print
' Revised on: 2/18/12
' by: Scott Conrad

Dim oldStatusBar As Boolean
Dim wsSheet As Worksheet

' Cancels procedure if no workbooks are open
If Workbooks.Count = 0 Then
    MsgBox "No workbooks are open.", , "Change Print Resolution"
    Exit Sub
    End If
    
' Stores initial settings
oldStatusBar = Application.DisplayStatusBar
Application.DisplayStatusBar = True
'InitGlobalFastApp

' Change print to black and white and hide page breaks
For Each wsSheet In Sheets
    Application.StatusBar = wsSheet.Name & " is being set to Black and White"
    wsSheet.PageSetup.BlackAndWhite = True
    wsSheet.DisplayPageBreaks = False
    Next wsSheet
    
Application.StatusBar = False
Application.DisplayStatusBar = oldStatusBar
    
' Returns to original state
'With Application
'    .Calculation = DefCalcState
'    .ScreenUpdating = DefScrUpdState
'    .EnableEvents = DefEventState
'    End With
        
End Sub
````

### Unhide All Sheets

* `UnhideAllSheets()`

````VBA
Sub UnhideAllSheets()
' Unhides all sheets. This works with or without index tab.
' Revised on: 2/18/12
' by: Scott Conrad

' Cancels procedure if no workbooks are open
If Workbooks.Count = 0 Then
    MsgBox "No workbooks are open.", , "Change Print Resolution"
    Exit Sub
    End If

Dim wsSheet As Worksheet

' Change sheets visibility
For Each wsSheet In Worksheets
    wsSheet.Visible = xlSheetVisible
    Next

End Sub
````

### All Read Only

* `AllReadOnly()`

````VBA
Sub AllReadOnly()
' Changes every file to read only without the save dialog
' Created on: 3/13/12
' By: S Conrad

Dim i As Integer
Dim aw As Workbook

' Exits if workbooks are not open
If Workbooks.Count < 1 Then Exit Sub

' Changes each open workbook to read only and deactivates the save application popup.
Set aw = ActiveWorkbook
For i = 1 To Workbooks.Count
    On Error Resume Next
    Workbooks(i).Saved = True ' Tricks excel into thinking file is saved
    Workbooks(i).ChangeFileAccess xlReadOnly
    Next i
    
' Returns Excel to original state
aw.Activate

End Sub
````

## Entire Print and Page Module

* `ModPrintAndPage.bas`

````VBA
Option Explicit

' These are used to speed up vba code
Public DefCalcState As Integer
Public DefEventState As Integer
Public DefScrUpdState As Integer

Sub SetPrintDPI()
' Allows the user to select from a list of available print qualities and changes
' all pages in the current workbook.
' Created on: 3/14/12
' By: S Conrad

Dim bExitLoop As Boolean
Dim oldStatusBar As Boolean
Dim i As Double
Dim sDefDPI As Double
Dim dDPI As Double
Dim vDPI As Variant
Dim wsWkSheet As Worksheet
Dim wsAW As Worksheet
Dim Ans As Double
Dim sAnsMsg As String
Dim SampleDPI As String
Dim sFormQuest As String

' Cancels procedure if no workbooks are open
If Workbooks.Count = 0 Then
    MsgBox "No workbooks are open.", , "Change Print Resolution"
    Exit Sub
    End If
    
' Stores initial settings
'InitGlobalFastApp
Set wsAW = ActiveSheet
sDefDPI = CStr(wsAW.PageSetup.PrintQuality(1))
oldStatusBar = Application.DisplayStatusBar

' Sets print quality to 600 if available
On Error Resume Next
ActiveSheet.PageSetup.PrintQuality = 600
If Err = 0 Then
    Application.DisplayStatusBar = True
    For Each wsWkSheet In Sheets
        Application.StatusBar = wsWkSheet.Name & "'s print quality is being changed to 600 DPi."
        wsWkSheet.PageSetup.PrintQuality = 600
        wsWkSheet.DisplayPageBreaks = False
        Next
    wsAW.Activate
    Application.StatusBar = False
    Application.DisplayStatusBar = oldStatusBar
    Exit Sub
    Else
    sAnsMsg = "This printer does not have a print setting of 600 DPi." & vbCrLf & _
        "Would you like to see a list of available resolutions?"
    Ans = MsgBox(sAnsMsg, vbOKCancel, "Setting Print Resolution")
    If Ans = vbCancel Then Exit Sub
    End If

Application.DisplayStatusBar = True
Application.StatusBar = "Please wait. A list of available print qualities is being populated"

' Populate a list of possible print qualities
SampleDPI = ""
For i = 100 To 1200 Step 50
    On Error Resume Next
    ActiveSheet.PageSetup.PrintQuality = i
    If Err = 0 Then SampleDPI = SampleDPI & i & vbCrLf
    Next
    
ActiveSheet.DisplayPageBreaks = False
' Returns status bar to original state
Application.StatusBar = False
Application.DisplayStatusBar = oldStatusBar
        
' Construction of messages to send to the user
SampleDPI = Left(SampleDPI, Len(SampleDPI) - 2)
        
sFormQuest = "Please choose a print quality.  The drop down list "
sFormQuest = sFormQuest & "contains some available print qualities.  "
sFormQuest = sFormQuest & "Other print qualities are allowed.  Refer "
sFormQuest = sFormQuest & "to the page setup form of the page layout tab "
sFormQuest = sFormQuest & "for other available qualities."

' This loop shows the combo form and waits for the user to enter an acceptable answer
bExitLoop = False
Do
    vDPI = ComboForm(SampleDPI, sFormQuest, "Print Quality", sDefDPI, _
    "DPI")
    ' Exits if the user cancels
    If vDPI = vbCancel Or cmbCancel = vbCancel Then
'        With Application
'            .Calculation = DefCalcState
'            .ScreenUpdating = DefScrUpdState
'            .EnableEvents = DefEventState
'            End With
        wsAW.Activate
        wsAW.PageSetup.PrintQuality = sDefDPI
        wsAW.DisplayPageBreaks = False
        Unload FmComboBox
        Exit Sub
        End If
    
    ' Only allows integers
    If WorksheetFunction.IsNumber(vDPI) Or vDPI > 1 Then
        dDPI = CDbl(vDPI)
        Else
        MsgBox "Please enter a value greater than one.", vbOKOnly, "Print Settings"
        dDPI = 0
        End If

    ' Checks if the DPI is available
    On Error Resume Next
    ActiveSheet.PageSetup.PrintQuality = dDPI
    If Err <> 0 Then
        dDPI = 0
        MsgBox "The selected pring quality is not availabe for this printer.", vbOKOnly, _
            "Print Quality"
        Else
        bExitLoop = True
        End If
        Unload FmComboBox
    Loop Until bExitLoop = True
    
' Change each pages print quality and hide page breaks
Application.DisplayStatusBar = True
For Each wsWkSheet In Sheets
    Application.StatusBar = wsWkSheet.Name & "'s print quality is being changed to " & dDPI & " DPi."
    wsWkSheet.PageSetup.PrintQuality = dDPI
    wsWkSheet.DisplayPageBreaks = False
    Next

' Returns status bar to original state
Application.StatusBar = False
Application.DisplayStatusBar = oldStatusBar

' Return application to original state
wsAW.Activate
'With Application
'    .Calculation = DefCalcState
'    .ScreenUpdating = DefScrUpdState
'    .EnableEvents = DefEventState
'    End With

End Sub
Sub SetPrintBlackandWhite()
' Changes print
' Revised on: 2/18/12
' by: Scott Conrad

Dim oldStatusBar As Boolean
Dim wsSheet As Worksheet

' Cancels procedure if no workbooks are open
If Workbooks.Count = 0 Then
    MsgBox "No workbooks are open.", , "Change Print Resolution"
    Exit Sub
    End If
    
' Stores initial settings
oldStatusBar = Application.DisplayStatusBar
Application.DisplayStatusBar = True
'InitGlobalFastApp

' Change print to black and white and hide page breaks
For Each wsSheet In Sheets
    Application.StatusBar = wsSheet.Name & " is being set to Black and White"
    wsSheet.PageSetup.BlackAndWhite = True
    wsSheet.DisplayPageBreaks = False
    Next wsSheet
    
Application.StatusBar = False
Application.DisplayStatusBar = oldStatusBar
    
' Returns to original state
'With Application
'    .Calculation = DefCalcState
'    .ScreenUpdating = DefScrUpdState
'    .EnableEvents = DefEventState
'    End With
        
End Sub
Sub UnhideAllSheets()
' Unhides all sheets. This works with or without index tab.
' Revised on: 2/18/12
' by: Scott Conrad

' Cancels procedure if no workbooks are open
If Workbooks.Count = 0 Then
    MsgBox "No workbooks are open.", , "Change Print Resolution"
    Exit Sub
    End If

Dim wsSheet As Worksheet

' Change sheets visibility
For Each wsSheet In Worksheets
    wsSheet.Visible = xlSheetVisible
    Next

End Sub
Sub AllReadOnly()
' Changes every file to read only without the save dialog
' Created on: 3/13/12
' By: S Conrad

Dim i As Integer
Dim aw As Workbook

' Exits if workbooks are not open
If Workbooks.Count < 1 Then Exit Sub

' Changes each open workbook to read only and deactivates the save application popup.
Set aw = ActiveWorkbook
For i = 1 To Workbooks.Count
    On Error Resume Next
    Workbooks(i).Saved = True ' Tricks excel into thinking file is saved
    Workbooks(i).ChangeFileAccess xlReadOnly
    Next i
    
' Returns Excel to original state
aw.Activate

End Sub

Sub InitGlobalFastApp()
' Used to speed up vba code.
' Created on: 3/26/12
' By: S Conrad

' Stores default settings and changes them to speed up code
With Application
    DefCalcState = .Calculation
    DefEventState = .EnableEvents
    DefScrUpdState = .ScreenUpdating
    .Calculation = xlCalculationManual
    .EnableEvents = False
    .ScreenUpdating = False
    End With
    
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
list from [[VBA - Page Setup and Print Macros]] AND -"Changelog"
````
