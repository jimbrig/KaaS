---
Date: 2022-02-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool/R", "#Topic/Dev/R", "#Type/Tool"]
Alias: ["R Package - uptasticsearch", "R Package - uptasticsearch"]
---

# R Package - uptasticsearch

*Source: [uptake/uptasticsearch: An Elasticsearch client tailored to data science workflows. (github.com)](https://github.com/uptake/uptasticsearch)*

## Contents

- [[#Overview|Overview]]
- [[#How it Works|How it Works]]
- [[#Installation|Installation]]
	- [[#R|R]]
	- [[#Python|Python]]
- [[#Usage Examples|Usage Examples]]
	- [[#Example 1: Get a Batch of Documents|Example 1: Get a Batch of Documents]]
	- [[#Example 2: Aggregation Results|Example 2: Aggregation Results]]
- [[#Appendix: Links|Appendix: Links]]



## Overview

<<<<<<< HEAD:3-Resources/Tools/R/R Packages/Database R Packages/R Package - uptasticsearch.md
`uptaasticsearch` is an [[Elasticsearch]] client tailored to data science workflows bundled as an [[3-Resources/Tools/R/R Packages/R Packages|R Package]].
=======
`uptaasticsearch` is an [[Elasticsearch]] client tailored to data science workflows bundled as an [[3-Resources/Tools/Developer Tools/Programming Languages/R/R Packages/R Packages|R Package]].
>>>>>>> develop:3-Resources/Tools/Developer Tools/Languages/R/R Packages/Database R Packages/R Package - uptasticsearch.md

`uptasticsearch` tackles the issue of getting data out of Elasticsearch and into a tabular format in R and Python. It should work for all versions of Elasticsearch from 1.0.0 onwards, but [is not regularly tested against all of them](https://github.com/uptake/uptasticsearch/blob/master/CONTRIBUTING.md#gha). If you run into a problem, please [open an issue](https://github.com/uptake/uptasticsearch/issues).

## How it Works

The core functionality of this package is the `es_search()` function. This returns a `data.table` containing the parsed result of any given query. Note that this includes `aggs` queries.

## Installation

### R

![Lifecycle Maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)

Releases of this package can be installed from CRAN:

```r
install.packages(
  'uptasticsearch'
  , repos = "http://cran.rstudio.com"
)
```

or from `conda-forge`

```shell
conda install -c conda-forge r-uptasticsearch
```

To use the development version of the package, which has the newest changes, you can install directly from GitHub

```r
remotes::install_github(
  "uptake/uptasticsearch"
  , subdir = "r-pkg"
)
```

### Python

![Lifecycle Dormant](https://img.shields.io/badge/lifecycle-dormant-orange.svg)

This package is not currently available on PyPi. To build the development version from source, clone this repo, then :

```shell
cd py-pkg
pip install .
```

## Usage Examples

The examples presented here pertain to a fictional Elasticsearch index holding some information on a movie theater business.

### Example 1: Get a Batch of Documents

The most common use case for this package will be the case where you have an Elasticsearch query and want to get a data frame representation of many resulting documents. 

In the example below, we use `uptasticsearch` to look for all survey results in which customers said their satisfaction was "low" or "very low" and mentioned food in their comments.

```r
library(uptasticsearch)

# Build your query in an R string
qbody <- '{
  "query": {
    "filtered": {
      "filter": {
        "bool": {
          "must": [
            {
              "exists": {
                "field": "customer_comments"
              }
            },
            {
              "terms": {
                "overall_satisfaction": ["very low", "low"]
              }
            }
          ]
        }
      }
    },
    "query": {
      "match_phrase": {
        "customer_comments": "food"
      }
    }
  }
}'

# Execute the query, parse into a data.table
commentDT <- es_search(
    es_host = 'http://mydb.mycompany.com:9200'
    , es_index = "survey_results"
    , query_body = qbody
    , scroll = "1m"
    , n_cores = 4
)
```

### Example 2: Aggregation Results

Elasticsearch ships with a rich set of aggregations for creating summarized views of your data. `uptasticsearch` has built-in support for these aggregations. 

In the example below, we use `uptasticsearch` to create daily timeseries of summary statistics like total revenue and average payment amount.

```r
library(uptasticsearch)

# Build your query in an R string
qbody <- '{
  "query": {
    "filtered": {
      "filter": {
        "bool": {
          "must": [
            {
              "exists": {
                "field": "pmt_amount"
              }
            }
          ]
        }
      }
    }
  },
  "aggs": {
    "timestamp": {
      "date_histogram": {
        "field": "timestamp",
        "interval": "day"
      },
      "aggs": {
        "revenue": {
          "extended_stats": {
            "field": "pmt_amount"
          }
        }
      }
    }
  },
  "size": 0
}'

# Execute the query, parse result into a data.table
revenueDT <- es_search(
    es_host = 'http://mydb.mycompany.com:9200'
    , es_index = "transactions"
    , size = 1000
    , query_body = qbody
    , n_cores = 1
)
```

In the example above, we used the [date_histogram](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-bucket-datehistogram-aggregation.html) and [extended_stats](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-metrics-extendedstats-aggregation.html) aggregations. `es_search()` has built-in support for many other aggregations and combinations of aggregations, with more on the way. Please see the table below for the current status of the package. Note that names of the form "agg1 - agg2" refer to the ability to handled aggregations nested inside other aggregations.

|Agg type                                     | R support?  | Python support?  |
|:--------------------------------------------|:-----------:|:----------------:|
|["cardinality"](http://bit.ly/2sn5Qiw)       |YES          |NO                |
|["date_histogram"](http://bit.ly/2qIR97Z)    |YES          |NO                |
|date_histogram - cardinality                 |YES          |NO                |
|date_histogram - extended_stats              |YES          |NO                |
|date_histogram - histogram                   |YES          |NO                |
|date_histogram - percentiles                 |YES          |NO                |
|date_histogram - significant_terms           |YES          |NO                |
|date_histogram - stats                       |YES          |NO                |
|date_histogram - terms                       |YES          |NO                |
|["extended_stats"](http://bit.ly/2qKqsDU)    |YES          |NO                |
|["histogram"](http://bit.ly/2sn4LXF)         |YES          |NO                |
|["percentiles"](http://bit.ly/2sy4z7f)       |YES          |NO                |
|["significant terms"](http://bit.ly/1KnhT1r) |YES          |NO                |
|["stats"](http://bit.ly/2sn1t74)             |YES          |NO                |
|["terms"](http://bit.ly/2mJyQ0C)             |YES          |NO                |
|terms - cardinality                          |YES          |NO                |
|terms - date_histogram                       |YES          |NO                |
|terms - date_histogram - cardinality         |YES          |NO                |
|terms - date_histogram - extended_stats      |YES          |NO                |
|terms - date_histogram - histogram           |YES          |NO                |
|terms - date_histogram - percentiles         |YES          |NO                |
|terms - date_histogram - significant_terms   |YES          |NO                |
|terms - date_histogram - stats               |YES          |NO                |
|terms - date_histogram - terms               |YES          |NO                |
|terms - extended_stats                       |YES          |NO                |
|terms - histogram                            |YES          |NO                |
|terms - percentiles                          |YES          |NO                |
|terms - significant_terms                    |YES          |NO                |
|terms - stats                                |YES          |NO                |
|terms - terms                                |YES          |NO                |

***

## Appendix: Links

- [[Tools]]
- [[Development]]
<<<<<<< HEAD:3-Resources/Tools/R/R Packages/Database R Packages/R Package - uptasticsearch.md
- [[R]]
- [[3-Resources/Tools/R/R Packages/R Packages]]
=======
- [[2-Areas/MOCs/R]]
- [[3-Resources/Tools/Developer Tools/Programming Languages/R/R Packages/R Packages]]
>>>>>>> develop:3-Resources/Tools/Developer Tools/Languages/R/R Packages/Database R Packages/R Package - uptasticsearch.md


*Backlinks:*

```dataview
list from [[R Package - uptasticsearch]] AND -"Changelog"
```