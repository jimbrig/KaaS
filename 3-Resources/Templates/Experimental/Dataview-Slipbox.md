<%*
const dv = this.DataviewAPI
const escapePipe = s => new String(s).replace(/\|/, '\\|') // required for links in Markdown table
/*
 You may want to collect your utilities in a central Javascript module below
 the Obsidian vault, e.g. in a file lib/utils.js.
 The file can be included via
 const { escapePipe } = require(app.vault.adapter.basePath + "/lib/utils.js")
*/
%>

| File | Tags |
|:----:|:----:|
<%
// Note that dv.table() cannot be used as it creates HTML but we want Markdown.
dv.pages("path:0-Slipbox")
  // .where(p => p.tags == '0-Slipbox') // a custom attribute, specified like "doctype:: project"
  .map(p => {
    let file = escapePipe(dv.fileLink(p.file.path))
    let tags = p.file.tags.map(t => `${t.text} ${escapePipe(t.link)}`).join('<br>')
    return `|${file}|${tags}|`
  })
  .join("\n")
%>