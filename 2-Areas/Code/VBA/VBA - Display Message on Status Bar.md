# VBA - Display Message on Status Bar

*Source: [Display Message on Status Bar - Erlandsen Data Consulting](https://erlandsendata.no/?t=vbatips&c=application&p=2120#main)*

See Also: [VBA - Progress Bar in the Status Bar](VBA%20-%20Progress%20Bar%20in%20the%20Status%20Bar.md)

---

![](https://i.imgur.com/J0uQUyf.png)

---

If you turn off the screen updating, and your macros takes some time to finish, the user may think that the computer has stopped to respond. 

Because of this it's a good programming rule to inform the user of the macro progress by displaying a message on the status bar at the bottom of the screen.

Here is an example:

````VBA
Sub StatusBarExample()
    Application.ScreenUpdating = False 
    ' turns off screen updating
    Application.DisplayStatusBar = True 
    ' makes sure that the statusbar is visible
    Application.StatusBar = "Please wait while performing task 1..."
    ' add some code for task 1 that replaces the next sentence
    Application.Wait Now + TimeValue("00:00:02")
    Application.StatusBar = "Please wait while performing task 2..."
    ' add some code for task 2 that replaces the next sentence
    Application.Wait Now + TimeValue("00:00:02")
    Application.StatusBar = False 
    ' gives control of the statusbar back to the programme
End Sub
````

````VBA
Sub ShowProgress(strStatusText As String, dblPercentDone As Double)
' updated 2000-08-08 by OPE
Const clngBarSize As Long = 20, clngBarChar As Long = 45, clngProgressChar As Long = 135
Dim lngProgress As Long
    If dblPercentDone < 0 Or dblPercentDone > 1 Then Exit Sub
    
    lngProgress = CLng(dblPercentDone * clngBarSize)
    Application.StatusBar = Application.Rept(Chr(clngProgressChar), lngProgress) & _
        Application.Rept(Chr(clngBarChar), clngBarSize - lngProgress) & " " & _
        Format(dblPercentDone, "0 %") & "   " & strStatusText
End Sub
````

This procedure does the same as the previous one, but you have a little more options if you want to use different types of characters when displaying your progress bars.

````VBA
Sub ShowProgress(strStatusText As String, dblPercentDone As Double, _
    Optional lngBarChar As Long = 45, Optional lngProgressChar As Long = 135, _
    Optional lngBarSize As Long = 20)
' updated 2000-08-08 by OPE
' strStatusText: text to display on the status bar
' dblPercentDone: percent finished, values between 0 to 1
' lngBarSize: count of characters in the bar, values between 10 to 100
' lngBarChar: the progress bar character
' lngProgressChar: the progress character
Dim lngProgress As Long ' count of progress characters
    If dblPercentDone < 0 Or dblPercentDone > 1 Then Exit Sub

    If lngBarChar < 32 Or lngBarChar > 255 Then lngBarChar = 45 ' default
    If lngProgressChar < 32 Or lngProgressChar > 255 Then lngProgressChar = 135 ' default
    If lngBarSize < 10 Or lngBarSize > 100 Then lngBarSize = 20 ' default
    lngProgress = CLng(dblPercentDone * lngBarSize)
    Application.StatusBar = Application.Rept(Chr(lngProgressChar), lngProgress) & _
        Application.Rept(Chr(lngBarChar), lngBarSize - lngProgress) & " " & _
        Format(dblPercentDone, "0 %") & "   " & strStatusText
End Sub
````

You can use the procedures above like this:

````VBA
Sub TestShowProgress()
Dim i As Long, lngTotal As Long
    lngTotal = 10
    For i = 1 To lngTotal
        ShowProgress "This is a test", i / lngTotal ' first procedure
        ' ShowProgress "This is a test", i / lngTotal, 176, 149 ' second procedure
        ' replace the line below with your own task(s)
        Application.Wait Now + TimeValue("00:00:01") ' just for demonstration purposes
    Next i
    Application.StatusBar = False
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
list from [[VBA - Display Message on Status Bar]] AND -"Changelog"
````
