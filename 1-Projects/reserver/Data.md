---
Date: 2021-12-07
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/List"]
Alias: Data
---

# Data

`data-raw`:

scripts for:

- loss_data_all
- loss_data
- transactional_claims_data

## Database Design

- Users
- Roles
- Coverages
- Policies
- Retentions
- ALAE Treatment
- Occurrence Based vs Claims Based
- Deductibles, Limits, Aggregates
- Claimants
- Claims
- Occurrences
- Locations
- Status Codes
- Evaluations
- Transactions
- Transaction Types
- Changes

***

- Account
- Activity
- Agreement
- Claim
- Communication
- Coverage
- Event
- GeographicLocation
- Money
- Party
- Policy
- Policy Coverage Detail
- Policy Deductible
- Policy Limit
- Product
- Product Coverage
- Reinsurance Agreements
- Reinsurance Coverage


- Occurrences:
	- occurrence_uid
	- catastrophic_event_indicator
	- geographic_location_uid
	- date_of_occurrence
	- date_of_closure
	- occurrence_name
	- occurrence_description


***

*Backlinks:*

```dataview
list from [[Data]] AND -"Changelog"
```