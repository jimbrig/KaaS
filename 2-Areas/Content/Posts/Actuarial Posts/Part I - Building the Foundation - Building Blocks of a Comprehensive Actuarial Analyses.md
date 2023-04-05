# Part I - Building the Foundation - The Building Blocks of a Comprehensive Actuarial Analyses

The series *The Building Blocks of a Comprehensive Actuarial Analyses* kicks off with Part I: Building the Foundation.

This article will walk through, in detail, the various aspects that a comprehensive actuarial analyses requires to get off the ground and running by building a solid foundation for the rest of the analyses to build from. 

*Note that this series is meant specifically for non-life, P&C related actuarial analyses and does not pertain to life insurance techniques or actuarial methodologies.*

## Contents

* [Scope and Data Requirements](Part%20I%20-%20Building%20the%20Foundation%20-%20Building%20Blocks%20of%20a%20Comprehensive%20Actuarial%20Analyses.md#scope-and-data-requirements)
  * [Data Collection](Part%20I%20-%20Building%20the%20Foundation%20-%20Building%20Blocks%20of%20a%20Comprehensive%20Actuarial%20Analyses.md#data-collection)
    * [Current Loss Run](Part%20I%20-%20Building%20the%20Foundation%20-%20Building%20Blocks%20of%20a%20Comprehensive%20Actuarial%20Analyses.md#current-loss-run)
    * [Historical Loss Runs](Part%20I%20-%20Building%20the%20Foundation%20-%20Building%20Blocks%20of%20a%20Comprehensive%20Actuarial%20Analyses.md#historical-loss-runs)
    * [Exposure Data](Part%20I%20-%20Building%20the%20Foundation%20-%20Building%20Blocks%20of%20a%20Comprehensive%20Actuarial%20Analyses.md#exposure-data)
      * [Common Exposure Metrics](Part%20I%20-%20Building%20the%20Foundation%20-%20Building%20Blocks%20of%20a%20Comprehensive%20Actuarial%20Analyses.md#common-exposure-metrics)
    * [Retentions, Limits, and Deductibles](Part%20I%20-%20Building%20the%20Foundation%20-%20Building%20Blocks%20of%20a%20Comprehensive%20Actuarial%20Analyses.md#retentions-limits-and-deductibles)
      * [ALAE Treatment](Part%20I%20-%20Building%20the%20Foundation%20-%20Building%20Blocks%20of%20a%20Comprehensive%20Actuarial%20Analyses.md#alae-treatment)
  * [Data Collection Conclusions](Part%20I%20-%20Building%20the%20Foundation%20-%20Building%20Blocks%20of%20a%20Comprehensive%20Actuarial%20Analyses.md#data-collection-conclusions)
* [Appendix: Links](Part%20I%20-%20Building%20the%20Foundation%20-%20Building%20Blocks%20of%20a%20Comprehensive%20Actuarial%20Analyses.md#appendix-links)

## Scope and Data Requirements

In order to optimize the return on investment for any actuarial analyses, it is important to begin with some high-level questions to discuss with other key stakeholders for clarification and transparency on what the desired outcome of the project is exactly.

Begin by discussing how the analyses will apply to the unique business operations and plans of the company. 

Walk through these important questions in order to build the initial scope of the analyses:

* *What are you trying to accomplish with the actuarial analyses?*
* *What is the overall structure of the program, including coverages and policy years included (experience period)?*
* *Have there been any changes in reserving practices, third-party administrators or claim reporting procedures over the years?*
* *What operational details of your company/client affect loss experience?*
* *What types of loss control programs have been implemented?*

Asking these questions and determining accurate answers ensures the clarification of a baseline to build the scope of the desired requirements for the actuarial analyses.

### Data Collection

After answering the preliminary clarification questions, the next step is to begin gathering all necessary data, starting with the most important, required pieces of data:

#### Current Loss Run

1. First and foremost is a *current* loss run for all open and closed claims. In general, loss runs include the following fields for any individual claim:
   * Claim Number - Unique identifier for any given claim.
   * Claimant - The name of the claimant issuing the claim against the insurance provider.
   * Loss Date - The date on which the accident causing loss or damages occurred.
   * Report Date - The date on which to insurance provider became aware of the claim.
   * Status - The current status of the claim as of the evaluation date of the loss run: Open or Closed
   * State - geographic information about where the claim occurred with relation to coverages and policies (if segmented by state, for example).
   * Accident Description - Text describing what happened
   * Incurred or Reported Losses - Total paid to-date plus outstanding reserves on a claim.
   * Paid Losses - Total amount paid to-date on a claim. 
   * Outstanding Reserves - Estimated amount left to be paid on a claim.

Loss runs should be provided for at least the past five policy periods and *should include all years with any remaining open claims*.

#### Historical Loss Runs

Annually Evaluated Loss Runs for past policy periods are needed in order to compile loss development triangles, which track year-over-year development on incurred loss, paid loss, and reported claim counts. 

Past development history is used to estimate future development in losses from the current evaluation date to the ultimate, estimated paid amount when all claims are closed. If past loss runs are not available, industry loss development factors should be utilized instead.

Note that, when the amount of historically evaluated loss runs utilized increases, not only is it easier to identify trends and patterns over time, but the more reliable the loss data becomes.

In other words, leveraging historical data builds *statistical credibility* into the actuarial model, allowing the projection of ultimate losses and reserves to be less dependent on industry patterns and more specific to the provided data's intrinsic trends and characteristics. 

[Credibility Theory](../../../../0-Slipbox/Credibility%20Theory.md) stems directly from the fundamental theory behind the *Statistical Laws of Probability* and [Bayesian Statistics](../../../../0-Slipbox/Bayesian%20Statistics.md): 

*The more data you have, the more stable that data becomes, and therefore the more we can rely on that data to base future outcomes off of. The less data you have, the data will inevitably vary more and therefore more variability should be placed on the predicted future outcomes and external credible sources of data should be used to provide weights on data-driven predictions.*

#### Exposure Data

Exposure information for at least the past five policy periods **and for the projected next period** is used to adjust historical losses by the volume of exposure for each policy year. Exposure data should tie to provided loss data with regard to what is received and used in the analysis, meaning that loss amounts aggregated by year and other groupings should have the same unit of measurement as the exposure data in order to derive rates (losses over exposures).

Additionally, exposure data should *tie-out* or match up with the aggregated claims data at the policy defined level of granularity. For example if policies are segmented out by coverage, year, line of business, business unit, state, and department, then exposure data should be provided at the same level of granularity where possible. If the analyses requires the allocation of future premiums or reserve estimates to separate entities, this is very important in order to project the correct riskiness associated with each entity being covered. If exposures cannot be segmented to the necessary level of granularity, but the provided claim's data in the loss runs does, then loss amounts could potentially be used to provide an assumed split-out of the exposures (for example loss weights by state in a ten year experience period can be applied to exposures assuming that they fall in-line with the assumed exposure-driven loss amounts).

**Policy premiums** should also directly correlate with exposure trends over time. Policy Premiums can even be used as an exposure metric for deriving earned premiums and estimated loss rates.

Exposures may also have non-claim related attributes and dimensions, which in turn have intrinsic consequences on the exposure data's treatment in the actuarial models. The aggregation of exposure data can include details that indicate separate distinctions of exposure levels and further segmentation may be necessary. For example, separating Fleet Trucks vs. Passenger Vehicles in AL, Full time vs. Part Time Employees in WC, or Neurology Physician vs. Nurse Assistants in MPL. 

These levels should ideally have some form on quantification for comparison with each other in order to allow leveling the exposures out using weighting techniques and deriving separate loss rates representing the level of risk by group. 

##### Common Exposure Metrics

Typical exposure metrics used by coverage include, but are not limited to:

* Worker's Compensation:
  
  * Payroll
  * Number of Employees
* General Liability:
  
  * Revenue
  * Earnings
* Automobile Liability:
  
  * Number of Vehicles
  * Mileage
  * Estimated price of vehicles
* Property Liability:
  
  * Square Footage
  * Estimated Value
* Medical Malpractice or Medical Professional Liability (MPL):
  
  * Physician Headcount
  * Hospital Bed Counts or Occupancy levels

but in practice, exposures can come from a widespread variety of sources related to the business.

#### Retentions, Limits, and Deductibles

Retention levels for each policy period are used to cap losses at per-occurrence retentions, aggregate retentions or quota share amounts declared by the policy. These limited claim amounts are used to derive the actual calculations for determining ultimate losses. 

Not only do these limits provide a way to mitigate large claim outliers in order to derive smooth development factors, but they also have direct consequences when deriving ultimate losses based off the development methods.

For example, if a claim has already breached its $500,000 limit and the company is no longer responsible to any excess amounts greater than $500,000, there is no point in developing ultimate losses for that claim and further and this should be taken into account during loss development.

##### ALAE Treatment

Additionally, the treatment of Allocated Loss Adjustment Expenses (ALAE) is an important piece of information here. This determines whom is responsible for paying for claim expense amounts and typically falls into one of three categories:

1. **Loss and ALAE** - insured is responsible for both loss and ALAE, and both loss and ALAE erode retention limits.
1. **Loss Only** - insured is only responsible for loss amounts and only loss amounts erode the retention limits.
1. **Pro-Rata** - The insured is responsible to a relative portion of ALAE (expenses), relative to the percent of the total claim's loss amount that is loss only.

For example, in a Worker's Compensation, Pro-Rata ALAE Policy scenario, if a claim has the following loss amounts split out between indemnity, medical and expense:

Individual Claim Limit: $500,000

|Indemnity|Medical|Expense|Total|
|---------|-------|-------|-----|
|$320,000|$100,000|$50,000|$470,000|

with Pro-Rata ALAE eroding the retention limit of $500,000 per-claim the amount the insured is responsible for would be:

$($320,000 + $100,000) / $470,000 = 89.36% * $50,000 = $44,680.85$

$44,680.85 versus the total $50,000 in expenses or ALAE because only 89.36% of the total amount is based off non-expense related values.

### Data Collection Conclusions

Reliable data and transparent discussion with your actuary on the offset of the analysis will help produce more reliable results from the analysis, in turn impacting balance sheet values, and influencing loss budgeting and financial decisions of the company.

In summary, data collection should include:

1. Claim level data
1. Exposure level data
1. Policy level data

Remember that both current and historical values for these categories of data (especially loss data) should include the current or latest data, historically evaluated data, and when necessary projected future period data.

One piece of data I left out here is **Industry Data**. Industry data will be addressed later on and will be considered its own separate process since it is less about collecting it and more about how to utilize it best.

I also did not include **Premiums** as its own separate data category as it is assumed these would be included in the policy level data provided.

## Summary and What's Next

In summary, this article provides an intuitive look at how actuaries should frame their projects in order to create the right mindset, determine the scope and requirements of the analyses with stakeholders, and gather the necessary data in order to build the foundation to build the rest of the analyses off of.

* Discuss and determine the business-case for the actuarial analyses through specific questions discussed with key stakeholders related to the project.
* Determine a set of requirements that in turn provide what is *and what is not* included in the scope of the analyses.
* Gather and collect necessary data, keeping in mind the value each category of data brings to an analyses' outcome. 

Next up after data collection is beginning the process of deriving the actuarial *Loss Development Factors* and summarizing claims data into actuarial triangles.

Next: [Part II - Loss Development Factors - The Building Blocks of a Comprehensive Actuarial Analysis](Part%20II%20-%20Loss%20Development%20Factors%20-%20The%20Building%20Blocks%20of%20a%20Comprehensive%20Actuarial%20Analysis.md)

---

## Appendix: Links

Sources:

* [Building Blocks for the Analytically Based – Data Driven Broker | SIGMA Actuarial Consulting Group, Inc. (sigmaactuary.com)](https://www.sigmaactuary.com/2016/08/30/building-blocks-for-the-analytically-based-data-driven-broker/)
* [The Analytically Based – Data Driven Broker: Loss Development Factors | SIGMA Actuarial Consulting Group, Inc. (sigmaactuary.com)](https://www.sigmaactuary.com/2016/11/15/the-analytically-based-data-driven-broker-loss-development-factors/)

Related:

* [Development](../../../MOCs/Development.md)
* [Actuarial Science](../../../MOCs/Actuarial%20Science.md)

*Backlinks:*

````dataview
list from [[The Building Blocks of a Comprehensive Actuarial Analyses]] AND -"Changelog"
````
