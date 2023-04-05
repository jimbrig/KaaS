# VBA - File Dialog

*Source: [VBA-General/mod_FileDialog.bas at main · ViperSRT3g/VBA-General](https://github.com/ViperSRT3g/VBA-General/blob/main/mod_FileDialog.bas)*

````VBA
Attribute VB_Name = "mod_FileDialog"
Option Explicit

Public Function FileDialog(ByVal DialogType As MsoFileDialogType, _
                           Optional ByVal DialogTitle As String, _
                           Optional ByVal MultiSelect As Boolean, _
                           Optional ByVal Initial As String, _
                           Optional ByRef Filter As Variant) As String()
    'FileDialog returns an array of strings based on user selection
    'Filter Example: "Images, *.gif; *.jpg; *.jpeg"
    Dim Index As Long, SubFilter() As String, Output() As String
    With Application.FileDialog(DialogType)
        If Len(DialogTitle) > 0 Then .Title = DialogTitle
        If Len(Initial) > 0 Then .InitialFileName = Initial & "\"
        .AllowMultiSelect = MultiSelect
        If DialogType = msoFileDialogFilePicker Or DialogType = msoFileDialogOpen Then
            If Not IsMissing(Filter) Then
                .Filters.Clear
                If (VarType(Filter) And vbArray) = vbArray Then 'An array was passed
                    For Index = LBound(Filter) To UBound(Filter)
                        If InStr(Filter(Index), ",") Then 'Verify supplied filter is parse-able
                            SubFilter = Split(Filter(Index), ",")
                            .Filters.Add Trim(SubFilter(0)), Trim(SubFilter(1)) 'If you didn't supply the Filters properly, then this is your fault
                        End If
                    Next Index
                ElseIf (VarType(Filter) And vbString) = vbString Then 'A single string was passed
                    If InStr(Filter, ",") Then
                        SubFilter = Split(Filter, ",")
                        .Filters.Add Trim(SubFilter(0)), Trim(SubFilter(1)) 'If you didn't supply the Filters properly, then this is your fault
                    End If
                End If
            End If
        End If
        .Show
        'Process file selection (Whether there was a file selected or not)
        Select Case .SelectedItems.Count
            Case 0: ReDim Output(0) As String
            Case Else: ReDim Output(.SelectedItems.Count - 1) As String
        End Select
        For Index = 0 To .SelectedItems.Count - 1
            Output(Index) = .SelectedItems(Index + 1)
        Next Index
        FileDialog = Output
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
list from [[VBA - File Dialog]] AND -"Changelog"
````
