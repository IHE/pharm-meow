# Cross Profile Considerations - IHE Pharmacy Medication Overview v0.1.0

* [**Table of Contents**](toc.md)
* [**Volume 1 Overview**](volume1.md)
* **Cross Profile Considerations**

## Cross Profile Considerations

This section describes how MEOW relates to other IHE profiles and specifications.

-------

### IHE Pharmacy MPD — Medication Prescription and Delivery

The [IHE Pharmacy MPD](https://profiles.ihe.net/PHARM/MPD) profile defines the exchange of medication prescriptions (MedicationRequest) and dispense records (MedicationDispense). MEOW and MPD are complementary:

* **MPD** covers the **workflow**: ordering, receiving, dispensing, and querying prescriptions and dispenses.
* **MEOW** covers the **consolidated view**: assembling those workflow artifacts — along with patient-reported data, treatment decisions, and administrations — into a coherent medication overview.

#### How MPD actors relate to MEOW

MPD defines four query/response actors that are directly relevant to MEOW:

| | | | |
| :--- | :--- | :--- | :--- |
| **Medication Order Responder** | PHARM-7 (query prescriptions) | `MedicationRequest`resources | A system acting as an MPD Order Responder can be grouped with a MEOW Responder. The same`MedicationRequest`resources returned via PHARM-7 can be returned as`_include`results in MEOW PHARM-12 (Query Medication Resources). |
| **Medication Dispense Responder** | PHARM-9 (query dispenses) | `MedicationDispense`resources | A system acting as an MPD Dispense Responder can be grouped with a MEOW Responder. The same`MedicationDispense`resources returned via PHARM-9 can be returned as`_revinclude`results in MEOW PHARM-12. |
| **Medication Order Consumer** | PHARM-7 | Queries`MedicationRequest` | A system acting as an MPD Order Consumer may also be a MEOW Consumer — querying both prescriptions (via MPD) and treatment lines (via MEOW). |
| **Medication Dispense Consumer** | PHARM-9 | Queries`MedicationDispense` | Same pattern — a system querying dispenses via MPD may also query the medication overview via MEOW. |

#### Shared data, different queries

A key architectural point: **the same underlying data can be accessed through both MPD and MEOW transactions**. Consider a national medication registry that stores prescriptions, dispenses, and treatment lines:

* An **MPD query** (PHARM-7) for a patient's prescriptions returns `MedicationRequest` resources — the individual orders.
* A **MEOW query** (PHARM-12) for the same patient's medication resources returns `MedicationTreatmentLine` entries, with those same `MedicationRequest` resources available as `_include` results.
* A **MEOW retrieve** (PHARM-11) for the same patient returns a compiled overview document that may reference or contain those same prescriptions and dispenses.

The difference is the entry point and the clinical purpose:

* MPD: "show me the prescriptions" or "show me the dispenses" — workflow-oriented.
* MEOW: "show me the medication overview" — treatment-oriented, with the treatment line as the organising entity.

#### Actor grouping — server side

The following groupings are expected on the server side (systems that hold data):

| | |
| :--- | :--- |
| National medication registry | MPD Order Responder + MPD Dispense Responder + MEOW Responder |
| Hospital pharmacy system | MPD Order Responder + MPD Dispense Responder + MEOW Responder |

A system implementing an MPD Responder actor already holds the data that MEOW needs. Adding MEOW Responder capability to such a system is a natural extension — the same `MedicationRequest` and `MedicationDispense` resources served by MPD become available as included resources in MEOW queries.

#### Actor grouping — client side (consulting the overview before acting)

Any system that creates prescriptions, dispenses medications, or administers treatments benefits from consulting the patient's medication overview **before** acting. This is a core safety and clinical workflow requirement — a prescriber needs to see what the patient is already taking before ordering a new medication; a pharmacist needs to check for interactions before dispensing.

Therefore, **all MPD actors that initiate clinical actions are expected to optionally group with the MEOW Consumer**:

| | | |
| :--- | :--- | :--- |
| **Medication Order Placer** | Creates prescriptions | Before prescribing, the clinician needs to see the patient's current medications to check for interactions, duplications, and contraindications |
| **Medication Dispense Reporter** | Records dispenses | Before dispensing, the pharmacist needs to verify the prescription in context of the patient's full treatment |
| **Medication Order Consumer** | Queries prescriptions | A system retrieving prescriptions may also need the broader treatment context |
| **Medication Dispense Consumer** | Queries dispenses | A system retrieving dispenses may also need treatment line context |

This grouping is optional but strongly recommended. In practice, most clinical systems that implement any MPD actor will also need MEOW Consumer capability to provide a complete medication view to their users.

The typical clinical workflow is:

1. Clinician opens patient record → system queries MEOW (PHARM-11 or PHARM-12) to display current medication overview
1. Clinician reviews the overview and decides to prescribe → system uses MPD (PHARM-5) to submit the new prescription
1. The new prescription is incorporated into the medication overview (by the MEOW Responder, internally)
1. Next clinician who opens the patient sees the updated overview

#### Profile constraints

Where MEOW returns `MedicationRequest` or `MedicationDispense` resources (as `_include` / `_revinclude` results in PHARM-12, or as entries in a PHARM-11 overview document), those resources SHOULD conform to the MPD profiles for MedicationRequest and MedicationDispense. This ensures consistency regardless of whether the resource was accessed via an MPD transaction or a MEOW transaction.

-------

### IHE Pharmacy PML — Patient Medication List

The IHE Pharmacy Patient Medication List (PML) profile defined an earlier approach to exchanging medication lists. MEOW is a functional evolution of PML for FHIR-based architectures:

* PML was document-centric (CDA). MEOW supports both document-based exchange (PHARM-11) and resource-based queries (PHARM-12).
* PML did not define a treatment line concept. MEOW introduces the `MedicationTreatmentLine` as the core organising entity.
* PML did not model the relationship between treatment lines and their source data (prescriptions, dispenses, administrations). MEOW makes this explicit via `derivedFrom` and `basedOn`.

Implementations migrating from PML to MEOW should map PML document sections to MEOW Composition sections. The content model is richer in MEOW but the clinical intent is the same.

-------

### CDA Medication Treatment Plan (MTP)

The IHE Pharmacy CDA Medication Treatment Plan has been deployed in several national implementations (Switzerland, Belgium, Austria, and others). MEOW is not a FHIR mapping of MTP — it is a functional evolution that covers the same clinical scope using FHIR resources and modern exchange patterns.

MEOW carries forward the key MTP concepts:

* Treatment lines with lifecycle management
* Authorship and verification metadata
* Indication, intended use, and substitution rules
* Relationship to prescriptions and dispenses

MEOW adds capabilities that MTP did not have:

* Resource-level queries (PHARM-12) — not just document exchange
* Structured adherence tracking
* Clinical intent type (therapeutic / prophylactic / self-medication)
* Off-label use flagging
* Treatment grouping via CarePlan
* `_include`/`_revinclude` to retrieve related workflow resources alongside treatment lines

National implementations currently using CDA MTP should consider MEOW as the FHIR-based successor for new deployments. Co-existence of CDA MTP and FHIR MEOW is expected during transition periods.

-------

### HL7 FHIR IPS — International Patient Summary

The [HL7 FHIR IPS](https://hl7.org/fhir/uv/ips/) defines a Medication Summary section containing `MedicationStatement` resources. MEOW's `MedicationTreatmentLine` is also profiled on `MedicationStatement` and is designed to be compatible with IPS:

* A `MedicationTreatmentLine` can be included in an IPS Medication Summary section.
* MEOW is richer than IPS requires — it adds extensions (verification, substitution, clinical intent, recorder) and structural elements (treatment grouping, derivation links) that IPS does not need but does not prohibit.
* A system producing an IPS can derive its Medication Summary from the MEOW treatment lines by including the IPS-required elements and omitting the MEOW-specific extensions.

The relationship is: **MEOW is a detailed, specialised medication view. IPS is a broad, summary-level patient view. MEOW treatment lines can feed the IPS medication section.**

-------

### IHE ITI profiles — Security and Infrastructure

MEOW actors are expected to be grouped with the following ITI actors:

| | | |
| :--- | :--- | :--- |
| Medication Overview Consumer | IUA Authorization Client | Obtain and present access tokens |
| Medication Overview Responder | IUA Resource Server | Validate access tokens and enforce access control |
| Both | ATNA Secure Node or Secure Application | Record audit events for all transactions |

These groupings are specified in [Actor Required Grouping](actor_required_grouping.md).

