---
Date: "<% tp.date.now() %>"
Author: Jimmy Briggs <jimmy.briggs@pwc.com>
Tags:
  - "#Type/Person"
Aliases:
  - "<% tp.file.cursor(8) %>"
---

# \<% tp.file.title %>

## Work

* I work with \<% tp.file.title %> on:

## Details

* Job Title: \<% tp.file.cursor(1) %>
* Area: \<% tp.file.cursor(2) %>
* Company: **PwC**
* Email: \<% tp.file.cursor(3) %>
* Phone: \<% tp.file.cursor(4) %>
* Location: \<% tp.file.cursor(5) %>
* Employee ID: \<% tp.file.cursor(6) %>

## Links

FILL IN HREF BELOW

<details>
    <summary>Click to View:
        <link>
        <a href="<% tp.file.cursor(7) %>">Google Contact Page</a>
    </summary>
    <p>
    <div style="display: block;
        position: relative; width: 100%; height: 0px; --aspect-ratio:9/16;
        padding-bottom: calc(var(--aspect-ratio) * 100%);"><iframe
            src="https://contacts.google.com/person/116122592750514227051" allow="fullscreen" style="position: absolute; top: 0px; left: 0px;
            height: 100%; width: 100%;"></iframe></div>
    </p>
</details>

---

*Backlinks*

````dataview
list from [[<% tp.file.title %>]] AND -"Meta/Changelog"
````
