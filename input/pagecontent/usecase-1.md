This is the first detailed use case for the IHE Medication Overview (MEOW) Profile. Additional use cases will be added in future versions.

### Use Case 1: Consulting the medication overview before prescribing

**Context.** A patient consults their general practitioner (GP). Before prescribing, the GP wants an up-to-date picture of the patient's current medication.

**Flow.**

1. The GP's system, acting as a Medication Overview Consumer, retrieves the patient's medication overview from a Medication Overview Repository using the [Get Medication Overview \[PHARM-x\]](PHARM-x.html) transaction.
2. The GP reviews the current treatment lines, including medications that were prescribed elsewhere and any recorded adherence information.
3. Taking this information into account, the GP issues a new prescription.
4. A treatment line reflecting the new medication is created and, through the [Submit Medication Overview \[PHARM-y\]](PHARM-y.html) transaction, the updated overview becomes available to other care providers.

This use case illustrates both the retrieval of an existing overview and its update as care progresses.
