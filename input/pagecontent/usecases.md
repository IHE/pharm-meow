This section presents the use cases that the IHE Medication Overview (MEOW) Profile is intended to support. Detailed, step-by-step use-case descriptions are being developed; this overview lists the scenarios that drive the scope of the profile.

### Use Case Themes

The profile addresses a range of scenarios in which a patient's medication overview is created, maintained, retrieved and reconciled:

1. **General practice** - a GP maintains a patient's medication overview and consults it before prescribing.
2. **Hospital** - medication information is reconciled on admission and at discharge.
3. **Patient access** - a patient (or their representative) views their own medication overview.
4. **Registry / national infrastructure** - a regional or national service aggregates medication information from multiple sources.
5. **Discharge** - a discharge medication list is produced and shared with downstream providers.
6. **Substance vs. product** - medication is described at the level of substance or of a specific product, depending on what is known.
7. **Adherence discrepancy** - differences between what was prescribed/dispensed and what the patient is actually taking are recorded.

Two opposite patterns for creating a Medication Overview run through these scenarios:

- the Medication Overview is the **source of truth**, from which medication requests are derived; and
- the Medication Overview is an **aggregation** of medication information already present in the patient's records (typically prescriptions and dispenses).

A first detailed use case is presented in [Use Case 1](usecase-1.html).
