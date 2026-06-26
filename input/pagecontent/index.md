<div class="stu-note" markdown="1">
**Preview Release — for review and comment**

This is a **preview release** of the IHE Pharmacy Medication Overview (MEOW) Implementation Guide. It is **not a draft for formal ballot**, and it is not a final publication.

It is published to **advance work on the topic and to collect input** from implementers, clinical experts, and the broader community. The content is deliberately incomplete and subject to change: several design decisions are still open, and a number of pages, terminology artifacts, examples, and conformance details are not yet finalized.

Comments and suggestions are welcome through the [issue tracker](https://github.com/IHE/pharm-meow/issues).
</div>

The IHE Medication Overview profile describes the content and transactions for consistent capture and exchange of patient's medication overviews - also referred as medication lists, or medication schemes.


### Background

Medication Overview is a list of patient's medication related treatments. The actual rules for composing and maintaining such lists can vary. IHE Medication Overview profile addresses multiple use cases and implementation patterns, including two opposite ways of creating the Medication Overview:  
- Medication Overview is the source of truth, and the basis of creating medication requests;  
- Medication Overview is an aggregation of medication information available in patient's medical records (usually prescriptions).

The main objectives of a Medication Overview are:
- better overview of ongoing treatments (multiple prescriptions aggregated into one row);  
- possibility to use different information sources (for example, add OTC products or patient stated medications);  
- suitable for feeding into Medications section in patient summary.

### Scope

**In scope:**
- Medication Overview / Medication List, which can be delivered as a document or a list.
- Description of each line in Medication Overview, and explanation of grouping mechanisms.
- Medicinal product information with enough details to be understandable in a recepient system that may not have access to the same medicinal product library.
- Transactions for retrieving Medication Overview.

**Out of scope:**
- Exact assembling and updating mechanism of the medication overview as similar result can be achieved with various implementation choices,
- Reimbursement information,
- Decision support mechanisms,
- Practitioner and patient details.



This profile 
* Articulated with the [Pharmacy Medication Prescription and Dispense](https://profiles.ihe.net/PHARM/MPD/) workflows.
* Supporting the different cases that are globally common: 
  * Medication lists being created from prescriptions (and/or dispenses) - evolving the IHE Pharmacy PML approach.
  * Medication lists being created from "treatment plans" and from which prescriptions are created.

* Aligned with the [HL7 FHIR IPS specification](https://hl7.org/fhir/uv/ips/), so that the MedicationOverview can be a part of a larger, modular summary, while retaining the necessary capabilities and details that are needed in a specialized medication scheme.


Date: {{site.data.publication.publication.date}}   

Author: {{site.data.publication.publisher.name}}  

Email: [{{site.data.publication.publisher.mail}}](mailto:{{site.data.publication.publisher.mail}})