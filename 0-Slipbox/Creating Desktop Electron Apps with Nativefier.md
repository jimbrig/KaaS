---
Date: 2022-01-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev"]
Alias: "Creating Desktop Electron Apps with Nativefier"
---

# Creating Desktop Electron Apps with Nativefier

## GSuite

From `~/.config/nativefier/GSuite`:

```powershell
nativefier 'https://calendar.google.com/calendar' `
	--user-agent firefox `
	--portable "nativefier" `
	--internal-urls ".*?\.google\.*?" `
	--show-menu-bar `
	--bookmarks-menu '.\menuBar.json'
	--arch x64 `
	--icon "icons\Google.ico" `
	--file-download-options '{"saveAs": true}' `
	--basic-auth-username "jimmy.briggs@jimbrig.com" `
	--basic-auth-password "M1$$ysusy1993google"
```


Utilize the `menuBar.json` configuration file:

```JSON
{
    "menuLabel": "&GSuite",
    "bookmarks": [
		{
			"title": "Google Workspace",
			"type": "link",
			"url": "https://workspace.google.com/u/1/dashboard"
		},
		{
			"type": "separator"
		},
        {
            "title": "Google Calendar",
            "url": "https://calendar.google.com/calendar",
            "type": "link"
        },
        {
            "title": "Gmail",
            "type": "link",
            "url": "https://mail.google.com/mail/"
        },
        {
            "title": "Google Drive",
            "url": "https://drive.google.com/drive/",
            "type": "link"
        },
        {
            "title": "Google Chat",
            "type": "link",
            "url": "https://mail.google.com/chat/"
        },
        {
            "title": "Google Contacts",
            "type": "link",
            "url": "https://contacts.google.com/"
        },
        {
            "type": "separator"
        },
        {
            "title": "YouTube",
            "type": "link",
            "url": "https://www.youtube.com/"
        },
        {
            "title": "Google Photos",
            "type": "link",
            "url": "https://photos.google.com/"
        },
        {
            "title": "Google Maps",
            "type": "link",
            "url": "https://www.google.com/maps"
        },
        {
            "type": "separator"
        },
        {
            "title": "Google Cloud Platform",
            "type": "link",
            "url": "https://console.cloud.google.com/home/dashboard"
        },
        {
            "title": "Google Domains",
            "type": "link",
            "url": "https://domains.google.com/"
        },
        {
            "title": "Google Developer",
            "type": "link",
            "url": "https://developers.google.com/"
        },
        {
            "type": "separator"
        },
        {
            "title": "Google Account",
            "type": "link",
            "url": "https://myaccount.google.com/"
        },
        {
            "title": "Google Admin",
            "type": "link",
            "url": "https://admin.google.com/"
        },
        {
            "title": "Google Business Profile",
            "type": "link",
            "url": "https://business.google.com/u/1/dashboard/"
        }
    ]
}
```

*Backlinks:*

```dataview
list from [[Creating Desktop Electron Apps with Nativefier]] AND -"Changelog"
```