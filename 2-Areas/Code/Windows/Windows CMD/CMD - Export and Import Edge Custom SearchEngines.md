---
Date: 2022-03-07
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code", "#Topic/Dev"]
Alias: ["CMD - Export and Import Edge Custom SearchEngines"]
---

# CMD - Export and Import Edge Custom SearchEngines

*Source: [erbanku/custom-search-engines-backup: Import/Export Google Chrome or Microsoft Edge's custom search engines and sync (overwrite) between 2 browsers. (github.com)](https://github.com/erbanku/custom-search-engines-backup)*

## Contents

- [[#Export|Export]]
- [[#Import|Import]]
- [[#Appendix: Links|Appendix: Links]]


Note that these commands/scripts assume [[SQLite]] executable is installed and on your system/user's `PATH`:

```powershell
scoop install sqlite3
```

## Export

```cmd
@echo off

set CURRENT_DRIVE=%~d0
set CURRENT_DIR=%~p0
if "%1"=="" (
	set DESTINATION=%CURRENT_DRIVE%%CURRENT_DIR%Edgekeywords.sql
) else (
	set DESTINATION=%~f1
)

set DESTINATION=%DESTINATION:\=/%
set TEMP_SQL_SCRIPT=%TEMP%\sync_edge_sql_script

pushd
echo Exporting Edge keywords to %DESTINATION%...
cd /D "%HOMEDRIVE%%HOMEPATH%\AppData\Local\Microsoft\Edge Dev\User Data\Default"
echo .output "%DESTINATION%" > %TEMP_SQL_SCRIPT%
echo .dump keywords >> %TEMP_SQL_SCRIPT%
"sqlite3.exe" -init %TEMP_SQL_SCRIPT% "Web Data" .exit
del %TEMP_SQL_SCRIPT%
popd

if errorlevel 1 pause
```

Results in a derived [[SQL]] script: 

`Edgekeywords.sql`:

```sql
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE keywords (id INTEGER PRIMARY KEY,short_name VARCHAR NOT NULL,keyword VARCHAR NOT NULL,favicon_url VARCHAR NOT NULL,url VARCHAR NOT NULL,safe_for_autoreplace INTEGER,originating_url VARCHAR,date_created INTEGER DEFAULT 0,usage_count INTEGER DEFAULT 0,input_encodings VARCHAR,suggest_url VARCHAR,prepopulate_id INTEGER DEFAULT 0,created_by_policy INTEGER DEFAULT 0,last_modified INTEGER DEFAULT 0,sync_guid VARCHAR,alternate_urls VARCHAR,image_url VARCHAR,search_url_post_params VARCHAR,suggest_url_post_params VARCHAR,image_url_post_params VARCHAR,new_tab_url VARCHAR,last_visited INTEGER DEFAULT 0, created_from_play_api INTEGER DEFAULT 0, is_active INTEGER DEFAULT 0);
INSERT INTO keywords VALUES(2,'Bing','bing.com','https://www.bing.com/sa/simg/favicon-2x.ico','{bing:baseURL}search?q={searchTerms}&{bing:cvid}{bing:msb}{google:assistedQueryStats}',1,'',0,0,'UTF-8','{bing:baseURL}qbox?query={searchTerms}&language={language}&{bing:partner}{bing:cvid}{bing:msb}{bing:ig}{google:inputType}{google:cursorPosition}{google:pageClassification}{bing:features}{bing:flights}',1,0,0,'485bf7d3-0215-45af-87dc-538868000001','[]','{bing:baseURL}images/detail/search?iss=sbiupload&FORM=ANCMS1#enterInsights','','','imageBin={google:imageThumbnailBase64}','{bing:baseURL}chrome/newtab',13291167504584288,0,0);
INSERT INTO keywords VALUES(3,'Yahoo!','yahoo.com','https://search.yahoo.com/favicon.ico','https://search.yahoo.com/search{google:pathWildcard}?ei={inputEncoding}&fr=crmas_sfp&p={searchTerms}',1,'',0,0,'UTF-8','https://search.yahoo.com/sugg/chrome?output=fxjson&appid=crmas_sfp&command={searchTerms}',2,0,0,'485bf7d3-0215-45af-87dc-538868000002','[]','','','','','https://search.yahoo.com?fr=crmas_sfp',0,0,0);
INSERT INTO keywords VALUES(4,'Google','google.com','https://www.google.com/images/branding/product/ico/googleg_lodp.ico','{google:baseURL}search?q={searchTerms}&{google:RLZ}{google:originalQueryForSuggestion}{google:assistedQueryStats}{google:searchFieldtrialParameter}{google:iOSSearchLanguage}{google:prefetchSource}{google:searchClient}{google:sourceId}{google:contextualSearchVersion}ie={inputEncoding}',1,'',0,0,'UTF-8','{google:baseSuggestURL}search?{google:searchFieldtrialParameter}client={google:suggestClient}&gs_ri={google:suggestRid}&xssi=t&q={searchTerms}&{google:inputType}{google:omniboxFocusType}{google:cursorPosition}{google:pageClassification}{google:searchVersion}{google:sessionToken}{google:prefetchQuery}sugkey={google:suggestAPIKeyParameter}',3,0,0,'485bf7d3-0215-45af-87dc-538868000003','["{google:baseURL}#q={searchTerms}","{google:baseURL}search#q={searchTerms}","{google:baseURL}webhp#q={searchTerms}","{google:baseURL}s#q={searchTerms}","{google:baseURL}s?q={searchTerms}"]','{google:baseSearchByImageURL}upload','','','encoded_image={google:imageThumbnail},image_url={google:imageURL},sbisrc={google:imageSearchSource},original_width={google:imageOriginalWidth},original_height={google:imageOriginalHeight}','',0,0,0);
INSERT INTO keywords VALUES(5,'DuckDuckGo','duckduckgo.com','https://duckduckgo.com/favicon.ico','https://duckduckgo.com/?q={searchTerms}',1,'',0,0,'UTF-8','https://duckduckgo.com/ac/?q={searchTerms}&type=list',92,0,0,'485bf7d3-0215-45af-87dc-538868000092','[]','','','','','https://duckduckgo.com/chrome_newtab',0,0,0);
INSERT INTO keywords VALUES(6,'GitHub','github.com','https://github.githubassets.com/favicons/favicon-dark.svg','https://github.com/search?q={searchTerms}&ref=opensearch',1,'https://github.com/opensearch.xml',13290915667964706,0,'UTF-8','',0,0,13290915667964706,'469a8d26-a794-44b6-a31a-00b7b2ba45e0','[]','','','','','',13291001137827521,0,0);
COMMIT;
```

## Import

```cmd
@echo off

tasklist /FI "IMAGENAME eq edge.exe" 2>NUL | find /I /N "edge.exe">NUL
if "%ERRORLEVEL%"=="0" (
	echo Close edge and try again...
	pause
	exit /B 1
)

set /P PROCEED=This will overwrite your Microsoft edge search engines! Are you sure?  
if "%PROCEED%"=="Y" goto DoIt
if "%PROCEED%"=="y" goto DoIt
if "%PROCEED%"=="YES" goto DoIt
if "%PROCEED%"=="Yes" goto DoIt
if "%PROCEED%"=="yes" goto DoIt
echo Cancelled operation.
pause
exit /B 2

:DoIt
set CURRENT_DRIVE=%~d0
set CURRENT_DIR=%~p0
if "%1"=="" (
	set SOURCE=%CURRENT_DRIVE%%CURRENT_DIR%Edgekeywords.sql
) else (
	set SOURCE=%~f1
)

set SOURCE=%SOURCE:\=/%
set TEMP_SQL_SCRIPT=%TEMP%\sync_edge_sql_script

pushd
echo Importing edge keywords from %SOURCE%...
cd /D "%HOMEDRIVE%%HOMEPATH%\AppData\Local\Microsoft\Edge Dev\User Data\Default"
echo DROP TABLE IF EXISTS keywords;> %TEMP_SQL_SCRIPT%
echo .read "%SOURCE%">> %TEMP_SQL_SCRIPT%
copy "Web Data" "Web Data.backup"
"sqlite3.exe" -init %TEMP_SQL_SCRIPT% "Web Data" .exit
del %TEMP_SQL_SCRIPT%
popd

if errorlevel 1 pause
```

Runs the exported [[SQL]] script against the `Web Data` file which is actually a [[SQLite]] database containing the *Keywords* table which defines the custom searchEngines.


***

## Appendix: Links

- [[Code]]
- [[Development]]
- [[Windows]]
- [[Microsoft Edge]]
- [[2-Areas/Code/Windows/Batch/_README|Batch]]
- [[2-Areas/Code/Windows/Windows CMD/_README|CMD]]
- [[Microsoft DOS|MS-DOS]]
- [[Automation]]
- [[2-Areas/MOCs/PowerShell]]
- [[SQLite]]
- [[Databases]]

*Backlinks:*

```dataview
list from [[CMD - Export and Import Edge Custom SearchEngines]] AND -"Changelog"
```