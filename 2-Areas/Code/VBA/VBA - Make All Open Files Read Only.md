# VBA - Make All Open Files Read Only

\*Source: *

````VBA
Sub AllReadOnly()
' Changes every file to read only without the save dialog
' 2014-01-18
' By: Jimmy Briggs

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

---

## Appendix: Links

* *Code*
* [Development](../../MOCs/Development.md)
* [Excel](../Excel/Excel.md)
* [Microsoft Office](../../../3-Resources/Tools/Microsoft%20Office/Microsoft%20Office.md)
* [Excel - VBA](../../../3-Resources/Tools/Microsoft%20Office/Excel/Excel%20-%20VBA.md)

*Backlinks:*

````dataview
list from [[VBA - Make All Open Files Read Only]] AND -"Changelog"
````
