# Bookmarklet Maker

*Site: [Bookmarklet Maker](https://caiorss.github.io/bookmarklet-maker/)*

*GitHub Repo: [caiorss/bookmarklet-maker: Tool to create bookmarklet/ javascript apps to automate the web browser.](https://github.com/caiorss/bookmarklet-maker)*

## Contents

* [Overview](Bookmarklet%20Maker.md#overview)
* [Tool (iframe)](Bookmarklet%20Maker.md#tool-iframe)
* [Examples](Bookmarklet%20Maker.md#examples)
  * [Get Metadata](Bookmarklet%20Maker.md#get-metadata)
    * [Get Current Page Title](Bookmarklet%20Maker.md#get-current-page-title)
    * [Get Author](Bookmarklet%20Maker.md#get-author)
    * [Get Description](Bookmarklet%20Maker.md#get-description)
    * [Get Keywords](Bookmarklet%20Maker.md#get-keywords)
    * [Get Current Date](Bookmarklet%20Maker.md#get-current-date)
  * [URL](Bookmarklet%20Maker.md#url)
    * [Get Current Page URL](Bookmarklet%20Maker.md#get-current-page-url)
    * [Redirect Current Page](Bookmarklet%20Maker.md#redirect-current-page)
    * [Open URL in a New Tab](Bookmarklet%20Maker.md#open-url-in-a-new-tab)
    * [URL Manipulation](Bookmarklet%20Maker.md#url-manipulation)
  * [Miscellaneous](Bookmarklet%20Maker.md#miscellaneous)
    * [Display Alert Box (Messagebox)](Bookmarklet%20Maker.md#display-alert-box-messagebox)
    * [Display a Prompt](Bookmarklet%20Maker.md#display-a-prompt)
    * [Display string in console](Bookmarklet%20Maker.md#display-string-in-console)
  * [Style](Bookmarklet%20Maker.md#style)
* [Recipes](Bookmarklet%20Maker.md#recipes)
  * [Generate org-mode Bibliographical Reference](Bookmarklet%20Maker.md#generate-org-mode-bibliographical-reference)
  * [Change the Page Width for Better Readability](Bookmarklet%20Maker.md#change-the-page-width-for-better-readability)
  * [Invert Page Color for Enhancing Reading at Night](Bookmarklet%20Maker.md#invert-page-color-for-enhancing-reading-at-night)
  * [Change Page Background Color](Bookmarklet%20Maker.md#change-page-background-color)
* [See Also](Bookmarklet%20Maker.md#see-also)
* [Appendix: Links](Bookmarklet%20Maker.md#appendix-links)

## Overview

Bookmarklet maker is a small web app to create bookmarklet or small executable [Javascript](../../../2-Areas/Code/Javascript/Javascript.md) apps to perform browser automation tasks.

You can run this app by accessing the hyperlink:

* [http://caiorss.github.io/bookmarklet-maker](http://caiorss.github.io/bookmarklet-maker)

If you don’t know what is a bookmarklet, see:

* [Creating a Simple Bookmarklet - YouTube](https://www.youtube.com/watch?v=K_A3Y3eqnzE)

## Tool (iframe)

<iframe src="https://caiorss.github.io/bookmarklet-maker/" allow="fullscreen" style="height:100%;width:100%; aspect-ratio: 16 / 9;"></iframe>

## Examples

* [Get Metadata](Bookmarklet%20Maker.md#get-metadata)
  * [Get Current Page Title](Bookmarklet%20Maker.md#get-current-page-title)
  * [Get Author](Bookmarklet%20Maker.md#get-author)
  * [Get Description](Bookmarklet%20Maker.md#get-description)
  * [Get Keywords](Bookmarklet%20Maker.md#get-keywords)
  * [Get Current Date](Bookmarklet%20Maker.md#get-current-date)
* [URL](Bookmarklet%20Maker.md#url)
  * [Get Current Page URL](Bookmarklet%20Maker.md#get-current-page-url)
  * [Redirect Current Page](Bookmarklet%20Maker.md#redirect-current-page)
  * [Open URL in a New Tab](Bookmarklet%20Maker.md#open-url-in-a-new-tab)
  * [URL Manipulation](Bookmarklet%20Maker.md#url-manipulation)
* [Miscellaneous](Bookmarklet%20Maker.md#miscellaneous)
  * [Display Alert Box (Messagebox)](Bookmarklet%20Maker.md#display-alert-box-messagebox)
  * [Display a Prompt](Bookmarklet%20Maker.md#display-a-prompt)
  * [Display string in console](Bookmarklet%20Maker.md#display-string-in-console)

### Get Metadata

#### Get Current Page Title

````html
<title>Page Title</title>
````

````javascript
document.title
````

#### Get Author

````html
<meta content="author M.r dummy" name="author">
````

````javascript
Array.from(document.getElementsByTagName("meta"))
    .find(function(e){return e.name == "author"})
    .content
````

#### Get Description

````html
<meta content="A description of the page." name="description">
````

````javascript
Array.from(document.getElementsByTagName("meta"))
    .find(function(e){return e.name == "description"})
    .content
````

#### Get Keywords

````html
<meta content="keyword1 keyword2 keyword2" name="keywords">
````

````javascript
Array.from(document.getElementsByTagName("meta"))
    .find(function(e){return e.name == "keywords"})
    .content
````

#### Get Current Date

````javascript
var d = new Date() ; (d.getYear() + 1900).toString() + "-" + d.getMonth().toString() + "-" + d.getDay().toString()

"2016-9-4"
````

* Function `getDate()`:

````javascript
function getDate(){
    var d = new Date();
    return (d.getYear() + 1900).toString() + "-" +
        d.getMonth().toString() + "-" + d.getDay().toString() ;
}

>> getDate()
"2017-3-5"
````

### URL

#### Get Current Page URL

````javascript
document.URL
````

#### Redirect Current Page

````javascript
window.location.href = "http://www.httpbin.org/get"
````

#### Open URL in a New Tab

````javascript
window.open("http://www.yandex.com")
````

#### URL Manipulation

URL Manipulation is useful to send the current URL to some web service or Web App such as Google Drive or Web Archive.

* Open some page that doesn't exist anymore in Web Archive:

````javascript
var baseUrl = "https://web.archive.org/web/*/"
var urlmod  = document.URL
window.location.href = baseUrl + urlmod
````

* Open a file in Google Drive.

Example URL: [https://drive.google.com/viewerng/viewer?url=lampwww.epfl.ch/~hmiller/scala2014/proceedings/p51-prokopec.pdf](https://drive.google.com/viewerng/viewer?url=lampwww.epfl.ch/~hmiller/scala2014/proceedings/p51-prokopec.pdf)

````javascript
var baseUrl = "http://lampwww.epfl.ch/~hmiller/scala2014/proceedings/p51-prokopec.pdf"
var urlmod = "https://drive.google.com/viewerng/viewer?url=" + baseUrl
window.open(urlmod)
````

Open current page (PDF document in Google Drive).

````javascript
window.open("https://drive.google.com/viewerng/viewer?url=" + document.URL);
````

Open a prompt showing Google Drive URL to current document. Useful to create short URL in services like tiny URL and view document in Tablets or Smartphones.

````javascript
prompt("Google driver URL:", "https://drive.google.com/viewerng/viewer?url=" + document.URL);
````

### Miscellaneous

#### Display Alert Box (Messagebox)

````javascript
alert("My message");
````

#### Display a Prompt

* The `prompt` function is useful to read user input and allow user to copy some data.

````javascript
prompt("Window title", "Content")
````

#### Display string in console

console.log(object);
console.log("My message");

### Style

## Recipes

### Generate org-mode Bibliographical Reference

````javascript
function getDate(){
    var d = new Date()
    return (d.getYear() + 1900).toString() + "-" +
        d.getMonth().toString() + "-" + d.getDay().toString() ;
};

var text = '*' + document.title + '*' + " Accessed at " + getDate() +
    ". Available at <" + document.URL + "> " ;

prompt("Type Ctrl+A and Ctrl+C to copy the markdown", text);
````

It will generate a reference like this:

* **Overview of Forks, Threads, and Asynchronous I/O** Accessed at 2017-3-5. Available at [http://www.remwebdevelopment.com/blog/overview-of-forks-threads-and-asynchronous-io-133.html](http://www.remwebdevelopment.com/blog/overview-of-forks-threads-and-asynchronous-io-133.html)

* *Overview of Forks, Threads, and Asynchronous I/O* Accessed at 2017-3-5. Available at <http://www.remwebdevelopment.com/blog/overview-of-forks-threads-and-asynchronous-io-133.html> 

### Change the Page Width for Better Readability

This will set the page width to the width of an A4 ISO paper sheet that makes easier to read long texts in the browser.

````javascript
document.querySelector("body").style.setProperty("width", "800px")
````

### Invert Page Color for Enhancing Reading at Night

````javascript
document.querySelector("body").style.setProperty("color", "white")
document.querySelector("body").style.setProperty("background", "black")
````

### Change Page Background Color

````javascript
document.querySelector("body").style.setProperty("background", "white")
````

## See Also

* [https://www.reddit.com/r/bookmarklets/](https://www.reddit.com/r/bookmarklets/)
* [100+ Useful Bookmarklets For Better Productivity | Ultimate List - Hongkiat](http://www.hongkiat.com/blog/100-useful-bookmarklets-for-better-productivity-ultimate-list/)
* [Beginner Geek: How to Use Bookmarklets on Any Device](http://www.howtogeek.com/189358/beginner-geek-how-to-use-bookmarklets-on-any-device/)
* [Top 10 Useful Bookmarklets](http://lifehacker.com/395697/top-10-useful-bookmarklets)

---

## Appendix: Links

* *Tools*
* [Javascript](../../../2-Areas/Code/Javascript/Javascript.md)
* *Javascript Code*
* [JS - Obsidian Web Clipper Bookmarklet](../../../2-Areas/Code/Javascript/JS%20-%20Obsidian%20Web%20Clipper%20Bookmarklet.md)
* [Web Development](../../../2-Areas/MOCs/Web%20Development.md)
* *Browsers*
* *Browser DevTools*

*Backlinks:*

````dataview
list from [[Bookmarklet Maker]] AND -"Changelog"
````
