# PHARM-11 Retrieve Medication Overview - IHE Pharmacy Medication Overview v0.1.0

* [**Table of Contents**](toc.md)
* [**Volume 2: Transactions**](volume2.md)
* **PHARM-11 Retrieve Medication Overview**

## PHARM-11 Retrieve Medication Overview

## PHARM-11: Retrieve Medication Overview

### Scope

The **Retrieve Medication Overview** transaction [PHARM-11] allows a **Medication Overview Consumer** to retrieve a complete, self-contained medication overview from a **Medication Overview Responder**.

The response is a `MedicationOverviewBundle` — a `Bundle` of type `document` — that carries authorship metadata via a `Composition`, and is suitable for handover, discharge summaries, and legal records. Unlike [PHARM-12](PHARM-12.md), which returns a live searchset of individual resources, this transaction returns a snapshot that is attributed and immutable.

The Consumer may either retrieve a specific known overview by identifier, or search for available overviews matching criteria such as patient, overview type, and date.

-------

### Actors and Roles

| | |
| :--- | :--- |
| **Medication Overview Consumer** | Initiates the retrieval; processes the returned overview Bundle |
| **Medication Overview Responder** | Stores medication overviews and responds to retrieval requests |

> **Note:** The Medication Overview Responder supports this transaction only if the **Document Option** is declared. A Responder that does not store pre-assembled overviews MAY instead support on-demand generation (see [Option: On-Demand Generation](#option-on-demand-generation)).

-------

### Referenced Standards

* HL7 FHIR R5 — Bundle (type: document), Composition, RESTful search
* IHE ITI Appendix Z — FHIR Common Implementation Material
* IHE ITI IUA — Authorization token (grouping requirement)
* IHE ITI ATNA — Audit trail (grouping requirement)
* IHE ITI MHD — Reference pattern for document-based exchange (non-normative)

-------

### Interaction Diagram

-------

### Request Messages

This transaction supports two request patterns. Both return a `MedicationOverviewBundle`. Systems SHALL support Pattern A (direct fetch); Pattern B (search for overviews) is required if the Responder holds multiple overviews per patient.

#### Pattern A — Retrieve a Known Overview

Used when the Consumer already has an identifier for a specific overview (e.g. obtained from a prior directory query or notification).

```
GET [base]/Bundle/[logical-id]

```

or, using a business identifier:

```
GET [base]/Bundle?identifier=[system]|[value]

```

#### Pattern B — Find Available Overviews for a Patient

Used when the Consumer wants to discover what overviews exist for a patient and retrieve the most appropriate one.

```
GET [base]/Bundle?type=document&patient=[ref]&[optional-parameters]

```

##### Optional Filter Parameters for Pattern B

| | | |
| :--- | :--- | :--- |
| `patient` | `reference` | **Required for Pattern B.**The patient whose overviews are requested. Supports local reference or identifier token (`patient.identifier=[system]\|[value]`). |
| `type` | `token` | The overview type / medication list category. Bound to the medication list type ValueSet (open issue[#42](https://github.com/IHE/pharm-meow/issues/42)). Examples: active medication list, discharge medication list, reconciled medication list. |
| `date` | `date` | Filter by overview creation date. Supports`gt`,`lt`,`ge`,`le`prefixes. |
| `_sort=date` | — | Sort results by date descending to retrieve the most recent overview first. |
| `_count` | — | Limit number of overviews returned (e.g.`_count=1`for most recent only). |

##### Example Requests

Fetch an overview by logical id:

```
GET [base]/Bundle/550e8400-e29b-41d4-a716-446655440000

```

Find the most recent active medication list for a patient:

```
GET [base]/Bundle?type=document
    &patient=Patient/123
    &type=http://loinc.org|10160-0
    &_sort=-date
    &_count=1

```

Find all discharge medication overviews for a patient since a date:

```
GET [base]/Bundle?type=document
    &patient=Patient/123
    &type=http://loinc.org|56445-0
    &date=ge2024-01-01

```

Using a national patient identifier:

```
GET [base]/Bundle?type=document
    &patient.identifier=urn:oid:2.16.840.1.113883.2.51.1|A123456789
    &_sort=-date

```

-------

### Overview Types

The `type` parameter selects the kind of medication overview. The following types are anticipated; the ValueSet is under development (see issue [#42](https://github.com/IHE/pharm-meow/issues/42)):

| | | |
| :--- | :--- | :--- |
| Active Medication List | LOINC 10160-0 | All currently active treatment lines |
| Discharge Medication List | LOINC 56445-0 | Medication overview produced at discharge |
| Reconciled Medication List | TBD | Result of a formal medication reconciliation process |
| Aggregated Overview | TBD | Assembled from multiple sources |

> **Open issue:** Finalize the ValueSet for overview type codes, considering existing LOINC codes and the need for additional types (issue [#42](https://github.com/IHE/pharm-meow/issues/42)).

-------

### Response Message

#### Success — 200 OK (Pattern A)

A single `MedicationOverviewBundle` resource is returned, conforming to [MedicationOverviewBundle](StructureDefinition-MedicationOverview.md).

The Bundle SHALL contain:

* **1..1** `MedicationOverviewComposition` — authorship, date, type, and section structure
* **1..1** `Patient` — subject of the overview
* **0..*** `MedicationTreatmentLine` — the treatment lines (mandatory clinical content)
* **0..*** `MedicationTreatment` (CarePlan) — grouping of treatment lines (conditional; present when treatment grouping is represented)
* **0..*** `MedicationRequest` — related prescriptions (optional; included based on Composition sections)
* **0..*** `MedicationDispense` — related dispenses (optional)
* **0..*** `MedicationAdministration` — related administrations (optional)
* **0..*** `Medication` — medication product details referenced by treatment lines

#### Success — 200 OK (Pattern B)

A `Bundle` of type `searchset` is returned. Each entry in the searchset is a `MedicationOverviewBundle`.

* `Bundle.total` reflects the number of matching overviews.
* Each overview entry SHALL be a full `MedicationOverviewBundle` or a reference that the Consumer can dereference to retrieve the full overview.

> **Design question:** Should Pattern B return full overview Bundles inline in the searchset, or references? Full inlining is simple but produces large responses. Returning references (with a subsequent Pattern A fetch) is more scalable. This decision is open.

#### No Results — 200 OK

An empty searchset `Bundle` (`total = 0`) for Pattern B. The Responder SHALL NOT return `404` when there are simply no overviews matching the criteria.

#### Errors

| | |
| :--- | :--- |
| `400 Bad Request` | Missing required parameter or malformed request |
| `401 Unauthorized` | Missing or invalid IUA authorization token |
| `403 Forbidden` | Requester is not authorized to access this patient's overviews |
| `404 Not Found` | Specific overview id does not exist (Pattern A only) |
| `410 Gone` | Overview existed but has been superseded or retracted |

All error responses SHALL include an `OperationOutcome`.

-------

### Option: On-Demand Generation

A Responder that does not store pre-assembled overviews MAY support on-demand generation using the FHIR `$document` operation on a `Composition`:

```
GET [base]/Composition/[id]/$document

```

In this case:

* The Responder internally holds a `MedicationOverviewComposition` resource (with section references to live resources).
* On receipt of `$document`, it assembles and returns a complete `MedicationOverviewBundle`.
* The Consumer receives the same response shape as Pattern A.
* The Responder SHALL declare support for this operation in its CapabilityStatement.

> **Open question:** Should this option be normative (i.e. a defined actor option) or informative? Declare as an Actor Option if on-demand generation is expected to be a distinct implementation pattern.

-------

### Expected Actions

#### Medication Overview Responder

* SHALL return a `MedicationOverviewBundle` conforming to [MedicationOverviewBundle](StructureDefinition-MedicationOverview.md) for a successful Pattern A request.
* SHALL support Pattern B (search) if it holds multiple overviews per patient.
* SHALL perform patient identity resolution per IHE ITI Appendix Z.
* SHALL validate that the requested overview belongs to the authorized patient.
* SHALL record an ATNA PHI-access audit event for each retrieval.
* SHALL return `404` for Pattern A requests when the overview identifier does not exist.
* SHALL return `410 Gone` if an overview has been explicitly retracted or replaced.

#### Medication Overview Consumer

* SHALL be capable of processing a complete `MedicationOverviewBundle`, including all defined section types.
* SHALL validate the overview's `Composition.author` and `Composition.date` for provenance purposes.
* SHALL use Pattern A when it has a direct overview reference; SHOULD use Pattern B only for discovery.
* SHALL present an IUA access token per IHE ITI IUA.

-------

### CapabilityStatement Requirements

The Medication Overview Responder (Document Option) SHALL declare:

```
{
  "type": "Bundle",
  "interaction": [
    { "code": "read" },
    { "code": "search-type" }
  ],
  "searchParam": [
    { "name": "type",      "type": "token",     "documentation": "Filter by overview type (overview category)" },
    { "name": "patient",   "type": "reference",  "documentation": "Required for patient-scoped search" },
    { "name": "date",      "type": "date" }
  ]
}

```

If on-demand generation via `$document` is supported:

```
{
  "type": "Composition",
  "operation": [
    {
      "name": "document",
      "definition": "http://hl7.org/fhir/OperationDefinition/Composition-document"
    }
  ]
}

```

-------

### Relationship to PHARM-12

| | | |
| :--- | :--- | :--- |
| Response type | `Bundle`type=document | `Bundle`type=searchset |
| Authorship | `Composition`with explicit author and date | None — server-assembled view |
| Immutability | Snapshot fixed at overview creation time | Always reflects current state |
| Use case | Handover, discharge, legal record, patient communication | EHR display, CDS, aggregation, synchronisation |
| Mandatory content | MedicationTreatmentLine + Composition + Patient | MedicationTreatmentLine |
| Actor option | Optional (Document Option) | Required (base capability) |

-------

### Security Considerations

* All exchanges SHALL use TLS (HTTPS).
* The Consumer SHALL present an IUA access token.
* The Responder SHALL enforce patient-level access control and verify the overview subject matches the authorized patient scope.
* Both actors SHALL record ATNA PHI-access audit events.
* Overviews marked as confidential in `Composition.confidentiality` SHALL be subject to additional access control enforcement.

-------

### Open Issues

| | |
| :--- | :--- |
| [#42](https://github.com/IHE/pharm-meow/issues/42) | Finalize ValueSet for overview type / medication list category codes |
| [#25](https://github.com/IHE/pharm-meow/issues/25) | Use cases needed to confirm which overview types are in scope |
| [#39](https://github.com/IHE/pharm-meow/issues/39) | MedicationTreatment (CarePlan) profile completion — affects Bundle content |
| — | Decide: Pattern B returns full overviews inline or references? |
| — | Decide: On-demand`$document`— informative or a named actor option? |
| — | Define retraction/replacement semantics (superseded overviews,`410 Gone`) |

