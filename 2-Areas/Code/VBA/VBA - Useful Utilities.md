---
Date: 2022-03-15
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/VBA", "#Topic/Dev"]
Alias: ["VBA - Useful Utilities"]
---

# VBA - Useful Utilities

*Source: *

## Workbook Functions

```VBA
'Returns TRUE if a given workbook reference exists and has not been saved
Public Function WBNotSaved(TargetWB As Workbook) As Boolean
    On Error Resume Next
    If TargetWB Is Nothing Then Exit Function
    If Len(TargetWB.Path) > 0 Then Exit Function
    WBNotSaved = Len(TargetWB.Path) = 0
End Function

'Returns TRUE if a given workbook reference is unused. This indicates that the workbook was unexpectedly closed
Public Function WBNullRef(TargetWB As Workbook) As Boolean
    On Error Resume Next
    If TargetWB Is Nothing Then Exit Function
    If Len(TargetWB.Name) = 0 Then
        WBNullRef = Not (Err.Number = 0)
        Err.Clear
    End If
End Function

```

### FindWorkbook()

```VBA
'Returns a workbook object based on a matching name search
Public Function FindWorkbook(ByVal WorkbookName As String) As Workbook
    If Len(WorkbookName) = 0 Then Exit Function
    Dim Index As Long
    For Index = 1 To Workbooks.Count
        If Workbooks(Index).Name Like "*" & WorkbookName & "*" Then
            Set FindWorkbook = Workbooks(Index)
            Exit Function
        End If
    Next Index
End Function
```

### IsWorkBookOpen()

```VBA
'Returns boolean if a given workbook is currently open
Public Function IsWorkBookOpen(ByVal WorkbookName As String) As Boolean
    On Error GoTo ErrorHandler
    If Len(WorkbookName) = 0 Then Exit Function
    Dim WBO As Workbook: Set WBO = Workbooks(WorkbookName)
    IsWorkBookOpen = Not WBO Is Nothing
ErrorHandler:
    Set WBO = Nothing
End Function
```

### IsWorkbookProtected

```VBA
'WORKBOOK FUNCTIONS
'Returns boolean if a given workbook is password protected
Public Function IsWBProtected(ByRef TWB As Workbook) As Boolean
    If TWB Is Nothing Then Exit Function
    IsWBProtected = TWB.ProtectWindows Or TWB.ProtectStructure
End Function

```

## Worksheet Functions

### GetSheet()

```VBA
'WORKSHEET FUNCTIONS
'Returns a worksheet with the given name, creates a new one if it doesn't already exist
Public Function GetSheet(SheetName As String, Optional WB As Workbook, Optional ForceNew As Boolean) As Worksheet
    On Error Resume Next
    If Len(SheetName) = 0 Then Exit Function
    If WB Is Nothing Then Set WB = ThisWorkbook
    Set GetSheet = WB.Worksheets(Left(SheetName, 31)) 'Test if the given named worksheet exists
    
    If ForceNew Then
        Dim Append As String, MatchCounter As Long
        If Not GetSheet Is Nothing Then 'If the given named worksheet exists, then begin appending the default ' (N)' postfix
            Do Until GetSheet Is Nothing
                Append = " (" & MatchCounter & ")"
                Set GetSheet = Nothing
                Set GetSheet = WB.Worksheets(Left(SheetName, 31 - Len(Append)) & Append)
                MatchCounter = MatchCounter + 1
            Loop
        End If
        Set GetSheet = WB.Worksheets.Add(After:=WB.Worksheets(WB.Worksheets.Count))
        GetSheet.Name = Left(SheetName, 31 - Len(Append)) & Append
    Else
        If GetSheet Is Nothing Then 'If the given name does not exist, create a worksheet with the given name
            Set GetSheet = WB.Worksheets.Add(After:=WB.Worksheets(WB.Worksheets.Count))
            GetSheet.Name = Left(SheetName, 31)
        End If
    End If
End Function
```

### SheetExists()

```VBA
'Returns boolean if a given worksheet exists in a given workbook
Public Function SheetExists(ByVal SheetName As String, Optional ByRef WB As Workbook) As Boolean
    On Error Resume Next
    If WB Is Nothing Then Set WB = ThisWorkbook
    SheetExists = Not WB.Worksheets(SheetName) Is Nothing
End Function
```

### CleanSheetName()

```VBA
'Sanitizes a given string to comply with Excel's Worksheet naming scheme
Public Function CleanSheetName(WorksheetName As String) As String
    CleanSheetName = WorksheetName
    Const InvalidChars As String = "\/?*[]"
    Dim Index As Long
    For Index = 1 To Len(InvalidChars)
        CleanSheetName = Replace(CleanSheetName, Mid(InvalidChars, Index, 1), "")
    Next Index
    CleanSheetName = Left(CleanSheetName, 31)
End Function
```

## Miscellaneous Functions

### ActiveRow()

```VBA
'Returns the row number of the currently selected cell
Public Function ActiveRow() As Long
    ActiveRow = Application.ActiveCell.Row
End Function
```

### ActiveCol()

```VBA
'Returns the column number of the currently selected cell
Public Function ActiveCol() As Long
    ActiveCol = Application.ActiveCell.Column
End Function
```

### CurrentCell()

```VBA
Public Function CurrentCell() As Range
    Set CurrentCell = Application.Caller
End Function
```

### GetURL()

```VBA
'Returns a URL within a given cell if it contains one
Public Function GetURL(Target As Range) As String
    If Target Is Nothing Then Exit Function
    'Grab URL if using the insert link method (Just the first one)
    If Target.Hyperlinks.Count > 0 Then
        GetURL = Target.Hyperlinks.Item(1).Address
        Exit Function
    End If
    'Grab URL if using the HYPERLINK formula
    If InStr(1, Target.Formula, "HYPERLINK(""", vbTextCompare) Then
        Dim SLeft As Long: SLeft = InStr(1, Target.Formula, "HYPERLINK(""", vbTextCompare)
        Dim SRight As Long: SRight = InStr(SLeft + 11, Target.Formula, """,""", vbTextCompare)
        GetURL = Mid(Target.Formula, SLeft + 11, SRight - (SLeft + 11))
    End If
End Function
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
list from [[VBA - Useful Utilities]] AND -"Changelog"
```