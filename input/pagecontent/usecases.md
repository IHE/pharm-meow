### Why medication overviews exist

A medication overview — in whatever form — serves the fundamental need to know **what medications a patient is taking, has taken, or should be taking**. This sounds simple, but in practice it is one of the hardest problems in health IT, because the answer depends on who is asking, what data is available, and what purpose the overview will serve.

Different healthcare systems have developed different approaches:

- In some countries, the medication overview is **the plan** — clinicians create and maintain treatment lines as the primary clinical artifact, and prescriptions are derived from them administratively when needed (e.g. to trigger a dispense or reimbursement). The overview drives the workflow.
- In others, the overview is **secondary** — prescriptions and dispenses are the primary workflow objects, and the medication overview is assembled afterwards by aggregating and reconciling these workflow artifacts. The overview summarises the workflow.
- In most real-world deployments, both patterns coexist: some treatment lines are clinician-authored (e.g. a hospital treatment decision), while others are derived from prescriptions and dispenses (e.g. ongoing community medications).

This profile supports all of these patterns by providing a common structure for exchanging both the **compiled overview** and the **underlying data**, without prescribing how the overview is produced.

---

### Flavours of a medication overview

There is no single correct medication overview. What constitutes "the medication overview" depends on the context:

| Flavour | Description | Example |
|---|---|---|
| **Active medication list** | Medications the patient is currently taking | GP's view of ongoing treatments |
| **Discharge medication list** | Medications at the point of hospital discharge | Handed to patient and community pharmacy |
| **Reconciled medication list** | Result of a formal reconciliation process comparing multiple sources | Hospital admission reconciliation |
| **Aggregated overview** | Automatically assembled from available data, not necessarily clinically reviewed | National registry's view combining prescriptions and dispenses |
| **Patient-maintained list** | What the patient believes they are taking, including OTC and supplements | Patient app or personal health record |
| **Preliminary report** | Linking of prescriptions to dispenses and administrations without clinical authorship | Middleware or registry that prepares data for clinician review |

A key insight is that **one system's compiled overview may be another system's raw data**. A hospital's reconciled discharge list is an authoritative clinical document for the hospital — but for the GP receiving it, it is input data to be reviewed and incorporated into their own medication overview.

---

### Functions around medication overviews

Three fundamental functions recur across all use cases:

**Collect** — gathering medication-related data from available sources. This may involve querying prescription repositories, dispensing systems, administration records, patient self-reports, and other medication overviews. The output is a set of raw resources — not yet curated or reconciled.

**Aggregate** — linking related data together. For example: matching a dispense to the prescription it fulfils, grouping multiple prescriptions for the same medication, or linking a patient-reported statement to an existing treatment line. Aggregation may be automatic and does not necessarily involve clinical judgement. The output is a preliminary, structured view — useful for display but not yet clinically validated.

**Reconcile** — a clinical act in which a healthcare professional reviews the collected and aggregated data, resolves discrepancies, and produces an authoritative medication overview. Reconciliation involves judgement: deciding which medications are truly active, resolving conflicts between sources, and taking responsibility for the result.

This profile covers the **exchange** of data at each of these stages — from raw resources (via [PHARM-12](PHARM-12.html)) to compiled overviews (via [PHARM-11](PHARM-11.html)) — without prescribing how collection, aggregation, or reconciliation are performed internally.

---

### Two types of exchanged content

The outputs of these functions fall into two broad categories, both supported by this profile:

**Processed, report-like data** — a compiled and authored overview. Someone (a clinician, a system, a process) has assembled it, reviewed it, and taken responsibility for its content. It has a clear author, date, and scope. Exchanged as a document via [PHARM-11](PHARM-11.html).

**Record-level ("raw") data** — the individual medication resources (treatment lines, prescriptions, dispenses, administrations, patient-reported statements) that exist in a system. These may or may not have been reviewed or reconciled. Exchanged as a searchset of resources via [PHARM-12](PHARM-12.html).

The boundary between these is not rigid. A reconciled medication list from Hospital A is a clinical document (processed data) — but when Hospital B receives it as part of a transfer, it becomes input (raw data) for Hospital B's own reconciliation process.

---

### Use cases

#### UC-1: Patient maintains their own medication list

A patient uses a personal health application to record the medications they take, including prescription medications, OTC products, and supplements. The patient adds, removes, and updates entries based on their own knowledge.

When the patient visits their GP, the GP's system queries the patient's medication list ([PHARM-12](PHARM-12.html)) and displays it alongside the GP's own records. The GP sees both what the patient reports and what is in the clinical system, and can reconcile differences.

**Challenges illustrated:**
- The patient may report medications that are not in any clinical system (OTC, supplements, medications from another country).
- The patient may say they are **not taking** a medication that is actually prescribed and dispensed — for example, a patient who stopped taking a statin due to muscle pain but never informed their doctor. The treatment line exists in the clinical system with status "active", but the patient's self-report says "not taking". This discrepancy is clinically critical and must be visible.

---

#### UC-2: Hospital reconciliation on admission

A patient is admitted to hospital. The admitting pharmacist needs to determine what medications the patient is actually taking.

1. The hospital system queries the national or regional medication repository ([PHARM-12](PHARM-12.html)) for all medication resources: treatment lines, prescriptions, dispenses, and patient-reported statements.
2. The pharmacist reviews the collected data. They notice:
   - A prescription for an antihypertensive issued 6 months ago with regular monthly dispenses — likely active.
   - A prescription for an antibiotic issued 3 weeks ago with a single dispense — likely completed.
   - A patient-reported entry for a herbal supplement — not in any prescription system.
   - A prescription for a pain medication with **no dispense for 3 months**, then a dispense **2 weeks after the patient returned from a 2-week vacation**. It is unclear whether the patient had stock at home and continued taking the medication during the gap, or whether they interrupted treatment and restarted late. The pharmacist needs to ask the patient.
3. The pharmacist reconciles these into an authoritative medication list for the admission, creating treatment lines for each active medication.
4. The reconciled list is stored and can be retrieved as a document ([PHARM-11](PHARM-11.html)).

**Challenges illustrated:**
- The same medication may appear in multiple sources with different levels of detail (overview on substance name, dispense on brand name).
- Dispense timing does not always reflect actual medication use — gaps may indicate non-adherence, patient stockpiling, or simply different dispensing patterns.
- Reconciliation is a clinical act that produces new treatment lines, not just a display of existing data.

---

#### UC-3: GP maintains medication overview as a document

A GP maintains an ongoing medication overview for their patients. After each consultation, the GP updates the treatment lines — adding new medications, adjusting dosages, stopping discontinued treatments.

The GP's system produces a medication overview document that is:
- Available to the patient (e.g. as a printed medication scheme or via a patient portal).
- Available to other healthcare providers via [PHARM-11](PHARM-11.html) (e.g. a specialist querying the GP's overview before a consultation).
- Suitable for feeding into a national patient summary.

When the GP prescribes a new medication, the treatment line is created first, and the prescription is derived from it. The overview is the source of truth.

---

#### UC-4: Proactive aggregation by a registry or middleware

A national or regional medication registry receives prescriptions ([MPD PHARM-5](https://profiles.ihe.net/PHARM/MPD)) and dispenses ([MPD PHARM-8](https://profiles.ihe.net/PHARM/MPD)) from clinical systems. It automatically links prescriptions to their dispenses, groups related prescriptions for the same medication, and produces a preliminary aggregated view per patient.

This aggregated view is **not a clinical document** — no clinician has reviewed or taken responsibility for it. But it provides a useful starting point:
- A pharmacist querying [PHARM-12](PHARM-12.html) can see prescriptions linked to their dispenses, making it easier to understand the patient's medication history.
- A hospital admitting pharmacist can use the aggregated view as input for their reconciliation (UC-2), rather than starting from raw, unlinked prescriptions and dispenses.
- A clinical system can retrieve the aggregated data and apply its own reconciliation logic.

The registry may also produce preliminary treatment lines — e.g. inferring that a prescription with regular dispenses represents an active treatment — but these are marked as unverified and require clinical confirmation.

**Challenges illustrated:**
- Aggregation without clinical review is valuable but cannot be treated as authoritative.
- The output of one system's aggregation (processed data) becomes input (raw data) for another system's reconciliation.

---

#### UC-5: Discharge medication communication

A hospital discharges a patient. The attending physician produces a discharge medication list containing all medications the patient should take after leaving the hospital. This list:
- Is produced as a medication overview document ([PHARM-11](PHARM-11.html)).
- Includes treatment lines for each medication with dosage, duration, and instructions.
- Is communicated to the patient (as a patient-facing medication scheme) and to the GP and community pharmacy.
- May trigger new prescriptions for medications that require a community prescription.

The GP receives the discharge list. Some medications are new (started in hospital), some are continuations of existing treatments (possibly with adjusted dosage), and some pre-admission medications may have been stopped. The GP reviews the discharge list against their existing overview and updates their records accordingly.

---

#### UC-6: Substance-level overview vs. product-level workflow

A patient's medication overview records that they take "atorvastatin 20 mg once daily" — at the substance level. The most recent prescription specifies "Lipitor 20 mg tablets" — at the brand/product level. The most recent dispense records "Atorvastatine EG 20 mg" — a generic substitution.

All three records describe the same treatment. The medication overview should present this as a single treatment line (atorvastatin 20 mg) with links to the specific prescription and dispense records that contain the product-level detail.

This is a common pattern: **overviews tend to work at the substance level, while workflow objects (prescriptions, dispenses) work at the product level**. The treatment line is the entity that bridges the two.

---

#### UC-7: Discrepancy between prescription and patient behaviour

A patient has an active prescription for metformin 500 mg twice daily. The dispensing records show regular monthly dispenses. However:

- **Scenario A:** The patient tells their GP they stopped taking metformin three months ago because of gastrointestinal side effects. The prescription and dispenses suggest active treatment; the patient's report contradicts this. The GP must update the treatment line to reflect the actual status (not taking, reason: adverse effects) and may choose to stop the prescription or switch to a different formulation.

- **Scenario B:** The patient has a prescription renewed in January. The next dispense is in March — six weeks later than expected for a monthly medication. The patient went on a 2-week vacation in February. Did they have enough stock at home? Did they skip the medication for two weeks? The dispensing gap alone cannot answer this — clinical follow-up is needed. The medication overview should surface this gap so the clinician can ask.

These scenarios illustrate why adherence status and dispense timing are important elements of the medication overview, and why a medication overview is more than just a list of active prescriptions.
