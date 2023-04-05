# Embracing the Model-View-ViewModel Architecture

*Source: [Model–view–viewmodel - Wikipedia](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel) | [Home · rubberduck-vba/MVVM Wiki · GitHub](https://github.com/rubberduck-vba/MVVM/wiki)*

## Overview

*Model-View-ViewModel (MVVM)* is a UI design pattern used in modern [software development](../2-Areas/MOCs/Software%20Development.md) for Win32/Desktop (WPF/XAML) and Web front-ends written in *JavaScript*.

What sets this pattern apart from, say, *Model-View-Presenter*, is property and command bindings: we don't handle control events anymore, so the form's code-behind is focused on the only concern that remains - presentation.

## MVVM with VBA

See Also: [Excel - VBA](../3-Resources/Tools/Microsoft%20Office/Excel/Excel%20-%20VBA.md)

````ad-info

In MVVM, we're going to be referring to a `UserForm` as a _View_ to broadly generalize the abstraction, but keep in mind that a _View_ could just as well be a `MSForms.Tab` control in a `MSForms.TabStrip` container, itself a child of a `UserForm`. The "Model-View-ViewModel" triad is about _abstractions_, so think of the _View_ as whichever component is responsible for directly interacting with the user.

````

This is a significant departure from how VBA traditionally makes you reason about programming. The Visual Basic Editor (VBE) has made a lot of us believe having lots of small, specialized modules was cumbersome and counter-productive. We are rightfully reluctant to code against interfaces, when there's no IDE support to navigate to their implementations. What if we just ran with it though, and embraced the full breadth of what [**Rubberduck**](https://github.com/rubberduck-vba/Rubberduck) *and VBA as a language* have to offer? This project is what happens then.

We can still drag-and-drop design our forms - but a *View* will only initialize property and command bindings, and MVVM does everything else. Or we can use an API to create the entire UI at run-time and bind the controls to *ViewModel* properties; either way, with MVVM the only code that's needed in a form's code-behind module, is code that configures all the property bindings, and boilerplate `IView` interface implementation.

The *ViewModel* is an object that exposes all the properties needed by the *View*, and implements the `INotifyPropertyChanged` interface to notify listeners (property bindings) when a value needs to be synchronized.

The *Model* is an abstraction representing the object(s) responsible for retrieving and persisting the *ViewModel* data, as applicable. It's arguably also the *commands* you implement that read *ViewModel* properties and pass them to some stored procedure on SQL Server.

*Backlinks:*

````dataview
list from [[Embracing the Model-View-ViewModel Architecture]] AND -"Changelog"
````
