---
Date: 2022-02-02
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool"]
Alias: ["SQL Server - DBA MultiTool"]
---

# SQL Server - DBA MultiTool

*Source: [LowlyDBA/dba-multitool (GitHub)](https://github.com/LowlyDBA/dba-multitool) | [Home | DBA MultiTool (dba-multitool.org)](https://dba-multitool.org/)*

## Overview

The [DBA MultiTool](https://github.com/LowlyDBA/dba-multitool) is a suite of scripts for the long haul: optimizing storage, on-the-fly documentation, general administrative needs, and more. Each script relies solely on [[T-SQL]] to ensure it is secure, requires no third-party software, and can be installed in seconds.

## Installation

- [Installation SQL Script](https://github.com/LowlyDBA/dba-multitool/blob/master/install_dba-multitool.sql)

```bash
sqlcmd -S localhost -d master -i install_dba-multitool.sql
```

## Usage

### `sp_doc`

```SQL
EXEC [dbo].[sp_doc] @Database = N'<database name>'
```

***

## Appendix: Related

- [[Tools]]

*Backlinks:*

```dataview
list from [[Tool-Template]] AND -"Changelog"
```