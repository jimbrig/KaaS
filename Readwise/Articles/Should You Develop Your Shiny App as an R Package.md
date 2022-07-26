---
Date: 2022-07-11
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: feedly
Link: https://www.r-craft.org/r-news/should-you-develop-your-shiny-app-as-an-r-package/
Tags: ["#Type/Highlight/Article"]
Aliases: ["Should You Develop Your Shiny App as an R Package?", "Should You Develop Your Shiny App as an R Package?"]
---
# Should You Develop Your Shiny App as an R Package?

## Metadata
- Author: [[Paweł Przytuła]]
- Full Title: Should You Develop Your Shiny App as an R Package?
- Category: #Type/Highlight/Article
- URL: https://www.r-craft.org/r-news/should-you-develop-your-shiny-app-as-an-r-package/

## Highlights
- Firstly, I want to clarify that I will focus on developing a Shiny app, not the way of distributing it. There are many different methods for distributing a Shiny application, and one of them is compiling your well tested app into an R package so that others can install it from CRAN or Package Manager and run it easily. There is no such limit if you want to develop an app using Rhino, but later compile it as a package.
- Limitations of developing a Shiny app as a package
- Flat files structure. It prevents you from organizing your project into clear, traversable structure. I don’t see a reason for flattening files structure when you develop a complex app that requires a lot of modules.
- R CMD check as a testing workflow – This is ok for simple apps, but complex apps need significantly more advanced testing (and not only R code needs testing). Linting, unit testing, end to end, performance testing – there are much better project structures that will support these different use cases.
- Development using an R package structure limits you from thinking about the broader ecosystem of tools available to you. It is a great starting point for those new to Shiny, but soon enough you will notice that Shiny app development is not only about R code. It can be also frontend in React, Python scripts or APIs, infrastructure as a code, data pipelines, data validation workflows, environment settings, docker images and more. It will be hard to maintain all of it as a package, and eventually you will end up wrapping only part of your project as an R package and the rest of it will be outside.
