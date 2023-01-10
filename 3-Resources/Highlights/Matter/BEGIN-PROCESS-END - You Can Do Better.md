## Metadata
* URL: [https://www.breakingpwsh.com/articles/beginprocessend-you-can-do-better](url)
* Publisher: www.breakingpwsh.com
* Tags: #microsoft, #pwsh

## Highlights
* When creating advanced functions or cmdlets, the processing always follows the same basic flow. Blocks of code are processed starting with block BEGIN, then PROCESS, followed by END. BEGIN for setting up and assigning variables. PROCESS does the bulk of code. END is for cleanup of vars, close files, close logs, etc. So what if in some scenarios the order needs to change? What if you want to skip PROCESS?
