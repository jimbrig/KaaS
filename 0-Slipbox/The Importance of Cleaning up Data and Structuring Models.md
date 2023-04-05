# The Importance of Cleaning up Data and Structuring Models

*Source: [The importance of cleaning up data | AccountingWEB](https://www.accountingweb.co.uk/tech/excel/the-importance-of-cleaning-up-data)*

## Typical Excel Data Process

Many analysts use Excel to summarize cleaned-up data and convert it into information, with structured (sorted and/or ordered) referencing, so that users may understand their numbers, identify trends and produce various reports.

To understand what I mean, as an example, we may receive data like this:

![Excel table with data](https://www.accountingweb.co.uk/sites/default/files/styles/content_full_width/public/1_75.png?itok=WoVAkAmt)

and we may turn it into something more informative, such as this:

![Informative table](https://www.accountingweb.co.uk/sites/default/files/styles/content_full_width/public/2_65.png?itok=XBD8ox5i)

Each attribute (known as a **field**) in a table typically contains a category of data. A **[SQL - Crosstab Query](../2-Areas/Code/SQL/SQL%20-%20Crosstab%20Query.md)** *(similar to the one pictured, above)* summarizes the data from one or more of these fields that are separated into groups based on one or more fields.

Essentially, a [SQL - Crosstab Query](../2-Areas/Code/SQL/SQL%20-%20Crosstab%20Query.md) summarizes data in more than one *dimension* to provide insight that may not be immediately forthcoming otherwise. 

For example, given the source data, how could you possibly notice that Sales for Quarter 4 in the South are very low relative to other quarters and regions?

Excel has many useful tools that will assist, centered on its version of an enhanced crosstab query, known as a ***PivotTable***. However, the subject here is not PivotTables.

There is an important first stage I want to discuss here: that is, *turning data into information we can use* – and that requires **cleaning up our data**.

## Data Cleansing

Data is central to everything we do in Excel. When you receive data for analysis, you don't always have control over the format, structure, positioning/placement, appearance and/or type of data that you import from an external data source, such as a database, text file or a web page.

Before you can analyze the data, you often need to clean it up. Excel has many features that may assist. Sometimes, the task is straightforward and there is a specific feature that does the job for you. For example, you can spell check, remove duplicates or remove all emboldening.

At other times, you may need to manipulate one or more columns by using a formula to convert the imported values into new values by either replacing certain text strings, or removing non-printable characters or excess spaces.

## Utilize Get and Transform

The confusingly named *Power Query* / *Get and Transform* / *Power Pivot* Excel Add-In and its integrated *Excel Data Model* platform are a powerful [Extract, Transform, Load](ETL.md) tool when working with [Excel](../2-Areas/Code/Excel/Excel.md) data.

It is especially useful for creating connections to data ("extraction"), manipulating that ingested data ("transform"), and finally linking/storing it in the Excel Model or workbook ("loading").

*Power Query* can also be parameterized and repeated using functions so that you don't keep having to make similar adjustments to the data every time its updated.

## Excel Data Cleaning Checklist

Here are some steps you can take "generically" when you wish to clean data in [Excel](../2-Areas/Code/Excel/Excel.md):

1. Import the data from an external data source
1. Create a backup copy of the original data in a separate workbook
1. Ensure that the data is in a tabular format of rows and columns with similar data in each column, all columns and rows visible, and no blank rows within the range
1. Consider putting your data in a Table (on ‘Insert’ tab of the ribbon, select “Table’ from ‘Tables’ grouping, **Ctrl + T**)
1. Do tasks that don't require column manipulation first, such as spell-checking (on the ‘Review’ tab of the ribbon, select ‘Spelling’ from the ‘Proofing’ grouping, **Alt + R + S** or **F7**) or using the ‘Find and Replace’ (select ‘Replace…’ from the drop-down list in ‘Find & Select’ in the ‘Editing’ grouping of the ‘Home’ tab of the ribbon, **Ctrl + H**) dialog box
1. Next, do tasks that do require column manipulation. The general steps for manipulating a column are:
   1. Insert a new column (call it “column 2”) next to the original column (call it “column 1”) that needs cleaning
   1. Add a formula that will transform the data at the top of the new column (column 2)
   1. Fill down the formula in the new column (2). In an Excel table, a calculated column is automatically created with values filled down
   1. Select the new column (2), copy it and then paste as values into the new column (2)
   1. Remove the original column (1), which converts the new column from column 2 to column 1.

If for some reason, Get & Transform is not a preferable approach, to periodically clean the same data source, consider recording a macro or writing code to automate the entire process.

---

## Appendix: Links

* [Development](../2-Areas/MOCs/Development.md)
* [Databases](../2-Areas/MOCs/Databases.md)
* [Data Science](../2-Areas/MOCs/Data%20Science.md)
* [Data Engineering](../2-Areas/MOCs/Data%20Engineering.md)

*Backlinks:*

````dataview
list from [[The Importance of Cleaning up Data and Structuring Models]] AND -"Changelog"
````
