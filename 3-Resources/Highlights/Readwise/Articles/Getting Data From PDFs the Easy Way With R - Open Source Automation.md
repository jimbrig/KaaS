# Getting Data From PDFs the Easy Way With R - Open Source Automation

## Metadata

* Author: 
* Full Title: Getting Data From PDFs the Easy Way With R - Open Source Automation
* Category: #Type/Highlight/Article
* URL: http://theautomatic.net/2018/08/24/getting-data-from-pdfs-the-easy-way-with-r/

## Highlights

* package called tabulizer was released in R, which allows you to automatically pull out tables and text from PDFs. Note, this package only works if the PDF’s text is highlightable (if it’s typed) — i.e. it won’t work for scanned-in PDFs, or image files converted to PDFs
* You can extract tables from this PDF using the aptly-named extract_tables function, like this:# default call with no parameters changed
  
  matrix_results \<- extract_tables(site)# get back the tables as data frames, keeping their headers
  
  df_results \<- extract_tables(site, output = "data.frame", header = TRUE)
  * Tags: [2-Areas/MOCs/R](../../../../2-Areas/MOCs/R.md)
