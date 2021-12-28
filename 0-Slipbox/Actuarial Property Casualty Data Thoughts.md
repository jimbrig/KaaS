---
Date: 2021-12-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Actuarial", "#Topic/Dev/Data"]
Alias: "Actuarial Property Casualty Data Thoughts"
---

# Actuarial Property Casualty Data Thoughts

## Raw Data

- Claims Lossrun
- Latest Exposures at consistent granularity
- Latest Policy Data and Details
- Manual Adjustments, Mapping, and Reference Tables

## Raw Data Ingestion

- Validation
- Reconciliation
- Reasonability Checks
- High Level Comparison to Prior (i.e. dropped claims, missing exposures, etc.)
- Cataloging and Metadata
- Data Dictionary

## Summary Data

- Loss data summarized by policy/accident year for paid, reported, counts, etc. with filtering based on any dimensions such as segment, limit, etc.
- Exposure data summarized by policy/accident year and aggregated to the necessary granularity for matching to loss data
- Indicated Rates: 
	- Frequency = Claim Counts / Exposures
	- Severity = Losses / Counts
	- Loss Cost = Losses / Exposures
- Indicated Trends
- Development and Diagnostic Triangles

## Analysis Specific Data

- Selected Rates, Trends, and Loss Development Factors
- Selected Ultimates and methods utilized
- Manual Adjustments and Assumptions related to data manipulations
- Notes and Comments
- Explanation of anomalies

## Flow

1. Raw Data
2. Working Data
3. Prior, Reference, and Industry Data
4. Summary Tables
5. Triangles
6. Selection of Development Factors
7. Derivation of Actual vs. Expected comparing to P

***

#### Related

- [[Development]]

*Backlinks:*

```dataview
list from [[Actuarial Property Casualty Data Thoughts]] AND -"Changelog"
```