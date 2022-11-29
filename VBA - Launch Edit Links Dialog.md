---
Date: 2022-11-29
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/VBA", "#Topic/Dev"]
Alias: ["VBA - Launch Edit Links Dialog"]
---

# VBA - Launch Edit Links Dialog

## Code

To open the default *External Links Manager* Dialog in Excel using [[VBA]], you can use the [[VBA Sub Procedure]] below:

```VBA
Public Sub ExternalLinksMgr()

  Application.CommandBars.FindControl(ID:=759).Execute

End Sub
```

## Notes

- This VBA uses the `Application.CommandBars` collection’s method `FindControl` for the supplied ID of `759`.

***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[Development]]
- [[Excel]]
- [[Microsoft Office]]
- [[Excel - VBA]]

*Backlinks:*

```dataview
list from [[VBA - Launch Edit Links Dialog]] AND -"Changelog"
```