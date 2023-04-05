# VBA Best Practices

## Use Ranges

A range object represents a contiguous area in a document and is defined using a starting and ending character position.

Unlike the Selection object, where you can only have one at time, you can have as many range object variables declared and assigned as you like, in one or many different open documents. A range object has many of the attributes of the Selection object and most (but not all) of the methods that can used with the Selection object can also be applied to a range object.

To start out on this, take a relatively small macro that you have written using the Selection. Put the following line at the start:

````vba
Dim ORng as Range
Set ORng = Selection.Range
````

You should see that from the material presented earlier that those statements declare a range object variable and assign it so that it is located at the same position as the current selection (i.e., the start and end character position of the range object = the start and end character position of the selection.)

Then, wherever you have a line of code that says `Selection.something`, replace it with `ORng.something`.

Remember most, but not all, of the methods that you can use with the selection object can also be used with a range object. You may get some compile errors when you first attempt to execute your modified macro, so take a look and see what the problem is. It is very likely that you have used the `HomeKey` method of the Selection object to move you to the top of the document, or used some other method that can't be done with a range object.

There is almost always one or more ways of doing the same thing using a method appropriate for a range object. In the case of `Selction.HomeKey`, you could use:

````VBA
ORng.Move Unit:=wdStory, Count:=-1
````

Once you have gotten used to the idea of using a range object instead of the Selection, you can start getting more ambitious.

````vba
Dim oRng As Word.Range
Set oRng = ActiveDocument.Range
'Other lines of code would go here. oRng.Move Unit:=wdStory, Count:=-1
oRng.Select
Set oRng = Nothing
````

````ad-note

It is always a good practice to explicitly destroy variable values when you are finished with their value as shown in the final assignment statement in the example above.

````

## Use MsgBox

As shown earlier, a `MsgBox` function can be used to display information on the screen. It can also return a user response to a query and when used with other code statements direct the course of execution.

Select `MsgBox` in a VBA code statement and press F1. The VBA Help file will present a help topic on the `MsgBox` function with an example. Part of that example is shown below (I have removed the part associated with a help file because I don't have a help file builder to work with).

````VBA
'Return the path of an open document in the documents collection named "VBA Basics.doc"
MsgBox Documents("VBA Basics.doc").Path
'Return the text of a first paragraph object in the ActiveDocument object
MsgBox ActiveDocument.Paragraphs(1).Range.Text
````

*Backlinks:*

````dataview
list from [[VBA Best Practices]] AND -"Changelog"
````
