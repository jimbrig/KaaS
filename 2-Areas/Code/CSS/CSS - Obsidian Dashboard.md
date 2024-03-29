# CSS - Obsidian Dashboard

*Source: [DashboardPlusPlus/dashboard.css at master · TfTHacker/DashboardPlusPlus (github.com)](https://github.com/TfTHacker/DashboardPlusPlus/blob/master/.obsidian/snippets/dashboard.css)*

````css
/* Updated 2022-02-28 */

.dashboard {
    padding-left: 25px !important;
    padding-right: 25px !important;
    padding-top: 20px !important;
}

.dashboard .markdown-preview-section {
    max-width: 100%;
}

/* Title at top of the document */
.dashboard .markdown-preview-section .title {
    top: 60px;
    position: absolute;
    font-size: 26pt !important;
    font-weight: bolder;
    letter-spacing: 8px;
}

.dashboard h1 {
    border-bottom-style: dotted !important;
    border-width: 1px !important;
    padding-bottom: 3px !important;
}

.dashboard div > ul {
    list-style: none;
    display: flex;
    column-gap: 50px;
    row-gap: 30px;
    flex-flow: row wrap;
}

.dashboard div > ul > li {
    min-width: 250px;
    width: 15%;
}
````

---

## Appendix: Links

* [Code](../Code.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[CSS - Obsidian Dashboard]] AND -"Changelog"
````
