author:: Caio Rodrigues.
source:: [Bookmarklet Maker](https://caiorss.github.io/bookmarklet-maker/)
clipped:: [[2022-08-26]]
published:: 

#clippings #

## Examples:

Sumbmit current URL to Reddit:

Sumbmit to Reddit

var url = document.URL ;
var title = document.title ;

window.location.href = "https://www.reddit.com/r/"
                        + prompt("Subreddit: ", "")
                        + "/submit?title="
                        + title + "&url="
                        + url ;  
      

Submit current URL to Reddit in a new tab

Submit to reddit in a new tab

var defaultSub = "dummy"
var subreddit = prompt("Enter the subreddit", defaultSub)
var baseUrl =  'https://www.reddit.com/r/' + subreddit + 'submit?title=';
window.open(baseUrl + document.title + '&url=' + document.URL, '\_blank') 
      

Generate org-mode hyperlink

Org-mode hyperlink

var md = "\[\[" + document.URL + "\]\[" + document.title + "\]\]" ;
prompt("Enter Ctrl+C to copy this org-mode hyperlink. :", md);
      

Clear google search URLs to allow easy copy URLs without messing it.

Clear google URL

var $s = function (selector){
    return Array.from(document.querySelectorAll(selector));
};

$s(".rc a").forEach(e => e.onmousedown = null);
      

Inject css style sheet from a given URL into current page.

inject css

var link = document.createElement("link");
link.href = prompt("css url", "");
link.type = "text/css";
link.rel = "stylesheet";
document.getElementsByTagName("head")\[0\].appendChild(link);
      

Open a prompt showing Google driver URL to current document. Useful to create short URL in services like tiny URL and view document in Tablets or Smartphones.

Copy Gdriver URL

prompt("Google driver URL:", "https://drive.google.com/viewerng/viewer?url=" + document.URL);
      

Past some URL and open it in Google driver.

open Gdriver prompt

var baseUrl = "https://drive.google.com/viewerng/viewer?url=";
var url = prompt("Paste Url");
if (url != null){
    window.open(baseUrl + url);
}
 

Open page that doesn't exist anymore in Web Archive

open in WebArchive

var baseUrl = "https://web.archive.org/web/\*/"
var urlmod  = document.URL
window.location.href = baseUrl + urlmod