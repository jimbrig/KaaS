# Creating a Google Suite Desktop Electron App with Nativefier

## Introduction

*See Also: [3-Resources/Tools/Utility/Nativefier](../3-Resources/Tools/Utility/Nativefier.md)*

[Nativefier](https://github.com/nativefier/nativefier) is a command-line tool to easily create a “desktop app” for any web site with minimal fuss. Apps are wrapped by [Electron](https://www.electronjs.org/) (which uses Chromium under the hood) in an OS executable (`.app`, `.exe`, etc) usable on Windows, macOS and Linux.

I built this because I grew tired of having to Alt-Tab to my browser and then search through numerous open tabs when using Messenger or Whatsapp Web ([HN thread](https://news.ycombinator.com/item?id=10930718)). Nativefier features:

* Automatically retrieval of app icon / name
* Injection of custom JS & CSS
* Many more, see the [API docs](https://github.com/nativefier/nativefier/blob/master/API.md) or `nativefier --help`

## Creation Command

Open a Terminal from `~/.config/nativefier/GSuite` and run the following command to generate the `app` folder:

````powershell
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
````

## Output

This results in the following output into the specified "app" directory above:

![](https://i.imgur.com/ov13uHW.png)

when I run the `GSuite.exe` executable it launches the Electron App with the resulting PWA looking like so:

*Workspace Home Page*

![](https://i.imgur.com/LQF1zYV.png)

*Calendar*

![](https://i.imgur.com/KE5zEtI.png)

*Gmail*

![](https://i.imgur.com/NLLk6qA.png)

*Drive*

![](https://i.imgur.com/hswA04s.png)

*Taskbar Icon*

![](https://i.imgur.com/0czyaiN.png)

### Notes

* I am assuming the working directory is set to `~/.config/nativefier/GSuite`:

<center><img src="https://i.imgur.com/xCVtaoN.png" /></center>

* I have placed all icons within the `~/.config/nativefier/GSuite/icons` folder:

<center><img src="https://i.imgur.com/QA1woKJ.png" /></center>

### menuBar.json Configuration

I am using a `menuBar.json` configuration file to enhance the menu bar in the electron app.

Currently I add the following URLs:

* [Google Workspace]()
* [Google Calendar]()
* [GMail]()
* [Google Drive]()
* [Google Chat]()
* [Google Contacts]()
* [YouTube]()
* [Google Photos]()
* [Google Maps]()
* [Google Cloud Platform]()
* [Google Domains]()
* [Google Developer Account]()
* [Google Account]()
* [GSuite Admin Dashboard]()
* [Google Business Profile]()

---

Here's the `menuBar.json` configuration file:

````JSON
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
````

And this is how it appears in the Electron App:

<center><img src="https://i.imgur.com/Jb5wkbJ.png"/></center>

---

## Appendix: Links

*Backlinks:*

````dataview
list from [[Creating Desktop Electron Apps with Nativefier]] AND -"Changelog"
````
