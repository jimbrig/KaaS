---
Date: 2022-02-06
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Databases"]
Alias: ["SQL - POST HTTP API Request with SQL Server"]
---

# SQL - POST HTTP API Request with SQL Server

*Source: [Send POST HTTP API Request with SQL Server | thiscodeWorks](https://www.thiscodeworks.com/61faf47fb783be0015bbaf85)*

```SQL
DECLARE @Object AS INT;
DECLARE @ResponseText AS VARCHAR(8000);
DECLARE @Body AS VARCHAR(8000) = 
'{
    "what": 1,
    "ever": "you",
    "need": "to send as the body"
}'  
 
EXEC sp_OACreate 'MSXML2.XMLHTTP', @Object OUT;
EXEC sp_OAMethod @Object, 'open', NULL, 'post','http://requestb.in/1h83e3n1', 'false'
 
EXEC sp_OAMethod @Object, 'setRequestHeader', null, 'Content-Type', 'application/json'
EXEC sp_OAMethod @Object, 'send', null, @body
 
EXEC sp_OAMethod @Object, 'responseText', @ResponseText OUTPUT
SELECT @ResponseText
 
EXEC sp_OADestroy @Object
```


***

## Appendix: Links

- [[3-Resources/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[SQL Server]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - POST HTTP API Request with SQL Server]] AND -"Changelog"
```