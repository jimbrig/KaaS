# VBA Classes and Solid Programming Principles

*Source: [VBA Class Modules: gateway to SOLID code – Rubberduck News (wordpress.com)](https://rubberduckvba.wordpress.com/2020/02/27/vba-classes-gateway-to-solid/)*

## Creating Custom Types

You may have already used a user-defined type (UDT), which is a convenient way to create a structure of closely related properties together. You may have used it before especially if you’ve ever had to use certain API functions via the Declare statements. Let’s start with a Person UDT. We can create a new standard module and define a UDT within the module:

````VBA
Public Type Person
  FirstName As String
  LastName As String
  BirthDate As Date
End Type
````

The UDT provides us with 3 members that tells us something about a Person; namely the first & last name and the birth date. Obviously, we can have more but we want the example to stay simple. The calling code to use a Person UDT could look something like this:

````VBA
Public Sub Test()
  Dim p1 As Person
  Dim p2 As Person
   
  p1.FirstName = "John"
  p1.LastName = "Smith"
  p1.BirthDate = #1970-01-01#
   
  p2.FirstName = "Jane"
  p2.LastName = "Doe"
  p2.BirthDate = #1970-01-01#
 
  Debug.Print VarPtr(p1), VarPtr(p2)
End Sub
````

## Create First Class Module

[image-8.png (171×120) (wordpress.com)](https://rubberduckvba.files.wordpress.com/2020/02/image-8.png)

The very first thing we want to do with our first class is to define the private data it needs to have to work correctly. We could start with nothing but *public fields*, like this:

````VBA
Public FirstName As String
Public LastName As String
Public BirthDate As Date
````

We could use `Property` statements instead. If you’ve never used one before, they are a way to provide a procedural access to a member of the data structure, which grants us additional control on how the property may be accessed. We could revise the code accordingly:

````VBA
Private mFirstName As String
Private mLastName As String
Private mBirthDate As Date
 
Public Property Get FirstName() As String
  FirstName = mFirstName
End Property
 
Public Property Let FirstName(NewValue As String)
  mFirstName = FirstName
End Property
 
Public Property Get LastName() As String
  LastName = mLastName
End Property
 
Public Property Let LastName(NewValue As String)
  mLastName = LastName
End Property
 
Public Property Get BirthDate() As String
  BirthDate = mBirthDate
End Property
 
Public Property Let BirthDate(NewValue As String)
  mBirthDate = BirthDate
End Property
````

*Backlinks:*

````dataview
list from [[VBA Classes and Solid Programming Principles]] AND -"Changelog"
````
