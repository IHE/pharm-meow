# Actors and Transactions - IHE Pharmacy Medication Overview v0.1.0

* [**Table of Contents**](toc.md)
* [**Volume 1 Overview**](volume1.md)
* **Actors and Transactions**

## Actors and Transactions

This section defines the actors and transactions in the MEOW profile.

The figure below shows the actors directly involved in the MEOW Profile and the relevant transactions between them.

**Table 1:33.1-1** lists the transactions for each actor. To claim compliance with this profile, an actor SHALL support all required transactions (labeled **R**) and MAY support the optional transactions (labeled **O**).

| | | | |
| :--- | :--- | :--- | :--- |
| [Medication Overview Consumer](#13311-medication-overview-consumer) | [Retrieve Medication Overview [PHARM-11]](PHARM-11.md) | O | Section 2:3.11 |
| [Query Medication Resources [PHARM-12]](PHARM-12.md) | R | Section 2:3.12 | |
| [Medication Overview Responder](#13312-medication-overview-responder) | [Retrieve Medication Overview [PHARM-11]](PHARM-11.md) | O | Section 2:3.11 |
| [Query Medication Resources [PHARM-12]](PHARM-12.md) | R | Section 2:3.12 | |

> **Future actors:** A **Medication Overview Source** and **Medication Overview Receiver** actor pair will be added in a future version to support push-based exchange of treatment lines [PHARM-13]. See [Cross-Profile Considerations](cross_profile_considerations.md).

-------

### 1:33.1.1 Actor Descriptions and Actor Profile Requirements

#### 1:33.1.1.1 Medication Overview Consumer

The **Medication Overview Consumer** is a system that retrieves medication overview information for a patient. Typical Consumer systems include electronic health records (EHRs), clinical decision support tools, dispensing systems, patient-facing apps, and care coordination platforms.

The Consumer initiates [PHARM-12](PHARM-12.md) queries to retrieve the individual FHIR resources constituting a patient's medication overview — principally `MedicationTreatmentLine` entries, with optional inclusion of related prescriptions, dispenses, and administrations. If the Consumer declares the **Document Option**, it also supports [PHARM-11](PHARM-11.md) to retrieve pre-assembled medication overviews.

The Consumer is responsible for:

* Supplying a valid patient identifier on every request.
* Presenting an authorization token per IHE IUA.
* Processing returned resources or document Bundles and rendering or using them appropriately.
* Handling partial results, empty result sets, and `OperationOutcome` error responses gracefully.

A conformant Medication Overview Consumer SHALL satisfy the requirements in CapabilityStatement [MedicationOverviewConsumer](CapabilityStatement-MedicationOverviewConsumer.md).

-------

#### 1:33.1.1.2 Medication Overview Responder

The **Medication Overview Responder** is a system that stores and/or assembles medication overview data for patients and serves it in response to Consumer requests.

A Responder may hold or generate:

* **MedicationTreatmentLine** resources (profiles on `MedicationStatement`) — the mandatory content of any medication overview.
* **MedicationTreatment** resources (profiles on `CarePlan`) — conditional; present when treatment grouping is clinically relevant.
* **MedicationRequest**, **MedicationDispense**, **MedicationAdministration** — optional linked resources returned via `_include`/`_revinclude`.
* **MedicationOverviewBundle** documents — present only if the **Document Option** is declared.

How the Responder obtains its data is an implementation concern, not an interoperability requirement of this profile. A Responder may:

* Maintain a continuously updated store of treatment lines fed by clinical systems.
* Aggregate and reconcile source data (prescriptions, dispenses, administrations) on demand at query time.
* Store pre-assembled documents produced by a clinical authoring process.

The Responder is responsible for:

* Responding to PHARM-12 queries with conformant searchset Bundles.
* Enforcing patient-level access control.
* Performing patient identity resolution per IHE ITI Appendix Z.
* Recording ATNA audit events for every transaction.
* If the **Document Option** is declared: storing and serving `MedicationOverviewBundle` overviews in response to PHARM-11 requests.

A conformant Medication Overview Responder SHALL satisfy the requirements in CapabilityStatement [MedicationOverviewResponder](CapabilityStatement-MedicationOverviewResponder.md).

-------

### 1:33.1.2 Transaction Descriptions

#### 1:33.1.2.1 Retrieve Medication Overview [PHARM-11]

The Consumer retrieves a pre-assembled medication overview as a `MedicationOverviewBundle` (Bundle type=document) from the Responder. This transaction supports handover, discharge summaries, cross-organisational sharing, and legal records. Requires the **Document Option** on both actors.

For detailed specification see [PHARM-11](PHARM-11.md).

#### 1:33.1.2.2 Query Medication Resources [PHARM-12]

The Consumer searches the Responder for `MedicationTreatmentLine` resources and optionally related resources for a given patient. The response is a FHIR searchset Bundle. This transaction supports live, current-state queries — for example, displaying a patient's active medication list in an EHR or feeding a clinical decision support engine.

For detailed specification see [PHARM-12](PHARM-12.md).

