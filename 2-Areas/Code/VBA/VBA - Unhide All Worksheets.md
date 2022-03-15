---
Date: 2022-03-15
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/VBA", "#Topic/Dev"]
Alias: ["VBA - Unhide All Worksheets"]
---

# VBA - Unhide All Worksheets

*Source: https://trumpexcel.com/excel-macro-examples/#Unhide-All-Worksheets-at-One-Go*

```VBA
'This code will unhide all sheets in the workbook
Sub UnhideAllWoksheets()
Dim ws As Worksheet
For Each ws In ActiveWorkbook.Worksheets
ws.Visible = xlSheetVisible
Next ws
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
list from [[VBA - Unhide All Worksheets]] AND -"Changelog"
```