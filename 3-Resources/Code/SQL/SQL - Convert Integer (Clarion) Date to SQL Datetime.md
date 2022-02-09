---
Date: 2022-02-06
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Databases"]
Alias: ["SQL - Convert Integer (Clarion) Date to SQL Datetime"]
---

# SQL - Convert Integer (Clarion) Date to SQL Datetime

*Source: [Convert Integer (Clarion) Date to SQL DateTime | thiscodeWorks](https://www.thiscodeworks.com/61faf4d2b783be0015bbaf87)*

```SQL
DECLARE @ClarionDate INT = 47563
DECLARE @SqlDateTime DATETIME 
 
-- Convert the clarion DATE into and SQL DateTime
SET @SqlDateTime = DateAdd(day, @ClarionDate  - 4, '1801-01-01') 
 
SELECT @SqlDateTime AS 'SQL Date Time'
 
-- Now convert it back from and SQL DateTime to a Clarion Date
SET @ClarionDate = DateDiff(day, DateAdd(day, -4, '1801-01-01'), @SqlDateTime)
SELECT @ClarionDate AS 'Clarion Date'
```

## Notes

A Clarion standard date is the number of days that have elapsed since December 28, 1800. The range of accessible dates is from January 1, 1801 (standard date 4) to December 31, 9999 (standard date 2,994,626). Date procedures will not return correct values outside the limits of this range. The standard date calendar also adjusts for each leap year within the range of accessible dates. Dividing a standard date by modulo 7 gives you the day of the week: zero = Sunday, one = Monday, etc. 

The LONG data type with a date format (@D) display picture is normally used for a standard date. Data entry into any date format picture with a two-digit year defaults to the century of next 20 or previous 80 years. For example, entering 01/01/01 results in 01/01/2001 if the current year (per the system clock) is greater than 1980, and 01/01/1901 if the current year is 1980 or earlier. 

The DATE data type is a data format used in the Btrieve Record Manager and some other file systems. A DATE field is internally converted to LONG containing the Clarion standard date before any mathematical or date procedure operation is performed. Therefore, DATE should be used for external file compatibility, and LONG is normally used for other dates.


***

## Appendix: Links

- [[3-Resources/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[SQL Server]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - Convert Integer (Clarion) Date to SQL Datetime]] AND -"Changelog"
```