---
Date: 2021-11-12
Author: Jimmy Briggs <jimmy.briggs@pwc.com>
Tags: ["#Type/Readme"]
Alias: Slipbox
---

# Slipbox

*Contents*

%% Error: Cannot create a waypoint in a note that's not the folder note. For more information, check the instructions [here](https://github.com/IdreesInc/Waypoint) %%



```dataview
TABLE Date, Tags
FROM "0-Slipbox" AND !#Type/Readme AND -"_assets"
SORT date, file
```

***

*Backlinks*

```dataview
list from [[_README]] AND -"Changelog"
```