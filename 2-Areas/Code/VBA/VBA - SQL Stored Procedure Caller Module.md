# VBA - SQL Stored Procedure Caller Module

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
