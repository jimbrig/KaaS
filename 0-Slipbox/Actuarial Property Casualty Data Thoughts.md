---
Date: 2021-12-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Brainstorm", "#Topic/Actuarial/PropertyCasualty", "#Topic/Dev/Data"]
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

1. Raw Data -> Working Data + Prior, Reference, and Industry Data
2. Summary Tables
3. Triangles
4. Selection of Development Factors
5. Interpolation and Extrapolation of Factors (i.e. Persistencies, decay factors, ILFs, interpolation methods, seasonality, priors, industry, weighted averages)
6. Derivation of Discount factors based off paid loss development pattern
7. Derivation of Actual vs. Expected comparing to Prior and using prior's interpolated Development Factors (with prior interpolation logic/persistencies)
	- *Note: Common to adjust latest periods for updates to exposures*
8. Initial Development Ultimates
9. Selection of Rates, Trends, Experience Factors, Credibility Weighting Factors, etc.
10. Selected Ultimates
11. Derivation of Unpaid Reserves (discounted and undiscounted)
12. Simulation and confidence intervals for unpaid reserves
13. Allocation of unpaid reserves/future premiums to entities

***

#### Related

- [[Actuarial Science]]
- [[Data Science]]
- [[Databases]]
- [[Development]]

*Backlinks:*

```dataview
list from [[Actuarial Property Casualty Data Thoughts]] AND -"Changelog"
```