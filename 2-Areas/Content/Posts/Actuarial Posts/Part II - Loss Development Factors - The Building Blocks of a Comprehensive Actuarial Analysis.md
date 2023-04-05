# Part II - Loss Development Factors - The Building Blocks of a Comprehensive Actuarial Analysis

In [Part I - Building the Foundation - Building Blocks of a Comprehensive Actuarial Analyses](Part%20I%20-%20Building%20the%20Foundation%20-%20Building%20Blocks%20of%20a%20Comprehensive%20Actuarial%20Analyses.md) I covered the initial steps undertaken by actuaries in order to create a fully beneficial actuarial analyses. 

Now that that is out of the way, the next steps involve another crucial aspect of actuarial modeling: *the calculation and derivation of loss development factors or LDFs*.

## Contents

* [Overview](Part%20II%20-%20Loss%20Development%20Factors%20-%20The%20Building%20Blocks%20of%20a%20Comprehensive%20Actuarial%20Analysis.md#overview)
  * [Example Reported Loss Development Triangle](Part%20II%20-%20Loss%20Development%20Factors%20-%20The%20Building%20Blocks%20of%20a%20Comprehensive%20Actuarial%20Analysis.md#example-reported-loss-development-triangle)
* [Analyzing Loss Development Triangles](Part%20II%20-%20Loss%20Development%20Factors%20-%20The%20Building%20Blocks%20of%20a%20Comprehensive%20Actuarial%20Analysis.md#analyzing-loss-development-triangles)
* [Deriving Selected Factors](Part%20II%20-%20Loss%20Development%20Factors%20-%20The%20Building%20Blocks%20of%20a%20Comprehensive%20Actuarial%20Analysis.md#deriving-selected-factors)
* [Concluding Remarks](Part%20II%20-%20Loss%20Development%20Factors%20-%20The%20Building%20Blocks%20of%20a%20Comprehensive%20Actuarial%20Analysis.md#concluding-remarks)
* [Appendix: Links](Part%20II%20-%20Loss%20Development%20Factors%20-%20The%20Building%20Blocks%20of%20a%20Comprehensive%20Actuarial%20Analysis.md#appendix-links)

## Overview

Depending on the line of business and coverages involved, it may take several years before any given claim or set of claims in a particular policy to become completely closed and paid.

New information pertaining to existing claims has impacts on liabilities owed long after the policy period has ended, and claims occurring during the policy period may be reported after it expires. 

A snapshot of losses made at the end of the policy period and at each subsequent year provides a good indication of how losses develop from year-to-year, and the way actuaries view these snapshots is through the lens of *Actuarial Loss Development Triangles*.

The loss development triangle is a unique way of arranging annual snapshots for past policy periods into a standard format that aggregates claims data into cells based off the length of time between the beginning of the policy and the snapshot's evaluation date (i.e. the "Maturity" or "Development Age") and the policy year itself. 

By arranging loss data in this way, where columns represent the maturity, or elapsed time since policy inception, and rows represent the policy periods, an actuary can analyze the changes in losses from one evaluation to the next more clearly.

### Example Reported Loss Development Triangle

**Loss Development Triangle for Cumulative Reported Incurred Losses:**

|Policy Year|12|24|36|48|60|
|:---------:|::|::|::|::|::|
|2016|$799,204|$855,023|$943,786|$1,034,762|$1,034,762|
|2017|$908,943|$1,297,037|$1,594,377|$1,888,982||
|2018|$562,032|$738,965|$879,100|||
|2019|$804,582|$900,110||||
|2020|$651,433|||||

**Age to Age Factors**

|Policy Year|12 to 24|24 to 36|36 to 48|48 to 60|60 to ULT|
|:---------:|:------:|:------:|:------:|:------:|:-------:|
|2016|1.107|1.066|1.096|1.000||
|2017|1.427|1.229|1.185|||
|2018|1.315|1.190||||
|2019|1.119|||||

In excel a similar exhibit would look something like so:

![](https://i.imgur.com/OWW8z6e.png)

## Analyzing Loss Development Triangles

The rates by which losses develop from one evaluation to the next are calculated by dividing losses in each column by losses in the prior column for each historical policy period. For example, the table above lists the 12 to 24 age-to-age factor for the 2017 period to be 1.427, which is the 24 month incurred amount of $1,297,037 divided by the 12 month incurred amount of $908,943. 

A loss development factor calculated to be less than 1.000 indicates that the value of reported losses declined, possibly due to a claim being settled for an amount less than was previously reserved.

If this triangle were depicting paid losses or reported claim counts, and not incurred losses, an indicated Age-to-Age factor below 1.000 would be worth investigating due to the fact that paid amounts and reported counts should not decrease except under rare circumstances (recoveries or subrogation and/or claims dropped from the policy, etc.), and could indicate an anomaly or error in your claims data derived from the loss runs collected during Part I of this series.

## Deriving Selected Factors

Several averages of age-to-age factors are then calculated and shown alongside industry and/or prior selected figures in order to select factors most representative of expected loss development and in-line with previous assumptions. 

Computation of loss development factors is based on the selected age-to-age factors. The 12 month to ultimate *cumulative* loss development factor, for instance, is found by multiplying the 12 to 24 month age-to-age factor by the 24 month to ultimate loss development factor.

A number of industry sources exist for loss development factors, such as the *National Council on Compensation Insurance* (NCCI), state rating bureaus, or Best's Aggregates and Averages. 

In some cases, either industry factors or a blend of unique and industry factors may be used. However, the use of unique loss development factors typically results in higher accuracy, provided the historical database is stable and credible (see Part I regarding credibility theory for historical data collection).

The development factors to be applied to reported losses are selected based on the time elapsed from the beginning of the loss period and the date of the most recent evaluation. In most cases, the closer the evaluation date is to the period effective date, the larger the loss development factor needed. Conversely, as the period matures, the loss development factor approaches 1.000. Expected ultimate losses for each period are estimated by multiplying the applicable development factor by the period's recently valued reported losses.

## Concluding Remarks

This post has provided the groundwork to help one better understand and evaluate an actuarial loss development triangle and its corresponding derived loss development factors. However, quite a bit more nuance surrounds their creation and use and it should be noted this is a very simplistic overview. 

Next up I will combine the knowledge gained through the first two posts in this series to introduce [Part III - Actuarial Reserve and Cash Flow Analyses](Part%20III%20-%20Actuarial%20Reserve%20and%20Cash%20Flow%20Analyses.md), were I focus on how to use these derived development factors in the overall actuarial analyses.

See you there!

---

## Appendix: Links

* [Development](../../../MOCs/Development.md)
* [Actuarial Science](../../../MOCs/Actuarial%20Science.md)

*Backlinks:*

````dataview
list from [[The Building Blocks of a Comprehensive Actuarial Analysis Part II - Loss Development Factors]] AND -"Changelog"
````
