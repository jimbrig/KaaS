---
Date: 2022-03-15
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/VBA", "#Topic/Dev"]
Alias: ["VBA - Copy Module from one Workbook to Another"]
---

# VBA - Copy Module from one Workbook to Another

*Source: [VBA-General/mod_VBA.bas at main · ViperSRT3g/VBA-General](https://github.com/ViperSRT3g/VBA-General/blob/main/mod_VBA.bas)*


```VBA
Option Explicit

Public Sub CopyModule(ByRef SourceWB As Workbook, ByVal strModuleName As String, ByRef TargetWB As Workbook)

    ' Description:  copies a module from one workbook to another
    ' example: CopyModule Workbooks(ThisWorkbook), "Module2",
    '          Workbooks("Food Specials Rolling Depot Memo 46 - 01.xlsm")
    ' Notes:   If Module to be copied already exists, it is removed first,
    '          and afterwards copied

    Dim strFolder As String, strTempFile As String, FName As String
    If Trim(strModuleName) = vbNullString Then Exit Sub

    If TargetWB Is Nothing Then
        MsgBox "Error: Target Workbook " & TargetWB.Name & " doesn't exist (or closed)", vbCritical
        Exit Sub
    End If

    strFolder = SourceWB.Path
    If Len(strFolder) = 0 Then strFolder = CurDir

    ' create temp file and copy "Module2" into it
    strFolder = strFolder & "\"
    strTempFile = strFolder & "~tmpexport.bas"

    On Error Resume Next
    FName = Environ("Temp") & "\" & strModuleName & ".bas"
    If Dir(FName, vbNormal + vbHidden + vbSystem) <> vbNullString Then
        Err.Clear
        Kill FName
        If Err.Number <> 0 Then
            MsgBox "Error copying module " & strModuleName & "  from Workbook " & SourceWB.Name & " to Workbook " & TargetWB.Name, vbInformation
            Exit Sub
        End If
    End If

    ' remove "Module2" if already exits in destination workbook
    With TargetWB.VBProject.VBComponents.Remove.Item(strModuleName)
    ' copy "Module2" from temp file to destination workbook
    SourceWB.VBProject.VBComponents(strModuleName).Export strTempFile
    TargetWB.VBProject.VBComponents.Import strTempFile
    Kill strTempFile
    On Error GoTo 0
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
list from [[VBA - Copy Module from one Workbook to Another]] AND -"Changelog"
```