# Pandoc - Convert Word to Markdown

*Source: https://pandoc.org/MANUAL.html#reader-options*

Initial attempt:

````powershell
pandoc -s example30.docx -t markdown -o example35.md
````

results with a couple issues:

* lines limited to 80 characters - can fix via `-no-wrap` argument
* links do not use reference style - can fix via `-reference-links` argument

````powershell
pandoc -s example30.docx --wrap=none --reference-links -t markdown -o example35.md
````

## Word to Markdown Logic

Markdown has become the *de-facto* standard for [writing software documentation](https://www.amazon.com/Modern-Technical-Writing-Introduction-Documentation-ebook/dp/B01A2QL9SS). This post documents my experience using Pandoc to convert Word documents (docx) to markdown.

To follow along, [install](https://pandoc.org/installing.html) Pandoc, if you haven’t done so already. Word documents need to be in the [docx](http://www.ecma-international.org/publications/standards/Ecma-376.htm) format. Legacy binary doc files are not supported.

Pandoc supports several flavors of markdown such as the popular [GitHub flavored Markdown](https://github.github.com/gfm/) (GFM). To produce a standalone GFM document from docx, run.

````powershell
pandoc -t gfm --extract-media . -o file.md file.docx
````

The `--extract-media` option tells Pandoc to extract media to a `./media` folder.

### Creating PDF

To create a PDF, run

````powershell
pandoc file.md -f gfm -o file.pdf --toc -N
````

Pandoc requires \[Math Processing Error\]LaTeX to produce the PDF. Remove `--toc` option if you don’t want Pandoc to create a table of contents (TOC). Remove `-N` option if you don’t want it to number sections automatically.

---

## Appendix: Links

* https://tewarid.github.io/2017/12/04/word-to-markdown-using-pandoc.html

* https://ronn-bundgaard.dk/blog/convert-docx-to-markdown-with-pandoc/

* [Code](../Code.md)

* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[Pandoc - Convert Word to Markdown]] AND -"Changelog"
````
