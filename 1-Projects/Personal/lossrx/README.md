# R Package for Actuarial Reserving - `reserver`

Personal Project

## Triangles and LDFs

* Cumulative Triangles: used to derive Age-to-Age triangles: `cum_tri` or `dev_tri`
* Incremental Triangles: incremental development triangles showing differences between periods: `incr_tri`
* Diagnostic Triangles: triangles used to evaluate and diagnose a set of claims data's historical experience:
  * Average Case Reserve per Open Claim
  * Average Paid per Closed Claim
  * Triangles involving exposure denominators for rating trends
* Age-to-Age Triangles: used to derive averages and incremental loss development factor selections: `ata_tri`
* Incremental Loss Development Factors: used to derive CDFs: `ldf` or `incr_factor` 
* Cumulative Loss Development Factors (CDFs): used to develop losses to ultimate: `cdf` or `cum_factor`

---

* Cumulative Paid and Reported Triangles
  
  * Gross and Net of any ceded reinsurance.
  * Unlimited and optional limits
* Cumulative Reported Claim Count Triangle
  
  * Including and Excluding *Closed without payment claims*
* Large claim listing with case reserve values that exceed a particular threshold

* Calendar period written and earned premiums, policies in force, historical rate changes, and relevant exposure metrics.

---

Diagnostics:

* Paid to incurred loss ratios
* Paid loss severities (paid loss divided by closed with payment counts) and resulting percentage changes between accident years at each age of development
* Incurred loss severities (incurred loss divided by the difference of reported counts and closed without payment counts) and resulting percentage changes between accident years at each age of development
* Closed with payment counts to reported counts ratios
* Closed without payment counts to reported counts ratios
* Open counts to reported counts ratios
* Open counts, case reserves, and average case reserves (case reserves divided by open counts)
* Incremental paid losses and incremental paid loss severities

Patterns:

* Development factors should be *monotonically decreasing* and smooth (i.e. not too much volatility)

## Development Methods

* Paid and Reported Loss Development Chain Ladder Methods
* Reported Claim Count Chain Ladder Loss Development Method
* Bornhuetter-Ferguson (B-F) Method
* Incremental Paid Development Method
* Case Reserve Method
* Frequency x Severity Method
* Loss Cost Method

## Ultimate Diagnostics

* Ultimate frequency diagnostic - ultimate claim counts divided by exposure or premium (actual and on-level/trended) for each accident year
* Ultimate severity diagnostic - ultimate losses (actual and on-level/trended) divided by claim counts for each accident year
* Ultimate loss ratio diagnostic - ultimate losses / exposure or premium
* Avg Outstanding Severity - total reserves / Open + IBNR counts
* Case incurred floor - reviewing the ultimate loss selections for each AY against case reserves to avoid negative IBNR

## Contents

````dataview
list from "1-Projects/reserver" AND !#Type/Readme AND -"Changelog"
````

---

*Backlinks*

````dataview
list from [[_README]] AND -"Changelog"
````
