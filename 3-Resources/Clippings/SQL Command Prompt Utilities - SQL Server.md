---
Date: 2022-08-26
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Clipping", "#Topic/Dev/Tools", "#Topic/Dev/SQL"]
Alias: "SQL Server Command Prompt Utilities"
---

# SQL Command Prompt Utilities (Database Engine) - SQL Server

*Source: [SQL Command Prompt Utilities (Database Engine) - SQL Server](https://docs.microsoft.com/en-us/sql/tools/command-prompt-utility-reference-database-engine?view=sql-server-ver16)*

## Contents

- [[#Overview|Overview]]
- [[#Command Prompt Utilities Syntax Conventions|Command Prompt Utilities Syntax Conventions]]
- [[#See Also|See Also]]
- [[#Appendix: Links|Appendix: Links]]

***

**Applies to:** 
- ![](https://docs.microsoft.com/en-us/sql/includes/media/yes-icon.svg?view=sql-server-ver16) SQL Server (all supported versions) 
- ![](https://docs.microsoft.com/en-us/sql/includes/media/yes-icon.svg?view=sql-server-ver16) Azure SQL Database 
- ![](https://docs.microsoft.com/en-us/sql/includes/media/yes-icon.svg?view=sql-server-ver16) Azure SQL Managed Instance 
- ![](https://docs.microsoft.com/en-us/sql/includes/media/yes-icon.svg?view=sql-server-ver16) Azure Synapse Analytics 
- ![](https://docs.microsoft.com/en-us/sql/includes/media/yes-icon.svg?view=sql-server-ver16) Analytics Platform System (PDW)

***

## Overview

Command prompt utilities enable you to script [[SQL Server]] operations. 

The following table contains a list of many [[Command Line|command prompt]] utilities that ship with [[SQL Server]].

| **Utility**                                                                                                                                                                         | **Description**                                                                                                                                                                             | **Installed in**                                                                   |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| [bcp Utility](https://docs.microsoft.com/en-us/sql/tools/bcp-utility?view=sql-server-ver16)                                                                                         | Used to copy data between an instance of Microsoft SQL Server and a data file in a user-specified format.                                                                                   | <*drive*:>\Program Files\MicrosoftSQL Server\Client SDK\ODBC\110\Tools\Binn        |
| [dta Utility](https://docs.microsoft.com/en-us/sql/tools/dta/dta-utility?view=sql-server-ver16)                                                                                     | Used to analyze a workload and recommend physical design structures to optimize server performance for that workload.                                                                       | <*drive*>:\Program Files\Microsoft SQL Server\*nnn*\Tools\Binn                     |
| [dtexec Utility](https://docs.microsoft.com/en-us/sql/integration-services/packages/dtexec-utility?view=sql-server-ver16)                                                           | Used to configure and execute an Integration Services package. A user interface version of this command prompt utility is called **DTExecUI**, which brings up the Execute Package Utility. | <*drive*>:\Program Files\Microsoft SQL Server\*nnn*\DTS\Binn                       |
| [dtutil Utility](https://docs.microsoft.com/en-us/sql/integration-services/dtutil-utility?view=sql-server-ver16)                                                                    | Used to manage SSIS packages.                                                                                                                                                               | <*drive*>:\Program Files\Microsoft SQL Server\*nnn*\DTS\Binn                       |
| [Deploy Model Solutions with the Deployment Utility](https://docs.microsoft.com/en-us/analysis-services/multidimensional-models/deploy-model-solutions-with-the-deployment-utility) | Used to deploy Analysis Services projects to instances of Analysis Services.                                                                                                                | <*drive*>:\Program Files\Microsoft SQL Server\*nnn*\Tools\Binn\VShell\Common7\IDE  |
| [osql Utility](https://docs.microsoft.com/en-us/sql/tools/osql-utility?view=sql-server-ver16)                                                                                       | Allows you to enter Transact-SQL statements, system procedures, and script files at the command prompt.                                                                                     | <*drive*>:\Program Files\Microsoft SQL Server\*nnn*\Tools\Binn                     |
| [Profiler Utility](https://docs.microsoft.com/en-us/sql/tools/profiler-utility?view=sql-server-ver16)                                                                               | Used to start SQL Server Profiler from a command prompt.                                                                                                                                    | <*drive*>:\Program Files\Microsoft SQL Server\*nnn*\Tools\Binn                     |
| [RS.exe Utility (SSRS)](https://docs.microsoft.com/en-us/sql/reporting-services/tools/rs-exe-utility-ssrs?view=sql-server-ver16)                                                    | Used to run scripts designed for managing Reporting Services report servers.                                                                                                                | <*drive*>:\Program Files\Microsoft SQL Server\*nnn*\Tools\Binn                     |
| [rsconfig Utility (SSRS)](https://docs.microsoft.com/en-us/sql/reporting-services/tools/rsconfig-utility-ssrs?view=sql-server-ver16)                                                | Used to configure a report server connection.                                                                                                                                               | <*drive*>:\Program Files\Microsoft SQL Server\*nnn*\Tools\Binn                     |
| [rskeymgmt Utility (SSRS)](https://docs.microsoft.com/en-us/sql/reporting-services/tools/rskeymgmt-utility-ssrs?view=sql-server-ver16)                                              | Used to manage encryption keys on a report server.                                                                                                                                          | <*drive*>:\Program Files\Microsoft SQL Server\*nnn*\Tools\Binn                     |
| [sqlagent90 Application](https://docs.microsoft.com/en-us/sql/tools/sqlagent90-application?view=sql-server-ver16)                                                                   | Used to start SQL Server Agent from a command prompt.                                                                                                                                       | <drive>:\Program Files\Microsoft SQL Server\<*instance_name*>\MSSQL\Binn           |
| [sqlcmd Utility](https://docs.microsoft.com/en-us/sql/tools/sqlcmd-utility?view=sql-server-ver16)                                                                                   | Allows you to enter Transact-SQL statements, system procedures, and script files at the command prompt.                                                                                     | <*drive*:>\Program Files\MicrosoftSQL Server\Client SDK\ODBC\110\Tools\Binn        |
| [SQLdiag Utility](https://docs.microsoft.com/en-us/sql/tools/sqldiag-utility?view=sql-server-ver16)                                                                                 | Used to collect diagnostic information for Microsoft Customer Service and Support.                                                                                                          | <*drive*>:\Program Files\Microsoft SQL Server\*nnn*\Tools\Binn                     |
| [sqllogship Application](https://docs.microsoft.com/en-us/sql/tools/sqllogship-application?view=sql-server-ver16)                                                                   | Used by applications to perform backup, copy, and restore operations and associated clean-up tasks for a log shipping configuration without running the backup, copy, and restore jobs.     | <*drive*>:\Program Files\Microsoft SQL Server\*nnn*\Tools\Binn                     |
| [SqlLocalDB Utility](https://docs.microsoft.com/en-us/sql/tools/sqllocaldb-utility?view=sql-server-ver16)                                                                           | An execution mode of SQL Server targeted to program developers.                                                                                                                             | <*drive*>:\Program Files\Microsoft SQL Server\*nnn*\Tools\Binn                     |
| [sqlmaint Utility](https://docs.microsoft.com/en-us/sql/tools/sqlmaint-utility?view=sql-server-ver16)                                                                               | Used to execute database maintenance plans created in previous versions of SQL Server.                                                                                                      | <drive>:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Binn         |
| [sqlps Utility](https://docs.microsoft.com/en-us/sql/tools/sqlps-utility?view=sql-server-ver16)                                                                                     | Used to run PowerShell commands and scripts. Loads and registers the SQL Server PowerShell provider and cmdlets.                                                                            | <*drive*>:\Program Files\Microsoft SQL Server\*nnn*\Tools\Binn                     |
| [sqlservr Application](https://docs.microsoft.com/en-us/sql/tools/sqlservr-application?view=sql-server-ver16)                                                                       | Used to start and stop an instance of Database Engine from the command prompt for troubleshooting.                                                                                          | <drive>:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Binn         |
| [Ssms Utility](https://docs.microsoft.com/en-us/sql/ssms/ssms-utility?view=sql-server-ver16)                                                                                        | Used to start SQL Server Management Studio from a command prompt.                                                                                                                           | <*drive*>:\Program Files\Microsoft SQL Server\*nnn*\Tools\Binn\VSShell\Common7\IDE |
| [tablediff Utility](https://docs.microsoft.com/en-us/sql/tools/tablediff-utility?view=sql-server-ver16)                                                                             | Used to compare the data in two tables for non-convergence, which is useful when troubleshooting a replication topology.                                                                    | <*drive*>:\Program Files\Microsoft SQL Server\*nnn*\COM                            |

For information on the *main* SQL gui and command-line tools, see [SQL Tools Overview](https://docs.microsoft.com/en-us/sql/tools/overview-sql-tools?view=sql-server-ver16).

## Command Prompt Utilities Syntax Conventions

| **Convention** | **Used for** |
| --- | --- |
| UPPERCASE | Statements and terms used at the operating system level. |
| `monospace` | Sample commands and program code. |
| *italic* | User-supplied parameters. |
| **bold** | Commands, parameters, and other syntax that must be typed exactly as shown. |
	


## See Also

-   [Replication Distribution Agent](https://docs.microsoft.com/en-us/sql/relational-databases/replication/agents/replication-distribution-agent?view=sql-server-ver16)
-   [Replication Log Reader Agent](https://docs.microsoft.com/en-us/sql/relational-databases/replication/agents/replication-log-reader-agent?view=sql-server-ver16)
-   [Replication Merge Agent](https://docs.microsoft.com/en-us/sql/relational-databases/replication/agents/replication-merge-agent?view=sql-server-ver16)
-   [Replication Queue Reader Agent](https://docs.microsoft.com/en-us/sql/relational-databases/replication/agents/replication-queue-reader-agent?view=sql-server-ver16)
-   [Replication Snapshot Agent](https://docs.microsoft.com/en-us/sql/relational-databases/replication/agents/replication-snapshot-agent?view=sql-server-ver16)
	
***

## Appendix: Links

- [[JS - Obsidian Web Clipper Bookmarklet|Obsidian Web Clipper Bookmarklet]]
- [[3-Resources/Clippings/_README|Clippings]]
