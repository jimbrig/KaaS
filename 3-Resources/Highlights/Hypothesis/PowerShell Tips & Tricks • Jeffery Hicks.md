---
doc_type: hypothesis-highlights
url: 'https://jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/'
---
# PowerShell Tips & Tricks • Jeffery Hicks

## Metadata
- Author: [jdhitsolutions.com]()
- Title: PowerShell Tips & Tricks • Jeffery Hicks
- Reference: https://jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/
- Category: #Type/Highlight/Article

## Highlights
- If you can’t run PowerShell effectively in the console, you’ll never be able to write an effective script. — [Updated on 2022-08-28 18:40:24](https://hyp.is/Z9SMuCciEe2-RB9bKkvc7A/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

- Using PowerShell interactively at the console to do your job and writing PowerShell scripts and tools are separate tasks each with its own set of best practices and recommendations. — [Updated on 2022-08-28 18:40:43](https://hyp.is/c1gtTCciEe2LtXeX_Cafqw/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

- Take advantage of Tee-Object. This will allow you to see the results of your command and save them to a variable: get-process | tee -Variable p — [Updated on 2022-08-28 18:40:53](https://hyp.is/eR5YKCciEe2xfB_k4RsFzQ/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

- Consider Get-WmiObject deprecated. Learn to use the CIM cmdlets like Get-CimInstance. — [Updated on 2022-08-28 18:40:58](https://hyp.is/fHcz8CciEe2qxOcydHdbjw/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

- Run Update-Help once a month. Better yet, learn how to set it up as a scheduled job in Windows PowerShell. — [Updated on 2022-08-28 18:41:03](https://hyp.is/fwHUhiciEe2ZmOeixeW3Jw/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

- Use Invoke-Item or its alias ii, to open a folder in Windows Explorer: ii c:\windows — [Updated on 2022-08-28 18:42:58](https://hyp.is/w5ucTiciEe2pSX9gO6KZsw/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

- Use Invoke-Item or its alias ii, to open a folder in Windows Explorer: ii c:\windows — [Updated on 2022-08-28 18:43:21](https://hyp.is/0aIpDCciEe22tW-xVhq0Pg/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: Change current `expl` alias to utilize this method.- Expose yourself to PowerShell every day. Even if you do nothing but closely read full help and examples for a few cmdlets or an about topic. — [Updated on 2022-08-28 18:43:30](https://hyp.is/1q9TAiciEe2_LQ9yqc8qzg/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

- Those who fail to automate are doomed to repeat their work. — [Updated on 2022-08-28 18:43:32](https://hyp.is/1_cSpCciEe2xgd-zBX8ITQ/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

- Don’t forget to look through the PowerShell about topics for help. — [Updated on 2022-08-28 18:43:35](https://hyp.is/2c9VqiciEe2ZoN8ORnH1dQ/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

- If you don’t do something with PowerShell every day, you’ll never really learn it. — [Updated on 2022-08-28 18:43:39](https://hyp.is/2_T9TiciEe2_LvdIPba4gg/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

- Enabling PowerShell Remoting is the easy first step. You still need to do your job and properly secure it. — [Updated on 2022-08-28 18:43:41](https://hyp.is/3V-6oiciEe2Zda9AjO1SmA/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

- View the content of any loaded function: (get-item function:prompt).scriptblock Or get-content function:prompt — [Updated on 2022-08-28 18:43:48](https://hyp.is/4ap5iiciEe2ry3d66r-VhA/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

- The forums at PowerShell.org are your best option for accurate and timely help and answers. — [Updated on 2022-08-28 18:43:56](https://hyp.is/5p_8lCciEe2KuUfxWqiVsw/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

- Open the current directory in VSCode. Great when working on a PowerShell module: code . — [Updated on 2022-08-28 18:44:12](https://hyp.is/8B2P1CciEe2qhB-PUnu0Dg/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: Need support/alias for code-insiders- Get in the habit of using -full when looking at cmdlet help. You could even add a PSDefaultParameterValue. — [Updated on 2022-08-28 18:44:39](https://hyp.is/ADbIGCcjEe2WMJ--9xMwyQ/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: Setup `$PSDefaultParameterValue` 's in PowerShell `$PROFILE`- Take advantage of the Is* variables in your PowerShell scripts like $IsLinux and $IsWindows. — [Updated on 2022-08-28 18:45:01](https://hyp.is/DWK6GicjEe2WMl_3kIvCmw/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: ?- Is your expression not working the way you expect? Learn how to use Trace-Command. — [Updated on 2022-08-28 18:45:08](https://hyp.is/ETmxXCcjEe2y-Z_1aKTSHg/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

- Having trouble installing for finding things from the PowerShell Gallery or GitHub? Add this line to your PowerShell profile script: [Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12 — [Updated on 2022-08-28 18:46:08](https://hyp.is/NNA0OCcjEe2aWZep-1glxA/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: This is huge!

Add to Profile:

```powershell
[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12
```
```- Once you understand the object-nature of PowerShell, you can do a lot with object notation. This is a one-line command using the gcim alias of Get-CimInstance:(gcim win32_operatingsystem).LastBootUpTime.Date.DayofWeek — [Updated on 2022-08-28 18:46:18](https://hyp.is/OuKHkCcjEe2KvYdBXqfYFw/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

- PowerShell Scripting and ToolMaking Know who will use the tool and how they will use it. What will be their expectation?Write one type of object to the pipeline.Use full cmdlet and parameter names in your scripts. No aliases.Be flexible and modular. Always think about re-use.Don’t hard code yourself into a corner. Aim for flexibility.Documentation is critical and not just internal comments.Use the Verb-Noun naming convention for your function and commonly accepted parameter names. Don’t re-invent the wheel.Use meaningful variable names that don’t use Hungarian notation. $strComputername is bad. $Computername is good.Standardize script layout with templates and snippets. Especially important in team environments.White space and formatting is your friend. VSCode can format your scripts for you. Use it.Write your code for the next person. It could be you.Include Write-Verbose messages from the beginning. They will help you develop your code.Learn how to use Write-Progress in place of Write-Host to provide execution details.Avoid using the value localhost as a default parameter value. Use $env:computername which will always resolve to a “real” name. If you need to script cross-platform you can use [environment]::machinename.Just because you can use a long, one-line pipelined expression doesn’t mean you should.Separate the data you need to run your code from the code itself.Avoid using .NET code when a cmdlet will work.Recognize that sometimes PowerShell is not the right solution or tool for the task at hand.Test your code in a PowerShell session with no profile. Even better, test in a virtual machine of the Windows Sandbox to avoid unintended dependencies.Understand the PowerShell paradigm. Don’t write a VBScript using PowerShell commands and think you’re done.If you are creating a graphical PowerShell tool, start with a console-based script or function that already works.Your first step in creating a new script or function is to read help and examples. Not Google or Bing.Leverage splatting to simplify your code.Think about how your code will scale. Don’t write a function that only works with one remote computer. How would you write it to work with 10 or 100 or 1000? Think “managing at scale”.If you need credentials in your script or function use a PSCredential type parameter. Never a username and plain text password.Learn how to use the Platyps module to create help documentation for commands in your PowerShell module. — [Updated on 2022-08-28 18:46:30](https://hyp.is/QjQc1CcjEe20C0NzYoT0HA/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

- Get the scriptblock content of a loaded function. Substitute the name of a function. — [Updated on 2022-08-28 18:47:04](https://hyp.is/Vo3tIicjEe2RJn_HTLQVaA/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: ```powershell
(Get-Item Function:\prompt).scriptblock
```- Copy a function to a remote computer using a PSSession. — [Updated on 2022-08-28 18:48:48](https://hyp.is/lC73KicjEe2qzhuVYd9Bwg/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: ```powershell
$f = $(get-item function:\Get-Foo).scriptblock
Invoke-Command { New-Item -Name Get-Foo -Path Function: -Value $($using:f)} -session $s
```- Get running scheduled tasks on a Windows system. — [Updated on 2022-08-28 18:49:06](https://hyp.is/nvZZRicjEe22vMPekqrUQQ/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: ```powershell
(get-scheduledtask).where({$_.state -eq 'running'})
```- List installed applications and a few details. But use with caution. It is slow, not necessarily complete, and could have unexpected consequences. Here’s a good link about using this class and alternatives. — [Updated on 2022-08-28 18:49:34](https://hyp.is/r8D78CcjEe2pUWOKGVxr9w/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: ```powershell
gcim win32_product -computername $env:computername | 
Sort-Object -property Vendor,Name | Select-Object -property Vendor,Name,
@{Name="Installed";Expression = {($_.InstallDate.Insert(4,"-").insert(7,"-") -as [datetime]).ToShortDateString()}},
InstallLocation,InstallSource,PackageName,Version
```- Get details about all external scripts in your %PATH%. — [Updated on 2022-08-28 18:49:51](https://hyp.is/ueCEZicjEe2q0qM4oHYtbQ/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: ```powershell
gcm -commandtype externalscript | Get-Item | 
Select-Object Directory,Name,Length,CreationTime,LastwriteTime,
@{name="Signature";Expression={(Get-AuthenticodeSignature $_.fullname).Status }}
```- Get folder utilization for a given directory. — [Updated on 2022-08-28 18:50:18](https://hyp.is/ynIPFicjEe2WkJcdrkJ94w/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: ```powershell
dir -path C:\Scripts -file -recurse -force | 
measure-object length -sum -max -average | 
Select-Object @{name="Total Files";Expression={$_.count}},
@{name="Largest File(MB)";Expression={"{0:F2}" -f ($_.maximum/1MB)}},
@{name="Average Size(MB)";Expression={"{0:F2}" -f ($_.average/1MB)}},
@{name="Total Size(MB)";Expression={"{0:F2}" -f ($_.sum/1MB)}}
```- Get free space for drive C on the local computer formatted in GB — [Updated on 2022-08-28 18:50:31](https://hyp.is/0b326icjEe2q1KObImSPMg/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: ```powershell
(gcim win32_logicaldisk -filter "deviceid = 'C:'").FreeSpace/1gb
#or use the PSDrive
(gdr c).Free/1gb
```- Get configured TrustedHosts. — [Updated on 2022-08-28 18:51:10](https://hyp.is/6QXihicjEe2J8a-s_oz23A/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: ```powershell
(get-wsmaninstance wsman/config/client).trustedhosts
```- Get all drives identified by a standard drive letter. I’m suppressing errors to ignore non-existent drive letters. — [Updated on 2022-08-28 18:51:29](https://hyp.is/9GKWLicjEe2xjiesV4psNw/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: ```powershell
get-volume -driveletter (97..122) -ErrorAction SilentlyContinue
```- Get total physical memory formatted as GB. — [Updated on 2022-08-28 18:51:57](https://hyp.is/BRflgickEe2-Uadyc4qwDQ/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: ```powershell
gcim win32_computersystem -computer SRV1,SRV2 | Select PSComputername,@{Name="Memory";Expression={$_.TotalPhysicalMemory/1GB -as [int]}}
```- Get IPv4 addresses on your local adapters. — [Updated on 2022-08-28 18:52:11](https://hyp.is/DSFVxCckEe2LxusiPsZJ2Q/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: ```powershell
Get-NetIPAddress -AddressFamily IPv4 | where-object IPAddress -notmatch "^(169)|(127)" | Sort-Object IPAddress | select IPaddress,Interface*
```- Find all processes that use a given module (dll). You can filter by the dll name or use part of a path. — [Updated on 2022-08-28 18:52:34](https://hyp.is/GzOgcickEe2WNR-vjohFsg/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: ```powershell
get-process | Where { $_.Modules.filename -match "netapi32.dll"}
```- Since PowerShell Core and PowerShell 7 do not include the Get-Eventlog cmdlet, here’s a one-liner to list the last 10 errors in the System event log. A level value of 3 will give you warnings. — [Updated on 2022-08-28 18:52:55](https://hyp.is/J8_E0ickEe2qkl95bd__2w/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: ```powershell
get-winevent -FilterHashtable @{Logname = 'System';Level=2} -MaxEvents 10 | sort-Object ProviderName,TimeCreated
```- List all PowerShell profile script settings. You will see different values for different hosts, such as the PowerShell ISE, as well as between Windows PowerShell and PowerShell 7. — [Updated on 2022-08-28 18:53:25](https://hyp.is/Obw7dickEe2aY8-8e50EkQ/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: ```powershell
$profile | select *host* | format-list
```- Get the current date and time formatted as UTC time. — [Updated on 2022-08-28 18:53:49](https://hyp.is/R8cUNCckEe2WlJs7ZErcHQ/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: ```powershell
(get-date).ToUniversalTime()
#or pretty it up
"$((get-date).ToUniversalTime()) UTC"
"$((Get-Date).ToUniversalTime().tolongdatestring()) UTC"
```- Get a formatted report of all commands with a synopsis. — [Updated on 2022-08-28 18:54:09](https://hyp.is/U4kdiickEe2ZsEOwdsQl1Q/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: ```powershell
(Get-Command).where({ $_.source }) | Sort-Object Source, CommandType, Name | Format-Table -GroupBy Source -Property CommandType, Name, @{Name = "Synopsis"; Expression = {(Get-Help $_.name).Synopsis}}
```- How long has your PowerShell session been running? — [Updated on 2022-08-28 18:54:28](https://hyp.is/XvBq6CckEe2zBfNbJf8T8g/jdhitsolutions.com/blog/powershell-tips-tricks-and-advice/)  — Group: #Development

   - Annotation: ```powershell
(Get-Date) - (get-process -id $pid).starttime
```
