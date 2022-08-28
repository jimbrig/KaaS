---
Date: 2022-06-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/VBA", "#Topic/Dev"]
Alias: ["VBS - Export Excel Code"]
---

# VBS - Export Excel Code

*Source: https://github.com/cavo789/vba_excel_export_code*

- Visual Basic Script: (`.vbs`): [excel_export_code.vbs] (https://github.com/cavo789/vba_excel_export_code/blob/master/excel_export_code.vbs):

```vb
Option Explicit

Const bVerbose = True

' Location, if installed, of 7-zip. Will make the export of the
' ribbon manifest faster
Const ZipProgram = "C:\Users\jbriggs010\scoop\shims\7z.exe"

Const vbext_ct_StdModule = 1
Const vbext_ct_ClassModule = 2
Const vbext_ct_MSForm = 3
Const vbext_ct_Document = 100

' https://ss64.com/vb/popup.html
Const popup_type_YesNo = 4
Const popup_answer_Yes = 6
Const popup_answer_No = 7

Class clsFiles

	Dim objFSO, objFile

	Private bVerbose

	Public Property Let verbose(bYesNo)
		bVerbose = bYesNo
	End Property

	Private Sub Class_Initialize()
		bVerbose = False
		Set objFSO = CreateObject("Scripting.FileSystemObject")
	End Sub

	Private Sub Class_Terminate()
		Set objFSO = Nothing
	End Sub

	Public Function Exists(ByVal sFileName)
		Exists = objFSO.FileExists(sFileName)
	End Function

	Public Function Delete(ByVal sFileName)
		Delete = objFSO.DeleteFile(sFileName)
	End Function

	Public Function Rename(ByVal sFileName, ByVal sNewName)

		If (Exists(sNewName)) Then
			Delete(sNewName)
		End If

		objFSO.MoveFile sFileName, sNewName

		Rename = Exists(sNewName)

	End Function

	' --------------------------------------------------
	' Return the file extension (f.i. "accdb")
	' --------------------------------------------------
	Public Function GetExtensionName(ByVal sFileName)
		GetExtensionName = objFSO.GetExtensionName(sFileName)
	End Function

	' --------------------------------------------------
	' Return only the file name (f.i. "db1")
	' --------------------------------------------------
	Public Function GetBaseName(ByVal sFileName)
		GetBaseName = objFSO.GetBaseName(sFileName)
	End Function

	' --------------------------------------------------
	' Return the folder where the file is stored (f.i. c:\temp)
	' --------------------------------------------------
	Public Function GetParentFolderName(ByVal sFileName)

		Dim sPath
		Dim objShell

		sPath = ""

		If (Exists(sFileName)) Then

			sPath = objFSO.GetParentFolderName(sFileName)

			' sPath is empty when sFileName was just a filename
			' like f.i. "workbook.xlsx". So, in that case, get the current
			' folder and concatenate
			If (sPath = "") Then
				Set objShell = WScript.CreateObject("WScript.Shell")
				sPath = objShell.CurrentDirectory
				Set objShell = Nothing
			End If

		End If

		GetParentFolderName = sPath

	End Function

End Class

Class clsFolders

	Dim objFSO, objFile

	Private bVerbose

	Public Property Let verbose(bYesNo)
		bVerbose = bYesNo
	End Property

	Private Sub Class_Initialize()
		bVerbose = False
		Set objFSO = CreateObject("Scripting.FileSystemObject")
	End Sub

	Private Sub Class_Terminate()
		Set objFSO = Nothing
	End Sub

	Public Function Exists(sFolderName)
		Exists = objFSO.FolderExists(sFolderName)
	End Function

	' --------------------------------------------------
	' Create a folder recursively
	' --------------------------------------------------
	Public Function Create(ByVal sFolderName)

		Create = false

		If Not exists(sFolderName) Then

			If Create(objFSO.GetParentFolderName(sFolderName)) Then
				Create = True

				If bVerbose Then
					wScript.echo "Create folder " & sFolderName
				End If

				Call objFSO.CreateFolder(sFolderName)
			End If

		Else
			Create = True
		End If

	End Function

End Class

Class clsMSExcel

	Private oApplication
	Private sFileName
	Private bAppHasBeenStarted
	Private cFiles
	Private cFolders

	Public Property Let FileName(ByVal sName)
		sFileName = sName
	End Property

	Public Property Get FileName
		FileName = sFileName
	End Property

	Private Sub Class_Initialize()
		bAppHasBeenStarted = False
		Set oApplication = Nothing

		Set cFiles = new clsFiles
		Set cFolders = new clsFolders
	End Sub

	Private Sub Class_Terminate()
		Set oApplication = Nothing
		Set cFiles = Nothing
		Set cFolders = Nothing
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

			On Error Resume Next

			Set oApplication = GetObject(,"Excel.Application")

			If (Err.number <> 0) or (oApplication Is Nothing) Then
				Set oApplication = CreateObject("Excel.Application")
				' Remember that Excel has been started by
				' this script ==> should be released
				bAppHasBeenStarted = True
			End If

			Err.clear

			On Error Goto 0

		End If

		' Return True if the application was created right
		' now
		Instantiate = bAppHasBeenStarted

	End Function

	Public Sub Quit()

		On Error Resume Next
		oApplication.Quit
		On Error Goto 0

	End Sub

	' --------------------------------------------------
	' Detect if the module, class, form has code (Y/N)
	' --------------------------------------------------
	Private Function hasCodeToExport(ByVal Component)

		Dim sFirstLine

		hasCodeToExport = True

		If Component.codeModule.CountOfLines <= 2 Then
			sFirstLine = Trim(Component.codeModule.lines(1, 1))
			hasCodeToExport = Not (sFirstLine = "" Or sFirstLine = "Option Explicit")
		End If

	End Function

	' --------------------------------------------------
	' Export class, module or form to a text file on disk)
	' --------------------------------------------------
	Private Sub exportComponent(ByVal sExportPath, ByVal Component, ByVal sExtension)

		If bVerbose Then
			wScript.echo "  Export " & Component.name & sExtension
		End If

		Component.Export sExportPath & "\" & Component.name & sExtension

	End Sub

	' --------------------------------------------------
	' Export sheet to a text file on disk)
	' --------------------------------------------------
	Private Sub exportLines(ByVal sExportPath, ByVal Component)

		Dim sFileName
		Dim objFSO, outStream

		Set objFSO = CreateObject("Scripting.FileSystemObject")

		sFileName = sExportPath & "\" & Component.name & ".sheet.cls"

		If bVerbose Then
			wScript.echo "  Export " & Component.name & ".sheet.cls"
		End If

		Set outStream = objFSO.CreateTextFile(sFileName, True, False)

		outStream.Write (Component.codeModule.lines(1, Component.codeModule.CountOfLines))
		outStream.Close

		Set outStream = Nothing
		Set objFSO = Nothing

	End Sub

	' --------------------------------------------------
	' Export the ribbon and icons (if applicable)
	'
	' Use the built-in unzip feature of Windows and export
	' the "customUI" folder. That folder contains the ribbon
	' --------------------------------------------------
	Private Sub exportRibbonXML(ByVal sExportPath)

		Dim oShell, FilesInZip, file
		Dim sFolder, sScript

		' Initialization
		sFolder = sExportPath & "\Ribbon"

		wScript.echo "Prepare exportation of the ribbon"
		wScript.echo "  Export to " & sFolder

		If cFiles.exists(ZipProgram) Then

			' Fatest way - Use 7-Zip

			Set oShell = CreateObject("wScript.Shell")

			sScript = chr(34) & ZipProgram & chr(34) & " x -y " & _
				chr(34) & sFilename & chr(34) & " " & _
				"customUI -o" & chr(34) & sFolder & chr(34)
			wScript.echo "  Use 7-zip (" & sScript & ")"

			oShell.Run sScript

		Else

			' Use the Zip built-in feature of Windows
			Set oShell = CreateObject("Shell.Application")

			' Open the zip and retrieve the ribbon (if there is one)

			' oShell.NameSpace requires a .zip file (the extension is really important)
			' So add ".zip" to our file (so f.i. rename to "workbook.xlsx.zip")
			cFiles.Rename sFileName, sFileName & ".zip"

			' Now, we can get the list of files in the "zip"
			' ------------------------------------------------------------------
			' - THIS LINE IS REALLY REALLY SLOW (CAN TAKE TWO MINUTES OR MORE) -
			' ------------------------------------------------------------------
			Set FilesInZip=oShell.NameSpace(sFileName & ".zip").items

			For each file In FilesInZip

				' When file name is "customUI", we've found the folder (not the file)
				' with the manifest and icons. Export them
				If (file.Name = "customUI") Then

					' Create the target folder
					cFolders.Create(sFolder)

					' And export the ribbon (i.e. the folder called "customUI")
					' 100 = Display a progression bar
					'  10 = Overwrite if the same file is already found in sFolder
					oShell.NameSpace(sFolder).CopyHere(file), &H110

					' Ok, we can stop, we got the ribbon
					Exit For

				End if
			Next

			' Reset the original name
			cFiles.Rename sFileName & ".zip", sFileName

			Set FilesInZip = Nothing

		End if

		Set oShell = Nothing

	End Sub

	' --------------------------------------------------
	' Export the code of a workbook (can be an addin)
	' --------------------------------------------------
	Public Sub ExportVBACode()

		Dim objFSO, objShell
		Dim wb, project
		Dim bUpdateLinks, bReadOnly
		Dim sProjectFileName, sExportPath, sTemp, sFolder
		Dim vbComponent
		Dim bContinue

		Set objFSO = CreateObject("Scripting.FileSystemObject")

		If Not (objFSO.FileExists(sFileName)) Then
		 	wScript.echo "Error, the file " & sFileName & " is not found"
			Exit sub
		End If

		bUpdateLinks = False
		bReadOnly = True

		' Get the parent folder i.e. the folder where the Excel file is stored
		sFolder = cFiles.GetParentFolderName(sFileName)

		' Get the export path
		' When sFileName is f.i. c:\temp\workbook.xlsm, the export path will be
		'  		c:\temp\src\workbook.xlsm\xxxxx
		' i.e. a subfolder src will be created with a folder for the file and, in that folder
		' every objects (forms, modules, ...) and also the ribbon

		sExportPath = sFolder & "\src\" & cFiles.GetBaseName(sFileName) & "." & _
			cFiles.GetExtensionName(sFileName)

		' Make the filename absolute; add the parent folder if needed
		If (sFileName = cFiles.GetBaseName(sFileName) & "." & cFiles.GetExtensionName(sFileName)) Then
			sFileName = cFiles.GetParentFolderName(sFileName) + "\" + sFileName
		End If

		' Open Excel
		oApplication.DisplayAlerts = False
		oApplication.EnableEvents = False
		oApplication.ScreenUpdating = False

		Set wb = oApplication.Workbooks.Open(sFileName, bUpdateLinks, bReadOnly)

		Set objShell = WScript.CreateObject("WScript.Shell")

		If Not (wb is Nothing) Then

			For Each project In oApplication.VBE.VBProjects

				' In the Excel solution, we can have VBA code for the
				' itself and addins. If the VBProjects has the same name
				' that the file ==> the exportation can be done immediatetly
				' Otherwise the user will be prompted before exporting addins
				bContinue = (project.name = cFiles.GetBaseName(sFileName))

				If (project.Protection = 0) Then

					If Not (bContinue) Then
						bContinue = (objShell.Popup ("Export " & project.name & "?",,, popup_type_YesNo) = popup_answer_Yes)
					End  If

					If bContinue Then

						sTemp = "= Exporting code of " & project.name & " ="

						wScript.echo Replace(Space(Len(sTemp)), " ", "=") & vbCrLF & _
							sTemp & vbCrLf & Replace(Space(Len(sTemp)), " ", "=") & vbCrLf

						sProjectFileName = project.fileName

						If bVerbose Then
							wScript.echo "Process " & sProjectFileName
						End If

						If (sProjectFileName <> "") Then
							' Extra security : be sure the project has a name,
							' should always be the case

							wScript.echo "Export to " & sExportPath
							Call cFolders.Create(sExportPath)

							wScript.echo ""

							For Each vbComponent In project.VBComponents

								If hasCodeToExport(vbComponent) Then

									Select Case vbComponent.Type
										Case vbext_ct_ClassModule
											exportComponent sExportPath, vbComponent, ".cls"
										Case vbext_ct_StdModule
											exportComponent sExportPath, vbComponent, ".bas"
										Case vbext_ct_MSForm
											exportComponent sExportPath, vbComponent, ".frm"
									Case vbext_ct_Document
											exportLines sExportPath, vbComponent
									Case Else
										wScript.echo "Unkown vbComponent type " & vbComponent.Name
									End Select

								End If
							Next

						End If

					End If

				Else

					wScript.echo "ERROR - " & project.name & " is protected with a password, "
					wScript.echo "If you want to export code, please first start Excel, open the file, "
					wScript.echo "go to the VB editor and type your password so the code become accessible."
					wScript.echo "Without exiting Excel, start this script again."

				End if

				wScript.echo ""

			Next

		End if

		Set objShell = Nothing

		On error Resume Next

		' Fake, let Excel think the file wasn't modified
		wb.Saved = True

		' Don't save changes
		wb.Close False

		Set wb = Nothing

		On error GoTo 0

		' Restore settings
		oApplication.DisplayAlerts = True
		oApplication.EnableEvents = True
		oApplication.ScreenUpdating = True

		' And now, export the ribbon
		' Note: this is a really slow process; strange...
		Call exportRibbonXML(sExportPath)

	End Sub

End Class

Sub ShowHelp()

	wScript.echo " ============================"
	wScript.echo " = Excel Export Code script ="
	wScript.echo " ============================"
	wScript.echo ""
	wScript.echo " You need to tell which file should be processed "
	wScript.echo ""
	wScript.echo " For instance :"
	wScript.echo ""
	wScript.echo "  " & Wscript.ScriptName & " myfile.xlam"
	wScript.echo ""
	wScript.echo "	or "
	wScript.echo ""
	wScript.echo "  " & Wscript.ScriptName & " myfile.xlsm"
	wScript.echo ""
	wScript.quit

End sub

' -----------------------------------------------------
' -------------------- ENTRY POINT --------------------
' -----------------------------------------------------

Dim cMSExcel
Dim sFileName

	' Get the first argument
	If (wScript.Arguments.Count = 0) Then

		Call ShowHelp

	Else
		' Get the file name
		sFileName = Trim(Wscript.Arguments.Item(0))

		Set cMSExcel = New clsMSExcel

		Call cMSExcel.Instantiate

		cMSExcel.FileName = sFileName

		Call cMSExcel.ExportVBACode()

		' Job done, we can quit Excel
		Call cMSExcel.Quit()

		Set cMSExcel = Nothing

	End if
```

Then, use the helper [[2-Areas/Code/Windows CMD/_README|CMD]] script to call this Visual Basic script with a single parameter/argument for the excel file to export from:

```cmd
cscript excel_export_code.vbs demo.xlsm //nologo
pause
```

***

## Appendix: Links

*See Also:* [[VBS - Import Excel Code]] | [[Excel - VBA]]

- [[2-Areas/Code/_README|Code]]
- [[Development]]
- [[Excel]]
- [[Microsoft Office]]
- [[Excel - VBA]]

*Backlinks:*

```dataview
list from [[VBS - Export Excel Code]] AND -"Changelog"
```