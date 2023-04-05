# VBA - Launch Edit Links Dialog

## Code

To open the default *External Links Manager* Dialog in Excel using [VBA](VBA.md), you can use the *VBA Sub Procedure* below:

````VBA
Public Sub ExternalLinksMgr()

  Application.CommandBars.FindControl(ID:=759).Execute

End Sub
````

## Notes

* This VBA uses the `Application.CommandBars` collection’s method `FindControl` for the supplied ID of `759`.

---

## Appendix: Links

* *Code*
* [Development](../../MOCs/Development.md)
* [Excel](../Excel/Excel.md)
* [Microsoft Office](../../../3-Resources/Tools/Microsoft%20Office/Microsoft%20Office.md)
* [Excel - VBA](../../../3-Resources/Tools/Microsoft%20Office/Excel/Excel%20-%20VBA.md)

*Backlinks:*

````dataview
list from [[VBA - Launch Edit Links Dialog]] AND -"Changelog"
````
