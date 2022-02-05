---
Date: <% tp.date.now() %>
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Readme"]
Alias: <% tp.file.folder() %>
---

# <% tp.file.folder() %>

*Contents*

```dataview
list from "<% tp.file.folder(true) %>" AND !#Type/Readme
```

***

*Backlinks*

```dataview
list from [[<% tp.file.title %>]] AND -"Changelog"
```