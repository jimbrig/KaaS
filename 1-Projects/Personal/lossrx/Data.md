# Data

`data-raw`:

scripts for:

* loss_data_all
* loss_data
* transactional_claims_data

## Database Design

* Users
* Roles
* Coverages
* Policies
* Retentions
* ALAE Treatment
* Occurrence Based vs Claims Based
* Deductibles, Limits, Aggregates
* Claimants
* Claims
* Occurrences
* Locations
* Status Codes
* Evaluations
* Transactions
* Transaction Types
* Changes

---

* Account

* Activity

* Agreement

* Claim

* Communication

* Coverage

* Event

* GeographicLocation

* Money

* Party

* Policy

* Policy Coverage Detail

* Policy Deductible

* Policy Limit

* Product

* Product Coverage

* Reinsurance Agreements

* Reinsurance Coverage

* Occurrences:
  
  * occurrence_uid
  * occurrence_number
  * catastrophic_event_indicator
  * geographic_location_uid
  * date_of_occurrence
  * date_of_closure
  * occurrence_name
  * occurrence_description

Claims:
- claim_uid
- claim_number
- occurrence_uid
- claimant_uid
- policy_uid
- event_uid
- claim_location_uid
- claim_status_code
- incurred_loss (splits)
- paid_loss (splits)
- claim_description
- claim_report_date
- claim_close_date
- claim_reopen_date
- claim_status_code
- claim_claims_made_date
- claim_submission_date

---

*Backlinks:*

````dataview
list from [[Data]] AND -"Changelog"
````
