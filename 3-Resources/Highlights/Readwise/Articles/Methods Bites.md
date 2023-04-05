# Methods Bites

## Metadata

* Author: *Mzes Social Science Data Lab*
* Full Title: Methods Bites
* Category: #Type/Highlight/Article
* URL: https://www.mzes.uni-mannheim.de/socialsciencedatalab

## Highlights

* Workflow for a Reproducible Data Project
  Even the setup of a reproducible data project should follow reproducible steps. And since we need to repeat these steps every time we start a new data project, it is a good idea to keep everything simple and to automate what can be automated. For the following steps to work you need three things:
  A github.com account.
  A current installation of R and RStudio on the computer you want to work on.
  An installation of git on the computer you want to work on.
* If you struggle with any of those three prerequisites, happygitwithr.com is an excellent resource that includes a step-by-step guide of how to setup git with R. It will also give you are more in-depth introduction to what git and github actually are and why it is worthwhile including them in any data project right from the start!
* Let’s start a new project:
  Start a new project on GitHub:
  Login to your GitHub account.
  Click on New on the left side where your repositories are displayed.
  Give your project repository a meaningful name. For this course you could name it: efficient-data-management.
  Click Create repository.
  Copy the URL to the repository, it will look something like this: https://github.com/<username>/efficient-data-management.git
  Open the project in RStudio:
  Open RStudio.
  Click on File > New Project....
  Create a new project from Version Control.
  Choose Git.
  Paste the URL to the repository in Repository URL.
  Choose a folder on your computer where the project will be stored locally.
  And finally click on Create.
* Initializing the project with a .Rprofile.
  Now you have a new Rproject that is linked with GitHub. Before start coding, we want to have an efficient folder structure. Ideally, we want to use the same structure for all of our projects. This way, it is easier to focus on the things that really matter – like producing interesting research. To that end, we initialize our Rproject with a .Rprofile that automates the process of setting up our project structure.
  Initialize your Rproject with a .Rprofile:
  If you follow these steps for the very first time, install the renv package in R.
  In RStudio, with your new Rproject open, open a new Text File.
  Paste the following code and save it as .Rprofile.
  Now close RStudio and re-open your project from your project folder.
* .First \<- function() {
  dir.create(paste0(getwd(), "/figures"), showWarnings = F)
  dir.create(paste0(getwd(), "/processed-data"), showWarnings = F)
  dir.create(paste0(getwd(), "/raw-data"), showWarnings = F)
  dir.create(paste0(getwd(), "/scripts"), showWarnings = F)
  dir.create(paste0(getwd(), "/manuscript"), showWarnings = F)
  if (!("renv" %in% list.files())) {
  renv::init()
  } else {
  source("renv/activate.R")
  }
  cat("\nWelcome to your R-Project:", basename(getwd()), "\n")
  }
* R will automatically source the .Rprofile at startup. Here, we first create some folders with dir.create(). Don’t worry, folders will not be created if they already exist, so this will not overwrite existing files. We then display a nice welcome message with cat() and activate the renv package.
  After re-opening the Rproject, you should now see the project setup in your folder.
* What is renv?
  In the past, sharing your project with someone else and getting R to show the exact same behavior on different machines could be a pain. The renv package makes this super easy. It creates a local package directory for your project. This means that it keeps track of all the packages and package versions that you use in your project. If someone else wants to work with the exact same package environment to reproduce your data project, they can easily restore it from your renv package directory. To learn more about renv, check out its documentation here.
* Leveraging git and renv at the end of a working session
  Now that we have our nice project setup, we should not forget to leverage it. At the end of a working session you should follow the following steps:
  Create a renv::snapshot() to save all the packages you used to your local package directory.
  Commit all your changes to git. This can be easily done by using the Git pane in RStudio.
  Push everything to GitHub.
