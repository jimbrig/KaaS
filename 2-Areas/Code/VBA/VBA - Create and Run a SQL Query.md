# VBA - Create and Run a SQL Query

\*Source: *

````VBA
Sub CreateAndRunQuery()
    
    '------------------------------------------------------------------------------------------
    'This macro opens the Sample.accdb database, creates and runs an SQL query (filtering
    'all the customers from Canada). Then, it copies selected fields back in the Excel sheet.
    'The code uses late binding, so no reference to external library is required.
    
    'Written By:    Christos Samaras
    'Date:          05/10/2013
    'Last Updated:  29/11/2014
    'E-mail:        xristos.samaras@gmail.com
    'Site:          http://www.myengineeringworld.net
    '------------------------------------------------------------------------------------------

    'Declaring the necessary variables.
    Dim con         As Object
    Dim rs          As Object
    Dim AccessFile  As String
    Dim strTable    As String
    Dim SQL         As String
    Dim i           As Integer
            
    'Disable screen flickering.
    Application.ScreenUpdating = False
    
    'Specify the file path of the accdb file. You can also use the full path of the file like:
    'AccessFile = "C:\Users\Christos\Desktop\Sample.accdb"
    AccessFile = ThisWorkbook.Path & "\" & "Sample.accdb"
    
    'Set the name of the table you want to retrieve the data.
    strTable = "Customers"
    
    On Error Resume Next
    'Create the ADODB connection object.
    Set con = CreateObject("ADODB.connection")
    'Check if the object was created.
    If Err.Number <> 0 Then
        MsgBox "Connection was not created!", vbCritical, "Connection Error"
        Exit Sub
    End If
    On Error GoTo 0
    
    'Open the connection.
    con.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & AccessFile
    
    'Create the SQL statement to retrieve the data from table.
    'Get the necessary information (first name etc.) for all the Canadian customers.
    SQL = "SELECT FirstName, LastName, Address, City, Phone FROM " & strTable & " WHERE COUNTRY='Canada'"
    
    On Error Resume Next
    'Create the ADODB recordset object.
    Set rs = CreateObject("ADODB.Recordset")
    'Check if the object was created.
    If Err.Number <> 0 Then
        'Error! Release the objects and exit.
        Set rs = Nothing
        Set con = Nothing
        'Display an error message to the user.
        MsgBox "Recordset was not created!", vbCritical, "Recordset Error"
        Exit Sub
    End If
    On Error GoTo 0
         
    'Set thee cursor location.
    rs.CursorLocation = 3 'adUseClient on early  binding
    rs.CursorType = 1 'adOpenKeyset on early  binding
    
    'Open the recordset.
    rs.Open SQL, con
    
    'Check if the recordet is empty.
    If rs.EOF And rs.BOF Then
        'Close the recordet and the connection.
        rs.Close
        con.Close
        'Release the objects.
        Set rs = Nothing
        Set con = Nothing
        'Enable the screen.
        Application.ScreenUpdating = True
        'In case of an empty recordset display an error.
        MsgBox "There are no records in the recordset!", vbCritical, "No Records"
        Exit Sub
    End If
    
    'Copy the recordset headers.
    For i = 0 To rs.Fields.Count - 1
        Sheets("New Query").Cells(1, i + 1) = rs.Fields(i).Name
    Next i
    
    'Write the query values in the sheet.
    Sheets("New Query").Range("A2").CopyFromRecordset rs
    
    'Close the recordet and the connection.
    rs.Close
    con.Close
    
    'Release the objects.
    Set rs = Nothing
    Set con = Nothing
    
    'Adjust the columns' width.
    Sheets("New Query").Columns("A:E").AutoFit
    
    'Enable the screen.
    Application.ScreenUpdating = True

    'Inform the user that the macro was executed successfully.
    MsgBox "The Canadian customers were successfully retrieved from the '" & strTable & "' table!", vbInformation, "Done"

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
list from [[VBA - Create and Run a SQL Query]] AND -"Changelog"
````
