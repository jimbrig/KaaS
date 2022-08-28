---
Date: 2022-03-15
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/VBA", "#Topic/Dev"]
Alias: ["VBA - Check for Broken Links in Workbook"]
---

# VBA - Check for Broken Links in Workbook

*Source: [Excel: How to find broken links and get them fixed - Ablebits.com](https://www.ablebits.com/office-addins-blog/2021/02/03/excel-find-fix-broken-links/)*


```VBA
Sub FindBrokenLinks()
    linksDataArray = ActiveWorkbook.LinkSources(xlExcelLinks)
    Dim reportHeaders() As String
    Dim rangeCur As Range
    Dim sheetCur As Worksheet
    Dim rowNo As Integer
    Dim linkFilePath, linkFilePath2, linkFileName As String
    Dim linksStatusDescr As String  'https://docs.microsoft.com/en-us/office/vba/api/excel.xllinkstatus
    Dim sheetReportName As String
 
    sheetReportName = "Broken Links report"
    linksStatusDescr = "File missing"
    reportHeaders = Split("Worksheet, Cell, Formula, Workbook, Link Status", ", ")
    rowNo = 1 'Header row
 
    Application.ScreenUpdating = False
    Application.Calculation = xlCalculationManual
 
    If Evaluate("ISREF('" & sheetReportName & "'!A1)") Then
        ActiveWorkbook.Worksheets(sheetReportName).Cells.Clear
    Else
        Sheets.Add.Name = sheetReportName
    End If
    Set sheetReport = ActiveWorkbook.Worksheets(sheetReportName)
 
    For indI = 0 To UBound(reportHeaders)
        sheetReport.Cells(rowNo, indI + 1) = reportHeaders(indI)
    Next
 
    For Each sheetCur In ActiveWorkbook.Worksheets
        If sheetCur.Name <> sheetReport.Name Then
            For Each rangeCur In sheetCur.UsedRange
                If rangeCur.HasFormula Then
                    For indI = LBound(linksDataArray) To UBound(linksDataArray)
                        linkFilePath = linksDataArray(indI)   'LinkSrouces returns the full file path with the file name
                        linkFileName = Right(linkFilePath, Len(linkFilePath) - InStrRev(linkFilePath, "\"))   'extract only the file name
                        linkFilePath2 = Left(linksDataArray(indI), InStrRev(linksDataArray(indI), "\")) & "[" & linkFileName & "]"  'the file path with the workbook name in square brackets
                        linksStatusCode = ActiveWorkbook.LinkInfo( CStr(linkFilePath), xlLinkInfoStatus)
 
                        If xlLinkStatusMissingFile = linksStatusCode And (InStr(rangeCur.Formula, linkFilePath) Or InStr(rangeCur.Formula, linkFilePath2)) Then
                            rowNo = rowNo + 1
                            With sheetReport
                                .Cells(rowNo, 1) = sheetCur.Name
                                .Cells(rowNo, 2) = Replace(rangeCur.Address, "$", "")
                                .Hyperlinks.Add Anchor:=.Cells(rowNo, 2), Address:="", SubAddress:="'" & sheetCur.Name & "'!" & rangeCur.Address
                                .Cells(rowNo, 3) = "'" & rangeCur.Formula
                                .Cells(rowNo, 4) = linkFilePath
                                .Cells(rowNo, 5) = linksStatusDescr
                            End With
                            Exit For
                        End If
                    Next indI
 
                    For Each namedrangeCur In Names
                       If InStr(rangeCur.Formula, namedrangeCur.Name) Then
                            linkFilePath = ""
                            linksStatusCode = -1
 
                            If 0 < InStr(namedrangeCur.RefersTo, "[") Then
                                linkFilePath = Replace( Split( Right(namedrangeCur.RefersTo, Len(namedrangeCur.RefersTo) - 2), "]")(0), "[", "")
                                linksStatusCode = ActiveWorkbook.LinkInfo( CStr(linkFilePath), xlLinkInfoStatus)
                            End If
                            If xlLinkStatusMissingFile = linksStatusCode Then
                                rowNo = rowNo + 1
                               With sheetReport
                                   .Cells(rowNo, 1) = sheetCur.Name
                                   .Cells(rowNo, 2) = Replace(rangeCur.Address, "$", "")
                                   .Hyperlinks.Add Anchor:=.Cells(rowNo, 2), Address:="", SubAddress:="'" & sheetCur.Name & "'!" & rangeCur.Address
                                   .Cells(rowNo, 3) = "'" & rangeCur.Formula
                                   .Cells(rowNo, 4) = linkFilePath
                                   If 0 < Len(linkFilePath) Then
                                    .Cells(rowNo, 5) = linksStatusDescr
                                   End If
                               End With
                            End If
                            Exit For
                        End If
                    Next namedrangeCur
                End If
            Next rangeCur
        End If
    Next
    Columns("A:E").EntireColumn.AutoFit
 
    Application.ScreenUpdating = True
    Application.Calculation = xlCalculationAutomatic
End Sub
```

A list of invalid links is output in a new worksheet named _Broken Links report_. Column B has a hyperlink to the cell containing the link.

![](https://i.imgur.com/k2WaJE6.png)


You can [insert the code](https://www.ablebits.com/office-addins-blog/2013/12/06/add-run-vba-macro-excel/) in your own workbook or [download our sample file](https://www.ablebits.com/office-addins-blog/2021/02/03/excel-find-fix-broken-links/#_Available_downloads:) with the macro as well as the step-by-step instructions on how to use it.

**Note.** This code only finds links to invalid workbooks (non-existent, moved or deleted), but not missing sheets. The reason is that the _LinkInfo_ method checks just the file name. An attempt to check a sheet name results in Error 2015.

***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[Development]]
- [[Excel]]
- [[Microsoft Office]]
- [[Excel - VBA]]

*Backlinks:*

```dataview
list from [[VBA - Check for Broken Links in Workbook]] AND -"Changelog"
```