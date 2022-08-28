---
Date: 2022-06-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev", "#Topic/Actuarial"]
Alias: "US GAAP LDTI - Considerations for the Modeling Actuary"
---

# US GAAP LDTI - Considerations for the Modeling Actuary

*Source: https://www.ey.com/en_us/insurance/finance-risk-actuarial-change/us-gaap-ldti-considerations-for-the-modeling-actuary*

## Contents

- [[#Overview|Overview]]
- [[#Migrating Toward a Defined, yet Adaptive, Future State Vision|Migrating Toward a Defined, yet Adaptive, Future State Vision]]
- [[#End-to-End Considerations|End-to-End Considerations]]
	- [[#End-to-End Considerations#Consolidation and Centralization|Consolidation and Centralization]]
		- [[#Consolidation and Centralization#Single Source of Truth Database Solutions|Single Source of Truth Database Solutions]]
		- [[#Consolidation and Centralization#Consolidate and Standardize to Reduce Complexity|Consolidate and Standardize to Reduce Complexity]]
		- [[#Consolidation and Centralization#Future Operating Model|Future Operating Model]]
	- [[#End-to-End Considerations#Systems Integration and Automation|Systems Integration and Automation]]
		- [[#Systems Integration and Automation#Data Staging and Preparation|Data Staging and Preparation]]
		- [[#Systems Integration and Automation#Disclosures|Disclosures]]
		- [[#Systems Integration and Automation#Integration-Centric Workflow|Integration-Centric Workflow]]
	- [[#End-to-End Considerations#Advanced Analytical Capabilities|Advanced Analytical Capabilities]]
		- [[#Advanced Analytical Capabilities#Dashboard Reporting|Dashboard Reporting]]
		- [[#Advanced Analytical Capabilities#Artificial intelligence and machine learning (AIML)|Artificial intelligence and machine learning (AIML)]]
- [[#Testing and validation: gaining comfort without a point of comparison|Testing and validation: gaining comfort without a point of comparison]]
- [[#Appendix: Links|Appendix: Links]]


## Overview

> Whether largely a compliance or modernization exercise, the considerations for the modeling actuary are numerous.

**In brief:**

-   [[LDTI]]'s impact on the [[actuarial modeling process]] is extensive.
-   Whether you look at [[LDTI]] as a compliance or [[modernization]] exercise, there are numerous considerations for the modeling [[actuary]].
-   Establishing a future state vision of the entire modeling process and translating into a strategy for execution will help position you for successful implementation.

The [[Accounting Standards Update]] (ASU) No. 2018-12, also referred to as *Targeted Improvements to the Accounting for Long-Duration Contracts*, or [[LDTI]] amends existing accounting requirements under generally accepted accounting principles ([[GAAP]]) for long-duration contracts. For U.S. reporting companies, [[LDTI]] is one of the most significant accounting framework changes in decades, impacting virtually every functional area within the company.

The actuarial modeling process is no exception; implementing changes of this magnitude requires careful assessment of the pending requirements, measured coordination with associated in-flight efforts, and collaboration across [[accounting]], [[finance]], [[actuarial]], and [[information technology]] (IT) departments.

In particular, modeling actuaries must navigate a confluence of changes to the models, including increasingly complex calculations, new data sources, new reporting requirements, and integration of functionality being rolled out by actuarial software providers. Further, a company's particular set of circumstances, such as being a public or private entity, or the degree of internal resource capacity, can influence the degree by which LDTI will be more of a compliance exercise versus an opportunity to modernize.

This article explores some key challenges facing the modeling actuary related to LDTI implementation and shares associated compliance and modernization considerations.

## Migrating Toward a Defined, yet Adaptive, Future State Vision

```ad-important

Establishing a clear future state vision of a company's end-to-end process for financial reporting and translating this vision into a strategy and tactical execution blueprint is critical for successful LDTI implementation.

```



Establishing a clear future state vision of a company's end-to-end process for financial reporting and translating this vision into a strategy and tactical execution blueprint is critical for successful LDTI implementation. This is true regardless of whether companies approach LDTI as a compliance exercise, aiming for “minimum viable product,” or as an opportunity to modernize. A key question to answer at the forefront of an LDTI implementation is what scope should be, from a modernization perspective.

Over the past two years, a number of companies have formulated road maps for their LDTI journey, with their modernization scope defined, and are currently in the midst of execution. During this time, the industry had to navigate around a number of moving targets, such as an evolving interpretation of LDTI guidance, changing timelines for go-live date, and evolving industry approaches toward implementation. Companies must then plan and implement adaptively, in an agile fashion, prioritizing or backlogging aspects of development based on new information revealed along the way.

Companies should consider taking stock of current future state vision and blueprints and determine if refinements are required. For example, a number of companies with in-flight model conversions had to make conscious decisions to keep portions of their business on legacy actuarial software given tight implementation timelines. With an expanded implementation horizon, possibilities open up to convert more models to the future state platform and increase the ceiling on transformative benefits to the reporting process.

Taking an adaptive approach, such as agile, or even just periodically reviewing your strategy and tactical blueprint, can help your company realign priorities across the functional areas, and reduce the operational risk of some areas falling behind others. This effort also opens up an opportunity to assess the latest tools and technologies that can be valuable on a look-forward basis.

Lastly, modeling actuaries must take an active stance in contributing to the vision and design of a company’s post-LDTI world. Actuarial models are a key part of the end-to-end LDTI reporting process, and the quality of the model and associated infrastructure will have a direct impact on the efficiency and effectiveness of the end-to-end process.

## End-to-End Considerations

Over the past decade, actuarial models grew increasingly complex due to regulatory changes and greater demands for value-add outputs (e.g., forecasting). Vendor-based actuarial systems reacted with new capabilities, including process automation, data warehousing solutions, cloud-based ecosystems, and systems integration capability through application programming interfaces (APIs). Due to this new technology, actuarial modelers can no longer “fly solo” from other functional areas such as IT, due to considerations around runtime, data, and controls.

LDTI will further stress the actuarial modeling process due to new data requirements (e.g., historical actuals), increased data volume, enhanced disclosures, and more sophisticated analysis. Regardless of whether a company treats LDTI as a compliance exercise or an opportunity to modernize, it must consider the full end-to-end elements of the post-LDTI world now, and design processes that meet regulatory and its own strategic business needs.

The following sections provide some key end-to-end modeling considerations the modeling actuary should be wary of. The degree to which companies may choose to adopt or avoid these concepts depends on the companies’ considerations around compliance and modernization.

### Consolidation and Centralization

LDTI prompts considerations around the consolidation of actuarial models and centralization of the actuarial modeling processes. Many aspects of LDTI makes a centralized process more favorable relative to a decentralized process:

#### Single Source of Truth Database Solutions

The actual historical transactional data will feed into both actuarial models and the financial ledger. Companies that have a “single source of truth” database solution will be able to more effectively implement efficient controls and governance compared with a decentralized data solution. Some companies are taking LDTI as an opportunity to evaluate newer data solutions, for both the relational and non-relational database management systems.

#### Consolidate and Standardize to Reduce Complexity

For most companies, LDTI is expected to be more complex than current GAAP, with more onerous reporting requirements. Companies should look for opportunities to standardize inputs into models and minimize back-end transformations on outputs from models. Companies should also consider consolidating actuarial models, where there are synergies in products or approach, to reduce future ongoing maintenance efforts.

#### Future Operating Model

LDTI will stress existing operating models, with a heavier reliance on actual transaction data, increased assumption governance requirements, and increased calculation complexity. Companies should assess future operating models, including the staffing model and associated mix of required skill sets, to evaluate how to best support future modeling efforts. For example, if a company adopts an LDTI consolidated model, then a single modeling center of excellence can cut across product lines and business units, including a greater presence of IT and data-oriented resources.

### Systems Integration and Automation

Insurers can gain significant operational efficiencies by incorporating well-designed automation in the end-to-end process. The following are some specific automation opportunities that modeling actuaries should consider:

#### Data Staging and Preparation

Streamlining or removing manual processes required for the model inputs, such as in-force inventory and assumption data, can directly improve the ability to automate and control front-end processing. It is also important to capture any incremental historical or transactional data requirements that will be required for back-end reporting, making sure these are processed and warehoused properly for eventual consumption.

#### Disclosures

More detailed financial disclosures are required under LDTI, leading to an increased reliance on sets of model projection output and transaction data. Thought should be given as to how to stage components of the end-to-end process to best accommodate disclosures. Much of the heavy lifting can be handled using the actuarial software platform, via various batching or process automation capabilities. Ideally, designing a “one-click” model runbook would be the goal, and design analysis should be given to determine which parts of the end-to-end process can accommodate the demands. In-house aggregation tools may be needed to aggregate disclosures for the financial statements.

#### Integration-Centric Workflow

When designing future processes in a post-LDTI world, some companies are looking into the use of work orchestration applications to automate and control sets of processes, with goals to create low-touch or no-touch end-to-end processes. Newer generations of these applications often have capabilities to use APIs to integrate different systems (e.g., data warehouse to actuarial modeling system), which can enable automatic data flow among networks of tools. These workflow tools can provide a standardized and controlled model execution process that can be used for period-end reporting for LDTI and other use cases.

### Advanced Analytical Capabilities

The following processes can be leveraged to gain more efficiency and value from the LDTI efforts:

#### Dashboard Reporting

The desire for on-demand dashboard-style reporting is not a new development per LDTI, but the new reporting requirements are furthering demands for these capabilities. A foundational element of this from the modeler’s perspective is to make sure the actuarial modeling system is producing the proper metrics at the proper level of grain to accommodate all back-end reporting needs.

This may require some analysis amid the implementation to map new reports and associated line items to variables resident in your financial models to make sure the data is there. For example, reports such as sources of earnings will look different under LDTI lenses, and companies will need to consider the shape and feel of these reports early on to ensure that the requirements are captured in actuarial models.

On top of that, once the reporting data is at the right level of detail, some companies have looked to move away from bespoke spreadsheet or database tools to the use of more powerful business integration (BI) toolsets when formulating analyses and associated reports. Actuarial modelers often need to work in close contact with valuation, IT, and other areas to develop these BI reports.


#### Artificial intelligence and machine learning (AIML)

The increased complexity associated with the calculation of GAAP balances puts a strain on processing time to some degree for valuation purposes, but even more so when companies aim to forecast GAAP financials. Traditional brute-force nested stochastic techniques are fraught with runtime/granularity tradeoffs that tend to hamper the quality and actionability of associated analyses.
    
We have recently observed consideration of AIML techniques as a mathematical alternative to traditional Monte Carlo simulation techniques, providing a tremendous speed pick-up without sacrificing accuracy.  Application to use cases that forecast LDTI, such as financial planning, pricing, or forecasting, may help enable the fidelity and “speed to market” a modeling actuary can expect from these analyses on a go-forward basis.

## Testing and validation: gaining comfort without a point of comparison

Actuarial modeling functions are no strangers to testing their models. Mature organizations with established first and second lines of defense have time-tested protocols and procedures in place to manage model risk via change management, as well as performing periodic review and inspection of in-production models. LDTI, like PBR, brings a unique challenge to the actuarial modeler when testing and validating a model. The actuarial modeler does not have any readily available challenger models (e.g., legacy models) or validation tools to grab off the shelf to help test and validate these newly built LDTI models. In addition to testing and validating a new measurement model, the actuarial modeler has new data elements and assumptions being fed into the model that have not been tested yet and will require additional procedures and approaches.

In lieu of having legacy model results to validate LDTI against, the actuarial modeler can develop single-cell replication tools and mock disclosures as a form of independent validation of the new calculations performed by the model. Performing a waterfall-type attribution analysis from current GAAP to LDTI on the aggregate results is a viable method to validating and explaining the new LDTI results to management and auditors. These testing procedures typically require resources with a more specific skill set (e.g., LDTI expertise to build independent tools) and require a greater amount of effort to perform than testing against legacy results. Thus, the actuarial modeler should ensure leadership is aware of these testing challenges, so they are appropriately reflected in the LDTI implementation road map.

As part of the project planning phase, the actuarial modeler should develop a complete testing plan, including acceptance criteria to be used as tollgates for each phase of testing, and ultimately deem the end-to-end model fit for production go-live. No actuarial modeler wants to find themselves approaching the go-live date and not being able to get user acceptance of the model because of underestimating the testing required to get these models to go-live. Generally speaking, there are four key benefits of having a comprehensive test strategy covering all phases of testing:

1.  Mitigation of financial reporting risk
2.  Increased predictability and quality
3.  Reduction of overall costs of testing
4.  Demonstration of audit compliance

A well-designed test plan covers the entire end-to-end process of the model. The table below provides a high-level summary of generalized stages of testing that are often employed to assure the quality of the LDTI model(s), considering all aspects of the end-to-end process:

| Testing stage                      | Description                                                                                                                                                                                                                                                                                                                                               | Considerations                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Unit and developer testing         | Initial testing of the model by the developer before considering the configuration of the calculation engine complete\. Unit testing of individual records would be performed to ensure the records are functioning as expected\. In addition to the unit testing, the developer would perform high\-level reasonability tests on the aggregate results\. |  
       
       Multiple components of the model updated for LDTI that require initial testing by the developer \(e\.g\., data, assumptions, calculation engine\) 
       When selecting a sample for unit testing, consider choosing records in a cohort with a limited number of records to increase the efficiency of testing initial cohort\-level calculations 
       An independent validation tool would need to be developed to validate that the measurement model was updated as intended 
                                                                  |
| Component testing                  | Quality assurance testing against associated LDTI requirements within each component of the end\-to\-end LDTI modeling process                                                                                                                                                                                                                            |  
       
       The component testing is often the largest of the testing efforts 
       The following updates should be considered when testing LDTI: 
         
         Inputs—New actual historical data \(including transition balances for modified\-retrospective transition\) and assumptions 
         Calculation engine—New measurement model, development of an independent calculation tool needed to validate updated calculation engine 
         Output—Enhanced disclosures with a heavy reliance on actuarial models to populate 
          
        |
| System integration testing \(SIT\) | Testing performed to validate end\-to\-end integration of components for LDTI, also can be referred to as testing of the “pipes” to ensure correct data is flowing through the end\-to\-end process                                                                                                                                                       |  
       
       LDTI creates new data processes \(e\.g\., actual historical data feeding actuarial models\) in addition to enhancements of existing data and system processes, confirm the data moves from system to system without failure 
       Ensure defects are cleared in advance of user acceptance testing so end users can focus on testing LDTI functionality rather than resolving system/technical defects and issues 
                                                                                                                                   |
| User acceptance testing \(UAT\)    | Testing performed by end users of the LDTI actuarial modeling process to ensure the LDTI requirements were ultimately met for all use cases of LDTI \(e\.g\., valuation, forecasting\)                                                                                                                                                                    |  
       
       Make sure end users can explain and attribute both the transition and projected financial impacts of LDTI 
       UAT includes business capability testing, to validate the ability of the new LDTI end\-to\-end process to meet business needs \(e\.g\., usability, performance\) 
                                                                                                                                                                                                                                                                    |
| Parallel testing                   | Testing performed by end users in parallel to current GAAP financial process to analyze LDTI financial results produced by new actuarial modeling process                                                                                                                                                                                                 |  
       
       Perform on multiple cycles to continue to monitor system stability, the reasonableness of results, and business process continuity before the effective date for LDTI 
       Can be performed in a lagged manner as the company balances the effort of parallel testing and period\-end reporting 
                                                                                                                                                                                                                                                    |

***

## Appendix: Links

- [[Development]]
- [[Actuarial Science]]


*Backlinks:*

```dataview
list from [[US GAAP LDTI - Considerations for the Modeling Actuary]] AND -"Changelog"
```