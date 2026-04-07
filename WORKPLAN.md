# MEOW Profile — Workplan

These are some ideas for the IHE Pharmacy Medication Overview (MEOW) expert group. where we are, what needs to happen, what decisions the group needs to make, and what remains to be built.

---

## 1. Where we are

The profile has a working foundation:

- **Architecture:** 2 actors (Consumer + Responder), 2 transactions (PHARM-11 Retrieve Medication Overview, PHARM-12 Query Medication Resources). Push architecture (Source + Receiver, PHARM-13) is anticipated but deferred.
- **Profiles:** MedicationTreatmentLine, IHEMedication — plus 9 extensions?  
   - For documents: MedicationOverviewComposition?, MedicationOverviewBundle   
   - deferred: MedicationTreatment (CarePlan)? 
- **Use cases:** 7 use cases drafted covering GP, hospital, patient, registry, discharge, substance-vs-product, and adherence discrepancy scenarios.
- **Cross-profile:** Relationship to MPD, PML, CDA MTP, IPS, and ITI documented. MPD actor grouping specified for both server and client sides.
- **Alignment:** Compared with Belgian BeMedicationLine profile. Key concepts adopted (recorder, clinicalIntentType, offLabel, effectivePeriod.start constraint). Several design decisions pending group review.

What is **not yet done**: terminology (ValueSets/CodeSystems), security and privacy, test plan, several narrative pages (lifecycle, aggregation/reconciliation, actor options, required grouping), examples, and a set of design decisions that require group consensus.

---

## 2. Key decisions for the group

These are the design questions that cannot be resolved editorially. Each one should be discussed and decided in a group meeting, with the decision recorded.

### Architecture & Transactions

| # | Decision | Context | Proposed resolution |
|---|---|---|---|
| D1 | **Is the push transaction (PHARM-13) in scope for this version?** | Determines whether we publish with 2 or 4 actors. Push architecture is designed for but not yet specified. | Defer to next version. Publish with 2 actors; document the intended 4-actor model. |
| D2 | **PHARM-11 Pattern B: full Bundles inline or references?** | When searching for available overviews, should the response contain full document Bundles or just references that require a second fetch? | Start with references (scalable). Allow servers to return full Bundles as an option - how? |
| D3 | **On-demand `$document` generation: informative or actor option?** | Some Responders may generate overviews on demand rather than storing pre-built documents. | Define as a named actor option ("On-Demand Document Option"). **If we do have an operation to produce a list, should that be our only transaction? Maybe for Pharm 11**|
| D4 | **Mandatory `_include` levels for PHARM-12** | Which related resources must every Responder support? Currently all are optional. | `MedicationStatement:medication` mandatory; others optional but declared in CapabilityStatement. **SHOULD WE ADOPT THIS MANDATORY DECLARATION OF SUPPORTED FLAVOURS?**|

### Information Model

| # | Decision | Context | Proposed resolution |
|---|---|---|---|
| D5 | **Status semantics** | For R4, Belgium fixes `status` to "unknown" (!) and uses a separate registrationStatus for record lifecycle. R5 status codes (recorded, draft, entered-in-error) naturally fit record lifecycle. | Use R5 `status` for record lifecycle only. Document that treatment status belongs in `adherence`. |
| D6 | **Treatment-line vs. patient-reported distinction** | How does a Consumer know whether a MedicationStatement is a clinician-determined treatment line or a patient self-report? | **Use `category` with defined codes. Define a ValueSet (linked to D8).** |
| D7 | **MedicationTreatment (CarePlan) conditionality** | When should treatment grouping be present? Always? Only for complex regimens? | Optional. Define guidance for when it adds value (oncology, chronic multi-drug regimens). |
| D8 | **Category ValueSet** | Codes needed for list types and statement types. | Define codes: `treatment-line`, `patient-reported`, `active-list`, `discharge-list`, `reconciled-list`, `aggregated`, `preliminary`. |

### Terminology

| # | Decision | Context | Proposed resolution |
|---|---|---|---|
| D9 | **ClinicalIntentType: own codes or SNOMED?** | Currently own CodeSystem (therapeutic, prophylactic, self-medication). Belgium uses SNOMED (SCT#360271000, SCT#360270004). | Use SNOMED where codes exist; add self-medication as a MEOW-defined code. **SHOULD WE CONSISTENTLY EXPOSE NON-SNOMED CODES AND MAPPINGS TO AVOID MAPPING INCONSISTENCIES? |
| D10 | **Adherence CodeSystem** | Compare Belgium  hierarchy (taking/not-taking × as-directed/not-as-directed) wtih R5 base binding. | Adopt starting point. Review with group for international applicability. |
| D11 | **Sorting of medication lists** | Application responsibility or profile-defined sort order? | Application responsibility. Profile may define `_sort` parameter support but does not mandate sort order. [#44](https://github.com/IHE/pharm-meow/issues/44) |

### Privacy & Security

| # | Decision | Context | Proposed resolution |
|---|---|---|---|
| D12 | **Patient consent and access control model** | Does accessing a medication overview require explicit patient consent? How is consent represented? | Reference IHE BPPC/APPC. Define that Responder SHALL enforce access control policy but do not mandate a specific access control model. Give examples of dissulfiram, TB treatment|
| D13 | **Sensitive medication handling** | Some medications reveal sensitive conditions (HIV, psychiatry, addiction). Should masking/redaction be supported? | Support via Composition.confidentiality and access control policy. Do not define medication-level masking in this version. |
| D14 | **Break-the-glass** | Emergency access when normal authorisation is unavailable. | Reference IHE EUA (Emergency User Access). Require enhanced audit logging. |

---

## 3. Alignment activities

### CDA Medication Treatment Plan (MTP)

The CDA MTP has been deployed in CH, BE, AT and others. MEOW must ensure functional coverage of MTP concepts — not as a mapping exercise, but to confirm that FHIR deployments can cover everything CDA deployments already handle.

**What needs to happen:**
1. Obtain the CDA MTP template and identify all data elements and clinical concepts.
2. Map each MTP concept to its MEOW equivalent. Identify gaps.
3. Specifically review: lifecycle states (PADV entries), authorship model, substitution handling, patient instructions.
4. Document conclusions: what was adopted, what was excluded, and why.

**Who:** National implementers with CDA MTP experience (CH-EMED, BE, AT).

### Belgian BeMedicationLine

Analysis is complete. Findings are recorded below. Group needs to confirm the decisions in D5, D9, D10.

| Finding | Action taken | Pending |
|---|---|---|
| Recorder separate from clinical author | Extension added | Group review |
| Exposure/intent (therapeutic, prophylactic) | ClinicalIntentType extension added | D9: own codes or SNOMED? |
| Structured off-label (boolean + reason + invariant) | Extension added matching BE pattern | Group review |
| effectivePeriod.start required | Constraint added (1..1) | Done |
| registrationStatus separate from status | Not yet adopted | D5: status semantics |
| originType (hospital/ambulatory) | Not yet adopted | Group discussion |
| medication.type (magistral/medicinal product) | Not yet adopted | Group discussion |
| Adherence hierarchy (taking-as-directed, etc.) | adherence.code and .reason are MS | D10: adopt BE CodeSystem? |

### MPD and IPS

Cross-profile considerations page is drafted. Key relationships documented:
- MPD Responder actors group with MEOW Responder (same data, different queries).
- MPD action actors (Order Placer, Dispense Reporter) should optionally group with MEOW Consumer (consult overview before prescribing/dispensing).
- MEOW treatment lines can feed IPS Medication Summary.

---

## 4. What remains to be built

### Profiles & Extensions

- Formal separation of patient-reported vs. treatment-line MedicationStatement (depends on D6)
- MedicationTreatment (CarePlan) profile completion (depends on D7)
- Profiles for MedicationRequest/Dispense/Administration — or formal delegation to MPD
- Must Support audit across all profiles
- Comprehensive examples (complete Bundles, searchset responses, various scenarios)

### Terminology

- Category / list type ValueSet (depends on D8)
- Adherence status CodeSystem and ValueSet (depends on D10)
- ClinicalIntentType — finalise codes (depends on D9)
- Routes of administration ValueSet (stronger binding) — [#19](https://github.com/IHE/pharm-meow/issues/19)
- Substitution reason codes
- Off-label reason codes (or leave open)
- Multilingual name handling — [#45](https://github.com/IHE/pharm-meow/issues/45)

### Transactions & CapabilityStatements

- Finalise PHARM-12 search parameters once terminology is defined
- Decide mandatory vs. optional `_include`/`_revinclude` levels (D4)
- Complete CapabilityStatements for Consumer and Responder
- Design PHARM-13 if in scope (D1)
- Sequence diagram for List-based queries
- Patient identity resolution approach — [#26](https://github.com/IHE/pharm-meow/issues/26)

### Security, Privacy & Audit

- `security_considerations.md` — authentication (IUA), authorisation, transport (TLS), audit (ATNA)
- Patient consent model (D12)
- Sensitive medication handling (D13)
- Break-the-glass (D14)
- ATNA audit event profiles for PHARM-11 and PHARM-12
- Data minimisation guidance
- Patient self-access model

### Test Plan

- Test cases for PHARM-11 and PHARM-12
- Conformance criteria
- Test data (sample Bundles, queries, expected responses)

### Documentation

- `medication_treatment_lifecycle.md` (depends on task 1.2)
- `aggregation_and_medication_reconciliation.md`
- `actor_options.md` (Document Option)
- `actor_required_grouping.md` (IUA + ATNA)
- `volume2.md` transaction overview
- Glossary completion
- Delete orphaned stubs (PHARM-x.md, PHARM-y.md, PHARM-QR1.md, PHARM-O1.md)
- Profile page restructuring — [#38](https://github.com/IHE/pharm-meow/issues/38)

---

## 5. Suggested meeting plan

| Meeting | Focus | Key outcomes |
|---|---|---|
| **Meeting 1** | Use cases & clinical scope | Validate 7 use cases. Agree lifecycle states. Decide list types (D8).|
| **Meeting 2** | Profiles & alignment | CDA MTP content review. BE alignment review. Decide D5 (status), D6 (treatment-line vs. patient-reported), D7 (CarePlan). |
| **Meeting 3** | Terminology | Decide D9 (clinicalIntentType codes), D10 (adherence codes). Define category and adherence ValueSets. |
| **Meeting 4** | Transactions | Finalise PHARM-11/12. Decide D2, D3, D4. Discuss PHARM-13 scope (D1). |
| **Meeting 5** | Security & privacy | Decide D12 (consent), D13 (sensitive meds), D14 (break-the-glass). Draft security_considerations.md. |
| **Meeting 6** | Review & test | Test plan. Examples. Documentation gaps. Publication readiness check. |
| **Publication review** | All | Final review before public comment. |

---

## 6. Open GitHub issues

For reference, the following open issues are tracked in the [GitHub repository](https://github.com/IHE/pharm-meow/issues):

| Issue | Topic | Related to |
|---|---|---|
| [#15](https://github.com/IHE/pharm-meow/issues/15) | Dosage logical model alignment with MPD | WS2 |
| [#16](https://github.com/IHE/pharm-meow/issues/16) | Related administrations in treatment line | D4 |
| [#19](https://github.com/IHE/pharm-meow/issues/19) | Routes of administration ValueSet | WS4 |
| [#20](https://github.com/IHE/pharm-meow/issues/20) | Authorship and responsibility | WS1 |
| [#21](https://github.com/IHE/pharm-meow/issues/21) | Versioning strategy | WS2 |
| [#22](https://github.com/IHE/pharm-meow/issues/22) | Clinical overrides (offLabel) | WS2 |
| [#25](https://github.com/IHE/pharm-meow/issues/25) | Use cases | WS1 |
| [#26](https://github.com/IHE/pharm-meow/issues/26) | Transaction start point / patient identity | WS3 |
| [#27](https://github.com/IHE/pharm-meow/issues/27) | Dynamic dosage | WS2 |
| [#28](https://github.com/IHE/pharm-meow/issues/28) | Dosage protocols | WS2 |
| [#29](https://github.com/IHE/pharm-meow/issues/29) | Extension context tightening (FHIRi) | WS2 |
| [#30](https://github.com/IHE/pharm-meow/issues/30) | MPD/MEOW model alignment | WS5 |
| [#31](https://github.com/IHE/pharm-meow/issues/31) | MPD alignment page | WS5 |
| [#33](https://github.com/IHE/pharm-meow/issues/33) | Tidying up | WS7 |
| [#34](https://github.com/IHE/pharm-meow/issues/34) | Add profiles for medication resources | WS2 |
| [#36](https://github.com/IHE/pharm-meow/issues/36) | Intent extension (clinicalIntentType) | D9 |
| [#37](https://github.com/IHE/pharm-meow/issues/37) | Must Support clarification | WS2 |
| [#38](https://github.com/IHE/pharm-meow/issues/38) | Profile page structure | WS7 |
| [#39](https://github.com/IHE/pharm-meow/issues/39) | MedicationTreatment profile | D7 |
| [#40](https://github.com/IHE/pharm-meow/issues/40) | Substitution alignment | WS2 |
| [#42](https://github.com/IHE/pharm-meow/issues/42) | List type codes | D8 |
| [#44](https://github.com/IHE/pharm-meow/issues/44) | Sorting | D11 |
| [#45](https://github.com/IHE/pharm-meow/issues/45) | Multilingual names | WS4 |
