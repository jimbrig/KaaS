# Excel VBA Overview

## Gallery

````ccard
type: folder_brief_live
````

## Contents

* [VBA - Notes](VBA%20-%20Notes.md)
* [VBA - Refresh All](VBA%20-%20Refresh%20All.md)
* [VBA - Unhide All Worksheets](VBA%20-%20Unhide%20All%20Worksheets.md)
* [VBA - Useful Utilities](VBA%20-%20Useful%20Utilities.md)
* [VBA - Optimize Speed](VBA%20-%20Optimize%20Speed.md)
* [VBA - Unhide all Rows and Columns](VBA%20-%20Unhide%20all%20Rows%20and%20Columns.md)
* [VBA - SQL Stored Procedure Caller Module](VBA%20-%20SQL%20Stored%20Procedure%20Caller%20Module.md)
* [VBA - Save All](VBA%20-%20Save%20All.md)
* [VBA - File Dialog](VBA%20-%20File%20Dialog.md)
* [VBA - Page Setup and Print Macros](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md)
* [VBA - Module Template](VBA%20-%20Module%20Template.md)
* [VBA - Make All Open Files Read Only](VBA%20-%20Make%20All%20Open%20Files%20Read%20Only.md)
* [VBA - ListLinks Module](VBA%20-%20ListLinks%20Module.md)
* [VBA - Balloon Notification](VBA%20-%20Balloon%20Notification.md)
* [VBA - Copy Module from one Workbook to Another](VBA%20-%20Copy%20Module%20from%20one%20Workbook%20to%20Another.md)
* [VBA - Create and Run a SQL Query](VBA%20-%20Create%20and%20Run%20a%20SQL%20Query.md)
* [VBA - Check for Broken Links in Workbook](VBA%20-%20Check%20for%20Broken%20Links%20in%20Workbook.md)
* [VBA - Alert](VBA%20-%20Alert.md)

### VBA - Notes

# VBA Notes

\*Source: *

* Example Sub Procedure

````vba
'The Sub statement (Note: All procedures are public by default)
Sub SubExample()
  'The instructions
  'On Error GoTo Err_Hanlder
  With Selection.Font 
    'Set font color property
    .Color = wdColorRed 
    'Set font size property
    .Size = 14 
  End With
  'The Exit statement
  Exit Sub
Err_Handler:
'The End statement
End Sub 
````

````ad-note

The Exit Sub statement typically precedes any error handling code statements. For more on error handling see my: Error Handling 101

````

A Sub procedure can take "parameters", such as *constants, variables, or expressions that are passed to it as "arguments" by another "calling" procedure*. 

The following is an example of a Sub that takes parameters passed as arguments from a calling procedure:

````vba
Sub Main()
 'Other code could go here
  'Call and pass arguments to another sub
  'Property values for font color _
  and size are passed as arguments  FormatFontAtSelection Selection.Range, wdColorRed, 14 
  'Other code could go here lbl_Exit:
  Exit Sub
End Sub

Sub FormatFontAtSelection(ByRef oRng As Range, oColor As Long, oSize As Long) 'Parameters
  With oRng.Font
    .Color = oColor
    .Size = oSize
  End With
lbl_Exit:
  Exit Sub
End Sub
````

* **Function Procedure:** A Function procedure is a series of Visual Basic statements enclosed by the Function and End Function statements.
  * It is similar to a Sub procedure, but a function can also return a value.
  * A function can take arguments, such as constants, variables, or expressions that are passed to it by a calling procedure.
  * If a Function procedure has no arguments, its Function statement must include an empty set of parentheses.
  * A function returns a value by assigning a value to its name in one or more statements of the procedure.

---

## Appendix: Links

* [Code](../Code.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[VBA Notes]] AND -"Changelog"
````

### VBA - Useful Utilities

* # VBA - Useful Utilities
  
  \*Source: *
  
  ## Workbook Functions
  
  ````VBA
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
  
  ````
  
  ### FindWorkbook()
  
  ````VBA
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
  ````
  
  ### IsWorkBookOpen()
  
  ````VBA
  'Returns boolean if a given workbook is currently open
  Public Function IsWorkBookOpen(ByVal WorkbookName As String) As Boolean
      On Error GoTo ErrorHandler
      If Len(WorkbookName) = 0 Then Exit Function
      Dim WBO As Workbook: Set WBO = Workbooks(WorkbookName)
      IsWorkBookOpen = Not WBO Is Nothing
  ErrorHandler:
      Set WBO = Nothing
  End Function
  ````
  
  ### IsWorkbookProtected
  
  ````VBA
  'WORKBOOK FUNCTIONS
  'Returns boolean if a given workbook is password protected
  Public Function IsWBProtected(ByRef TWB As Workbook) As Boolean
      If TWB Is Nothing Then Exit Function
      IsWBProtected = TWB.ProtectWindows Or TWB.ProtectStructure
  End Function
  
  ````
  
  ## Worksheet Functions
  
  ### GetSheet()
  
  ````VBA
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
  ````
  
  ### SheetExists()
  
  ````VBA
  'Returns boolean if a given worksheet exists in a given workbook
  Public Function SheetExists(ByVal SheetName As String, Optional ByRef WB As Workbook) As Boolean
      On Error Resume Next
      If WB Is Nothing Then Set WB = ThisWorkbook
      SheetExists = Not WB.Worksheets(SheetName) Is Nothing
  End Function
  ````
  
  ### CleanSheetName()
  
  ````VBA
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
  ````
  
  ## Miscellaneous Functions
  
  ### ActiveRow()
  
  ````VBA
  'Returns the row number of the currently selected cell
  Public Function ActiveRow() As Long
      ActiveRow = Application.ActiveCell.Row
  End Function
  ````
  
  ### ActiveCol()
  
  ````VBA
  'Returns the column number of the currently selected cell
  Public Function ActiveCol() As Long
      ActiveCol = Application.ActiveCell.Column
  End Function
  ````
  
  ### CurrentCell()
  
  ````VBA
  Public Function CurrentCell() As Range
      Set CurrentCell = Application.Caller
  End Function
  ````
  
  ### GetURL()
  
  ````VBA
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
  list from [[VBA - Useful Utilities]] AND -"Changelog"
  ````

## Code Snippets

### VBA - Refresh All

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

### VBA - Unhide All Worksheets

* # VBA - Unhide All Worksheets
  
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

### VBA - Optimize Speed

# VBA - Optimize Speed

\*Source: *

## Contents

* [OptimizeCodeSpeed](VBA%20-%20Optimize%20Speed.md#optimizecodespeed)
* [OptimizeCodeSpeedRestore](VBA%20-%20Optimize%20Speed.md#optimizecodespeedrestore)
* [LudicrousMode](VBA%20-%20Optimize%20Speed.md#ludicrousmode)
* [Example](VBA%20-%20Optimize%20Speed.md#example)
* [Appendix: Links](VBA%20-%20Optimize%20Speed.md#appendix-links)

## OptimizeVBA

````VBA
Sub OptimizeVBA(isOn As Boolean)
    Application.Calculation = IIf(isOn, xlCalculationManual, xlCalculationAutomatic)
    Application.EnableEvents = Not (isOn)
    Application.ScreenUpdating = Not (isOn)
    ActiveSheet.DisplayPageBreaks = Not (isOn)
End Sub
````

## OptimizeCodeSpeed

````VBA
Public Sub OptimizeCodeSpeed()

  On Error Resume Next

    Application.EnableEvents = False
    Application.DisplayAlerts = False
    Application.ScreenUpdating = False
    Application.EnableAnimations = False
    ActiveSheet.DisplayPageBreaks = False
    Application.DisplayStatusBar = False
    Application.Calculation = xlCalculationManual
         
  On Error GoTo 0
                   
End Sub
````

## OptimizeCodeSpeedRestore

````VBA
Public Sub OptimizeCodeSpeedRestore()

  On Error Resume Next

    Application.EnableEvents = True
    Application.DisplayAlerts = True
    Application.ScreenUpdating = True
    ActiveSheet.DisplayPageBreaks = False
    Application.DisplayStatusBar = True
    Application.Calculation = xlCalculationAutomatic

  On Error GoTo 0

End Sub
````

## LudicrousMode

````VBA
'Adjusts Excel settings for faster VBA processing
Public Sub LudicrousMode(ByVal Toggle As Boolean)
    Application.ScreenUpdating = Not Toggle
    Application.EnableEvents = Not Toggle
    Application.DisplayAlerts = Not Toggle
    Application.EnableAnimations = Not Toggle
    Application.DisplayStatusBar = Not Toggle
    Application.PrintCommunication = Not Toggle
    Application.Calculation = IIf(Toggle, xlCalculationManual, xlCalculationAutomatic)
End Sub
````

## Example

````VBA
Sub example()
	'Stop automatic calculation of excel cells
	Application.Calculation = xlCalculationManual
	'Stop screen updating
	Application.ScreenUpdating = False

	'Some code

	'Put it back to "normal"
	Application.Calculation = xlCalculationAutomatic
	Application.ScreenUpdating = True
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
list from [[VBA - Optimize Speed]] AND -"Changelog"
````

### VBA - Unhide all Rows and Columns

# VBA - Unhide all Rows and Columns

\*Source: *

````VBA

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
list from [[VBA - Unhide all Rows and Columns]] AND -"Changelog"
````

### VBA - SQL Stored Procedure Caller Module

* # VBA - SQL Stored Procedure Caller Module
  
  *Source: https://gist.github.com/2bb551e24cb2fab4f61db673f6ee62a3#file-mdlgen_dbcommands-vb*
  
  *Excel VBA* - [SQL](../SQL/SQL.md) Stored Procedure Caller Module - `mdlGen_DBCommands.vb`:
  
  ````vba
  'This module was originally created by Rohan Shenoy in December 2012. It was designed to collect parameters,
  'and use them to call stored procedures (in SQL Server 2005+). The primary function - sqlStoredProc takes the
  'name of a stored procedure and a scripting dictionary containing a variable number of parameters (stored in
  'key-value pairs). If the procedure returns a dataset, the function returns this data as an ADO recordset
  'to the caller.
  '
  ' - © R Shenoy 30/07/2013
  '
  '(Remember to add references to ADO and Scripting Runtime libraries to any workbooks that you add this to)
  
  
  Option Explicit
  
  'dictionary of parameters to pass to sqlStoredProc function when invoking SQL Server Stored Procedures
  Public dicParams    As New Scripting.Dictionary
  
  'Connection String to UK Apps DB (ExcelLogin user)
  Public strConn              As String
  
  Public Const strConnEnc     As String = "80;82;79;86;73;68;69;82;61;..."
  'For obvious reasons I've not included the whole connection string here. You can use the Encode() function below to generate
  'a (trivially) obfuscated version of the raw connection string so that passwords aren't in plain text. If you are concerned
  'about securing your DB credentials, you probably want to password-protect the VBA project as well
  
  
  'Recordset for global use
  Public rs           As New ADODB.Recordset
  
  
  Public Function sqlStoredProc(strStoredProc As String, dicParameters As Scripting.Dictionary)
  'Run stored procedure and pass parameters - returns Nothing if no records found
  'If stored proc expects a parameter not contained in dictionary, an error is returned.
  'Any parameters not required by the proc will just be ignored.
  'Requisites: strConn, strConnEnc, Decode()
  
      Dim conn        As ADODB.Connection
      Dim cmd         As ADODB.Command
      Dim rs          As New ADODB.Recordset
      Dim rs2         As New ADODB.Recordset
      Dim param       As ADODB.Parameter
      Dim dicTypes    As New Scripting.Dictionary
  
      'Define data type conversion from SQL to ADODB
      dicTypes("varchar") = adVarChar
      dicTypes("char") = adChar
      dicTypes("text") = adVarChar
      dicTypes("int") = adInteger
      dicTypes("datetime") = adDBTimeStamp
      dicTypes("numeric") = adNumeric
      dicTypes("nvarchar") = adVarChar
      dicTypes("decimal") = adDecimal
      dicTypes("date") = adDate
      dicTypes("bit") = adBoolean
      
      If strConn = "" Then strConn = Decode(strConnEnc)
      
      'Connect to database
      Set conn = New ADODB.Connection
      conn.Open strConn
      
      'Get parameter names, datatypes and precision for Stored Proc and store in rs2
      Set cmd = New ADODB.Command
      cmd.CommandText = "pGetSPParameters"
      cmd.CommandType = adCmdStoredProc
      cmd.ActiveConnection = conn
      Set param = cmd.CreateParameter("@SPName", adVarChar, adParamInput, 100, strStoredProc)
      cmd.Parameters.Append param
  
      With rs2
          .CursorType = adOpenStatic
          .CursorLocation = adUseClient
          .Open cmd
  
          'Now create command to call Stored Procedure
          Set cmd = New ADODB.Command
          
          cmd.CommandText = strStoredProc
          cmd.CommandType = adCmdStoredProc
          cmd.ActiveConnection = conn
          
          'Loop through each parameter required by the proc and add it to the ADO command
         ' On Error GoTo Closedown
          
          If Not (.BOF And .EOF) Then
              .MoveFirst
              Do While Not .EOF
                  'If missing parameter not supplied then goto error handler
                  If Not dicParameters.Exists(!ParameterName.Value) Then
                      GoTo InvalidParameter
                  End If
                  Set param = cmd.CreateParameter(!ParameterName.Value, _
                                                  dicTypes(!DataType.Value), _
                                                  adParamInput, _
                                                  !CharacterMaxLength.Value, _
                                                  dicParameters(!ParameterName.Value))
                  If !NumericScale > 0 Then param.NumericScale = !NumericScale.Value
                  If !NumericPrecision > 0 Then param.Precision = !NumericPrecision.Value
                  cmd.Parameters.Append param
                  .MoveNext
              Loop
          End If
      End With
      
      Set rs = New ADODB.Recordset
      With rs
          .CursorType = adOpenStatic
          .CursorLocation = adUseClient
          '.LockType = adLockOptimistic
          .Open cmd
      End With
      
      Set sqlStoredProc = Nothing
      
      If rs.State = 0 Then
          'Set rs = Nothing
      ElseIf rs.BOF And rs.EOF Then
          'Set rs = Nothing
      Else
          Set rs.ActiveConnection = Nothing
          Set cmd = Nothing
          Set conn = Nothing
          Set sqlStoredProc = rs
      End If
      
      GoTo Closedown
  
  InvalidParameter:
      MsgBox "Procedure " & strStoredProc & " is missing parameter " & rs2!ParameterName
      Set cmd = Nothing
      
  Closedown:
      If Err.Number <> 0 Then
          MsgBox "Error - " & Err.Description
      End If
      
      'Close all objects
      On Error Resume Next
      
      rs2.Close
      'conn.Close
      Set rs2 = Nothing
      'Set conn = Nothing
      Set cmd = Nothing
      
      On Error GoTo 0
  
  End Function
  
  
  Function TestConnection() As Boolean
  'Simple function to test db connection
  'Requisites: strConn, Decode
  
      Dim cnTest              As ADODB.Connection
  
      Set cnTest = New ADODB.Connection
  
      If strConn = "" Then strConn = Decode(strConnEnc)
  
      On Error GoTo Failed
      cnTest.Open strConn
      On Error GoTo 0
      cnTest.Close
      
      TestConnection = True
      
      Exit Function
      
  Failed:
      TestConnection = False
      
  End Function
  
  
  Function sqlCleanString(strUserInput As String) As String
  'Clean troublesome characters for SQL or File operations
  'Requisites: none
  
      Dim cleanChar       As String
      Dim singleQuote     As String
      Dim doubleQuote     As String
      Dim semiColon       As String
      Dim singledash      As String
      Dim doubleDash      As String
      Dim commentStart    As String
      Dim commentEnd      As String
      Dim comma           As String
      
      cleanChar = Chr(32) 'space character which the SQL parser ignores
      singleQuote = Chr(39)
      doubleQuote = Chr(34)
      semiColon = Chr(59)
      singledash = Chr(45)
      doubleDash = Chr(45) & Chr(45)
      commentStart = Chr(47) & Chr(42)
      commentEnd = Chr(42) & Chr(47)
      comma = Chr(44)
      
      ' replace single quote with double quotes; also properly formats legit possession and contractions
      strUserInput = Replace(strUserInput, singleQuote, doubleQuote)
      
      ' remove semicolon command delimiter
      strUserInput = Replace(strUserInput, semiColon, comma)
      
      ' remove double dash comment
      Do While InStr(1, strUserInput, doubleDash) > 0
          strUserInput = Replace(strUserInput, doubleDash, singledash)
      Loop
      
      ' remove slash begin comment
      strUserInput = Replace(strUserInput, commentStart, singledash)
      
      ' remove slash end comment
      strUserInput = Replace(strUserInput, commentEnd, singledash)
      
      'remove xp_ external commands
      strUserInput = Replace(strUserInput, "xp_", cleanChar)
      
      sqlCleanString = Trim(strUserInput)
      
  End Function
  
  
  Function Decode(str As String) As String
  'Convert a string of ASCII codes into plain text
  'Requisites: none
      Dim varArray        As Variant
      Dim x               As Integer
  
      varArray = Split(str, ";")
      On Error GoTo Decoded:
      For x = LBound(varArray) To UBound(varArray)
          Decode = Decode & Chr(varArray(x))
      Next x
      Exit Function
  
  Decoded:
      Decode = str
  
  End Function
  
  
  Function Encode(str As String) As String
  'Convert a string of plain text into ASCII codes
  'Requisites: none
      Dim x       As Integer
  
      For x = 1 To Len(str)
          Encode = Encode & IIf(x = 1, "", ";") & Asc(Mid(str, x, 1))
      Next x
  End Function
  
  
  Public Function IfNull(val, str)
  'Function to replicate Access' Nz or SQL's ISNULL
  'Requisites: none
  
      If IsNull(val) Then
          IfNull = str
      Else
          IfNull = val
      End If
  End Function
  
  
  Public Function NullIf(val, chk)
  'Reverse of IfNull, to submit NULLs to database
  'Requisites: none
  
      If val = chk Then
          NullIf = Null
      Else
          NullIf = val
      End If
  End Function
  
  
  Public Function IsEmptyRS(rs As ADODB.Recordset) As Boolean
  'Test whether recordset is empty
  'Requisites: none
  
      If rs Is Nothing Then
          IsEmptyRS = True
      ElseIf rs.State = 0 Then
          IsEmptyRS = True
      Else
          IsEmptyRS = False
      End If
  End Function
  
  
  Public Sub rsToRow(rs As ADODB.Recordset, StartRange As Range, Optional HeaderRow As Long = 1)
  'Loop through all fields in a recordset, add them to the correct columns (relative to StartRange)
  'Requisites: IsEmptyRS
      Dim sht As Worksheet
      Dim cel As Range
      
      Set sht = StartRange.Parent
  
      If Not IsEmptyRS(rs) Then
          With sht
              rs.MoveFirst
              Do While Not rs.EOF
                  For Each cel In .Range(.Cells(HeaderRow, StartRange.Column), .Cells(HeaderRow, .Columns.Count).End(xlToLeft))
                      On Error Resume Next
                      Debug.Print rs(cel.Value)
                      On Error GoTo 0
                  Next cel
  
                  rs.MoveNext
              Loop
          End With
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
  * [SQL](../SQL/SQL.md)
  * [Stored Procedures - SQL Server](../../../0-Slipbox/Stored%20Procedures%20-%20SQL%20Server.md)
  *Backlinks:*
  
  ````dataview
  list from [[VBA - SQL Stored Procedure Caller Module]] AND -"Changelog"
  ````

\#Status/WIP 

* # VBA - Save All
  
  ## Contents
  
  * [Individual Sub Modules](VBA%20-%20Save%20All.md#individual-sub-modules)
    * [Save All](VBA%20-%20Save%20All.md#save-all)
    * [Close Without Save](VBA%20-%20Save%20All.md#close-without-save)
    * [Save All and Close](VBA%20-%20Save%20All.md#save-all-and-close)
  * [Whole Save Module](VBA%20-%20Save%20All.md#whole-save-module)
  * [Appendix: Links](VBA%20-%20Save%20All.md#appendix-links)
  ## Individual Sub Modules
  
  * [Save All](VBA%20-%20Save%20All.md#save-all)
  * [Close Without Save](VBA%20-%20Save%20All.md#close-without-save)
  * [Save All and Close](VBA%20-%20Save%20All.md#save-all-and-close)
  ### Save All
  
  * `SaveAll(Optional CloseSaved As Boolean = False)`
  ````VBA
  Sub SaveAll(Optional CloseSaved As Boolean = False)
  ' This procedure saves all open workbooks
  ' Created on: 2/28/12
  ' by: Scott Conrad
  
  Dim Ans As Integer
  Dim ListAns As Integer
  Dim i As Integer
  Dim sUnsavedMessage As String
  Dim wbActive As Workbook
  Dim wbBook As Workbook
  
  ' For returning to active workbook
  Set wbActive = ActiveWorkbook
  
  ' For populating a list of unsaved files
  iCtUnsaved = 0
  iCtSaved = 0
  sUnsavedList = ""
  i = 0
  
  ' Disabling alerts so that the program will pause
  Application.DisplayAlerts = False
  
  ' Loops through all books
  For Each wbBook In Application.Workbooks
      ' Checks if file is not read only and begins to save
      If wbBook.ReadOnly <> True Then
          ' If path exists file saves otherwise save prompt is opened
          If wbBook.Path <> "" Then
                  wbBook.Save
                  iCtSaved = iCtSaved + 1
                  If CloseSaved = True Then
                      wbBook.Close
                      End If
              Else
                  Err.Clear
                  wbBook.Activate
                  Ans = 6
                  Ans = Application.Dialogs(xlDialogSaveAs).Show
                  Do
                  Loop While Ans = 6
                  If Ans = 0 Then
                      iCtUnsaved = iCtUnsaved + 1
                      sUnsavedList = sUnsavedList + wbBook.Name + vbCrLf
                  Else
                  If Err <> 0 Then
                      MsgBox wbBook.Name & "did not save. Please try saving later.", vbOK, "Saving"
                      iCtUnsaved = iCtUnsaved + 1
                      sUnsavedList = sUnsavedList + wbBook.Name + vbCrLf
                      Else
                      iCtSaved = iCtSaved + 1
                      wbBook.Save
                      If CloseSaved = True Then
                          wbBook.Close
                          End If
                      End If
                  End If
                  Err.Clear
                  
              End If
          ' If file is read only, file name is stored for listing in
          '   unsaved form.
          Else
          i = i + 1
          iCtUnsaved = iCtUnsaved + 1
          sUnsavedList = sUnsavedList + wbBook.Name & vbCrLf
          End If
      Next wbBook
  
  If CloseSaved = False And iCtUnsaved > 0 Then
      sUnsavedMessage = "The following files did not save, because they were "
      sUnsavedMessage = sUnsavedMessage & "either in read-only or new books."
      ListAns = ListForm(sUnsavedList, sUnsavedMessage, "Save All", typeOK)
      End If
  
  On Error Resume Next
  wbActive.Activate
  Application.DisplayAlerts = True
  
  End Sub
  ````
  
  ### Close Without Save
  
  * `CloseWithoutSave(Optional bForceClose As Boolean = False)`
  ````VBA
  Sub CloseWithoutSave(Optional bForceClose As Boolean = False)
  ' Closes excel without saving any of the open files
  ' Created on: 3/13/12
  ' By: S Conrad
  
  Dim CloseAns As Integer
  Dim sClose As String
  Dim wbBook As Workbook
  
  ' Gives the user the option to abort.
  If bForceClose = False Then
      sClose = "Would you like to continue closing Excel without saving the open files?"
      CloseAns = MsgBox(sClose, vbOKCancel, "Close All Files")
      Else
      CloseAns = vbOK
      End If
      
  If CloseAns = vbCancel Then Exit Sub
  
  ' Tricks excel into thinking workbook was saved and closes workbook leaving the application open
  For Each wbBook In Workbooks
      wbBook.Saved = True
      wbBook.Close (False)
      Next
  
  '' If ok is clicked, all workbooks are closed without the save dialog popup activating.
  'If CloseAns = vbOK Then
  '    Excel.Application.Quit
  '    End If
  
  End Sub
  ````
  
  ### Save All and Close
  
  * `SaveAllAndClose()`
  ````VBA
  Sub SaveAllandClose()
  
  Dim sUnsavedMess As String
  Dim ListAns As Integer
  Dim wb As Workbook
  
  SaveAll (True)
  
  If iCtUnsaved > 0 Then
      sUnsavedMess = "The following files did not save, because they were "
      sUnsavedMess = sUnsavedMess & "either in read-only or new books.  Would "
      sUnsavedMess = sUnsavedMess & "you like to close these without saving?"
      ListAns = ListForm(sUnsavedList, sUnsavedMess, "Save and Close", typeYes, typeNo)
      Else
      Application.Quit
      End If
  
  Debug.Print "Here are unsaved"; iCtUnsaved
  
  If ListAns = vbYes Then
      For Each wb In Workbooks
          wb.Saved = True
          Next wb
      Excel.Application.Quit
      End If
  End Sub
  ````
  
  ## Whole Save Module
  
  * `ModSave.bat`
  ````VBA
  Option Explicit
  Dim iCtSaved As Integer
  Dim iCtUnsaved As Integer
  Dim sUnsavedList As String
  
  Sub SaveAll(Optional CloseSaved As Boolean = False)
  ' This procedure saves all open workbooks
  ' Created on: 2/28/12
  ' by: Scott Conrad
  
  Dim Ans As Integer
  Dim ListAns As Integer
  Dim i As Integer
  Dim sUnsavedMessage As String
  Dim wbActive As Workbook
  Dim wbBook As Workbook
  
  ' For returning to active workbook
  Set wbActive = ActiveWorkbook
  
  ' For populating a list of unsaved files
  iCtUnsaved = 0
  iCtSaved = 0
  sUnsavedList = ""
  i = 0
  
  ' Disabling alerts so that the program will pause
  Application.DisplayAlerts = False
  
  ' Loops through all books
  For Each wbBook In Application.Workbooks
      ' Checks if file is not read only and begins to save
      If wbBook.ReadOnly <> True Then
          ' If path exists file saves otherwise save prompt is opened
          If wbBook.Path <> "" Then
                  wbBook.Save
                  iCtSaved = iCtSaved + 1
                  If CloseSaved = True Then
                      wbBook.Close
                      End If
              Else
                  Err.Clear
                  wbBook.Activate
                  Ans = 6
                  Ans = Application.Dialogs(xlDialogSaveAs).Show
                  Do
                  Loop While Ans = 6
                  If Ans = 0 Then
                      iCtUnsaved = iCtUnsaved + 1
                      sUnsavedList = sUnsavedList + wbBook.Name + vbCrLf
                  Else
                  If Err <> 0 Then
                      MsgBox wbBook.Name & "did not save. Please try saving later.", vbOK, "Saving"
                      iCtUnsaved = iCtUnsaved + 1
                      sUnsavedList = sUnsavedList + wbBook.Name + vbCrLf
                      Else
                      iCtSaved = iCtSaved + 1
                      wbBook.Save
                      If CloseSaved = True Then
                          wbBook.Close
                          End If
                      End If
                  End If
                  Err.Clear
                  
              End If
          ' If file is read only, file name is stored for listing in
          '   unsaved form.
          Else
          i = i + 1
          iCtUnsaved = iCtUnsaved + 1
          sUnsavedList = sUnsavedList + wbBook.Name & vbCrLf
          End If
      Next wbBook
  
  If CloseSaved = False And iCtUnsaved > 0 Then
      sUnsavedMessage = "The following files did not save, because they were "
      sUnsavedMessage = sUnsavedMessage & "either in read-only or new books."
      ListAns = ListForm(sUnsavedList, sUnsavedMessage, "Save All", typeOK)
      End If
  
  On Error Resume Next
  wbActive.Activate
  Application.DisplayAlerts = True
  
  End Sub
  
  
  Sub CloseWithoutSave(Optional bForceClose As Boolean = False)
  ' Closes excel without saving any of the open files
  ' Created on: 3/13/12
  ' By: S Conrad
  
  Dim CloseAns As Integer
  Dim sClose As String
  Dim wbBook As Workbook
  
  ' Gives the user the option to abort.
  If bForceClose = False Then
      sClose = "Would you like to continue closing Excel without saving the open files?"
      CloseAns = MsgBox(sClose, vbOKCancel, "Close All Files")
      Else
      CloseAns = vbOK
      End If
      
  If CloseAns = vbCancel Then Exit Sub
  
  ' Tricks excel into thinking workbook was saved and closes workbook leaving the application open
  For Each wbBook In Workbooks
      wbBook.Saved = True
      wbBook.Close (False)
      Next
  
  '' If ok is clicked, all workbooks are closed without the save dialog popup activating.
  'If CloseAns = vbOK Then
  '    Excel.Application.Quit
  '    End If
  
  End Sub
  
  Sub SaveAllandClose()
  
  Dim sUnsavedMess As String
  Dim ListAns As Integer
  Dim wb As Workbook
  
  SaveAll (True)
  
  If iCtUnsaved > 0 Then
      sUnsavedMess = "The following files did not save, because they were "
      sUnsavedMess = sUnsavedMess & "either in read-only or new books.  Would "
      sUnsavedMess = sUnsavedMess & "you like to close these without saving?"
      ListAns = ListForm(sUnsavedList, sUnsavedMess, "Save and Close", typeYes, typeNo)
      Else
      Application.Quit
      End If
  
  Debug.Print "Here are unsaved"; iCtUnsaved
  
  If ListAns = vbYes Then
      For Each wb In Workbooks
          wb.Saved = True
          Next wb
      Excel.Application.Quit
      End If
  End Sub
  
  Private Sub TestSaveAll()
  SaveAll
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
  list from [[VBA - Save All]] AND -"Changelog"
  ````

* # VBA - File Dialog
  
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

* # VBA - Page Setup and Print Macros
  
  ## Contents
  
  * [Individual Sub Modules](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#individual-sub-modules)
    * [Setup and Optimization](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#setup-and-optimization)
    * [Set Print DPI](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#set-print-dpi)
    * [Set Print to Black and White](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#set-print-to-black-and-white)
    * [Unhide All Sheets](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#unhide-all-sheets)
    * [All Read Only](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#all-read-only)
  * [Entire Print and Page Module](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#entire-print-and-page-module)
  * [Appendix: Links](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#appendix-links)
  ## Individual Sub Modules
  
  The following Sub's are included:
  
  * [Setup and Optimization](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#setup-and-optimization)
  * [Set Print DPI](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#set-print-dpi)
  * [Set Print to Black and White](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#set-print-to-black-and-white)
  * [Unhide All Sheets](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#unhide-all-sheets)
  * [All Read Only](VBA%20-%20Page%20Setup%20and%20Print%20Macros.md#all-read-only)
  ### Setup and Optimization
  
  * Setup & `InitGlobalFastApp()`
  ````VBA
  Option Explicit
  
  ' These are used to speed up vba code
  Public DefCalcState As Integer
  Public DefEventState As Integer
  Public DefScrUpdState As Integer
  
  Sub InitGlobalFastApp()
  ' Used to speed up vba code.
  ' Created on: 3/26/12
  ' By: S Conrad
  
  ' Stores default settings and changes them to speed up code
  With Application
      DefCalcState = .Calculation
      DefEventState = .EnableEvents
      DefScrUpdState = .ScreenUpdating
      .Calculation = xlCalculationManual
      .EnableEvents = False
      .ScreenUpdating = False
      End With
      
  End Sub
  ````
  
  ### Set Print DPI
  
  * `SetPrintDPI()`
  ````VBA
  Sub SetPrintDPI()
  ' Allows the user to select from a list of available print qualities and changes
  ' all pages in the current workbook.
  ' Created on: 3/14/12
  ' By: S Conrad
  
  Dim bExitLoop As Boolean
  Dim oldStatusBar As Boolean
  Dim i As Double
  Dim sDefDPI As Double
  Dim dDPI As Double
  Dim vDPI As Variant
  Dim wsWkSheet As Worksheet
  Dim wsAW As Worksheet
  Dim Ans As Double
  Dim sAnsMsg As String
  Dim SampleDPI As String
  Dim sFormQuest As String
  
  ' Cancels procedure if no workbooks are open
  If Workbooks.Count = 0 Then
      MsgBox "No workbooks are open.", , "Change Print Resolution"
      Exit Sub
      End If
      
  ' Stores initial settings
  'InitGlobalFastApp
  Set wsAW = ActiveSheet
  sDefDPI = CStr(wsAW.PageSetup.PrintQuality(1))
  oldStatusBar = Application.DisplayStatusBar
  
  ' Sets print quality to 600 if available
  On Error Resume Next
  ActiveSheet.PageSetup.PrintQuality = 600
  If Err = 0 Then
      Application.DisplayStatusBar = True
      For Each wsWkSheet In Sheets
          Application.StatusBar = wsWkSheet.Name & "'s print quality is being changed to 600 DPi."
          wsWkSheet.PageSetup.PrintQuality = 600
          wsWkSheet.DisplayPageBreaks = False
          Next
      wsAW.Activate
      Application.StatusBar = False
      Application.DisplayStatusBar = oldStatusBar
      Exit Sub
      Else
      sAnsMsg = "This printer does not have a print setting of 600 DPi." & vbCrLf & _
          "Would you like to see a list of available resolutions?"
      Ans = MsgBox(sAnsMsg, vbOKCancel, "Setting Print Resolution")
      If Ans = vbCancel Then Exit Sub
      End If
  
  Application.DisplayStatusBar = True
  Application.StatusBar = "Please wait. A list of available print qualities is being populated"
  
  ' Populate a list of possible print qualities
  SampleDPI = ""
  For i = 100 To 1200 Step 50
      On Error Resume Next
      ActiveSheet.PageSetup.PrintQuality = i
      If Err = 0 Then SampleDPI = SampleDPI & i & vbCrLf
      Next
      
  ActiveSheet.DisplayPageBreaks = False
  ' Returns status bar to original state
  Application.StatusBar = False
  Application.DisplayStatusBar = oldStatusBar
          
  ' Construction of messages to send to the user
  SampleDPI = Left(SampleDPI, Len(SampleDPI) - 2)
          
  sFormQuest = "Please choose a print quality.  The drop down list "
  sFormQuest = sFormQuest & "contains some available print qualities.  "
  sFormQuest = sFormQuest & "Other print qualities are allowed.  Refer "
  sFormQuest = sFormQuest & "to the page setup form of the page layout tab "
  sFormQuest = sFormQuest & "for other available qualities."
  
  ' This loop shows the combo form and waits for the user to enter an acceptable answer
  bExitLoop = False
  Do
      vDPI = ComboForm(SampleDPI, sFormQuest, "Print Quality", sDefDPI, _
      "DPI")
      ' Exits if the user cancels
      If vDPI = vbCancel Or cmbCancel = vbCancel Then
  '        With Application
  '            .Calculation = DefCalcState
  '            .ScreenUpdating = DefScrUpdState
  '            .EnableEvents = DefEventState
  '            End With
          wsAW.Activate
          wsAW.PageSetup.PrintQuality = sDefDPI
          wsAW.DisplayPageBreaks = False
          Unload FmComboBox
          Exit Sub
          End If
      
      ' Only allows integers
      If WorksheetFunction.IsNumber(vDPI) Or vDPI > 1 Then
          dDPI = CDbl(vDPI)
          Else
          MsgBox "Please enter a value greater than one.", vbOKOnly, "Print Settings"
          dDPI = 0
          End If
  
      ' Checks if the DPI is available
      On Error Resume Next
      ActiveSheet.PageSetup.PrintQuality = dDPI
      If Err <> 0 Then
          dDPI = 0
          MsgBox "The selected pring quality is not availabe for this printer.", vbOKOnly, _
              "Print Quality"
          Else
          bExitLoop = True
          End If
          Unload FmComboBox
      Loop Until bExitLoop = True
      
  ' Change each pages print quality and hide page breaks
  Application.DisplayStatusBar = True
  For Each wsWkSheet In Sheets
      Application.StatusBar = wsWkSheet.Name & "'s print quality is being changed to " & dDPI & " DPi."
      wsWkSheet.PageSetup.PrintQuality = dDPI
      wsWkSheet.DisplayPageBreaks = False
      Next
  
  ' Returns status bar to original state
  Application.StatusBar = False
  Application.DisplayStatusBar = oldStatusBar
  
  ' Return application to original state
  wsAW.Activate
  'With Application
  '    .Calculation = DefCalcState
  '    .ScreenUpdating = DefScrUpdState
  '    .EnableEvents = DefEventState
  '    End With
  
  End Sub
  ````
  
  ### Set Print to Black and White
  
  * `SetPrintBlackandWhite()`
  ````VBA
  Sub SetPrintBlackandWhite()
  ' Changes print
  ' Revised on: 2/18/12
  ' by: Scott Conrad
  
  Dim oldStatusBar As Boolean
  Dim wsSheet As Worksheet
  
  ' Cancels procedure if no workbooks are open
  If Workbooks.Count = 0 Then
      MsgBox "No workbooks are open.", , "Change Print Resolution"
      Exit Sub
      End If
      
  ' Stores initial settings
  oldStatusBar = Application.DisplayStatusBar
  Application.DisplayStatusBar = True
  'InitGlobalFastApp
  
  ' Change print to black and white and hide page breaks
  For Each wsSheet In Sheets
      Application.StatusBar = wsSheet.Name & " is being set to Black and White"
      wsSheet.PageSetup.BlackAndWhite = True
      wsSheet.DisplayPageBreaks = False
      Next wsSheet
      
  Application.StatusBar = False
  Application.DisplayStatusBar = oldStatusBar
      
  ' Returns to original state
  'With Application
  '    .Calculation = DefCalcState
  '    .ScreenUpdating = DefScrUpdState
  '    .EnableEvents = DefEventState
  '    End With
          
  End Sub
  ````
  
  ### Unhide All Sheets
  
  * `UnhideAllSheets()`
  ````VBA
  Sub UnhideAllSheets()
  ' Unhides all sheets. This works with or without index tab.
  ' Revised on: 2/18/12
  ' by: Scott Conrad
  
  ' Cancels procedure if no workbooks are open
  If Workbooks.Count = 0 Then
      MsgBox "No workbooks are open.", , "Change Print Resolution"
      Exit Sub
      End If
  
  Dim wsSheet As Worksheet
  
  ' Change sheets visibility
  For Each wsSheet In Worksheets
      wsSheet.Visible = xlSheetVisible
      Next
  
  End Sub
  ````
  
  ### All Read Only
  
  * `AllReadOnly()`
  ````VBA
  Sub AllReadOnly()
  ' Changes every file to read only without the save dialog
  ' Created on: 3/13/12
  ' By: S Conrad
  
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
  
  ## Entire Print and Page Module
  
  * `ModPrintAndPage.bas`
  ````VBA
  Option Explicit
  
  ' These are used to speed up vba code
  Public DefCalcState As Integer
  Public DefEventState As Integer
  Public DefScrUpdState As Integer
  
  Sub SetPrintDPI()
  ' Allows the user to select from a list of available print qualities and changes
  ' all pages in the current workbook.
  ' Created on: 3/14/12
  ' By: S Conrad
  
  Dim bExitLoop As Boolean
  Dim oldStatusBar As Boolean
  Dim i As Double
  Dim sDefDPI As Double
  Dim dDPI As Double
  Dim vDPI As Variant
  Dim wsWkSheet As Worksheet
  Dim wsAW As Worksheet
  Dim Ans As Double
  Dim sAnsMsg As String
  Dim SampleDPI As String
  Dim sFormQuest As String
  
  ' Cancels procedure if no workbooks are open
  If Workbooks.Count = 0 Then
      MsgBox "No workbooks are open.", , "Change Print Resolution"
      Exit Sub
      End If
      
  ' Stores initial settings
  'InitGlobalFastApp
  Set wsAW = ActiveSheet
  sDefDPI = CStr(wsAW.PageSetup.PrintQuality(1))
  oldStatusBar = Application.DisplayStatusBar
  
  ' Sets print quality to 600 if available
  On Error Resume Next
  ActiveSheet.PageSetup.PrintQuality = 600
  If Err = 0 Then
      Application.DisplayStatusBar = True
      For Each wsWkSheet In Sheets
          Application.StatusBar = wsWkSheet.Name & "'s print quality is being changed to 600 DPi."
          wsWkSheet.PageSetup.PrintQuality = 600
          wsWkSheet.DisplayPageBreaks = False
          Next
      wsAW.Activate
      Application.StatusBar = False
      Application.DisplayStatusBar = oldStatusBar
      Exit Sub
      Else
      sAnsMsg = "This printer does not have a print setting of 600 DPi." & vbCrLf & _
          "Would you like to see a list of available resolutions?"
      Ans = MsgBox(sAnsMsg, vbOKCancel, "Setting Print Resolution")
      If Ans = vbCancel Then Exit Sub
      End If
  
  Application.DisplayStatusBar = True
  Application.StatusBar = "Please wait. A list of available print qualities is being populated"
  
  ' Populate a list of possible print qualities
  SampleDPI = ""
  For i = 100 To 1200 Step 50
      On Error Resume Next
      ActiveSheet.PageSetup.PrintQuality = i
      If Err = 0 Then SampleDPI = SampleDPI & i & vbCrLf
      Next
      
  ActiveSheet.DisplayPageBreaks = False
  ' Returns status bar to original state
  Application.StatusBar = False
  Application.DisplayStatusBar = oldStatusBar
          
  ' Construction of messages to send to the user
  SampleDPI = Left(SampleDPI, Len(SampleDPI) - 2)
          
  sFormQuest = "Please choose a print quality.  The drop down list "
  sFormQuest = sFormQuest & "contains some available print qualities.  "
  sFormQuest = sFormQuest & "Other print qualities are allowed.  Refer "
  sFormQuest = sFormQuest & "to the page setup form of the page layout tab "
  sFormQuest = sFormQuest & "for other available qualities."
  
  ' This loop shows the combo form and waits for the user to enter an acceptable answer
  bExitLoop = False
  Do
      vDPI = ComboForm(SampleDPI, sFormQuest, "Print Quality", sDefDPI, _
      "DPI")
      ' Exits if the user cancels
      If vDPI = vbCancel Or cmbCancel = vbCancel Then
  '        With Application
  '            .Calculation = DefCalcState
  '            .ScreenUpdating = DefScrUpdState
  '            .EnableEvents = DefEventState
  '            End With
          wsAW.Activate
          wsAW.PageSetup.PrintQuality = sDefDPI
          wsAW.DisplayPageBreaks = False
          Unload FmComboBox
          Exit Sub
          End If
      
      ' Only allows integers
      If WorksheetFunction.IsNumber(vDPI) Or vDPI > 1 Then
          dDPI = CDbl(vDPI)
          Else
          MsgBox "Please enter a value greater than one.", vbOKOnly, "Print Settings"
          dDPI = 0
          End If
  
      ' Checks if the DPI is available
      On Error Resume Next
      ActiveSheet.PageSetup.PrintQuality = dDPI
      If Err <> 0 Then
          dDPI = 0
          MsgBox "The selected pring quality is not availabe for this printer.", vbOKOnly, _
              "Print Quality"
          Else
          bExitLoop = True
          End If
          Unload FmComboBox
      Loop Until bExitLoop = True
      
  ' Change each pages print quality and hide page breaks
  Application.DisplayStatusBar = True
  For Each wsWkSheet In Sheets
      Application.StatusBar = wsWkSheet.Name & "'s print quality is being changed to " & dDPI & " DPi."
      wsWkSheet.PageSetup.PrintQuality = dDPI
      wsWkSheet.DisplayPageBreaks = False
      Next
  
  ' Returns status bar to original state
  Application.StatusBar = False
  Application.DisplayStatusBar = oldStatusBar
  
  ' Return application to original state
  wsAW.Activate
  'With Application
  '    .Calculation = DefCalcState
  '    .ScreenUpdating = DefScrUpdState
  '    .EnableEvents = DefEventState
  '    End With
  
  End Sub
  Sub SetPrintBlackandWhite()
  ' Changes print
  ' Revised on: 2/18/12
  ' by: Scott Conrad
  
  Dim oldStatusBar As Boolean
  Dim wsSheet As Worksheet
  
  ' Cancels procedure if no workbooks are open
  If Workbooks.Count = 0 Then
      MsgBox "No workbooks are open.", , "Change Print Resolution"
      Exit Sub
      End If
      
  ' Stores initial settings
  oldStatusBar = Application.DisplayStatusBar
  Application.DisplayStatusBar = True
  'InitGlobalFastApp
  
  ' Change print to black and white and hide page breaks
  For Each wsSheet In Sheets
      Application.StatusBar = wsSheet.Name & " is being set to Black and White"
      wsSheet.PageSetup.BlackAndWhite = True
      wsSheet.DisplayPageBreaks = False
      Next wsSheet
      
  Application.StatusBar = False
  Application.DisplayStatusBar = oldStatusBar
      
  ' Returns to original state
  'With Application
  '    .Calculation = DefCalcState
  '    .ScreenUpdating = DefScrUpdState
  '    .EnableEvents = DefEventState
  '    End With
          
  End Sub
  Sub UnhideAllSheets()
  ' Unhides all sheets. This works with or without index tab.
  ' Revised on: 2/18/12
  ' by: Scott Conrad
  
  ' Cancels procedure if no workbooks are open
  If Workbooks.Count = 0 Then
      MsgBox "No workbooks are open.", , "Change Print Resolution"
      Exit Sub
      End If
  
  Dim wsSheet As Worksheet
  
  ' Change sheets visibility
  For Each wsSheet In Worksheets
      wsSheet.Visible = xlSheetVisible
      Next
  
  End Sub
  Sub AllReadOnly()
  ' Changes every file to read only without the save dialog
  ' Created on: 3/13/12
  ' By: S Conrad
  
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
  
  Sub InitGlobalFastApp()
  ' Used to speed up vba code.
  ' Created on: 3/26/12
  ' By: S Conrad
  
  ' Stores default settings and changes them to speed up code
  With Application
      DefCalcState = .Calculation
      DefEventState = .EnableEvents
      DefScrUpdState = .ScreenUpdating
      .Calculation = xlCalculationManual
      .EnableEvents = False
      .ScreenUpdating = False
      End With
      
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
  list from [[VBA - Page Setup and Print Macros]] AND -"Changelog"
  ````

* # VBA - Module Template
  
  \*Source: *
  
  ````VBA
  
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
  list from [[VBA - Module Template]] AND -"Changelog"
  ````

* # VBA - Make All Open Files Read Only
  
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

* # VBA - ListLinks Module
  
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

* # VBA - Balloon Notification
  
  \*Source: *
  
  ````VBA
  Attribute VB_Name = "mod_BalloonNotification"
  Option Explicit
  
  Declare Function SetForegroundWindow Lib "user32" (ByVal hwnd As Long) As Long
  
  Declare Function Shell_NotifyIcon Lib "shell32.dll" Alias "Shell_NotifyIconA" ( _
      ByVal dwMessage As Long, _
      lpData As NOTIFYICONDATA) As Long
  
  Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" ( _
      ByVal lpPrevWndFunc As Long, _
      ByVal hwnd As Long, _
      ByVal Msg As Long, _
      ByVal wParam As Long, _
      ByVal lParam As Long) As Long
  
  Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" ( _
      ByVal hwnd As Long, _
      ByVal nIndex As Long, _
      ByVal dwNewLong As Long) As Long
  
  Declare Function FindWindow Lib "user32" Alias "FindWindowA" ( _
      ByVal lpClassName As String, _
      ByVal lpWindowName As String) As Long
  
  Declare Function ExtractIcon Lib "shell32.dll" Alias "ExtractIconA" ( _
      ByVal hInst As Long, _
      ByVal lpszExeFileName As String, _
      ByVal nIconIndex As Long) As Long
  
  Public Const WM_LBUTTONDOWN = &H201
  Public Const WM_LBUTTONUP = &H202
  Public Const WM_LBUTTONDBL = &H203
  Public Const WM_RBUTTONDOWN = &H204
  Public Const WM_RBUTTONUP = &H205
  Public Const WM_RBUTTONDBL = &H206
  Public Const WM_ACTIVATEAPP = &H1C
  
  Public Const NIS_HIDDEN = &H1
  Public Const NIS_SHAREDICON = &H2
  Public Const NIF_ICON = &H2
  Public Const NIF_MESSAGE = &H1
  Public Const NIF_TIP = &H4
  Public Const NIF_STATE = &H8
  Public Const NIF_INFO = &H10
  Public Const NIM_ADD = &H0
  Public Const NIM_MODIFY = &H1
  Public Const NIM_DELETE = &H2
  Public Const WM_MOUSEMOVE = &H200
  Public Const MAX_TOOLTIP As Integer = 128
  Public Const GWL_WNDPROC = (-4)
  
  'shell version / NOTIFIYICONDATA struct size constants
  Public Const NOTIFYICONDATA_V1_SIZE As Long = 88  'pre-5.0 structure size
  Public Const NOTIFYICONDATA_V2_SIZE As Long = 488 'pre-6.0 structure size
  Public Const NOTIFYICONDATA_V3_SIZE As Long = 504 '6.0+ structure size
  Public NOTIFYICONDATA_SIZE As Long
  
  
  Type NOTIFYICONDATA
      cbSize As Long
      hwnd As Long
      uID As Long
      uFlags As Long
      uCallbackMessage As Long
      hIcon As Long
      szTip As String * MAX_TOOLTIP
      dwState As Long
      dwStateMask As Long
      szInfo As String * 256
      uTimeout As Long
      szInfoTitle As String * 64
      dwInfoFlags As Long
  End Type
  
  Public nfIconData As NOTIFYICONDATA
  
  ' list the icon types for the balloon message..
  Public Const vbNone = 0
  Public Const vbInformation = 1
  Public Const vbExclamation = 2
  Public Const vbCritical = 3
  
  Private FHandle As Long
  Private WndProc As Long
  Private Hooking As Boolean
  
  Private Sub Hook(Lwnd As Long)
      If Hooking = False Then
          FHandle = Lwnd
          WndProc = SetWindowLong(Lwnd, GWL_WNDPROC, AddressOf WindowProc)
          Hooking = True
      End If
  End Sub
  
  Private Sub Unhook()
      If Hooking = True Then
          SetWindowLong FHandle, GWL_WNDPROC, WndProc
          Hooking = False
      End If
  End Sub
  
  Private Function WindowProc(ByVal hw As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
      If Hooking Then
          If lParam = WM_LBUTTONDBL Then
              UserForm1.Show 1
              WindowProc = True
              '   Unhook
              Exit Function
          End If
          WindowProc = CallWindowProc(WndProc, hw, uMsg, wParam, lParam)
      End If
  End Function
   
  Private Sub RemoveIconFromTray()
      Shell_NotifyIcon NIM_DELETE, nfIconData
  End Sub
  
  Private Sub AddIconToTray(MeHwnd As Long, MeIcon As Long, MeIconHandle As Long, Tip As String)
      With nfIconData
          .hwnd = MeHwnd
          .uID = MeIcon
          .uFlags = NIF_MESSAGE Or NIF_ICON Or NIF_TIP
          .uCallbackMessage = WM_RBUTTONUP
          .dwState = NIS_SHAREDICON
          .hIcon = MeIconHandle
          .szTip = Tip & Chr$(0)
          .cbSize = NOTIFYICONDATA_V3_SIZE
      End With
      Shell_NotifyIcon NIM_ADD, nfIconData
  End Sub
  
  Private Sub BalloonPopUp(ByVal Title As String, ByVal Message As String)
      ' ok, create a balloon popup..
      With nfIconData
          .dwInfoFlags = vbInformation
          .uFlags = NIF_INFO
          .szInfoTitle = Title & vbNullChar
          .szInfo = Message & vbNullChar
      End With
      
      ' ok, write it to the system tray icon
      Shell_NotifyIcon NIM_MODIFY, nfIconData
  End Sub
  
  Private Function FindWindowd(ByVal lpClassName As String, ByVal lpWindowName As String) As Long
      FindWindowd = FindWindow(lpClassName, lpWindowName)
  End Function
  
  Private Function ExtractIcond(ByVal hInst As Long, ByVal lpszExeFileName As String, ByVal nIconIndex As Long) As Long
      ExtractIcond = ExtractIcon(hInst, lpszExeFileName, nIconIndex)
  End Function
  
  
  Public Sub DisplayNotification(ByVal Title As String, ByVal Message As String)
      Dim Me_hWnd As Long
      Dim Me_Icon As Long
      Dim Me_Icon_Handle As Long
      Dim IconPath As String
      
      Me_hWnd = FindWindowd("XLMAIN", ThisWorkbook.Name & " - Excel")
      IconPath = Application.Path & Application.PathSeparator & "excel.exe"
      Me_Icon_Handle = ExtractIcond(0, IconPath, 0)
      
      Call Hook(Me_hWnd)
      Call AddIconToTray(Me_hWnd, 0, Me_Icon_Handle, "Double Click to re-open userform")
      Call BalloonPopUp(Title, Message)
  End Sub
  
  Public Sub RemoveNotificationHooks()
      Call RemoveIconFromTray
      Call Unhook
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
  list from [[VBA - Balloon Notification]] AND -"Changelog"
  ````

* # VBA - Copy Module from one Workbook to Another
  
  *Source: [VBA-General/mod_VBA.bas at main · ViperSRT3g/VBA-General](https://github.com/ViperSRT3g/VBA-General/blob/main/mod_VBA.bas)*
  
  ````VBA
  Option Explicit
  
  Public Sub CopyModule(ByRef SourceWB As Workbook, ByVal strModuleName As String, ByRef TargetWB As Workbook)
  
      ' Description:  copies a module from one workbook to another
      ' example: CopyModule Workbooks(ThisWorkbook), "Module2",
      '          Workbooks("Food Specials Rolling Depot Memo 46 - 01.xlsm")
      ' Notes:   If Module to be copied already exists, it is removed first,
      '          and afterwards copied
  
      Dim strFolder As String, strTempFile As String, FName As String
      If Trim(strModuleName) = vbNullString Then Exit Sub
  
      If TargetWB Is Nothing Then
          MsgBox "Error: Target Workbook " & TargetWB.Name & " doesn't exist (or closed)", vbCritical
          Exit Sub
      End If
  
      strFolder = SourceWB.Path
      If Len(strFolder) = 0 Then strFolder = CurDir
  
      ' create temp file and copy "Module2" into it
      strFolder = strFolder & "\"
      strTempFile = strFolder & "~tmpexport.bas"
  
      On Error Resume Next
      FName = Environ("Temp") & "\" & strModuleName & ".bas"
      If Dir(FName, vbNormal + vbHidden + vbSystem) <> vbNullString Then
          Err.Clear
          Kill FName
          If Err.Number <> 0 Then
              MsgBox "Error copying module " & strModuleName & "  from Workbook " & SourceWB.Name & " to Workbook " & TargetWB.Name, vbInformation
              Exit Sub
          End If
      End If
  
      ' remove "Module2" if already exits in destination workbook
      With TargetWB.VBProject.VBComponents.Remove.Item(strModuleName)
      ' copy "Module2" from temp file to destination workbook
      SourceWB.VBProject.VBComponents(strModuleName).Export strTempFile
      TargetWB.VBProject.VBComponents.Import strTempFile
      Kill strTempFile
      On Error GoTo 0
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
  list from [[VBA - Copy Module from one Workbook to Another]] AND -"Changelog"
  ````

* # VBA - Create and Run a SQL Query
  
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

* # VBA - Check for Broken Links in Workbook
  
  *Source: [Excel: How to find broken links and get them fixed - Ablebits.com](https://www.ablebits.com/office-addins-blog/2021/02/03/excel-find-fix-broken-links/)*
  
  ````VBA
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
  ````
  
  A list of invalid links is output in a new worksheet named *Broken Links report*. Column B has a hyperlink to the cell containing the link.
  
  ![](https://i.imgur.com/k2WaJE6.png)
  
  You can [insert the code](https://www.ablebits.com/office-addins-blog/2013/12/06/add-run-vba-macro-excel/) in your own workbook or [download our sample file](https://www.ablebits.com/office-addins-blog/2021/02/03/excel-find-fix-broken-links/#_Available_downloads:) with the macro as well as the step-by-step instructions on how to use it.
  
  **Note.** This code only finds links to invalid workbooks (non-existent, moved or deleted), but not missing sheets. The reason is that the *LinkInfo* method checks just the file name. An attempt to check a sheet name results in Error 2015.
  
  ---
  
  ## Appendix: Links
  
  * *Code*
  * [Development](../../MOCs/Development.md)
  * [Excel](../Excel/Excel.md)
  * [Microsoft Office](../../../3-Resources/Tools/Microsoft%20Office/Microsoft%20Office.md)
  * [Excel - VBA](../../../3-Resources/Tools/Microsoft%20Office/Excel/Excel%20-%20VBA.md)
  *Backlinks:*
  
  ````dataview
  list from [[VBA - Check for Broken Links in Workbook]] AND -"Changelog"
  ````

* # VBA - Alert
  
  \*Source: *
  
  ````VBA
  Option Explicit
  
  Private Declare Function sndPlaySound32 Lib "winmm.dll" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long
  
  Public Function Alert(ByVal Prompt As String, Optional Buttons As VbMsgBoxStyle, Optional ByVal Title As String, Optional SoundPath As String, Optional SoundFlag As Long = 1) As VbMsgBoxResult
      Call Sound(SoundPath, SoundFlag)
      Alert = MsgBox(Prompt, Buttons, Title)
  End Function
  
  Public Function Sound(ByVal FilePath As String, Optional ByVal Flag As Long = 1) As Boolean
      If Len(FilePath) > 0 Then
          Dim FSO As Object: Set FSO = CreateObject("Scripting.FileSystemObject")
          If FSO.FileExists(FilePath) Then Sound = sndPlaySound32(FilePath, Flag)
          Set FSO = Nothing
      End If
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
  list from [[VBA - Alert]] AND -"Changelog"
  ````

---

## Appendix: Links

*DataView*

````dataview
list from "2-Areas/Code/Windows/Visual Basic" AND !#Type/Readme
````

*Backlinks*

````dataview
list from [[_README]] AND -"Changelog"
````

---
