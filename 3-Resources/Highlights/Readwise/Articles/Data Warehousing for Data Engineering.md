# Data Warehousing for Data Engineering

## Metadata

* Author: *Alan Bernardo Palacio*
* Full Title: Data Warehousing for Data Engineering
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/b85c24c2d662

## Highlights

* Scaling up with a Data Lakehouse
* Data warehouses have been the de facto way of data management for several years until the rise of the data lake, which seeks to overcome the limitations faced when dealing with unstructured data. It accomplishes this by using cloud-based storage systems that allow for cheap storage of unstructured data. This data is read from these unstructured files and processed. And ultimately, the outcome is ingested into a data warehouse.
* The issue with this approach is that it still requires a data warehouse, which has fixed costs derived from it. Moreover, the transformations applied to files stored in the data lake don’t ensure ACID transactions, which means that some applications that deal with transactional data are not suited to use this system.
* The data lakehouse is a data management concept that seeks to unify the benefits from data lakes and data warehouses into a single flexible and cost-efficient platform while ensuring ACID transactions. Business intelligence analytics, data products, and machine learning applications can make use of the same data management system without needing to access multiple systems.
* Data sources can be directly accessed in their raw formats.
* Separation between storage and compute resources.
* Standardized storage file formats enable direct queries without the need for loading or transformation.
* Streams of data can be directly loaded into data structures.
* Enhanced management of unstructured data.
* The objective of a data platform is to provide timely and reliable data while being able to rapidly adapt to the changes in data. Keep this in mind while building yours and try to dig into the requirements of your process to find the solution that works best for you.
