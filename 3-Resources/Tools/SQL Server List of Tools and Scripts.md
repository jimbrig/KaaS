---
Date: 2022-02-03
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/List", "#Type/Tool", "#Topic/Dev/Databases"]
Alias: Untitled
---

# SQL Server List of Tools and Scripts

*Source: [expressdb.io/sql-server-resources.md at master · LowlyDBA/expressdb.io (github.com)](https://github.com/LowlyDBA/expressdb.io/blob/master/sql-server-resources.md)*

Most open source, all free. Scripts, tools, and resources pertinent to SQL Server and beyond.

## Contents

- [[#T-SQL Scripts|T-SQL Scripts]]
- [[#References|References]]
- [[#SSMS Plugins|SSMS Plugins]]
- [[#Azure Data Studio Extensions|Azure Data Studio Extensions]]
- [[#Tools|Tools]]
- [[#Education|Education]]
- [[#Articles|Articles]]
	- [[#AlwaysOn|AlwaysOn]]
	- [[#Patterns / Anti-Patterns|Patterns / Anti-Patterns]]
	- [[#Misc|Misc]]
- [[#Other|Other]]


## T-SQL Scripts

- [Ola's Maintenance Scripts](https://github.com/olahallengren/sql-server-maintenance-solution)
- [Brent Ozar's First Responder Kit](https://github.com/BrentOzarULTD/SQL-Server-First-Responder-Kit)
- [Glenn Berry's Diagnostic Queries](https://www.sqlskills.com/blogs/glenn/category/dmv-queries/)
- [SQL CAT's Tiger Tool Box](https://github.com/Microsoft/tigertoolbox)
- [Adam Machanic's sp_WhoIsActive](http://whoisactive.com/downloads/)
- [Aaron Bertrand's sp_InEachDB](https://github.com/BrentOzarULTD/SQL-Server-First-Responder-Kit/blob/dev/sp_ineachdb.sql) - replacement for the undocumented [sp_MSForEachDB](http://sqlblog.com/blogs/aaron_bertrand/archive/2010/12/29/a-more-reliable-and-more-flexible-sp-msforeachdb.aspx)
- [Jeff Moden's DelimitedSplit8k](http://www.sqlservercentral.com/articles/Tally+Table/72993/) - string splitter function
- [John McCall's DBA MultiTool](https://dba-multitool.org) - Suite of administrative scripts

## References

- [SQL Style Guide](http://www.sqlstyle.guide/)
- [T-SQL Style Guide](https://lowlydba.github.io/tsqlstyle.guide/)
- [DBATools Build Reference](https://sqlcollaborative.github.io/builds) - Open source SQL Server build tracker
- [SQLServerUpdates.com](https://sqlserverupdates.com/) - Brent Ozar's SQL Server build tracker
- [MSSQL Waitopedia](https://www.spotlightessentials.com/public/waitopedia)
- [Module Signing Info](https://modulesigning.info/)
- [SQL Server & Azure Database Permissions Poster](https://github.com/microsoft/sql-server-samples/tree/master/samples/features/security/permissions-posters)
- [The Data Loading Performance Guide](https://docs.microsoft.com/en-us/previous-versions/sql/sql-server-2008/dd425070(v=sql.100))
- [Database Hiearachy of Monitoring Infographic](https://www.lowlydba.com/database-hierarchy-of-monitoring/)
- [Scheduling Powershell Tasks With SQL Agent](https://dbatools.io/agent/)
- [ColumnScore.com](https://columnscore.com/) - Quiz to find if you should use columnstore indexes on your table
- [Use the Index, Luke!](https://use-the-index-luke.com/) - A site explaining SQL indexing to developers—no crap about administration.
- [Modern SQL](https://modern-sql.com/) - A site explaining modern features of the SQL standard & which products use them.
- [EndofLife.Date](https://endoflife.date/mssqlserver) - EOL for MSSQL (and many others).

## SSMS Plugins

- [SQL Sentry Plan Explorer](https://www.sentryone.com/plan-explorer/)
- [Dell Spotlight Essentials](https://www.spotlightessentials.com/spotlight-extensions)

## Azure Data Studio Extensions

Micosoft curates a list of first and third party extensions [here][ads-extensions].

## Tools

| Name | Type | Open Source | Author |
| ---- | ---- | ----------- | ------ |
| [DBA Tools](https://dbatools.io) | Admin | 👍 | [SQL Collaborative](https://dbatools.io/team/) |
| [DBA Checks](https://dbachecks.io) | Admin | 👍 | [SQL Collaborative](https://dbatools.io/team/) |
| [MinionWare](http://www.minionware.net/) | Admin | | [MinionWare](http://www.minionware.net/meet-the-team/)|
| [DLM Dashboard](http://www.red-gate.com/products/dlm/dlm-dashboard/) | Devops | | [Redgate](https://www.red-gate.com/) |
| [DBOps](https://github.com/sqlcollaborative/dbops) | Migrations | 👍 | [SQL Collaborative](https://dbatools.io/team/) |
| [Flyway](https://flywaydb.org/) | Migrations | 👍 | [Axel Fontaine](https://axelfontaine.com/) |
| [Is It SQL?](http://www.scalesql.com/isitsql/) | Monitoring | | [Bill Graziano](http://www.scalesql.com/about.html) |
| [OpServer](https://github.com/opserver/Opserver) | Monitoring | 👍 | [Stack Exchange](https://opserver.github.io/Opserver/) |
| [Spotlight Cloud Basic](https://www.spotlightcloud.io/pricing) | Monitoring | | [Quest](https://www.quest.com/) |
| [SQLTop](https://github.com/channeladvisor/sqltop) | Monitoring | 👍 | [Channel Advisor](https://www.channeladvisor.com/)
| [SQL Watch](https://sqlwatch.io/) | Monitoring | 👍 | [Marcin Gminski](https://marcin.gminski.net/) |
| [SchemaZen](https://github.com/sethreno/schemazen#schemazen---script-and-create-sql-server-objects-quickly) | Scripting | 👍 | [Seth Reno](https://github.com/sethreno) |
| [mssql-scripter](https://github.com/Microsoft/sql-xplat-cli/) (may be dead) | Scripting | 👍 | Microsoft |
| [DBDiagram.io](https://dbdiagram.io/) | Sharing | | [holistics.io](https://www.holistics.io) |
| [Format Text as Table](https://senseful.github.io/text-table/) | Sharing | | [Senseful Solutions](https://senseful.github.io/) |
| [DBFit](http://www.methodsandtools.com/tools/dbfit.php) | Testing | | [Yavor Nikolov](https://javornikolov.wordpress.com/) |
| [DB Fiddle](https://dbfiddle.uk/) | Testing/Sharing | | [Jack Douglas](https://douglastechnology.co.uk/) |
| [SQL Fiddle](http://sqlfiddle.com/) | Testing/Sharing | | [Jake Feasel](http://stackoverflow.com/users/808921/jake-feasel) |
| [SQL Query Stress](https://github.com/ErikEJ/SqlQueryStress) | Testing | 👍 | [Erik Ejlskov Jensen](https://erikej.github.io/)
| [Paste The Plan](https://pastetheplan.com/) | Tuning/Sharing | | [Brent Ozar Unlimited](https://www.brentozar.com/)

## Education

- [Vertabelo's Academy](https://www.vertabelo.com/academy/) - Various database patterns and schema design examples
- [5 Rules of Normalization][normrules] by [Marc Rettig][marc]
- [SQL Murder Mystery](https://mystery.knightlab.com/) - Introduction to SQL as a murder mystery story
- [Select Star](https://selectstarsql.com/) - Interactive introduction to SQL

## Articles

### AlwaysOn

- [The AlwaysOn Health Model Part 2 - Extending the Health Model][alwaysonhealth]
- [When Always On Isn't: Handling Outages In Your Application](https://www.brentozar.com/archive/2017/01/always-isnt-handling-outages-application/) by Brent Ozar
- [SQL Server 2016/2017: Availability group secondary replica redo model and performance](https://blogs.msdn.microsoft.com/sql_server_team/sql-server-20162017-availability-group-secondary-replica-redo-model-and-performance/) - Detailed information on parallelism in redo worker threads

### Patterns / Anti-Patterns

- [SQL Server UPSERT Patterns and Antipatterns][upsert] by [Michael J Swart][swart]
- [T-SQL Code Smells][smelly] by [Phil Factor][phil]
- [Fighting Evil in Your Code: Comments on Comments](https://www.red-gate.com/simple-talk/opinion/opinion-pieces/fighting-evil-code-comments-comments/) by [Michael Sorens](https://www.red-gate.com/simple-talk/author/michael-sorens/)
- [The Data Loading Performance Guide][dlpg]


### Misc

- [Erland Sommarskog's articles on SQL Server](http://sommarskog.se/)
- [Modern Data Analysis: Don't Trust Your Spreadsheet][betterment]
- [T-SQL Interview Questions](https://www.mssqltips.com/sqlservertip/1450/sql-server-developer-tsql-interview-questions/) by [Jeremy Kadlec](https://www.mssqltips.com/sqlserverauthor/38/jeremy-kadlec/)
- [Developer Interview Questions](https://www.brentozar.com/archive/2009/06/top-10-developer-interview-questions-about-sql-server/) by Brent Ozar
- [Tuning Cost Threshold](http://sqlblog.com/blogs/jonathan_kehayias/archive/2010/01/19/tuning-cost-threshold-of-parallelism-from-the-plan-cache.aspx)
- [The Security of Modern Password Expiration: An Algorithmic Framework and Empirical Analysis](https://www.cs.unc.edu/~reiter/papers/2010/CCS.pdf)

## Other

- [Wide World Importer Database][wwi] - Successor to the AdventureWorks sample database for SQL Server 2016+
- [Stack Overflow Database][so-db] - Brent Ozar's packaging of the Stack Overflow database
- [idownvotedbecau.se][idvb] - Linkable downvoting rationale for Stack Exchange comments.
- [Open Source Pull Request Template][pr-template] - Whimsical choose-your-own-adventure that climaxes with a customized pull request template by [Tal Ater][tal]
- [SQL Server Kit][ssk] - Compendium of everything SQL Server & R by [Konstantin Taranov][konstantin]

[ads-extensions]: https://github.com/Microsoft/azuredatastudio/wiki/List-of-Extensions
[alwaysonhealth]: https://techcommunity.microsoft.com/t5/SQL-Server/The-AlwaysOn-Health-Model-Part-2-Extending-the-Health-Model/ba-p/384043?advanced=false&collapse_discussion=true&q=the%20alwayson%20health%20model&search_type=thread
[betterment]: https://www.betterment.com/resources/inside-betterment/engineering/modern-data-analysis-dont-trust-your-spreadsheet/
[dbfit]: http://www.methodsandtools.com/tools/dbfit.php
[dlpg]: https://docs.microsoft.com/en-us/previous-versions/sql/sql-server-2008/dd425070(v=sql.100)
[fiddle]: http://sqlfiddle.com/
[idvb]: http://idownvotedbecau.se/
[isitsql]: http://www.scalesql.com/isitsql/
  "Is It SQL?"
[konstantin]: https://github.com/ktaranov
[marc]: http://marcrettig.me/data-normalization-poster-1989/
  "Marc Rettig"
[normrules]: /rettigNormalizationPoster.pdf
  "5 Rules of Normalization"
[pr-template]: https://www.talater.com/open-source-templates/#/
[schemazen]: https://github.com/sethreno/schemazen#schemazen---script-and-create-sql-server-objects-quickly
[smelly]: https://www.red-gate.com/simple-talk/sql/t-sql-programming/sql-code-smells/
[so-db]: https://www.brentozar.com/archive/2015/10/how-to-download-the-stack-overflow-database-via-bittorrent/
[ssk]: https://github.com/ktaranov/sqlserver-kit
[swart]: https://michaeljswart.com/about/
[tal]: https://twitter.com/TalAter
[upsert]: https://michaeljswart.com/2017/07/sql-server-upsert-patterns-and-antipatterns/
[phil]: https://www.red-gate.com/simple-talk/author/phil-factor/
[wwi]: https://github.com/Microsoft/sql-server-samples

<ClientOnly>
<disqus-component/>
<userway-component/>
</clientOnly>



***

## Appendix: Links

- [[SQL Server]]
- [[Microsoft]]
- [[SQL]]
- [[T-SQL]]
- [[3-Resources/Tools/_README|Tools]]
- [[Databases]]
- [[Data Engineering]]
- [[Development]]
- [[Data Science]]

*Backlinks:*

```dataview
list from [[SQL Server List of Tools and Scripts]] AND -"Changelog"
```