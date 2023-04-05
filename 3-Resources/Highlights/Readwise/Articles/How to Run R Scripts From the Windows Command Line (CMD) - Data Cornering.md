# How to Run R Scripts From the Windows Command Line (CMD) - Data Cornering

## Metadata

* Author: 
* Full Title: How to Run R Scripts From the Windows Command Line (CMD) - Data Cornering
* Category: #Type/Highlight/Article
* URL: http://datacornering.com/how-to-run-r-scripts-from-the-windows-command-line-cmd/

## Highlights

* "C:\Program Files\R\R-3.4.3\bin\Rscript.exe" C:\Users\myusername\Documents\R\Send_Outlook_Email.R
* C:\Program Files\R\R-3.4.3\bin\R.exe" CMD BATCH C:\Users\myusername\Documents\R\Send_Outlook_Email.R
* Find the path to R.exe or Rscript.exe on your computer. If you try to run R.exe from the command line, you enter an R terminal
* In Rscript.exe case you can see additional usage options.
  2. Find the path to R file.
  3. Open Notepad and combine paths together (with quotation marks if needed and additional commands “CMD BATCH” if you choose to go with R.exe).
  1
  "C:\Program Files\R\R-3.4.3\bin\R.exe" CMD BATCH C:\Users\myusername\Documents\R\Send_Outlook_Email.R
  4. Save as file with extension .bat (for example send_email.bat).
  5. Run that batch file to execute R script.
