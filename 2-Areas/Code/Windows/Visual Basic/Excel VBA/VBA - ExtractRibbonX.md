---
Date: 2022-06-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/VBA", "#Topic/Dev"]
Alias: ["VBA - ExtractRibbonX"]
---

# VBA - ExtractRibbonX

*Source: *

```vb
Option Explicit

Public Sub ExtractRibbonX(sFullFile As String, sSaveFile As String)
'-------------------------------------------------------------------------
' Procedure : ExtractRibbonX
' Author    : Jimmy Briggs <jimmy.briggs@jimbbrig.com>
' Created   : 06-05-2019
' Purpose   : Demonstrates getting something from an OpemXML file
'-------------------------------------------------------------------------
    Dim cEditOpenXML As clsEditOpenXML
    Dim sXML As String
    Dim oXMLDoc As MSXML2.DOMDocument

    Set cEditOpenXML = New clsEditOpenXML

    With cEditOpenXML
        .CreateBackup = False
        'Tell it which OpenXML file to process
        .SourceFile = sFullFile
        'Before you can access info in the file, it must be unzipped
        .UnzipFile

        'Get XML from the ribbonX file (Office 2007 compatible)
        sXML = .GetXMLFromFile("customUI.xml", XMLFolder_customUI)
        If Len(sXML) > 0 Then
            'Change the xml of the sheet here
            Set oXMLDoc = New DOMDocument
            oXMLDoc.loadXML sXML
            oXMLDoc.Save sSaveFile
        End If
        'RibbonX for Office 2010 and up
        sXML = .GetXMLFromFile("customUI14.xml", XMLFolder_customUI)
        If Len(sXML) > 0 Then
            'Change the xml of the sheet here
            Set oXMLDoc = New DOMDocument
            oXMLDoc.loadXML sXML
            oXMLDoc.Save Replace(sSaveFile, ".xml", "14.xml")
        End If
    End With

    'Only when you let the class go out of scope the zip file's .zip extension is removed
    'in the terminate event of the class.
    'Then the OpenXML file has its original filename back.
    Set cEditOpenXML = Nothing
End Sub
```

## Dependent Class Model: `clsEditOpenXML`

```vb
Option Explicit

Private mbCreateBackup As Boolean
Private mvSourceFile As Variant
Private msSheet2Change As String
Private msSheetId As String
Private msSheetFileName As String
Private mbAddedZip As Boolean
Private mvXMLFolderRoot As Variant
Private mvxmlfolder As Variant
'Private mvXMLFolderCustomUI As Variant

Public Enum XMLFolder
    XMLFolder_root = 1
    XMLFolder_rels = 2
    XMLFolder_xl = 3
    XMLFolder_customUI = 4
    XMLFolder_docProps = 5
End Enum

'-------------------------------------------------------------------------
' Procedure : GetXMLFromFile
' Author    : Jimmy Briggs <jimmy.briggs@jimbbrig.com>
' Created   : 6-5-2019
' Purpose   : Gets the XML code from the foldername\filename
'-------------------------------------------------------------------------
Public Function GetXMLFromFile(sFileName As String, sXMLFolder As XMLFolder) As String
    
    Dim oXMLDoc As MSXML2.DOMDocument
    If Len(XMLFolder(sXMLFolder)) = 0 Then
        GetXMLFromFile = ""
    Else
        Set oXMLDoc = New MSXML2.DOMDocument
        oXMLDoc.Load XMLFolder(sXMLFolder) & sFileName
        GetXMLFromFile = oXMLDoc.XML
        Set oXMLDoc = Nothing
    End If

End Function

'-------------------------------------------------------------------------
' Procedure : WriteXML2File
' Author    : Jimmy Briggs <jimmy.briggs@jimbbrig.com>
' Created   : 6-5-2019
' Purpose   : Writes sXML to sFileName
'             Adjusted to add ability to write to customUI container
'-------------------------------------------------------------------------
Public Sub WriteXML2File(sXML As String, sFileName As String, sXMLFolder As XMLFolder)

	Dim oXMLDoc As MSXML2.DOMDocument
    Set oXMLDoc = New MSXML2.DOMDocument

    'If attempting to write a customUI component, test to see if one exists
    
    'Should probably test the .rels file to see if the CustomUI relationship exists...
    If sXMLFolder = XMLFolder_customUI Then
        If Not FolderExists(XMLFolder(XMLFolder_customUI)) Then

            MkDir XMLFolder(XMLFolder_customUI)
            'Write the XML to the file
            oXMLDoc.loadXML sXML
            oXMLDoc.Save XMLFolder(sXMLFolder) & sFileName
            'CustomUI has not been created yet.  Rels file needs to be adjusted
            AddCustomUIToRels
        End If
    End If

    'Write the XML to the file
    oXMLDoc.loadXML sXML
    oXMLDoc.Save XMLFolder(sXMLFolder) & sFileName
End Sub

' Purpose: Add the customUI relationship to the rels file
Public Sub AddCustomUIToRels()

    Dim oXMLDoc As MSXML2.DOMDocument
'    Dim oXMLElement As MSXML2.IXMLDOMElement
    Dim oXMLElement As MSXML2.IXMLDOMNode
    Dim oXMLAttrib As MSXML2.IXMLDOMAttribute
    Dim oNamedNodeMap As MSXML2.IXMLDOMNamedNodeMap
    Dim oXMLRelsList As MSXML2.IXMLDOMNodeList
    'Create a new XML document
    Set oXMLDoc = New MSXML2.DOMDocument
    'Attach to the root element of the .rels file
    oXMLDoc.Load XMLFolder(XMLFolder_rels) & ".rels"

    'Create a new relationship element in the .rels file
    Set oXMLElement = oXMLDoc.createNode(1, "Relationship", "http://schemas.openxmlformats.org/package/2006/relationships")
    Set oNamedNodeMap = oXMLElement.Attributes
    
    'Create ID attribute for the element
    Set oXMLAttrib = oXMLDoc.createAttribute("Id")
    oXMLAttrib.nodeValue = "cuID"
    oNamedNodeMap.setNamedItem oXMLAttrib

    'Create Type attribute for the element
'    Set oXMLAttrib = oXMLDoc.createAttribute("Type")
'    oXMLAttrib.nodeValue = "http://shemas.microsoft.com/office/2006/relationships/ui/extensibility"
    Set oXMLAttrib = oXMLDoc.createAttribute("Type")
    oXMLAttrib.nodeValue = "http://schemas.microsoft.com/office/2006/relationships/ui/extensibility"
    oNamedNodeMap.setNamedItem oXMLAttrib

    'Create Target element for the attribute
'    Set oXMLAttrib = oXMLDoc.createAttribute("Target")
'    oXMLAttrib.nodeValue = "customUI/customUI.xml"
'    oXMLElement.setAttributeNode oXMLAttrib
    Set oXMLAttrib = oXMLDoc.createAttribute("Target")
    oXMLAttrib.nodeValue = "customUI/customUI.xml"
    oNamedNodeMap.setNamedItem oXMLAttrib
    
    'Now insert the new node at the proper location
    Set oXMLRelsList = oXMLDoc.selectNodes("/Relationships")
    oXMLRelsList.Item(0).appendChild oXMLElement
    'Save the .rels file
    oXMLDoc.Save XMLFolder(XMLFolder_rels) & ".rels"

    Set oXMLAttrib = Nothing
    Set oXMLElement = Nothing
    Set oXMLDoc = Nothing
End Sub



'-------------------------------------------------------------------------
' Procedure : GetSheetIdFromSheetName
' Author    : Jimmy Briggs <jimmy.briggs@jimbbrig.com>
' Created   : 6-5-2019
' Purpose   : Finds out what the SheetId of sSheetname is
'             by reading Workbook.xml
'-------------------------------------------------------------------------
Private Function GetSheetIdFromSheetName(sSheetName) As String

    Dim oXMLDoc As MSXML2.DOMDocument
    Dim oxmlNode As MSXML2.IXMLDOMNode
    Dim oXMLChildNode As MSXML2.IXMLDOMNode
    Dim oXMLTemp As MSXML2.IXMLDOMNode
    If XMLFolder(XMLFolder_xl) <> "" And Sheet2Change <> "" Then
        Set oXMLDoc = New MSXML2.DOMDocument
        oXMLDoc.Load XMLFolder(XMLFolder_xl) & "workbook.xml"
        For Each oxmlNode In oXMLDoc.ChildNodes
            For Each oXMLChildNode In oxmlNode.ChildNodes
                If oXMLChildNode.baseName = "sheets" Then
                    For Each oXMLTemp In oXMLChildNode.ChildNodes
                        If oXMLTemp.Attributes.getNamedItem("name").nodeValue = sSheetName Then
                            GetSheetIdFromSheetName = oXMLTemp.Attributes.getNamedItem("r:id").nodeValue
                            Exit Function
                        End If
                    Next
                End If
            Next
        Next
    End If
End Function


'-------------------------------------------------------------------------
' Procedure : GetSheetFileNameFromId
' Author    : Jimmy Briggs <jimmy.briggs@jimbbrig.com>
' Created   : 6-5-2019
' Purpose   : Fetches the name of the xml file belonging to the sheet with id SheetId.
'-------------------------------------------------------------------------
Public Function GetSheetFileNameFromId(sSheetId As String) As String

    Dim oXMLDoc As MSXML2.DOMDocument
    Dim oxmlNode As MSXML2.IXMLDOMNode
    Dim oXMLChildNode As MSXML2.IXMLDOMNode
    If XMLFolder(XMLFolder_xl) <> "" And Sheet2Change <> "" Then
        Set oXMLDoc = New MSXML2.DOMDocument
        oXMLDoc.Load XMLFolder(XMLFolder_xl) & "_rels\workbook.xml.rels"
        For Each oxmlNode In oXMLDoc.ChildNodes
            For Each oXMLChildNode In oxmlNode.ChildNodes
                If oXMLChildNode.Attributes.getNamedItem("Id").nodeValue = sSheetId Then
                    GetSheetFileNameFromId = oXMLChildNode.Attributes.getNamedItem("Target").nodeValue
                    Exit Function
                End If
            Next
        Next
    End If
End Function

'-------------------------------------------------------------------------
' Procedure : GetSheetNameFromId
' Author    : Jimmy Briggs <jimmy.briggs@jimbbrig.com>
' Created   : 6-5-2019
' Purpose   : Returns the sheetname belonging to a sheetId
'-------------------------------------------------------------------------
Private Function GetSheetNameFromId(sId As String) As String

    Dim oXMLDoc As MSXML2.DOMDocument
    Dim oxmlNode As MSXML2.IXMLDOMNode
    Dim oXMLChildNode As MSXML2.IXMLDOMNode
    Dim oXMLChildChildNode As MSXML2.IXMLDOMNode
    If mvxmlfolder(XMLFolder_xl) <> "" Then
        Set oXMLDoc = New MSXML2.DOMDocument
        oXMLDoc.Load XMLFolder(XMLFolder_xl) & "workbook.xml"
        For Each oxmlNode In oXMLDoc.ChildNodes
            For Each oXMLChildNode In oxmlNode.ChildNodes
                If oXMLChildNode.nodeName = "sheets" Then
                    For Each oXMLChildChildNode In oXMLChildNode.ChildNodes
                        If oXMLChildChildNode.Attributes.getNamedItem("r:id").nodeValue = "rId" & Val(sId) + 1 Then
                            GetSheetNameFromId = oXMLChildChildNode.Attributes.getNamedItem("name").nodeValue
                            'Got it, get out
                            Exit Function
                        End If
                    Next
                    'get out here, no point in doing the rest
                    Exit Function
                End If
            Next
        Next
    End If
End Function

Public Sub ZipAllFilesInFolder()

    Dim oShellApp As Object
    Dim sDate As String
    Dim sDefPath As String
    Dim vFileNameZip As Variant
    Dim FSO As Object
    Dim lFileCt As Long
    Set FSO = CreateObject("scripting.filesystemobject")

    'To ensure a unique filename,
    'append date and time to the name of the current file

    sDate = Format(Now, " dd-mmm-yy h-mm-ss")
    vFileNameZip = SourceFile & sDate & ".zip"

    'Create empty Zip File
    NewZip vFileNameZip

    Set oShellApp = CreateObject("Shell.Application")

    'Count how many items are in the "old" folder
    lFileCt = oShellApp.Namespace(FolderName & "Unzipped " & FileName & Application.PathSeparator).items.Count

    'Copy the files to the compressed folder
    oShellApp.Namespace(vFileNameZip).CopyHere oShellApp.Namespace(FolderName & "Unzipped " & FileName & Application.PathSeparator).items

    'Keep script waiting until we have same # of files in the new folder
    On Error Resume Next
    Do Until oShellApp.Namespace(vFileNameZip).items.Count = lFileCt
        Application.Wait (Now + TimeValue("0:00:01"))
    Loop
    DoEvents

    'Remove original file
    Kill SourceFile

    'Rename new zipped file to same name as original file (with .zip appended)
    Name vFileNameZip As SourceFile
    On Error Resume Next

    'Now remove old folder, just in case something went haywire
    FSO.DeleteFolder FolderName & "Unzipped " & FileName, True
    On Error GoTo 0

    Set oShellApp = Nothing
End Sub

Public Sub UnzipFile()

    Dim FSO As Object
    Dim oShellApp As Object
    Set FSO = CreateObject("scripting.filesystemobject")

    'Derive the folder to unzip to from the location of the sourcefile
    XMLFolderRoot = FolderName

    'A dedicated unzip folder will be created in the same folder as the sourcefile,
    'called ..\Unzipped Filename\
    If Right(XMLFolderRoot, 1) <> Application.PathSeparator Then
        XMLFolderRoot = XMLFolderRoot & "\UnZipped " & FileName & Application.PathSeparator
    Else
        XMLFolderRoot = XMLFolderRoot & "UnZipped " & FileName & Application.PathSeparator
    End If
    On Error Resume Next
    'Remove all previous existing folders
    FSO.DeleteFolder XMLFolderRoot & "*", True
    Kill XMLFolderRoot & "*.*"

    'Create normal folder
    If FolderExists(XMLFolderRoot) = False Then
        MkDir XMLFolderRoot
    End If

    Set oShellApp = CreateObject("Shell.Application")
    'Copy the files in the newly created folder
    oShellApp.Namespace(XMLFolderRoot).CopyHere oShellApp.Namespace(SourceFile).items

    On Error Resume Next
    'Clean up temp folder
    FSO.DeleteFolder Environ("Temp") & "\Temporary Directory*", True

    Set oShellApp = Nothing
    Set FSO = Nothing
    Exit Sub
End Sub

Sub NewZip(sPath)
    If Len(Dir(sPath)) > 0 Then Kill sPath
    Open sPath For Output As #1
    Print #1, Chr$(80) & Chr$(75) & Chr$(5) & Chr$(6) & String(18, 0)
    Close #1
End Sub

Public Property Get CreateBackup() As Boolean
    CreateBackup = mbCreateBackup
End Property

Public Property Let CreateBackup(ByVal bCreateBackup As Boolean)
    mbCreateBackup = bCreateBackup
End Property

Private Sub Class_Initialize()
'Set defaults
    CreateBackup = True
End Sub

Public Property Get SourceFile() As Variant
    SourceFile = mvSourceFile
End Property

Public Property Let SourceFile(ByVal vSourceFile As Variant)
    mvSourceFile = vSourceFile
    If CreateBackup Then
        If Len(Dir(vSourceFile & "(backup)")) > 0 Then
            Kill vSourceFile & "(backup)"
        End If
        FileCopy vSourceFile, vSourceFile & "(backup)"
    End If
    If Not vSourceFile Like "*.zip" Then
        Name vSourceFile As vSourceFile & ".zip"
        mvSourceFile = mvSourceFile & ".zip"
        AddedZip = True
    End If
End Property

Public Property Get FolderName() As Variant
    FolderName = Mid(SourceFile, 1, InStrRev(SourceFile, Application.PathSeparator))
End Property

Public Property Get FileName() As Variant
    If SourceFile <> "" Then
        FileName = Mid(SourceFile, InStrRev(SourceFile, Application.PathSeparator) + 1, Len(SourceFile))
    End If
End Property

Public Property Get XMLFolder(sXMLFolder As XMLFolder) As String
    Select Case sXMLFolder
        Case Is = XMLFolder_root
            XMLFolder = mvXMLFolderRoot
        Case Is = XMLFolder_customUI
            XMLFolder = mvXMLFolderRoot & "customUI" & Application.PathSeparator
        Case Is = XMLFolder_docProps
            XMLFolder = mvXMLFolderRoot & "docProps" & Application.PathSeparator
        Case Is = XMLFolder_rels
            XMLFolder = mvXMLFolderRoot & "_rels" & Application.PathSeparator
        Case Is = XMLFolder_xl
            XMLFolder = mvXMLFolderRoot & "xl" & Application.PathSeparator
    End Select
End Property

Public Property Get Sheet2Change() As String
    Sheet2Change = msSheet2Change
End Property

Public Property Let Sheet2Change(ByVal sSheet2Change As String)
    msSheet2Change = sSheet2Change
    SheetId = GetSheetIdFromSheetName(sSheet2Change)
    If SheetId <> "" Then
        SheetFileName = GetSheetFileNameFromId(SheetId)
    End If
End Property

Public Property Get SheetId() As String
    SheetId = msSheetId
End Property

Public Property Let SheetId(ByVal sSheetId As String)
    msSheetId = sSheetId
End Property

Public Property Get SheetFileName() As String
    SheetFileName = msSheetFileName
End Property

Public Property Let SheetFileName(ByVal sSheetFileName As String)
    msSheetFileName = sSheetFileName
End Property

Private Property Get AddedZip() As Boolean
    AddedZip = mbAddedZip
End Property

Private Property Let AddedZip(ByVal bAddedZip As Boolean)
    mbAddedZip = bAddedZip
End Property

Private Sub Class_Terminate()
    Dim FSO As Object
    If AddedZip Then
        'Remove .zip from file again
        Name SourceFile As Left(SourceFile, Len(SourceFile) - 4)
    End If
    'Remove zip folder
    On Error Resume Next
    FSO.DeleteFolder XMLFolderRoot, True
End Sub

Private Property Get XMLFolderRoot() As Variant
    XMLFolderRoot = mvXMLFolderRoot
End Property

Private Property Let XMLFolderRoot(ByVal vXMLFolderRoot As Variant)
    mvXMLFolderRoot = vXMLFolderRoot
End Property
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
list from [[VBA - ExtractRibbonX]] AND -"Changelog"
```