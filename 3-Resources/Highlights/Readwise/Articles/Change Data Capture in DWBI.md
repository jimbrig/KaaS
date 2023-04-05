# Change Data Capture in DWBI

## Metadata

* Author: *Pooja Kelgaonkar*
* Full Title: Change Data Capture in DWBI
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/af08b54d8fb5

## Highlights

* Change Data Capture(CDC) is one of the most important feature of DWBI implementations. CDC is used to identify changed data and apply changes to Data Warehouse. Change data capture (CDC) is the process of recognizing when data has been changed in a source system so a downstream process or system can action that change. A common use case is to reflect the change in a different target system so that the data in the systems stay in sync.
* Change data capture (CDC) records insert, update, and delete activity that applies to a table. This activity makes the details of the changes available in an easily consumed relational format. Column information and the metadata that is required to apply the changes to a target environment is captured for the modified rows and stored in change tables that mirror the column structure of the tracked source tables.
* There are different types of CDCs which can be implemented - Type I ,Type II and Type III. Type I doesn't store history. This updates record directly, there is no record of historical values, only current state.
* Type II - Row versioning , Track changes as version records with current flag & active dates and other metadata.
* Type III - History versioning, preserve versions of data. Track change to a specific attribute, add a column to show the previous value, which is updated as further changes occur. SCD Type II is widely used implementation in DWBI
* with SCD Type II implementation, target table need to add few extra columns to track versioning - e.g. Active_IND, Start_Date, End_Date etc. Active Indicator column represents if the record is active or inactive(old/historical record). For new/updated record the indicator column is set to "Y" or"Yes" and for old records, its set to "N" or "No". Start date is date when the record is start date/load date. End date is date when the record gets updated for historical record. For all new/active record inserted, end date is set to NULL.
* Delta Capture - Source data received from source system on scheduled basis.
* Identify Change - Source data compared against target table to identify records existed/updated and new records to be considered as inserted to the target table
* Apply Change - Once records identified to be inserted or updated. Update and Inserts can be applied to the target system. In case of updates, old records are updated for flag - Active_IND and End_date with date of updation. In case of inserts, active_ind set to Y and End_date as NULL .All records to be updated and inserted all together as inserts to the target system.
* In some of the implementations, Batch_ID is also used along with date and indicator columns. with Batch id , loads can be identified with batch of data load. Batch id can also be used as part of Audit Batch Control.
