---
Date: 2022-09-03
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: hypothesis
Link: https://dataedo.com/kb/data-glossary/what-is-data-dictionary
Tags: ["#Type/Highlight/Article"]
Aliases: ["What Is Data Dictionary - Data Terminology", "What Is Data Dictionary - Data Terminology"]
---
# What Is Data Dictionary - Data Terminology

## Metadata
- Author: [[dataedo.com]]
- Full Title: What Is Data Dictionary - Data Terminology
- Category: #Type/Highlight/Article
- URL: https://dataedo.com/kb/data-glossary/what-is-data-dictionary

## Highlights
- Data dictionary is an inventory of data elements in a database or data model with detailed description of its format, relationships, meaning, source and usage.
- Data dictionary has 2 essential elements:
  List of tables (or entities)
  List of columns (or fields, or attributes)
- Relational database engines enable much more description of data models and provide this information through their data dictionaries. This information is:
  Data type of column,
  Default values for columns,
  Nullability of columns,
  Table relationships (foreign keys),
  Uniqueness of column values (primary and unique keys),
  Data elements descriptions
- There are more attributes for each table or column that architects, teams or organizations might want to collect that are not supported by database engines. It all depends on the purpose of the data dictionary. Those attributes could be:
  Source,
  Meaning and purpose,
  Use,
  Holds sensitive data,
  List of values,
  String formats,
  UI form label,
  Owner,
- In such case teams can collect this information in external document or dedicated software (referred to as data dictionary tool, metadata repository, data catalog).
- Data Dictionary can be used as a tool to model data. This can be done with dedicated data modeling tool or plain spreadsheet or document. In this case data dictionary serves as a specification of entities and their fields and helps business analysts, subject matter experts and architects to gather requirements and model the domain. Physical database and application is then designed and implemented based on this document.
- Data dictionary can also be used as a reference and cataloging of existing data assets - tables in databases, spreadsheets, files and so on.
  This can be achieved with a few formats and tools:
  Read only HTML or PDF exports from DBMS with database tools
  Manually prepared and maintained spreadsheets,
  Data modeling tools with the use of reverse engineering,
  Database documentation tools,
  Metadata repositories/data catalogs
