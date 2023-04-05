# Data Warehouse Insurance - Kimball Group

## Metadata

* Author: [Ralph Kimball](../../../../2-Areas/People/Ralph%20Kimball.md)
* Full Title: Data Warehouse Insurance - Kimball Group
* Category: #Type/Highlight/Article
* Document Tags: *Liked* 
* URL: https://www.kimballgroup.com/1995/12/data-warehouse-insurance/

## Highlights

* First, to understand their claims in detail, the users needed to see every possible transaction. This precluded presenting summary data only. Many end-user analyses required the slicing and dicing of the huge pool of transactions. ([View Highlight](https://instapaper.com/read/1475732578/18525232))
* Second, the users needed to view the business in monthly intervals. Claims needed to be grouped by month, and compared at month’s end to other months of the same year, or to months in previous years. This conflicted with the need to store every transaction, because it was impractical to roll-up complex sequences of transactions just to get monthly premiums and monthly claims payments. ([View Highlight](https://instapaper.com/read/1475732578/18525234))
* Third, we needed to deal with the heterogeneous nature of InsureCo’s lines of business. The facts recorded for an automobile accident claim are different than those recorded for a homeowner’s fire loss claim or for a burglary claim. ([View Highlight](https://instapaper.com/read/1475732578/18525236))
* The conflict between the detailed transaction view and the monthly snapshot view almost always requires that you build both kinds of tables in the data warehouse. We call these the transaction views and monthly snapshot views of a business. Note that we are not referring to SQL views here, but to physical tables. ([View Highlight](https://instapaper.com/read/1475732578/18525248))
* we first tackled the transaction and monthly snapshot views of the business by carefully dimensionalizing the base-level claims processing transactions. Every claims processing transaction was able to fit into the star join schema. ([View Highlight](https://instapaper.com/read/1475732578/18525254))
* This structure is characteristic of transaction-level data warehouse schemas. The central transaction-level fact table consists almost entirely of keys. Transaction fact tables typically have only one additive fact, which we call Amount. The interpretation of the Amount field depends on the transaction type, which is identified in the transaction dimension. The Time dimension is actually two instances of the same dimension table connecting to the fact table to provide independent constraints on the Transaction Date and the Effective Date ([View Highlight](https://instapaper.com/read/1475732578/18525258))
* This transaction-level star join schema provided an extremely powerful way for InsureCo to analyze claims. The number of claimants, the timing of claims, the timing of payments made, and the involvement of third parties, such as witnesses and lawyers, were all easily derived from this view of the data. Strangely enough, it was somewhat difficult to derive “claim-to-date” measures, such as monthly snapshots, because of the need to crawl through every detailed transaction from the beginning of history. The solution was to add to InsureCo’s data warehouse a monthly snapshot version of the data. The monthly snapshot removed some of the dimensions, while adding more facts. ([View Highlight](https://instapaper.com/read/1475732578/18525260))
