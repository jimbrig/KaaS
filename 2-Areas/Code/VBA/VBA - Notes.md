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
