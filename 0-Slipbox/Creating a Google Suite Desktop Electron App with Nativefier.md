---
Date: 2022-01-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev"]
Alias: "Creating a Google Suite Desktop Electron App with Nativefier"
---

# Creating a Google Suite Desktop Electron App with Nativefier

## Introduction

*See Also: [[Nativefier]]*

[Nativefier](https://github.com/nativefier/nativefier) is a command-line tool to easily create a “desktop app” for any web site with minimal fuss. Apps are wrapped by [Electron](https://www.electronjs.org/) (which uses Chromium under the hood) in an OS executable (`.app`, `.exe`, etc) usable on Windows, macOS and Linux.

I built this because I grew tired of having to Alt-Tab to my browser and then search through numerous open tabs when using Messenger or Whatsapp Web ([HN thread](https://news.ycombinator.com/item?id=10930718)). Nativefier features:

-   Automatically retrieval of app icon / name
-   Injection of custom JS & CSS
-   Many more, see the [API docs](https://github.com/nativefier/nativefier/blob/master/API.md) or `nativefier --help`


## Creation Command

Open a Terminal from `~/.config/nativefier/GSuite` and run the following command to generate the `app` folder:

```powershell
nativefier 'https://workspace.google.com/u/1/dashboard' `
	--user-agent firefox `
	--portable "." `
	--internal-urls ".*?\.google\.*?" `
	--show-menu-bar `
	--bookmarks-menu '.\menuBar.json' `
	--arch x64 `
	--icon "icons\Google.ico" `
	--basic-auth-username "jimmy.briggs@jimbrig.com" `
	--basic-auth-password "<PASSWORD>" `
	"app"
```

### Notes

- I am assuming the working directory is set to `~/.config/nativefier/GSuite`:

<center><img src="https://i.imgur.com/xCVtaoN.png" /></center>

- I have placed all icons within the `~/.config/nativefier/GSuite/icons` folder:

<center><img src="https://i.imgur.com/QA1woKJ.png" /></center>

### menuBar.json Configuration

I am using a `menuBar.json` configuration file to enhance the menu bar in the electron app.
	
Currently I add the following URLs:
	
- [Google Workspace]()  
- [Google Calendar]()  
- [GMail]()  
- [Google Drive]()  
- [Google Chat]()  
- [Google Contacts]()  
- [YouTube]()  
- [Google Photos]()  
- [Google Maps]()  
- [Google Cloud Platform]()  
- [Google Domains]()  
- [Google Developer Account]()  
- [Google Account]()  
- [GSuite Admin Dashboard]()  
- [Google Business Profile]()  

***

Here's the `menuBar.json` configuration file:

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

And this is how it appears in the Electron App:

<center><img src="https://i.imgur.com/Jb5wkbJ.png"/></center>



*Backlinks:*

```dataview
list from [[Creating Desktop Electron Apps with Nativefier]] AND -"Changelog"
```