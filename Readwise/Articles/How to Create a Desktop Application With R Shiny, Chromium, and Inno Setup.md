---
Date: 2022-07-11
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: medium
Link: https://medium.com/p/b47cee8ab788
Tags: ["#Type/Highlight/Article"]
Aliases: ["How to Create a Desktop Application With R Shiny, Chromium, and Inno Setup", "How to Create a Desktop Application With R Shiny, Chromium, and Inno Setup"]
---
# How to Create a Desktop Application With R Shiny, Chromium, and Inno Setup

## Metadata
- Author: [[Marcus Codrescu]]
- Full Title: How to Create a Desktop Application With R Shiny, Chromium, and Inno Setup
- Category: #Type/Highlight/Article
- URL: https://medium.com/p/b47cee8ab788

## Highlights
- My colleagues and I utilize a small Postgres database on Microsoft Azure to hold data relevant to a project we are currently working on. Not everyone on my team is experienced using programming languages to upload .csv files to the database and I often get requests to upload files for them. After about the tenth time I decided to create a application using R Shiny that allows users to upload .csv files to the database themselves.
- Because of security protocols, we can only access the database while on the corporate VPN. This made hosting a shiny application on shinyapps.io impossible. So, my next thought was to create a desktop application that a user could install and run locally and access the database. I experimented with Electronjs, Neutralinojs, and NWjs but found it very difficult to merge these frameworks with R Shiny. I did, however, copy the idea from these frameworks to use Chromium browser to create a clean window interface for the application (as opposed to simply opening it in the default browser).
- I then turned to Inno Setup. It’s a program that creates windows desktop installers. I created a file on my computer call Database App and copied the entire source code for R-4.1.2, Chromium Browser, and a single app.R shiny application.
