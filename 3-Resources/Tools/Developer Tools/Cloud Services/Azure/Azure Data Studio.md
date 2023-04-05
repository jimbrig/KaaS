# Azure Data Studio

Related: 

* [SQL Server Management Studio](../../Data%20Stack/Database%20GUI/SQL%20Server%20Management%20Studio.md) (SSMS)
* [Visual Studio Code](../../IDE/Visual%20Studio%20Code.md)
* [Azure Machine Learning](Azure%20Machine%20Learning.md)

## Contents

* [What is Azure Data Studio](Azure%20Data%20Studio.md#what-is-azure-data-studio)
* [Features](Azure%20Data%20Studio.md#features)
* [SQL code editor with IntelliSense](Azure%20Data%20Studio.md#sql-code-editor-with-intellisense)
* [Smart SQL code snippets](Azure%20Data%20Studio.md#smart-sql-code-snippets)
* [Customizable Server and Database Dashboards](Azure%20Data%20Studio.md#customizable-server-and-database-dashboards)
* [Connection management (server groups)](Azure%20Data%20Studio.md#connection-management-server-groups)
* [Integrated Terminal](Azure%20Data%20Studio.md#integrated-terminal)
* [Extensibility and extension authoring](Azure%20Data%20Studio.md#extensibility-and-extension-authoring)
* [Feature comparison with SQL Server Management Studio (SSMS)](Azure%20Data%20Studio.md#feature-comparison-with-sql-server-management-studio-ssms)
* [Source Control](Azure%20Data%20Studio.md#source-control)
  * [Git support in Azure Data Studio](Azure%20Data%20Studio.md#git-support-in-azure-data-studio)
  * [Open an existing Git repository](Azure%20Data%20Studio.md#open-an-existing-git-repository)
  * [Working with Git repositories](Azure%20Data%20Studio.md#working-with-git-repositories)

## What is Azure Data Studio

[Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/?view=sql-server-ver15) is a cross-platform database tool for data professionals using on-premises and cloud data platforms on Windows, macOS, and Linux.

Azure Data Studio offers a modern editor experience with IntelliSense, code snippets, source control integration, and an integrated terminal. It's engineered with the data platform user in mind, with built-in charting of query result sets and customizable dashboards.

Links:

* [Documentation](https://docs.microsoft.com/en-us/sql/azure-data-studio/?view=sql-server-ver15)
* [Download and Install Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver15)
* [Source Code](https://github.com/microsoft/azuredatastudio)

## Features

## SQL code editor with IntelliSense

Azure Data Studio offers a modern, keyboard-focused SQL coding experience that makes your everyday tasks easier with built-in features, such as multiple tab windows, a rich SQL editor, IntelliSense, keyword completion, code snippets, code navigation, and source control integration (Git). Run on-demand SQL queries, view and save results as text, JSON, or Excel. Edit data, organize your favorite database connections, and browse database objects in a familiar object browsing experience. To learn how to use the SQL editor, see [Use the SQL editor to create database objects](https://docs.microsoft.com/en-us/sql/azure-data-studio/tutorial-sql-editor?view=sql-server-ver15).

## Smart SQL code snippets

SQL code snippets generate the proper SQL syntax to create databases, tables, views, stored procedures, users, logins, roles, and to update existing database objects. Use smart snippets to quickly create copies of your database for development or testing purposes, and to generate and execute CREATE and INSERT scripts.

Azure Data Studio also provides functionality to create custom SQL code snippets. To learn more, see [Create and use code snippets](https://docs.microsoft.com/en-us/sql/azure-data-studio/code-snippets?view=sql-server-ver15).

## Customizable Server and Database Dashboards

Create rich customizable dashboards to monitor and quickly troubleshoot performance bottlenecks in your databases. To learn about insight widgets, and database (and server) dashboards, see [Manage servers and databases with insight widgets](https://docs.microsoft.com/en-us/sql/azure-data-studio/insight-widgets?view=sql-server-ver15).

## Connection management (server groups)

Server groups provide a way to organize connection information for the servers and databases you work with. For details, see [Server groups](https://docs.microsoft.com/en-us/sql/azure-data-studio/server-groups?view=sql-server-ver15).

## Integrated Terminal

Use your favorite command-line tools (for example, Bash, PowerShell, sqlcmd, bcp, and ssh) in the Integrated Terminal window right within the Azure Data Studio user interface. To learn about the integrated terminal, see [Integrated terminal](https://docs.microsoft.com/en-us/sql/azure-data-studio/integrated-terminal?view=sql-server-ver15).

## Extensibility and extension authoring

Enhance the Azure Data Studio experience by extending the functionality of the base installation. Azure Data Studio provides extensibility points for data management activities, and support for extension authoring.

To learn about extensibility in Azure Data Studio, see [Extensibility](https://docs.microsoft.com/en-us/sql/azure-data-studio/extensibility?view=sql-server-ver15). To learn about authoring extensions, see [Extension authoring](https://docs.microsoft.com/en-us/sql/azure-data-studio/extensions/extension-authoring?view=sql-server-ver15).

## Feature comparison with SQL Server Management Studio (SSMS)

**Use Azure Data Studio if you:**

* Are mostly editing or executing queries.
* Need the ability to quickly chart and visualize result sets.
* Can execute most administrative tasks via the integrated terminal using sqlcmd or PowerShell.
* Have minimal need for wizard experiences.
* Do not need to do deep administrative or platform related configuration.
* Need to run on macOS or Linux.

**Use SQL Server Management Studio if you:**

* Are doing complex administrative or platform configuration.
* Are doing security management, including user management, vulnerability assessment, and configuration of security features.
* Need to make use of performance tuning advisors and dashboards.
* Use database diagrams and table designers.
* Need access to Registered Servers.
* Make use of live query stats or client statistics.

## Source Control

Azure Data Studio supports Git for version/source control.

### Git support in Azure Data Studio

Azure Data Studio ships with a Git source control manager (SCM), but you still need to [install Git (version 2.0.0 or later)](https://git-scm.com/download) before these features are available.

### Open an existing Git repository

1. Under the **File** menu, select **Open Folder...**
1. Browse to the folder that contains your files tracked by git, and select **Select Folder**. Subfolders in your local repository are okay to select here.

### Working with Git repositories

Azure Data Studio inherits its Git implementation from VS Code, but doesn't currently support additional SCM providers. For the details about working with Git after you open or initialize a repository, see [Git support in VS Code](https://code.visualstudio.com/docs/editor/versioncontrol#_git-support).

See also: [Git documentation](https://git-scm.com/documentation)

*Backlinks:*

````dataview
list from [[Azure Data Studio]] AND -"Changelog"
````
