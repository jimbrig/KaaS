# Enable Code Folding in Bookdown and Blogdown · StatnMap

## Metadata

* Author: *Sébastien Rochette*
* Full Title: Enable Code Folding in Bookdown and Blogdown · StatnMap
* Category: #Type/Highlight/Article
* URL: https://statnmap.com/2017-11-13-enable-code-folding-in-bookdown-and-blogdown/

## Highlights

* Option code_folding: true, like in classical rmarkdown documents, is not working in bookdown or blogdown but it is possible to enable it with some tricks. All files presented here, the javascript and Rmd files necessary for bookdown and the html files necessary for blogdown, to enable code folding are available on my github blog tips repository.
  As in the present blog post, these codes allow for:
  a button on each code chunk to show/hide it
  a global button with a dropdown menu to show/hide all codes on your page
* Some javascript codes
  The main javascript function that will be called codefolding.js needs to find .sourceCode class divisions to work with bookdown. This also requires complementary javascript functions of bootstrap, but not all.
  Here are the steps:
  Create a js folder in the same directory than your Rmd file
  Download javascript functions transition.js, collapse.js and dropdown.js here for instance: https://github.com/twbs/bootstrap/tree/v3.3.7/js and store them in your js folder
  Create a new file in the js folder called codefolding.js with the following code. This is the same as for rmarkdown code_folding option but with pre.sourceCode added to find R-code chunks. You can had any other code language with pre.lang in this file.
  * Tags: *favorite* 

---

## title: "Toggle R code"
author: "StatnMap"
date: '06 mai, 2020'
output:
bookdown::html_document2:
includes:
in_header: header.html
bookdown::gitbook:
includes:
in_header: header.html

* Modify your hugo templates
  In your theme config file, you can add the following parameters to enable or disable totally codefolding in the website and to define if it is shown or not by default. Note that this can also be defined in each blog article (see below).# Set to true to disable code folding
  
  disable_codefolding = false# Set to "hide" or "show" all codes by default
  
  codefolding_show = "hide"
  In the main footer (or header) of your website, you need to load the javascript libraries. You can use the following code (footer_js.html).
