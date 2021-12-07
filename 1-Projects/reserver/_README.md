---
Date: 2021-12-07
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Project", "#Topic/Dev/R" ]
Alias: [ "lossdevt", "reserver", "reservr", "actdev" ] 
---

# R Package for Actuarial Reserving - `reserver`

Personal Project

## Triangles and LDFs

- Cumulative Triangles: used to derive Age-to-Age triangles: `cum_tri` or `dev_tri`
- Incremental Triangles: incremental development triangles showing differences between periods: `incr_tri`
- Diagnostic Triangles: triangles used to evaluate and diagnose a set of claims data's historical experience:
	- Average Case Reserve per Open Claim
	- Average Paid per Closed Claim
	- Triangles involving exposure denominators for rating trends
- Age-to-Age Triangles: used to derive averages and incremental loss development factor selections: `ata_tri`
- Incremental Loss Development Factors: used to derive CDFs: `ldf` or `incr_factor` 
- Cumulative Loss Development Factors (CDFs): used to develop losses to ultimate: `cdf` or `cum_factor`

***

- Cumulative Paid and Reported Triangles
	- Gross and Net of any ceded reinsurance.
	- Unlimited and optional limits

- Cumulative Reported Claim Count Triangle
	- Including and Excluding *Closed without payment claims*

- Cumulative Closed with Loss Payment Claim Count Triangle



## Contents

```dataview
list from "1-Projects/reserver" AND !#Type/Readme AND -"Changelog"
```

***

*Backlinks*

```dataview
list from [[_README]] AND -"Changelog"
```

