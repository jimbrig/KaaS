---
Date: <% tp.date.now() %>
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: 
- "#Type/{{Type}}"
- "#Topic/{{Topic}}"
Alias: 
- "<% tp.file.title %>"
- "{{Alias}}"
---

# <% tp.file.title %>

*Source: {{source}}*

***

## Appendix: Links

- [[{{MOC}}]]
- [[{{Link1}}]]
- [[{{Link2}}]]
- [[{{Link3}}]]

*Backlinks:*

```dataview
list from [[<% tp.file.title %>]] AND -"Changelog"
```