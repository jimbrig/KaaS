---
Date: 2022-01-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev"]
Alias: "Creating Desktop Electron Apps with Nativefier"
---

# Creating Desktop Electron Apps with Nativefier

## GSuite

```powershell
nativefier 'https://calendar.google.com/calendar' `
	--user-agent firefox `
	--portable "nativefier" `
	--internal-urls ".*?\.google\.*?" `
	-m --bookmarks-menu '.\nativefier\GSuite\menuBar.json'
	--arch x64 `
	--icon "$ONEDRIVE\Pictures\Icons"
```

*Backlinks:*

```dataview
list from [[Creating Desktop Electron Apps with Nativefier]] AND -"Changelog"
```