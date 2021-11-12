---
Date: <% tp.date.now() %>
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev"]
Alias: "<% tp.file.title %>"
---

# <% tp.file.title %>

*Backlinks:*

```dataview
list from [[<% tp.file.title %>]] AND -"Changelog"
```