# VBA - Unhide All Worksheets

*Source: https://trumpexcel.com/excel-macro-examples/#Unhide-All-Worksheets-at-One-Go*

````VBA
'This code will unhide all sheets in the workbook
Sub UnhideAllWoksheets()
Dim ws As Worksheet
For Each ws In ActiveWorkbook.Worksheets
ws.Visible = xlSheetVisible
Next ws
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
list from [[VBA - Unhide All Worksheets]] AND -"Changelog"
````
