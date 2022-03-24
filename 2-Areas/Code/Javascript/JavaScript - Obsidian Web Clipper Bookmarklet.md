---
Date: 2022-03-23
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code", "#Topic/PKM/Obsidian", "#Type/Tool/Obsidian", "#Topic/Dev/JavaScript"]
Alias: ["Obsidian Web Clipper Bookmarklet"]
---

# Obsidian Web Clipper Bookmarklet

*Source: [Obsidian Web Clipper Bookmarklet to save articles and pages from the web (for Safari, Chrome, Firefox, and mobile browsers)](https://gist.github.com/jimbrig/6ba6fd7c28957cc4db5d1f0063fae71e)*

## Contents

- [[#Overview|Overview]]
	- [[#Demo|Demo]]
	- [[#Installation|Installation]]
	- [[#Usage|Usage]]
	- [[#Troubleshooting|Troubleshooting]]
- [[#Scripts|Scripts]]
	- [[#obsidian-web-clipper.js|obsidian-web-clipper.js]]
	- [[#obsidian-web-clipper.min.js|obsidian-web-clipper.min.js]]
- [[#Appendix: Links|Appendix: Links]]


## Overview

### Demo
You can find a demo of this bookmarklet [on YouTube](https://www.youtube.com/watch?v=Vy1MdjickAI)

### Installation
Create a new bookmark in your browser, then copy/paste the minified code below into the URL field. 

You can customize the output using the optional variables at the top, and the template at the bottom. The default template is designed for use with the [[Dataview]] plugin. 

If you make changes I recommend using [Bookmarklet Maker](https://caiorss.github.io/bookmarklet-maker/) ([[Bookmarklet Maker]]) to minify and URI encode the bookmarklet.

### Usage

By default, clicking the bookmarklet creates a new Obsidian file from the main body of the article (similar to Readability view). Alternatively you can choose to create a file from a selection, by either selecting all (`CMD+A`), or just a portion of the page.

### Troubleshooting

This bookmarklet may not work on all websites. If you run into issues, you can also try the [MarkDownload browser extension](https://forum.obsidian.md/t/markdownload-markdown-web-clipper/173) which provides similar functionality. You can troubleshoot issues by opening the Developer Console in your browser and checking if any errors appear when you click the bookmarklet. The most common error is that a website or the browser itself is blocking third party code execution. Unfortunately there is no good solve for that yet.

## Custom Enhancements

Enhancements I added to fit my custom needs:

- Added const for vault = `"KaaS"`

- Added const for folder = `"3-Resources/Clippings/"`

- Added const for tags = `"[\"#Type/Clipping\"]"`


- Enhanced the `fileContent` const:
    - Added [[YAML]] header instead of dataview syntax 
    - In YAML header added:
        - Date - today's date
        - Author - made myself as actual authors are typically `null`
        - Tags - Defaults to `#Type/Clipping`
        - Alias - equals `title`
    - Added a title with markdown syntax (i.e. `# TITLE`)
    - Added the source below the title (i.e. `*Source: [title](url)*`)
    - Added an Appendix: Links section (i.e. `## Appendix: Links`)
    - Added references for:
        - [[JavaScript - Obsidian Web Clipper Bookmarklet|Obsidian Web Clipper Bookmarklet]] (this note!)
        - [[3-Resources/Clippings/_README|Clippings]] Folder's README

```javascript
const fileContent = 
      "---\n"
      + "Date: " + today + "\n" 
      + "Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>\n"
      + "Tags: " + tags + "\n"
      + "Alias: \"" + title + "\"\n"
      + "---\n\n"
      + "# " + title + "\n"  
      + "\n*Source: [" + title + "](" + document.URL + ")*\n\n"
      + markdownBody 
      + "\n\n***\n\n"
      + "## Appendix: Links\n" 
      + "\n- [[JavaScript - Obsidian Web Clipper Bookmarklet|Obsidian Web Clipper Bookmarklet]]"
      + "\n- [[3-Resources/Clippings/_README|Clippings]]"
      + "\n";
```

## Scripts

### Customized obsidian-web-clipper.js
- [obsidian-web-clipper-kaas.js](https://gist.github.com/jimbrig/6ba6fd7c28957cc4db5d1f0063fae71e#file-obsidian-web-clipper-kaas-js):


```javascript
javascript: Promise.all([import('https://unpkg.com/turndown@6.0.0?module'), import('https://unpkg.com/@tehshrike/readability@0.2.0'), ]).then(async ([{
    default: Turndown
}, {
    default: Readability
}]) => {

  /* Optional vault name */
  const vault = "KaaS";

  /* Optional folder name such as "Clippings/" */
  const folder = "3-Resources/Clippings/";

  /* Optional tags  */
  const tags = "[\"#Type/Clipping\"]";

  function getSelectionHtml() {
    var html = "";
    if (typeof window.getSelection != "undefined") {
        var sel = window.getSelection();
        if (sel.rangeCount) {
            var container = document.createElement("div");
            for (var i = 0, len = sel.rangeCount; i < len; ++i) {
                container.appendChild(sel.getRangeAt(i).cloneContents());
            }
            html = container.innerHTML;
        }
    } else if (typeof document.selection != "undefined") {
        if (document.selection.type == "Text") {
            html = document.selection.createRange().htmlText;
        }
    }
    return html;
  }

  const selection = getSelectionHtml();

  const {
      title,
      byline,
      content
  } = new Readability(document.cloneNode(true)).parse();

  function getFileName(fileName) {
    var userAgent = window.navigator.userAgent,
        platform = window.navigator.platform,
        windowsPlatforms = ['Win32', 'Win64', 'Windows', 'WinCE'];

    if (windowsPlatforms.indexOf(platform) !== -1) {
      fileName = fileName.replace(':', '').replace(/[/\\?%*|"<>]/g, '-');
    } else {
      fileName = fileName.replace(':', '').replace(/\//g, '-').replace(/\\/g, '-');
    }
    return fileName;
  }
  const fileName = getFileName(title);

  if (selection) {
      var markdownify = selection;
  } else {
      var markdownify = content;
  }

  if (vault) {
      var vaultName = '&vault=' + encodeURIComponent(`${vault}`);
  } else {
      var vaultName = '';
  }

  const markdownBody = new Turndown({
      headingStyle: 'atx',
      hr: '---',
      bulletListMarker: '-',
      codeBlockStyle: 'fenced',
      emDelimiter: '*',
  }).turndown(markdownify);

  var date = new Date();

  function convertDate(date) {
    var yyyy = date.getFullYear().toString();
    var mm = (date.getMonth()+1).toString();
    var dd  = date.getDate().toString();
    var mmChars = mm.split('');
    var ddChars = dd.split('');
    return yyyy + '-' + (mmChars[1]?mm:"0"+mmChars[0]) + '-' + (ddChars[1]?dd:"0"+ddChars[0]);
  }

  const today = convertDate(date);

  const fileContent = 
      "---\n"
      + "Date: " + today + "\n" 
      + "Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>\n"
      + "Tags: " + tags + "\n"
      + "Alias: \"" + title + "\"\n"
      + "---\n\n"
      + "# " + title + "\n"  
      + "\n*Source: [" + title + "](" + document.URL + ")*\n\n"
      + markdownBody 
      + "\n\n***\n\n"
      + "## Appendix: Links\n" 
      + "\n- [[JavaScript - Obsidian Web Clipper Bookmarklet|Obsidian Web Clipper Bookmarklet]]"
      + "\n- [[3-Resources/Clippings/_README|Clippings]]"
      + "\n";
  
  document.location.href = "obsidian://new?"
    + "file=" + encodeURIComponent(folder + fileName)
    + "&content=" + encodeURIComponent(fileContent)
    + vaultName ;
})
```

### Generic obsidian-web-clipper.js

- [`obsidian-web-clipper.js`](https://gist.github.com/jimbrig/6ba6fd7c28957cc4db5d1f0063fae71e#file-obsidian-web-clipper-js):

```javascript
javascript: Promise.all([import('https://unpkg.com/turndown@6.0.0?module'), import('https://unpkg.com/@tehshrike/readability@0.2.0'), ]).then(async ([{
    default: Turndown
}, {
    default: Readability
}]) => {

  /* Optional vault name */
  const vault = "";

  /* Optional folder name such as "Clippings/" */
  const folder = "";

  /* Optional tags  */
  const tags = "#clippings";

  function getSelectionHtml() {
    var html = "";
    if (typeof window.getSelection != "undefined") {
        var sel = window.getSelection();
        if (sel.rangeCount) {
            var container = document.createElement("div");
            for (var i = 0, len = sel.rangeCount; i < len; ++i) {
                container.appendChild(sel.getRangeAt(i).cloneContents());
            }
            html = container.innerHTML;
        }
    } else if (typeof document.selection != "undefined") {
        if (document.selection.type == "Text") {
            html = document.selection.createRange().htmlText;
        }
    }
    return html;
  }

  const selection = getSelectionHtml();

  const {
      title,
      byline,
      content
  } = new Readability(document.cloneNode(true)).parse();

  function getFileName(fileName) {
    var userAgent = window.navigator.userAgent,
        platform = window.navigator.platform,
        windowsPlatforms = ['Win32', 'Win64', 'Windows', 'WinCE'];

    if (windowsPlatforms.indexOf(platform) !== -1) {
      fileName = fileName.replace(':', '').replace(/[/\\?%*|"<>]/g, '-');
    } else {
      fileName = fileName.replace(':', '').replace(/\//g, '-').replace(/\\/g, '-');
    }
    return fileName;
  }
  const fileName = getFileName(title);

  if (selection) {
      var markdownify = selection;
  } else {
      var markdownify = content;
  }

  if (vault) {
      var vaultName = '&vault=' + encodeURIComponent(`${vault}`);
  } else {
      var vaultName = '';
  }

  const markdownBody = new Turndown({
      headingStyle: 'atx',
      hr: '---',
      bulletListMarker: '-',
      codeBlockStyle: 'fenced',
      emDelimiter: '*',
  }).turndown(markdownify);

  var date = new Date();

  function convertDate(date) {
    var yyyy = date.getFullYear().toString();
    var mm = (date.getMonth()+1).toString();
    var dd  = date.getDate().toString();
    var mmChars = mm.split('');
    var ddChars = dd.split('');
    return yyyy + '-' + (mmChars[1]?mm:"0"+mmChars[0]) + '-' + (ddChars[1]?dd:"0"+ddChars[0]);
  }

  const today = convertDate(date);

  const fileContent = 
      "author:: " + byline + "\n"
      + "source:: [" + title + "](" + document.URL + ")\n"
      + "clipped:: [[" + today + "]]\n"
      + "published:: \n\n" 
      + tags + "\n\n"
      + markdownBody ;
  
  document.location.href = "obsidian://new?"
    + "file=" + encodeURIComponent(folder + fileName)
    + "&content=" + encodeURIComponent(fileContent)
    + vaultName ;
})
```

### obsidian-web-clipper.min.js

- [`obsidian-web-clipper.min.js`](https://gist.github.com/jimbrig/6ba6fd7c28957cc4db5d1f0063fae71e#file-obsidian-web-clipper-min-js):

```javascript
javascript:(function()%7Bjavascript%3A%20Promise.all(%5Bimport('https%3A%2F%2Funpkg.com%2Fturndown%406.0.0%3Fmodule')%2C%20import('https%3A%2F%2Funpkg.com%2F%40tehshrike%2Freadability%400.2.0')%2C%20%5D).then(async%20(%5B%7B%0A%20%20%20%20default%3A%20Turndown%0A%7D%2C%20%7B%0A%20%20%20%20default%3A%20Readability%0A%7D%5D)%20%3D%3E%20%7B%0A%0A%20%20%2F*%20Optional%20vault%20name%20*%2F%0A%20%20const%20vault%20%3D%20%22%22%3B%0A%0A%20%20%2F*%20Optional%20folder%20name%20such%20as%20%22Clippings%2F%22%20*%2F%0A%20%20const%20folder%20%3D%20%22%22%3B%0A%0A%20%20%2F*%20Optional%20tags%20%20*%2F%0A%20%20const%20tags%20%3D%20%22%23clippings%22%3B%0A%0A%20%20function%20getSelectionHtml()%20%7B%0A%20%20%20%20var%20html%20%3D%20%22%22%3B%0A%20%20%20%20if%20(typeof%20window.getSelection%20!%3D%20%22undefined%22)%20%7B%0A%20%20%20%20%20%20%20%20var%20sel%20%3D%20window.getSelection()%3B%0A%20%20%20%20%20%20%20%20if%20(sel.rangeCount)%20%7B%0A%20%20%20%20%20%20%20%20%20%20%20%20var%20container%20%3D%20document.createElement(%22div%22)%3B%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20(var%20i%20%3D%200%2C%20len%20%3D%20sel.rangeCount%3B%20i%20%3C%20len%3B%20%2B%2Bi)%20%7B%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20container.appendChild(sel.getRangeAt(i).cloneContents())%3B%0A%20%20%20%20%20%20%20%20%20%20%20%20%7D%0A%20%20%20%20%20%20%20%20%20%20%20%20html%20%3D%20container.innerHTML%3B%0A%20%20%20%20%20%20%20%20%7D%0A%20%20%20%20%7D%20else%20if%20(typeof%20document.selection%20!%3D%20%22undefined%22)%20%7B%0A%20%20%20%20%20%20%20%20if%20(document.selection.type%20%3D%3D%20%22Text%22)%20%7B%0A%20%20%20%20%20%20%20%20%20%20%20%20html%20%3D%20document.selection.createRange().htmlText%3B%0A%20%20%20%20%20%20%20%20%7D%0A%20%20%20%20%7D%0A%20%20%20%20return%20html%3B%0A%20%20%7D%0A%0A%20%20const%20selection%20%3D%20getSelectionHtml()%3B%0A%0A%20%20const%20%7B%0A%20%20%20%20%20%20title%2C%0A%20%20%20%20%20%20byline%2C%0A%20%20%20%20%20%20content%0A%20%20%7D%20%3D%20new%20Readability(document.cloneNode(true)).parse()%3B%0A%0A%20%20function%20getFileName(fileName)%20%7B%0A%20%20%20%20var%20userAgent%20%3D%20window.navigator.userAgent%2C%0A%20%20%20%20%20%20%20%20platform%20%3D%20window.navigator.platform%2C%0A%20%20%20%20%20%20%20%20windowsPlatforms%20%3D%20%5B'Win32'%2C%20'Win64'%2C%20'Windows'%2C%20'WinCE'%5D%3B%0A%0A%20%20%20%20if%20(windowsPlatforms.indexOf(platform)%20!%3D%3D%20-1)%20%7B%0A%20%20%20%20%20%20fileName%20%3D%20fileName.replace('%3A'%2C%20'').replace(%2F%5B%2F%5C%5C%3F%25*%7C%22%3C%3E%5D%2Fg%2C%20'-')%3B%0A%20%20%20%20%7D%20else%20%7B%0A%20%20%20%20%20%20fileName%20%3D%20fileName.replace('%3A'%2C%20'').replace(%2F%5C%2F%2Fg%2C%20'-').replace(%2F%5C%5C%2Fg%2C%20'-')%3B%0A%20%20%20%20%7D%0A%20%20%20%20return%20fileName%3B%0A%20%20%7D%0A%20%20const%20fileName%20%3D%20getFileName(title)%3B%0A%0A%20%20if%20(selection)%20%7B%0A%20%20%20%20%20%20var%20markdownify%20%3D%20selection%3B%0A%20%20%7D%20else%20%7B%0A%20%20%20%20%20%20var%20markdownify%20%3D%20content%3B%0A%20%20%7D%0A%0A%20%20if%20(vault)%20%7B%0A%20%20%20%20%20%20var%20vaultName%20%3D%20'%26vault%3D'%20%2B%20encodeURIComponent(%60%24%7Bvault%7D%60)%3B%0A%20%20%7D%20else%20%7B%0A%20%20%20%20%20%20var%20vaultName%20%3D%20''%3B%0A%20%20%7D%0A%0A%20%20const%20markdownBody%20%3D%20new%20Turndown(%7B%0A%20%20%20%20%20%20headingStyle%3A%20'atx'%2C%0A%20%20%20%20%20%20hr%3A%20'---'%2C%0A%20%20%20%20%20%20bulletListMarker%3A%20'-'%2C%0A%20%20%20%20%20%20codeBlockStyle%3A%20'fenced'%2C%0A%20%20%20%20%20%20emDelimiter%3A%20'*'%2C%0A%20%20%7D).turndown(markdownify)%3B%0A%0A%20%20var%20date%20%3D%20new%20Date()%3B%0A%0A%20%20function%20convertDate(date)%20%7B%0A%20%20%20%20var%20yyyy%20%3D%20date.getFullYear().toString()%3B%0A%20%20%20%20var%20mm%20%3D%20(date.getMonth()%2B1).toString()%3B%0A%20%20%20%20var%20dd%20%20%3D%20date.getDate().toString()%3B%0A%20%20%20%20var%20mmChars%20%3D%20mm.split('')%3B%0A%20%20%20%20var%20ddChars%20%3D%20dd.split('')%3B%0A%20%20%20%20return%20yyyy%20%2B%20'-'%20%2B%20(mmChars%5B1%5D%3Fmm%3A%220%22%2BmmChars%5B0%5D)%20%2B%20'-'%20%2B%20(ddChars%5B1%5D%3Fdd%3A%220%22%2BddChars%5B0%5D)%3B%0A%20%20%7D%0A%0A%20%20const%20today%20%3D%20convertDate(date)%3B%0A%0A%20%20const%20fileContent%20%3D%20%0A%20%20%20%20%20%20%22author%3A%3A%20%22%20%2B%20byline%20%2B%20%22%5Cn%22%0A%20%20%20%20%20%20%2B%20%22source%3A%3A%20%5B%22%20%2B%20title%20%2B%20%22%5D(%22%20%2B%20document.URL%20%2B%20%22)%5Cn%22%0A%20%20%20%20%20%20%2B%20%22clipped%3A%3A%20%5B%5B%22%20%2B%20today%20%2B%20%22%5D%5D%5Cn%22%0A%20%20%20%20%20%20%2B%20%22published%3A%3A%20%5Cn%5Cn%22%20%0A%20%20%20%20%20%20%2B%20tags%20%2B%20%22%5Cn%5Cn%22%0A%20%20%20%20%20%20%2B%20markdownBody%20%3B%0A%20%20%0A%20%20document.location.href%20%3D%20%22obsidian%3A%2F%2Fnew%3F%22%0A%20%20%20%20%2B%20%22file%3D%22%20%2B%20encodeURIComponent(folder%20%2B%20fileName)%0A%20%20%20%20%2B%20%22%26content%3D%22%20%2B%20encodeURIComponent(fileContent)%0A%20%20%20%20%2B%20vaultName%20%3B%0A%7D)%7D)()%3B
```

***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[Development]]

*Backlinks:*

```dataview
list from [[JavaScript - Obsidian Web Clipper Bookmarklet]] AND -"Changelog"
```