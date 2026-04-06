<div>
<span style="text-align:center">

<p style="text-align:center"><strong>IHE Pharmacy</strong></p>
<p style="text-align:center"><strong>{{site.data.profile.profile.name}}</strong></p>
<p style="text-align:center"><strong>({{site.data.profile.profile.acronym}})</strong></p>
</span>

</div>

### Why "Medication Overview"?

Many terms exist in health IT for a list of a patient's medications: *medication list*, *medication summary*, *medication scheme*, *medication plan*, *medication record*, *treatment plan*, *treatment sheet*. These terms carry different meanings in different countries, settings, and systems — and are often used interchangeably, creating confusion.

This profile uses the term **Medication Overview** deliberately — not to define what such a list should look like, but as a neutral umbrella for the many flavours that exist across healthcare systems.

A key insight for interoperability is that **there is no single "correct" medication list**. Different systems, organisations, and countries produce medication lists that differ in scope, rules, and purpose. Rather than choosing one definition, this profile provides a common structure and exchange mechanism that works across these different flavours.

The two main dimensions this profile addresses are:

**a) Compiled, authored lists** — a curated set of medication treatment lines that someone (a clinician, a system, a process) has assembled and takes responsibility for. Different implementations may call these:

| Flavour | Example |
|---|---|
| Active medication list | What the patient is currently taking |
| Reconciled medication list | Result of a formal medication reconciliation process |
| Discharge medication list | Medications at the point of hospital discharge |
| Authoritative medication scheme | A nationally defined "source of truth" medication list |
| Patient-facing medication scheme | What is communicated to the patient |

**b) The underlying data that feeds those lists** — the individual medication-related resources (prescriptions, dispenses, administrations, patient-reported statements) that are used as input for creating and maintaining the compiled lists. This data may be exchanged on its own — for example, a system may query for all medication resources for a patient and perform its own compilation locally.

This profile provides exchange mechanisms for **both**: a compiled list can be exchanged as a document (PHARM-12), and the underlying data can be queried as individual resources (PHARM-11). The same data structures — **medication treatment lines** — serve as the common building block across all flavours.

---

### Background

A Medication Overview may be produced in different ways, depending on the healthcare system and national architecture:

- **Overview-first:** The medication overview is the source of truth. Clinicians create and maintain treatment lines, and prescriptions are derived from them.
- **Prescription-first:** The medication overview is assembled by aggregating prescriptions, dispenses, and other medication data from the patient's records into treatment lines.
- **Hybrid:** Some treatment lines are clinician-authored (e.g. hospital treatments), while others are derived from existing prescriptions (e.g. community prescriptions).

All three patterns are supported by this profile. How the overview is assembled is an implementation choice — this profile specifies how it is **queried, retrieved, and exchanged**, not how it is built.

### Objectives

The main objectives of this profile are:
- **Exchange, not definition** — provide a common structure and transactions for exchanging medication overview content, without prescribing the rules for how that content is compiled or maintained.
- **Support multiple flavours** — accommodate different kinds of medication lists (active, reconciled, discharge, etc.) and the underlying source data, using the same building blocks.
- **Inclusivity** — accommodate information from different sources: prescriptions, dispenses, hospital administrations, OTC products, and patient-reported medications.
- **Traceability** — each treatment line can link back to the source data it was derived from.
- **Interoperability** — suitable for exchange between systems, organisations, and countries, and for feeding into broader patient summary documents.

---

### Scope

**In scope:**
- The **Medication Overview** as a queryable set of resources (PHARM-11) and as a document (PHARM-12).
- The **Medication Treatment Line** — the core unit of the overview, profiled on MedicationStatement.
- The **Medication Treatment** — optional grouping of related treatment lines, profiled on CarePlan.
- Links to related **prescriptions** (MedicationRequest), **dispenses** (MedicationDispense), and **administrations** (MedicationAdministration).
- **Medicinal product** information with enough detail to be understandable by a recipient system that may not share the same product catalogue.
- Transactions for querying and retrieving the overview.

**Out of scope:**
- How the overview is assembled, reconciled, or maintained internally — this is an implementation concern.
- Reimbursement information.
- Clinical decision support mechanisms.
- Detailed patient and practitioner demographics (referenced, not profiled).

---

### Related profiles

This profile is:
* Designed to work with the [IHE Pharmacy Medication Prescription and Delivery (MPD)](https://profiles.ihe.net/PHARM/MPD) profile — MPD defines the prescription and dispense workflows; MEOW provides the exchange of medication overview content.
* A functional successor to the IHE Pharmacy PML (Patient Medication List) profile and the CDA Medication Treatment Plan, evolved for FHIR-based architectures.
* Aligned with the [HL7 FHIR IPS specification](https://hl7.org/fhir/uv/ips/), so that treatment lines can feed into the IPS Medication Summary section, while retaining the richer detail needed in a specialised medication scheme.
* Supporting the different national patterns that are globally common:
  * Medication lists created from prescriptions and/or dispenses.
  * Medication lists created from treatment plans, from which prescriptions are then derived.

---

Date: {{site.data.publication.publication.date}}   

Author: {{site.data.publication.publisher.name}}  

Email: [{{site.data.publication.publisher.mail}}](mailto:{{site.data.publication.publisher.mail}})
