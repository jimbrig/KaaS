---
Date: <% tp.date.now() %>
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Embedding"]
Alias: "<% tp.file.title %>"
---

# <% tp.file.title %>

**Link:** \<insert link here\>

**Iframe:**

<iframe src="<insert link here>" allow="fullscreen" style="height:100%; width:100%; aspect-ratio: 16/9;"></iframe>

***

*Backlinks:*

```dataview
list from [[<% tp.file.title %>]] AND -"Changelog"
```