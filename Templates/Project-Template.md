---
Date: "<% tp.date.now() %>"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags:
  - "#Type/Project"
  - "#Topic/PwC"
Alias: "<% tp.file.cursor() %>"
---

# \<% tp.file.title %>

* 🔗 - \< add link to Todoist project here >
* 📁 - \< add URI/path to project directory here >

## Contents

````dataview
list from "<% tp.file.folder(true) %>" AND !#Type/Readme AND -"Changelog"
````

---

*Backlinks*

````dataview
list from [[<% tp.file.title %>]] AND -"Changelog"
````
