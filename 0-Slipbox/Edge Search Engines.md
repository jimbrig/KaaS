# Edge Search Engines

## Search Engines and Address Bar

Use <edge://version> to retrieve `PATH` where profile specific settings are stored in `%localappdata%` for [Microsoft Edge](../3-Resources/Tools/Web%20Browsers/Microsoft%20Edge.md):

* Edge (stable): `%LOCALAPPDATA%\Microsoft\Edge\User Data\Default`
* Edge Dev: `%LOCALAPPDATA%\Microsoft\Edge Dev\User Data\Default`
* Edge Beta: `%LOCALAPPDATA%\Microsoft\Edge Beta\User Data\Default`
* Edge Canary: `%LOCALAPPDATA%\Microsoft\Edge SxS\User Data\Default`

The *searchEngines* and their keywords are stored in the file: Web Data within the aforementioned folder(s); however, this file 
is not a text file, rather a version of a `.sqlite` database.

Therefore, to extract and view this data, utilize the [DB Browser for SQLite Utility](https://sqlitebrowser.org/) to extract the tables from the database.

* Can be installed with chocolatey via: `cinst sqlitebrowser.install`. 

I exported `keywords.csv` from that, which houses information on my custom *searchEngines* <edge://settings/searchEngines>.

---

Useful Post (although about Chrome): https://superuser.com/questions/272511/where-do-chrome-chromium-store-search-keywords

*Backlinks:*

````dataview
list from [[Edge Search Engines]] AND -"Changelog"
````
