# The Clean Architecture — Beginner’s Guide

## Metadata

* Author: *Bharath*
* Full Title: The Clean Architecture — Beginner’s Guide
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/e4b7058c1165

## Highlights

* Advantages of Proper Architecture
* Testable
* Maintainable
* Changeable
* Easy to Develop
* Easy to Deploy
* Independent
* The Dependency Rule states that the source code dependencies can only point inwards.
* This means nothing in an inner circle can know anything at all about something in an outer circle. i.e. the inner circle shouldn’t depend on anything in the outer circle. The Black arrows represented in the diagram show the dependency rule.
* First of all, this circular representation might be confusing for many. So let's try to represent it vertically.
* Frameworks and Drivers
* Interface Adapters
* Presenters (UI Logic, States)
* Controllers (Interface that holds methods needed by the application which is implemented by Web, Devices or External Interfaces)
* Gateways (Interface that holds every CRUD operation performed by the application, implemented by DB)
* Application Business Rules
* This layer holds Use Cases
