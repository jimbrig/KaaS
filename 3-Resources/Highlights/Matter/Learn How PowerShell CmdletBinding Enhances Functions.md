## Metadata
* URL: [https://adamtheautomator.com/powershell-cmdletbinding/](https://adamtheautomator.com/powershell-cmdletbinding/)
* Published Date: 2022-05-05
* Author: [[Samuel Ogunleke]]

## Highlights
* Have you ever wanted to create a PowerShell cmdlet but didn’t know C# or another Microsoft .NET Framework language? Why keep ‘wanting’ when you have PowerShell CmdletBinding at your fingertips?
* Creating a Basic Function to Organize Files with PowerShell
* A basic PowerShell function is not defined as having just a few lines of code. “Basic” in this context means that the function lacks the features of a PowerShell cmdlet. The function doesn’t have common parameters, and there’s no full control over the parameters available.
* Gaining Access to Common Parameters with the CmdletBinding Attribute
* After running the code above, you may have noticed that all the files just moved without asking you to confirm. Moreover, the function didn’t tell you what would happen if you ran the code. You’ll learn more about enhancing the function with CmdletBinding in the following sections.
* You’ve seen that a basic function works fine. But perhaps you prefer to make parameters mandatory or add a confirm action dialog box? If so, the CmdletBinding attribute will do the trick! The CmdletBinding attribute allows you to use common parameters available for PowerShell cmdlets.
* Advanced functions work like PowerShell cmdlets. With an advanced function, you can access all the common parameters available for cmdlets. But as you’ve seen, advanced functions are written in the PowerShell language while cmdlets are written in a Microsoft .NET Framework language, such as C#.