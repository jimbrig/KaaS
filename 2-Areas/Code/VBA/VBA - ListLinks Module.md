# VBA - ListLinks Module

\*Source: *

````VBA
Sub ListLinks()
    Dim xSheet As Worksheet
    Dim xRg As Range
    Dim xCell As Range
    Dim xCount As Long
    Dim xLinkArr() As String
    On Error Resume Next
    For Each xSheet In Worksheets
        Set xRg = xSheet.UsedRange.SpecialCells(xlCellTypeFormulas)
        If xRg Is Nothing Then GoTo LblNext
        For Each xCell In xRg
            If InStr(1, xCell.Formula, "[") > 0 Then
                xCount = xCount + 1
                ReDim Preserve xLinkArr(1 To 2, 1 To xCount)
                xLinkArr(1, xCount) = xCell.Address(, , , True)
                xLinkArr(2, xCount) = "'" & xCell.Formula
           End If
        Next
LblNext:
    Next
    If xCount > 0 Then
        Sheets.Add(Sheets(1)).Name = "Link Sheet"
        Range("A1").Resize(, 2).Value = Array("Location", "Reference")
        Range("A2").Resize(UBound(xLinkArr, 2), UBound(xLinkArr, 1)).Value = Application.Transpose(xLinkArr)
        Columns("A:B").AutoFit
    Else
        MsgBox "No links were found within the active workbook.", vbInformation, "KuTools for Excel"
    End If
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
list from [[VBA - ListLinks Module]] AND -"Changelog"
````
