# Python Best Practices.

## Metadata

* Author: *Roman*
* Full Title: Python Best Practices.
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/78634aac5b12

## Highlights

* Environment Isolation and Dependency Management.
* If you are working on multiple projects with different dependencies at the same time, then there is a high chance of dependency conflict. For example, when one project requires Django==2.6 but some other project requires Django==3.0.6, dependency conflicts occur. To resolve this issue, you should isolate your python environment and install the dependencies/packages on the environment and not the default system.
* Naming Conventions
* Make sure that the names of your files or folders give you an idea of what the file/folder contains.
* Similarly when naming class, functions and variables, some standards can be followed.
* Variable names, function/method names must all be in lowercase, ought to be separated by underscores, and just like files and folders, their names should give us a proper idea about their use.
* Constants must be all CAPS.
* The USER_NAME, EMAIL, PHONE etc. all hold values that do not change throughout the execution of the code. Hence, they are all in CAPS.
* The class name must be in CamelCase.
* Proper use of Comments and docStrings
* A small description of your code can help other developers better understand it. You can use docStrings after each class/function declaration to give a brief explanation about the code. Multiline comments at the start of every file can also be of great help to other coders.
* Proper Indentation and Spacing
* Implement correct data structures and write compact code for efficiency and less complexity.
* For optimal performance, it is essential that the data in your system is organized correctly. Using incorrect data structures to hold data can drastically exacerbate the time/space complexity of your code.
* You can try and reduce the number of lines of code by making use of list comprehension, avoiding nested if blocks, naming multiple variables in the same line etc.
* Iterators vs Generators: Memory usage can be a problem when working with large data. Correct implementation of generators can help mitigate this problem as, unlike iterators, generators generate data only when needed. This makes generators more memory efficient. If you want to learn more about them, click here.
* Recursion vs Iteration
* While it is true that recursive programs are more compact and are easy to understand, their execution consumes a lot more memory than iterations. It is also difficult to calculate the Time Complexity of a recursive program, and they tend to be very high compared to iterative programs. Therefore, only use recursion when memory and time complexity is not an issue.
* Remove unnecessary variables.
* Variables take up memory and if you want your code to be memory efficient, you should try and not use variables when you do not need to. Several IDEs automatically underline unused variables which makes it easy for us to find and remove them.
* Proper use of Exceptional Handling
* In case an undesired event occurs during the execution of code, Exception Handling can help redirect the flow of execution such that the program does not crash.
* Increase code reusability and make use of built-in functions.
* One way to write efficient code is to avoid code duplication. If the same code needs to be reused multiple times, wrap the code inside a function and call the function whenever necessary.
* Statically type your function parameters and return values.
* Log your process.
* “Logging is a means of tracking events that happen when some software runs. Logging is important for software developing, debugging and running. If you don’t have any logging record and your program crashes, there are very little chances that you detect the cause of the problem.” -GeeksForGeeks
* Make use of decorators
* A decorator is a function that takes another function as an argument, adds some kind of functionality to it and returns another function. Python decorators help add functionality to an existing code(function) which may aid in code reusability. To learn more about decorators click here.
* Multithreading for optimal use of CPU
* Multithreading allows the execution of multiple parts of a program at the same time. This can be crucial at times when multiple actions that happen simultaneously needs to be handled. Else, they can be used to execute another piece of code(function) while the CPU is idle.
* Make full use of External Libraries
* Always Test your code
* Make full use of the unittest functionality or use the pytest library to test your code. Selenium can be used for cross-browser testing and Postman can be used for testing APIs.
* Structure your project.
* Your folders structure for your project should be such that navigating through it (searching for any particular file/subfolder) should be easy. Other developers should not have a hard time searching for a particular file. You can help with this by showcasing your project folder structure in your readme file.
