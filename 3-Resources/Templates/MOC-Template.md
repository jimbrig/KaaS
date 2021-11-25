---
Date: <% tp.date.now() %>
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/MOC"]
Alias: "<% tp.file.title %>"
---

# <% tp.file.title %>

*<% tp.file.title %>* Map of Content houses all notes related to <% tp.file.title %> in general.

## Notes

## Related MOCs

## Dataviews

### Tagged as *Category/<% tp.file.title %>*

```dataview
list from #Category/<% tp.file.title %> AND -"Templates" AND -"MOCs" AND -"Changelog"
```

### Links to this File

```dataview
list from [[<% tp.file.title %>]] AND -"Changelog"
```