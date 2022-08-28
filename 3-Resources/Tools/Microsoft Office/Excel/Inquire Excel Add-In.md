---
Date: 2022-03-15
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool"]
Alias: ["Inquire Excel Add-In"]
---

# Inquire Excel Add-In

*Source: [Excel 2020: Audit a Worksheet With Spreadsheet Inquire - Excel Tips - MrExcel Publishing](https://www.mrexcel.com/excel-tips/excel-2020-audit-a-worksheet-with-spreadsheet-inquire/)*

## Overview

In classic [[Microsoft]] fashion, they kept the tool hidden so even if you have it, you don‘t know that it is there. If you‘ve ever seen a Power Pivot tab in your Ribbon, you likely have Inquire. It is at least worth the minute to figure out if you have it.

If you have the Developer tab in the Ribbon, click the COM Add-Ins button and continue to step 3 below. Otherwise, follow these steps:

1.  Go to File, Options. In the left bar of Excel Options, choose Add-ins (near the bottom of the list).
2.  Go all the way to the bottom of the dialog, next to Manage. Open the drop-down and change from Excel Add-Ins to COM Add-ins. After choosing COM Add-ins, click Go...
    
    ![In the COM Add-ins dialog, Inquire is in the list but is not enabled. Check the box next to Inquire to load it.](https://www.mrexcel.com/img/content/2020/07/LIV83.png)
    
3.  If you have Inquire in the list, check the box next to it, click OK, and keep reading. If you don‘t have Inquire in your list, see [Excel 2020: Discover New Functions by Using fx](https://www.mrexcel.com/excel-tips/excel-2020-discover-new-functions-by-using-fx/).

Once you enable Inquire, you have a new tab in the Ribbon called Inquire that provides the following options.

![There are six tools on the Inquire tab: Workbook Analysis, Workbook Relationship, Worksheet Relationship, Cell Relationship, Compare Files, and Clean Excess Cell Formatting.](https://www.mrexcel.com/img/content/2020/07/LXFig-166.jpg)

-   The Workbook Analysis takes from a few seconds to a few minutes to build a report about your worksheet. It tells you the number of formulas, hidden sheets, linked workbooks, external data connections, and array formulas, as well as how many formulas result in errors. Click any category for a list of the various items.
-   The next three icons allow you to draw diagrams showing relationships between workbooks, worksheets, or cells. The diagram below shows all inbound and outbound dependencies for cell D6. You can see the second-level precedents. Each node can be collapsed or expanded.

![A cell relationship diagram in Inquire has nodes that you can expand and collapse.](https://www.mrexcel.com/img/content/2020/07/LIV82.png)

-   Compare Files helps you find all changes between two open files. It does a really good job. You can foil most comparison tools by deleting a row in the second file. But Inquire detects that row 8 was deleted and keeps comparing row 9 in one file to row 8 in the other file.
-   Clean Excess Cell Formatting locates the last non blank cell in a worksheet and deletes all conditional formatting beyond that cell. You might want to do this, for example, if someone selects an entire row or column and applies conditional formatting.

***

## Appendix: Links

- [[Tools]]
- [[Excel]]
- [[__README|VBA]]
- [[Data Engineering]]

*Backlinks:*

```dataview
list from [[Inquire Excel Add-In]] AND -"Changelog"
```