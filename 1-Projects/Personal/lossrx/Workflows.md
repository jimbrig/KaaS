# Workflows

## I) Acquire Raw Data

 > 
 > Receive new, raw data from source (client, database, etc.)

Phases:

* Investigation Phase: investigate top-level things like:
  
  * File formats
  * File Sizes
  * Column and Field Names
  * Logical Calculated and inter-dependent fields or duplication
  * Compare dimensionality to any prior received data
* Initial Validation Phase:

* Caching Phase:

* Logging

* Cleanse Phase:

* Transform Phase:

* Working Phase:

* Analysis Phase

* Aggregation and Summary Phase

* Results

---

Aggregate for triangles by year, maturity, and any groups necessary for all needed value_types: paid, incurred, counts, case reserves, split-outs.

Derive loss triangles

Derive diagnostic triangles

Apply and save selections for LDFs

Derive CDFs and %'s from LDFs

Interpolate, Persist, Decay, and Extrapolate CDFs

Compare Derived CDFs to Priors

Derive initial development ultimate values

Derive rates and trends

---

*Backlinks:*

````dataview
list from [[Workflows]] AND -"Changelog"
````
