## Metadata
* URL: [https://learn.microsoft.com/en-us/office/vba/library-reference/concepts/getting-started-with-vba-in-office](url)
* Author: o365devx
* Publisher: learn.microsoft.com
* Published Date: 2022-06-08
* Tags: #excel, #guide, #microsoft, #vba, #workflow

## Highlights
* The great power of VBA programming in Office is that nearly every operation that you can perform with a mouse, keyboard, or a dialog box can also be done by using VBA. Further, if it can be done once with VBA, it can be done just as easily a hundred times. (In fact, the automation of repetitive tasks is one of the most common uses of VBA in Office.)
* Beyond the power of scripting VBA to accelerate every-day tasks, you can use VBA to add new functionality to Office applications or to prompt and interact with the user of your documents in ways that are specific to your business needs. For example, you could write some VBA code that displays a pop up message that reminds users to save a document to a particular network drive the first time they try to save it.
* Automation and repetition
* Extensions to user interaction
* Interaction between Office applications
* Doing things another way
* The critical question to ask is whether there is an easier way. Before you begin a VBA project, consider the built-in tools and standard functionalities. For example, if you have a time-consuming editing or layout task, consider using styles or accelerator keys to solve the problem. Can you perform the task once and then use CTRL+Y (Redo) to repeat it? Can you create a new document with the correct format or template, and then copy the content into that new document?
* Before you begin a VBA project, ensure that you have the time to work with VBA. Programming requires focus and can be unpredictable. Especially as a beginner, never turn to programming unless you have time to work carefully. Trying to write a "quick script" to solve a problem when a deadline looms can result in a very stressful situation. If you are in a rush, you might want to use conventional methods, even if they are monotonous and repetitive.
* Using code to make applications do things
* Microsoft Office applications are created in such a way that they expose things called objects that can receive instructions, in much the same way that a phone is designed with buttons that you use to interact with the phone. When you press a button, the phone recognizes the instruction and includes the corresponding number in the sequence that you are dialing. In programming, you interact with the application by sending instructions to various objects in the application. These objects are expansive, but they have their limits. They can only do what they are designed to do, and they will only do what you instruct them to do.
* The Object Model
* Developers organize programming objects in a hierarchy, and that hierarchy is called the object model of the application. Word, for example, has a top-level Application object that contains a Document object. The Document object contains Paragraph objects and so on. Object models roughly mirror what you see in the user interface. They are a conceptual map of the application and its capabilities.
* The definition of an object is called a class, so you might see these two terms used interchangeably. Technically, a class is the description or template that is used to create, or instantiate, an object.
* Once an object exists, you can manipulate it by setting its properties and calling its methods. If you think of the object as a noun, the properties are the adjectives that describe the noun and the methods are the verbs that animate the noun. Changing a property changes some quality of appearance or behavior of the object. Calling one of the object methods causes the object to perform some action.
* Methods
* Properties
* The first challenge in VBA programming is to get a feeling for the object model of each Office application and to read the object, method, and property syntax. The object models are similar in all Office applications, but each is specific to the kind of documents and objects that it manipulates.
* Programming tips and tricks
* Start with examples
* Make a simpler problem Programming can get complex quickly. It's critical, especially as a beginner, that you break the problem down to the smallest possible logical units, then write and test each piece in isolation. If you have too much code in front of you and you get confused or muddled, stop and set the problem aside. When you come back to the problem, copy out a small piece of the problem into a new module, solve that piece, get the code working, and test it to ensure that it works. Then move on to the next part.
* Bugs and debugging
* There are two main types of programming errors: syntax errors, which violate the grammatical rules of the programming language, and run-time errors, which look syntactically correct, but fail when VBA attempts to execute the code. Although they can be frustrating to fix, syntax errors are easy to catch; the Visual Basic Editor beeps and flashes at you if you type a syntax error in your code.
* Using reference materials well
* Going further with programming Although this article is short and only scratches the surface of VBA and programming, it is hopefully enough to get you started.
* Variables In the simple examples in this article you manipulated objects that the application had already created. You might want to create your own objects to store values or references to other objects for temporary use in your application. These are called variables. To use a variable in VBA, must tell VBA which type of object the variable represents by using the Dim statement. You then set its value and use it to set other variables or properties.
* Branching and looping The simple programs in this article execute one line at a time, from the top down. The real power in programming comes from the options that you have to determine which lines of code to execute, based on one or more conditions that you specify. You can extend those capabilities even further when you can repeat an operation many times.
