# VBA - Refresh All

\*Source: *

Refresh all Workbook Connections, Pivot Tables, Charts, Forms and Formulas

````VBA
Sub RefreshAll() 'Refresh All Workbook Connections, Pivot Tables, Charts, Forms and Formulas
   
    Dim conn As Variant
    Dim pvtTbl As PivotTable
    Dim pCache As PivotCache
    Dim myChart As ChartObject
    Dim obj As AccessObject
    Dim dbs As Object
    Dim intFormCount As Integer
   
    On Error GoTo ErrorHandler
   
    Call Functions.OptimizeCodeSpeed
   
    ActiveWorkbook.RefreshAll
   
    'Connections Refresh
        Application.CalculateUntilAsyncQueriesDone
        Application.CalculateFullRebuild
        Application.CalculateUntilAsyncQueriesDone
             
        For Each conn In ActiveWorkbook.Connections
           
            conn.ODBCConnection.BackgroundQuery = False
       
        Next conn

    'Refresh all pivot tables
        For Each pCache In ActiveWorkbook.PivotCaches
            pCache.Refresh
        Next pCache
   
        For Each pvtTbl In ActiveSheet.PivotTables
            pvtTbl.RefreshTable
        Next
       
    'Refresh all Workbook Charts
        For Each myChart In ActiveSheet.ChartObjects
            myChart.Chart.Refresh
        Next myChart
       
'Refresh Access Forms, it requieres: Tools > References > Microsoft Access
        Set dbs = Application.CurrentProject
        intFormCount = dbs.AllForms.Count - 1
   
        For i = 0 To intFormCount
            If dbs.AllForms(i).isloaded = True Then
                dbs.AllForms(i).Refresh
            End If
        Next
       
    'Refresh Workbook Links Sources
        ActiveWorkbook.UpdateLink Name:=ActiveWorkbook.LinkSources, Type:=xlExcelLinks
   
    ActiveWorkbook.RefreshAll
    Application.CalculateFullRebuild 'Refresh all formulas, including custom ones

ErrorHandler:

    Call Functions.OptimizeCodeSpeedRestore

    Exit Sub

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
list from [[VBA - Refresh All]] AND -"Changelog"
````
