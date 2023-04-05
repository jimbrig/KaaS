# VBA - Save All

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
