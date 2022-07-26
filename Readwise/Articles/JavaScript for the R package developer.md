---
Date: 2022-07-17
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: Matter
Link: https://blog.r-hub.io/2020/08/25/js-r/
Tags: ["#Type/Highlight/Article"]
Aliases: ["JavaScript for the R package developer", "JavaScript for the R package developer"]
---
# JavaScript for the R package developer

## Metadata
- Author: [[Maëlle Salmon]]
- Full Title: JavaScript for the R package developer
- Category: #Type/Highlight/Article
- URL: https://blog.r-hub.io/2020/08/25/js-r/

## Highlights
- At a basic level, knitr includes a JavaScript chunk engine that writes the code in JavaScript chunks marked with ````{js}into a<script>` tag in the HTML document. The JS code is then rendered in the browser when the reader opens the output document! Now, what about executing JS code at compile time i.e. when knitting? For that the experimental bubble package provides a knitr engines that uses Node to run JavaScript chunks and insert the results in the rendered output.
- JavaScript in your R package
- Bundling JavaScript code
- The easiest way to interface JavaScript code from an R package is using the V8 package. From its docs, “A major advantage over the other foreign language interfaces is that V8 requires no compilers, external executables or other run-time dependencies. The entire engine is contained within a 6MB package (2MB zipped) and works on all major platforms.” V8 documentation includes a vignette on how to use JavaScript libraries with V8. Some examples of use include the js package, “A set of utilities for working with JavaScript syntax in R"; jsonld for working with, well, JSON-LD where LD means Linked Data; slugify (not on CRAN) for creating slugs out of strings.
- For another approach, depending on a local NodeJS and Node Package Manager (NPM) installation, see Colin Fay’s blog post “How to Write an R Package Wrapping a NodeJS Module”. An interesting read about NPM and R, even if you end up going the easier V8 route.
- JavaScript for your package documentation
- The roxygenlabs package, that is an incubator for experimental roxygen features, includes a way to add JS themes to your documentation. With its default JS script, your examples gain a copy-paste button! Noam Ross once described a way to include a searchable table in reference pages, with DT.
- Web dependency management HTML Dependencies
- A third, and most common, way in which you as an R package developer might interact with JavaScript is to repackage web dependencies, such as JavaScript and CSS libraries, that enhance HTML documents and Shiny apps! For that, you’ll want to learn about the htmltools package, in particular for its htmlDependency() function.
- As Hadley Wickham describes in the Managing JavaScript/CSS dependencies section of Mastering Shiny, an HTML dependency object describes a single JavaScript/CSS library, which often contains one or more JavaScript and/or CSS files and additional assets. As an R package author providing reusable web components for Shiny or R Markdown, in Hadley’s words, you “absolutely should be using HTML dependency objects rather than calling tags$link(), tags$script(), includeCSS(), or includeScript() directly.”
- htmlDependency()
- There are two main advantages to using htmltools::htmlDependency(). First, HTML dependencies can be included with HTML generated with htmltools, and htmltools will ensure that the dependencies are loaded only once per page, even if multiple components appear on a page. Second, if components from different packages depend on the same JavaScript or CSS library, htmltools can detect and resolve conflicts and load only the most recent version of the same dependency.
- JS and package robustness
