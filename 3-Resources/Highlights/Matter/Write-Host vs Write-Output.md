## Metadata
* URL: [https://www.breakingpwsh.com/articles/write-host-vs-write-output-the-final-argument](url)
* Publisher: www.breakingpwsh.com
* Tags: #Development, #Technology, #Tools, #design, #dev, #microsoft, #pwsh

## Highlights
* Let's compare the 2 cmdlets to start. Write-Host is the cmdlet to use if you want to write to the screen, possibly with colors, to show the user some output text while the script is running. Maybe you're iterating through a list of servers, or when you hit a different stage of the script, and want to keep the user informed of current state. Write-Output is very similar and can be used in the same instances - minus the colorful part. The advantage of Write-Output is that the text can be piped to the "stream" or "pipeline" and used by a cmdlet further in the pipeline. Maybe even passed to another script. Thats the big difference there - -Host is for humans, -Output is for the powershell host. There is no right or wrong cmdlet. It's only using the right cmdlet in the right context.
