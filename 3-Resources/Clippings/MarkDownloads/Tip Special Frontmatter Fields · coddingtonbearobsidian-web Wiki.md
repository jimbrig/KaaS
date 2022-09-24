---
page-title: "Tip: Special Frontmatter Fields · coddingtonbear/obsidian-web Wiki"
url: https://github.com/coddingtonbear/obsidian-web/wiki/Tip:-Special-Frontmatter-Fields
date: "2022-09-23 19:55:12"
---
Obsidian Web treats a few frontmatter fields in a special way. You can find here what these fields mean

## For Finding Notes for your URL

-   `url`: This page is "owned" by this URL. If you have "Note Recall" enabled and, while at a URL matching such a field in your notes, Obsidian Web will suggest this page to you. Wildcards are supported.

Example:

\---
url: https://www.amazon.com/Zenkeeper-Obsidian-Tumbling-Meditation-Sculpture/dp/B08L3LWVKV/\*
\---

## For Controlling Icon Badge Behavior while Background Searches are enabled

These particular fields are related to the above, but adjust how Obsidian Web will decorate its icon in your extension toolbar when finding that the page you are on is owned by a note:

-   `web-badge-color`: The color to display the badge in when landing on a URL owned by this page. This should be a hexadecimal value, and given that frontmatter is YAML and the `#` field starts a comment, this must be quoted. E.g. `"#FF00FF"`. By default, the badge is shown in gold (or blue, if the URL is only mentioned on a non-URL-owned page).
-   `web-badge-message`: A message to display when landing on a URL owned by this page. The badge only allows for very short messages -- just maybe four characters -- so you will have to be brief. By default, the message will contain the count of matching pages.

Example:

\---
url: https://www.amazon.com/Zenkeeper-Obsidian-Tumbling-Meditation-Sculpture/dp/B08L3LWVKV/\*
web-badge-color: "#5b4965"
web-badge-message: "A+"
\---