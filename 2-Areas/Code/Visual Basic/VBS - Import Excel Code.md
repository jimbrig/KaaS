# VBS - Import Excel Code

*Source: https://github.com/cavo789/vbs_xls_import_code*

````vb
Option Explicit

Private Const cDebugMode = True

Class clsMSExcel

    Private oApplication
    Private sFileName
    Private bVerbose, bEnableEvents, bDisplayAlerts, bScreenUpdating

    Private bAppHasBeenStarted

    Public Property Let verbose(bYesNo)
        bVerbose = bYesNo
    End Property

    Public Property Let EnableEvents(bYesNo)
        bEnableEvents = bYesNo

        If Not (oApplication Is Nothing) Then
            oApplication.EnableEvents = bYesNo
        End If
    End Property

    Public Property Let DisplayAlerts(bYesNo)
        bDisplayAlerts = bYesNo

        If Not (oApplication Is Nothing) Then
            oApplication.DisplayAlerts = bYesNo
        End If

    End Property

    Public Property Let ScreenUpdating(bYesNo)
        bScreenUpdating = bYesNo

        If Not (oApplication Is Nothing) Then
            oApplication.ScreenUpdating = bYesNo
        End If

    End Property

    Public Property Let FileName(ByVal sName)
        sFileName = sName
    End Property

    Public Property Get FileName
        FileName = sFileName
    End Property

    ' Make oApplication accessible
    Public Property Get app
        Set app = oApplication
    End Property

    Private Sub Class_Initialize()
        bVerbose = False
        bAppHasBeenStarted = False
        bEnableEvents = False
        bDisplayAlerts = False
        bScreenUpdating = True
        Set oApplication = Nothing
    End Sub

    Private Sub Class_Terminate()
        Set oApplication = Nothing
    End Sub

    ' --------------------------------------------------------
    ' Initialize the oApplication object variable : get a pointer
    ' to the current Excel.exe app if already in memory or start
    ' a new instance.
    '
    ' If a new instance has been started, initialize the variable
    ' bAppHasBeenStarted to True so the rest of the script knows
    ' that Excel should then be closed by the script.
    ' --------------------------------------------------------
    Public Function Instantiate()

        If (oApplication Is Nothing) Then

            On error Resume Next

            Set oApplication = GetObject(,"Excel.Application")

            If (Err.number <> 0) or (oApplication Is Nothing) Then
                Set oApplication = CreateObject("Excel.Application")
                ' Remember that Excel has been started by
                ' this script ==> should be released
                bAppHasBeenStarted = True
            End If

            oApplication.EnableEvents = bEnableEvents
            oApplication.DisplayAlerts = bDisplayAlerts
            oApplication.ScreenUpdating = bScreenUpdating

            Err.clear

            On error Goto 0

        End If

        ' Return True if the application was created right
        ' now
        Instantiate = bAppHasBeenStarted

    End Function

    ' --------------------------------------------------------
    ' Be sure Excel is visible
    ' --------------------------------------------------------
    Public Sub MakeVisible

        Dim objShell

        If Not (oApplication Is Nothing) Then

            With oApplication

                .Application.Visible = True
                .Application.DisplayFullScreen = False

                .WindowState = -4137 ' xlMaximized

            End With

            Set objShell = CreateObject("wScript.Shell")
            objShell.appActivate oApplication.Caption
            Set objShell = Nothing

        End If

    End Sub

    ' --------------------------------------------------------
    ' Quit Excel
    ' --------------------------------------------------------
    Public Sub Quit()
        If not (oApplication Is Nothing) Then
            oApplication.Quit
        End If
    End Sub

    ' --------------------------------------------------------
    ' Open a standard Excel file and allow to specify if the
    ' file should be opened in a read-only mode or not
    ' --------------------------------------------------------
    Public Sub Open(bReadOnly)

        If Not (oApplication Is Nothing) Then

            If bVerbose Then
                wScript.echo "Open " & sFileName & _
                    " (clsMSExcel::Open)"
            End If

            ' False = UpdateLinks
            oApplication.Workbooks.Open sFileName, False, _
                bReadOnly

        End If

    End sub

    ' --------------------------------------------------------
    ' Close the active workbook
    ' --------------------------------------------------------
    Public Sub CloseFile(sFileName)

        Dim wb
        Dim I
        Dim objFSO
        Dim sBaseName

        If Not (oApplication Is Nothing) Then

            Set objFSO = CreateObject("Scripting.FileSystemObject")

            If (sFileName = "") Then
                If Not (oApplication.ActiveWorkbook Is Nothing) Then
                    sFileName = oApplication.ActiveWorkbook.FullName
                End If
            End If

            If (sFileName <> "") Then

                If bVerbose Then
                    wScript.echo "Close " & sFileName & _
                        " (clsMSExcel::CloseFile)"
                End If

                ' Only the basename and not the full path
                sBaseName = objFSO.GetFileName(sFileName)

                On Error Resume Next
                Set wb = oApplication.Workbooks(sBaseName)
                If Not (err.number = 0) Then
                    ' Not found, workbook not loaded
                    Set wb = Nothing
                Else
                    If bVerbose Then
                        wScript.echo "    Closing " & sBaseName & _
                            " (clsMSExcel::CloseFile)"
                    End If
                    ' Close without saving
                    wb.Close False
                End If

                On Error Goto 0

            End If

            Set objFSO = Nothing

        End If

    End Sub

    ' --------------------------------------------------------
    ' Save the active workbook on disk
    ' --------------------------------------------------------
    Public Sub SaveFile()

        Dim wb, objFSO

        ' If Excel isn't loaded or has no active workbook, there
        ' is thus nothing to save.
        If Not (oApplication Is Nothing) Then

            Set objFSO = CreateObject("Scripting.FileSystemObject")
            Set wb = oApplication.Workbooks(objFSO.GetFileName(sFileName))

            If Not (wb is Nothing) Then

                If (bVerbose) Then
                    wScript.echo "Save file " & sFileName & _
                        " (clsMSExcel::SaveFile)"
                End If

                If (wb.FullName = sFileName) Then
                    wb.Save
                Else
                    ' Don't specify extension because if we've opened
                    ' a .xlsm file and save the file elsewhere, we need
                    ' to keep the same extension
                    wb.SaveAs sFileName
                End If
            End If

            Set wb = Nothing
            Set objFSO = Nothing

        End If

    End Sub

    ' --------------------------------------------------------
    ' Check if a specific file is already opened in Excel
    ' This function will return True if the file is already loaded.
    ' Documentation : https://github.com/cavo789/vbs_scripts/blob/master/src/classes/MSExcel.md#isloaded
    ' --------------------------------------------------------
    Public Function IsLoaded()

        Dim bLoaded, bShouldClose
        Dim bCheckAddins2
        Dim I, J

        bLoaded = false

        If (oApplication Is Nothing) Then
            bShouldClose = Instantiate()
        End If

        On Error Resume Next

        If bVerbose Then
            wScript.echo "Check if " & sFileName & _
                " is already loaded (clsMSExcel::IsLoaded)"
        End If

        If (Right(sFileName, 5) = ".xlam") Then

            ' The AddIns2 collection only exists since MSOffice
            ' 2014 (version 14)
            On Error Resume Next
            J = oApplication.AddIns2.Count
            bCheckAddins2 = (Err.Number = 0)
            On Error Goto 0

            If (bCheckAddins2) then

                J = oApplication.AddIns2.Count

                If J > 0 Then
                    For I = 1 To J
                        If (StrComp(oApplication.AddIns2(I).FullName,sFileName,1)=0) Then
                            bLoaded = True
                            Exit For
                        End If
                    Next ' For I = 1 To J
                End If

            End If ' If (oApplication.version >=14) then

        Else ' If (Right(sFileName, 5) = ".xlam") Then

            ' It's a .xls, .xlsm, ... file, not an AddIn
            J = oApplication.Workbooks.Count

            If J > 0 Then
                For I = 1 To J
                    If (StrComp(oApplication.Workbooks(I).FullName,sFileName,1)=0) Then
                        bLoaded = True
                        Exit For
                    End If
                Next ' For I = 1 To J
            End If ' If J > 0 Then

        End If ' If (Right(sFileName, 5) = ".xlam") Then

        On Error Goto 0

        ' Quit Excel if it was started here, in this script
        If bShouldClose then
            oApplication.Quit
            Set oApplication = Nothing
        End If

        If bVerbose Then
            wScript.echo "  " & bLoaded & " (clsMSExcel::IsLoaded)"
        End If

        IsLoaded = bLoaded

    End Function

End Class

' -------------------
' --- ENTRY POINT ---
' -------------------

Dim cExcel
Dim oApplication
Dim objFSO, objFolder, objFiles, objFile
Dim sFoldername, sFileName

' --------------------------------------------------------
'
' Variables initialization
'
' --------------------------------------------------------
Private Sub initialization()

    Set cExcel = Nothing
    Set objFSO = CreateObject("Scripting.FileSystemObject")

End Sub

' --------------------------------------------------------
'
' Finalization
'
' --------------------------------------------------------
Private Sub finalize()

    ' Restore properties
    cExcel.EnableEvents = True
    cExcel.ScreenUpdating = True
    cExcel.DisplayAlerts = True

    ' And release our Excel object
    Set cExcel = Nothing
    Set objFSO = Nothing

End Sub

' --------------------------------------------------------
'
' Instanciate Excel, create the cExcel object and make
' Excel visible
'
' --------------------------------------------------------
Private Sub instantiateExcel()

    If (cExcel Is Nothing) Then

        On Error Resume Next

        ' Due to Excel's security, Excel should be started manually ("by a human")
        ' to allow to access to VBE features like importing a VBA module through VBS.
        ' GetObject() will allow us to detect if Excel is already running.
        Set oApplication = GetObject(,"Excel.Application")

        If (oApplication Is Nothing) Then

            ' Not yet running, show an error message and quit
            Set oApplication = Nothing
            Call dieExcelNotOpened()

        End If

        On Error Goto 0

        ' Yes, Excel is already running, we can continue

        Set oApplication = Nothing

        ' Instantiate our object and run initialization code
        Set cExcel = New clsMSExcel

        cExcel.verbose = cDebugMode

        cExcel.Instantiate

        cExcel.EnableEvents = False
        cExcel.DisplayAlerts = False
        cExcel.ScreenUpdating = True

        cExcel.MakeVisible

    End If

End sub

' --------------------------------------------------------
'
' Process a file
'
' The wFile parameter is the position of the file being
' processed in the arrInputFiles array.
'
' --------------------------------------------------------
Private Sub processFile(sFileName, sSourcePath)

    Dim oMacro, oVBComp
    Dim wb
    Dim sBaseName

    ' Process the file
    If Not (sFileName = "") Then

        wScript.Echo "Process " & sFileName

        cExcel.FileName = sFileName

        ' Open the file
        cExcel.Open(False)

        ' sFileName is the full name (with paths included)
        ' Retrieve only the file name without path
        sBaseName = objFSO.GetFileName(sFileName)

        ' Be sure that the opened workbook is the active one
        cExcel.app.Workbooks(sBaseName).Activate

    Else

        ' No file to open ? Ok, create a new workbook
        Set wb = cExcel.app.Workbooks.Add
        sFileName = wb.FullName
        wb.Activate

    End If

    wScript.echo " Import files from " & sSourcePath
    wScript.echo " into " & sFileName
    wScript.echo ""

    With cExcel.app

        Set oVBComp = .VBE.ActiveVBProject.VBComponents

        Set objFolder = objFSO.GetFolder(sSourcePath)
        Set objFiles = objFolder.Files

        For Each objFile in objFiles
            If (objFSO.GetExtensionName(objFile.Name) = "cls") Or _
                (objFSO.GetExtensionName(objFile.Name) = "frm") Or _
                (objFSO.GetExtensionName(objFile.Name) = "bas") Then

                sBaseName = objFSO.GetBaseName(objFile.Name)

                wScript.echo " Import " & sBaseName

                ' remove previous version if any
                On error Resume Next
                oVBComp.Remove .VBE.ActiveVBProject.VBComponents(sBaseName)
                On error Goto 0

                Set oMacro = oVBComp.Import(objFile.path)

            End If
        Next

        wScript.echo ""
        wScript.echo " All Forms, Modules, and Classes imported"
        wScript.echo ""

        '.ActiveWorkbook.Save 

        ' Fake
        .ActiveWorkbook.Saved = true 

    End with

    ' cExcel.CloseFile(cExcel.app.ActiveWorkbook.Name)

End Sub

Sub ShowHelp()

    wScript.echo " ============================"
    wScript.echo " = Excel Import Code script ="
    wScript.echo " ============================"
    wScript.echo ""
    wScript.echo " You need to tell where source file can be retrieved. Absolute or relative path."
    wScript.echo ""
    wScript.echo " This script will open Excel, create a new workbook and import all sources in that new file."
    wScript.echo ""
    wScript.echo "     " & wScript.ScriptName & " src\"
    wScript.echo ""
    wScript.echo " If you don't want to create a new workbook but use an existing one, "
    wScript.echo " just specify his name as the second parameter."
    wScript.echo ""
    wScript.echo "      " & wScript.ScriptName & " src\ application.xlsm"
    wScript.echo ""
    wScript.quit

End sub

' --------------------------------------------------------
'
' ENTRY POINT
'
' --------------------------------------------------------

    ' Get the first argument
    If (wScript.Arguments.Count = 0) Then

        Call ShowHelp

    Else

        Call initialization() 

        ' Folder where sources are located
        sFoldername = Trim(Wscript.Arguments.Item(0))        
        sFoldername = objFso.GetAbsolutePathName(sFoldername)

        If Not (objFSO.FolderExists(sFoldername)) Then

            wScript.echo "Error, the folder " & sFoldername & " didn't exists."
            wScript.echo "Please make sure to mention an existing folder."
            wScript.Quit

        End If

        sFileName = ""

        If (wScript.Arguments.Count = 2) Then 

            sFileName = Trim(Wscript.Arguments.Item(1))
            sFileName = objFso.GetAbsolutePathName(sFileName)

            If Not (objFSO.FileExists(sFileName)) Then
                wScript.echo "Error, the file " & sFileName & " didn't exists."
                wScript.echo "Please make sure to mention an existing file."
                wScript.Quit
            End If
        End if

        ' Instantiate Excel
        Call instantiateExcel()

        'Call processFile("C:\temp\vbs_xls_import\demo.xlsm", "C:\temp\vbs_xls_import\src\")
        Call processFile(sFileName, sFolderName)

        call finalize()
        
    End if
````

Then, use the helper *CMD* script to call this Visual Basic script with a single parameter/argument for the excel file to export from:

````cmd
cscript excel_import_code.vbs demo.xlsm //nologo
pause
````

---

## Appendix: Links

*See Also: [VBS - Export Excel Code](VBS%20-%20Export%20Excel%20Code.md)*

* *Code*
* [Development](../../MOCs/Development.md)
* [Excel](../Excel/Excel.md)
* [Microsoft Office](../../../3-Resources/Tools/Microsoft%20Office/Microsoft%20Office.md)
* [Excel - VBA](../../../3-Resources/Tools/Microsoft%20Office/Excel/Excel%20-%20VBA.md)

*Backlinks:*

````dataview
list from [[VBS - Excel Import Code]] AND -"Changelog"
````
