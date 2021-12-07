---
Date: 2021-12-07
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Project", "#Topic/Dev/R" ]
Alias: [ "lossdevt", "reserver", "reservr", "actdev" ] 
---

# R Package for Actuarial Reserving - `reserver`

Personal Project

## Notes

Objects:

- Cumulative Triangles: used to derive Age-to-Age triangles: `cum_tri` or `dev_tri`
- Incremental Triangles: incremental development triangles showing differences between periods: `incr_tri`
- Diagnostic Triangles: triangles used to evaluate and diagnose a set of claims data's historical experience:
	- Average Case Reserve per Open Claim
	- 
- Age-to-Age Triangles: used to derive averages and incremental loss development factor selections: `ata_tri`
- Incremental Loss Development Factors: used to derive CDFs: `ldf` or `incr_factor` 
- Cumulative Loss Development Factors (CDFs): used to develop losses to ultimate: `cdf` or `cum_factor`
- 




## Contents

```dataview
list from "1-Projects/reserver" AND !#Type/Readme AND -"Changelog"
```

***

*Backlinks*

```dataview
list from [[_README]] AND -"Changelog"
```

