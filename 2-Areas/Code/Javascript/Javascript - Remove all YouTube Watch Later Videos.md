---
Date: 2022-02-09
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/Javascript", "#Topic/Dev"]
Alias: ["Javascript - Remove all YouTube Watch Later Videos"]
---

# Javascript - Remove all YouTube Watch Later Videos

*Source: [How to Bulk Delete All Youtube's Watch Later Videos in February 2022 | TL Dev Tech](https://www.tldevtech.com/how-to-bulk-delete-all-youtubes-watch-later-videos/)*

## Contents

- [[#Javascript|Javascript]]
- [[#See it in Action|See it in Action]]
- [[#Appendix: Links|Appendix: Links]]

## Javascript

- From your desktop browser, navigate to <https://www.youtube.com/playlist?list=WL> (i.e. your *Watch Later* page).
- Open the browser's developer tools console by pressing `Ctrl + Shift + I` or `F12`
- Paste one of the scripts below into the console and hit `Enter` to run it:

```javascript
setInterval(function () {
  document.querySelector('#contents button[aria-label="Action menu"]').click();
  var things = document.evaluate(
    '//span[contains(text(),"Watch later")]',
    document,
    null,
    XPathResult.ORDERED_NODE_SNAPSHOT_TYPE,
    null
  );
  for (var i = 0; i < things.snapshotLength; i++) {
    things.snapshotItem(i).click();
  }
}, 1000);
```

If that doesn't work then try:

```javascript
setInterval(function () {
  document.querySelector('#primary button[aria-label="Action menu"]').click();
  var things = document.evaluate(
    '//span[contains(text(),"Watch later")]',
    document,
    null,
    XPathResult.ORDERED_NODE_SNAPSHOT_TYPE,
    null
  );
  for (var i = 0; i < things.snapshotLength; i++) {
    things.snapshotItem(i).click();
  }
}, 1000);
```

## See it in Action

![](https://i.imgur.com/6gPLire.gif)

Notice how the browser starts to automatically remove each video one-by-one after running one of the scripts from above in the Browser's JavaScript Console.

***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[Development]]
- [[JavaScript]]
- [[YouTube]]
- [[Browser DevTools]]

***

*Backlinks:*

```dataview
list from [[Javascript - Remove all YouTube Watch Later Videos]] AND -"Changelog"
```