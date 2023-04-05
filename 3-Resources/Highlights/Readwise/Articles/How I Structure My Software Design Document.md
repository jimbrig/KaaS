# How I Structure My Software Design Document

## Metadata

* Author: *Noran Azmy*
* Full Title: How I Structure My Software Design Document
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/c5fc6faf098f

## Highlights

* 
  1. Start with a TLDR
* A short paragraph that’s entirely free from jargon or project code names.
* I try to start all my documents with a couple of lines explaining in plain English what this document is about.
* Keep the Introduction section short and to the point
* Aim to answer these two main questions.
* Why am I doing this project?
* Why now/why wasn’t it done before?
* Always include a Scope section
* Don’t forget to list what’s not in scope.
* This might well be the most criminally overlooked section in a design document. You might think the scope of your project can be clearly inferred from the project description. I promise you it isn’t. You might think the requirements for your project are clear enough that they don’t need to be explicitly listed. I promise you they aren’t.
* The Scope section should contain two lists: a list of what’s in scope, and a list of what’s out of scope.
* Write a comprehensive Design section
* Add diagrams to give a visual idea of your design.
* The Design section should give the more technical reader a good idea of the parts of the system you’re changing, and the reason behind your choice of change. I often include system diagrams in there to give a quick visual idea of what this design is proposing.
* For UI changes, it is helpful to include some mocks of the UI you’re going to implement, but remember that showcasing the UI mocks is not the main purpose of the design section. Focus instead on the implications your project has on the system.
* Pick and choose what goes in the Implementation section
* Don’t overdo it with a description of every code change you intend to make.
* Explicitly list the parts of the code you intend to touch, and even add some pseudo-code snippets to your document to give the reader an idea of the code changes you’re thinking of doing.
* Don’t forget the rest
* Depending on your project, you might want to add many more sections to your design document. For example, some projects require careful legal, security, or privacy considerations. In these cases, it’s important to have dedicated sections in your document where you cover these areas of concern.
* Another section I often find useful is a dedicated Test Plan section. I often list at least three types of tests I intend to add, and where I intend to add them.
* Manual testing
* Unit and component testing
* Integration testing
* If applicable, accessibility testing
