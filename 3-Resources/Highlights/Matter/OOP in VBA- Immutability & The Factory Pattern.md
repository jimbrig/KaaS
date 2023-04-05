## Metadata

* URL: [https://rubberduckvba.wordpress.com/2016/01/11/oop-in-vba-immutability-the-factory-pattern/](url)
* Author: Rubberduck VBA
* Publisher: wordpress.com
* Published Date: 2016-01-11
* Tags: #design, #dev, #excel, #guide, #microsoft, #vba, #workflow

## Highlights

* Factory Pattern A factory is exactly what it sounds like: it’s an object whose role is to make things; it encapsulates the notion of creating an object.
* Whenever we use the New keyword or the CreateObject function, we create a new instance of a class.
* Singleton In OOP design patterns, factories are often combined with the Singleton pattern, because there only ever needs to be one single instance of a factory class. Given that the class can’t be created by the client code with the New keyword, setting the VB_PredeclaredId attribute to True essentially makes that class’ default instance an effective Singleton, at least from the perspective of the VBA project that’s referencing the project that defines the factory class.
