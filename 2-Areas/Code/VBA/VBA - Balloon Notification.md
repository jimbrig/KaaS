# VBA - Balloon Notification

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
