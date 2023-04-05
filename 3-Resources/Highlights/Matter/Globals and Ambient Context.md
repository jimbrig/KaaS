## Metadata

* URL: [https://rubberduckvba.wordpress.com/2021/03/19/globals-and-ambient-context/](url)
* Author: Rubberduck VBA
* Publisher: wordpress.com
* Published Date: 2021-03-19
* Tags: #design, #dev, #excel, #guide, #microsoft, #vba, #workflow

## Highlights

* Rubberduck recommends using the Dim keyword only in local scope, and to use the Private keyword to declare module-level variables. It also recommends using Public over Global, because nothing is really “global” in VBA and that makes the deprecated keyword potentially confusing. The Global keyword really means Public in VBA, and should be avoided.
* Global variables are very useful: having a piece of data that is accessible from anywhere in the code does have its advantages. Used wisely, globals can very elegantly address cross-cutting concerns. Instead of having every method responsible for its own logging, or instead of passing a Logger instance to every method, each scope can access a single global Logger object (or invoke the same Log utility procedure), and there really isn’t any problem with that, …until you realize that your unit tests are all needlessly writing logs to some file under C:\Dev\VBA because the global logger is doing its job whether or not the code invoking it is being executed from a test runner… and this is making tests run code that isn’t related to these tests’ purpose: if there’s a bug in the logger code, it’s a test about the logger code that should be failing, not every single other test that couldn’t care less for the logging functionality.
* Treating the Excel Object Model as a Dependency Imagine needing to write tests for user-defined functions (UDF) that store a number of values in a global Dictionary and then schedule a macro that then runs (asynchronously!) and sends these values over to some web API that returns data that then ends up on the worksheet, underneath the calling UDF; the functions have dependencies on Application.Caller and Application.OnTime: we don’t own the Application global object, and we can’t modify its code to accommodate testing – what then?
* The basic idea is to pull our dependencies from global scope, encapsulate them in a class module, …and then making an instance of that class an “ambient context” that’s still globally accessible, but that introduces the necessary abstraction needed to make that UDF fully testable.
