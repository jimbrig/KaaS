---
Date: 2022-07-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool/Documentation", "#Topic/Dev/VBA"]
Alias: ["Dr. Explain"]
---

# DrExplain

*Source: https://www.drexplain.com/

Dr. Explain is an awesome documentation tool for developing, generating, and exporting help files in [[3-Resources/Tools/Developer Tools/Languages/HTML/_README|HTML]], [[CHM]], or [[3-Resources/PDFs/_README|PDF]] format. Currently, there are not many products available for generating the classic windows help-file `.chm` format.

To add your exported `.chm` help to an existing [[Excel - VBA|VBA]] project, add code such as the following to a VBA module and/or a RibbonX callback Sub-module to launch the help file user guide:

```vba
Call Shell("explorer.exe " & ActiveWorkbook.Path & "\Documentation\Help.chm", vbNormalFocus)
```

Assuming your help files is located in a directory named "Documentation" with file name "Help.chm" this code would launch the file using [[Excel - VBA|VBA]] directly.

If you have a custom `RibbonX` [[XML]] `customUI14.xml` file contained within your project, and a button or control related to HELP or DOCS the callback for VBA would look like so:

```VBA
'Callback for bttnHelp onAction
Sub viewHelp_callback(control As IRibbonControl)

  Call Shell("explorer.exe " & ActiveWorkbook.Path & "\Documentation\PayoutProcessGuide.chm", vbNormalFocus)

End Sub
```

![[Pasted image 20220701103614.png]]

You can also associate the CHM file with your VBA project via the VBE Editor's Project Properties window:

![[Pasted image 20220701103425.png]]



***

## Appendix: Links

- [[3-Resources/Tools/_README|Tools]]
- [[Excel - VBA|VBA]]
- [[2-Areas/Code/Windows/Visual Basic/Excel VBA/_README|VBA]]
- [[Microsoft]]
- [[Development]]
- [[3-Resources/Tools/Developer Tools/Documentation/_README|Documentation]]
- [[Excel]]

*Backlinks:*

```dataview
list from [[DrExplain]] AND -"Changelog"
```