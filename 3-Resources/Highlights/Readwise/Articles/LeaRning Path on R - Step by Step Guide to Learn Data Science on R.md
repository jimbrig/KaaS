# LeaRning Path on R - Step by Step Guide to Learn Data Science on R

## Metadata

* Author: 
* Full Title: LeaRning Path on R - Step by Step Guide to Learn Data Science on R
* Category: #Type/Highlight/Article
* URL: https://www.analyticsvidhya.com/learning-paths-data-science-business-analytics-business-intelligence-big-data/learning-path-r-data-science/

## Highlights

* Step 0: Warming up
  Before starting your journey, the first question to answer is: Why use R? or How would R be useful?
  R is a fast growing open source contestant to commercial software packages like SAS, STATA and SPSS. The demand for R skills in the job marketing is rising rapidly, and recently companies such as Microsoft pledged their commitment to R as a lingua franca of Data Science.
* Step 1: Setting up your machine
  The easiest way to set-up R is by downloading a copy of it on your local computer from the Comprehensive R Archive Network (CRAN). You can choose between binaries for Linux, Mac and Windows.
  Although you could consider working with the basic R console, we recommend you to install one of R’s integrated development environment (IDE). The most well known IDE is RStudio, which makes R coding much easier and faster as it allows you to type multiple lines of code, handle plots, install and maintain packages and navigate your programming environment much more productively. An alternative to RStudio is Architect, an eclipse-based workbench.
  (Need a GUI? Check R-commander or Deducer)
* Assignment
  Install R, and RStudio
  Install Packages Rcmdr, rattle, and Deducer. Install all suggested packages or dependencies including GUI.
  Load these packages using library command and open these GUIs one by one.
* Step 2: Learn the basics of R language
* In addition to these online resources, you can also consider the following excellent written resources:
  The free introduction to R manual by CRAN
  Jared Lander’s R for Everyone
  Quick-R
* Specifically learn: read.table, data frames, table, summary, describe, loading and installing packages, data visualization using plot command
* Assignment
  Take the free online R tutorial by DataCamp and become familiar with basic R syntax
  Create a github account at http://github.com
  Learn to troubleshoot package installation above by googling for help.
  Install package swirl and learn R programming (see above)
* Step 3: Understanding the R community
* The major reason R is growing rapidly and is such a huge success, is because of its strong community. At the center of this is R’s package ecosystem. These packages can be downloaded from the Comprehensive R Archive Network, or from bioconductor, github and bitbucket. At Rdocumentation you can easily search packages from CRAN, github and bioconductor that will fit your needs for the task at hand.
* Next to the package ecosystem R, you can also easily find help and feedback on your R endeavours. First of all there is R’s built-in help system which you can access via the command ? and the name of e.g. a function. There is also Analytics Vidhya Discussions, Stack Overflow where R is one of the fastests growing languages. To end, there are numerous blogs run by R enthusiast, a great collection of these is aggregated at R-bloggers.
* Assignment
  Understand the R package ecosystem by visiting Cran Task Views
  Sign up at http://r-bloggers.com for the daily newsletter
* Step 4: Importing and manipulating your data
* Importing and manipulating your data are important steps in the data science workflow. R allows for the import of different data formats using specific packages that can make your job easier:
  readr for importing flat files
  The readxl package for getting excel files into R
  The haven package lets you import SAS, STATA and SPSS data files into R.
  Databases: connect via packages like RMySQL and RpostgreSQL, and access and manipulate via DBI
  rvest for webscraping
  Once your data is available in your working environment you are ready to start manipulating it using these packages:
  The stringr package for string manipulation.
  For data frame like objects learn the ins and outs of the dplyr package (try this course).
  Need to perform heavy data wrangling tasks? Check out the data.table package
  Performing time series analysis? Try out packages like like zoo, xts and quantmod.
* Assignment
  Master the packages mentioned for importing data via this “Importing Data Into R” course, or read these articles 1,2,3 and 4.
  See this Data Wrangling with R video by RStudio
  Read and practice how to work with packages like dplyr, tidyr, and data.table.
* Step 5: Effective Data Visualization
* 5.3: HTML widgets
  A very promising new tool for visualizations in R is the usage of HTML widgets. HTML widgets allow you to create interactive web visualizations in an easy way (see the tutorial by RStudio) and mastering this type of visualizations is very likely to become a must have R skill. Impress your friends and colleagues with these visualizations:
  Dynamic maps with leaflet
  Time-series data charting using dygraphs
  Interactive tables (DataTables)
  DiagrammeR for diagrams and flowcharts
  D3 scatterplots, line charts, and histograms with MetricsGraphics
  Assignment
  Make sure you have understand the principles of the grammar of graphics.
  Take the ggplot2 tutorial
  Follow the html widgets tutorial by RStudio
* Step 7: Reporting Results
* Communicating your results and sharing your insights with fellow data science enthusiast is equally important as the analysis itself. Luckily R has some very nifty tools to do this that can save you a lot of time.
  The first is R Markdown , a great tool for reporting your data analysis in a reproducible manner based on knitr and pandoc. With R markdown, R generates a final document that replaces the R code with its results. This document can be in an html, word, pfd, ioslides, etc. format. You can learn more on it via this tutorial and use this cheat sheet a a reference.
  Next to R Markdown there is also ReporteRs. ReporteRs is an R package for creating Microsoft (Word docx and Powerpoint pptx) and html documents and runs on Windows, Linux, Unix and Mac OS systems. Just like R Markdown it’s an ideal tool to automate reporting generation from R. See here how to get started.
* Last but not least there is Shiny, one of the most exciting tools in R around at the moment. Shiny makes it incredibly easy to build interactive web applications with R. It allows you to turn your analysis into interactive web applications without needing to know HTML, CSS or Javascript. If you want to get started with Shiny (and believe us you should!), checkout the RStudio learning portal.
  Assignment
  Create your first interactive report using RMarkdown and/or ReporteRs
  Try to build your very first Shiny app
* Bonus Step: Practice
  You will only become a great R programmer through practice. Therefore, make sure to tackle new data science challenges regularly. The best recommendation we can make to you here is to start competing with fellow data scientists on Kaggle: https://www.kaggle.com/c/titanic-gettingStarted.
  Test your R Skills on live challenges – Practice Problems
* Step 9: Becoming an R Master
  Now that you have learnt most of data analytics using R , it is time to give some advanced topics a shot. There is a good chance that you already know many of these, but have a look at these tutorials too.
  Advanced R by Hadley Wickham
  Using R together with Hadoop, MongoDB or NoSQL
  The RevoScaleR package by Microsoft (formerly Revolution Analytics)
