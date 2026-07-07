# MeOw Home - IHE Pharmacy Medication Overview v0.1.0

* [**Table of Contents**](toc.md)
* **MeOw Home**

## MeOw Home

| | |
| :--- | :--- |
| *Official URL*:http://profiles.ihe.net/PHARM/MEOW/ImplementationGuide/ihe.pharm.meow | *Version*:0.1.0 |
| Active as of 2026-04-07 | *Computable Name*:IHE_PHARM_MEOW |
| **Copyright/Legal**: IHE http://www.ihe.net/Governance/#Intellectual_Property | |

 
**IHE Pharmacy** 
**MedicationOverview** 
**(MEOw)** 

### Why "Medication Overview"?

Many terms exist in health IT for a list of a patient's medications: **medication list**, **medication summary**, **medication scheme**, **medication plan**, **medication record**, **treatment plan**, **treatment sheet**. These terms carry different meanings in different countries, settings, and systems — and are often used interchangeably, creating confusion.

This profile uses the term **Medication Overview** deliberately — not to define what such a list should look like, but as a neutral umbrella for the many flavours that exist across healthcare systems.

A key insight for interoperability is that **there is no single "correct" medication list**. Different systems, organisations, and countries produce medication lists that differ in scope, rules, and purpose. Rather than choosing one definition, this profile provides a common structure and exchange mechanism that works across these different flavours.

The two main dimensions this profile addresses are:

**a) Compiled, authored lists** — a curated set of medication treatment lines that someone (a clinician, a system, a process) has assembled and takes responsibility for. Different implementations may call these:

| | |
| :--- | :--- |
| Active medication list | What the patient is currently taking |
| Reconciled medication list | Result of a formal medication reconciliation process |
| Discharge medication list | Medications at the point of hospital discharge |
| Authoritative medication scheme | A nationally defined "source of truth" medication list |
| Patient-facing medication scheme | What is communicated to the patient |

**b) The underlying data that feeds those lists** — the individual medication-related resources (prescriptions, dispenses, administrations, patient-reported statements) that are used as input for creating and maintaining the compiled lists. This data may be exchanged on its own — for example, a system may query for all medication resources for a patient and perform its own compilation locally.

This profile provides exchange mechanisms for **both**: a compiled list can be exchanged as a document (PHARM-12), and the underlying data can be queried as individual resources (PHARM-11). The same data structures — **medication treatment lines** — serve as the common building block across all flavours.

-------

### Background

A Medication Overview may be produced in different ways, depending on the healthcare system and national architecture:

* **Overview-first:** The medication overview is the source of truth. Clinicians create and maintain treatment lines, and prescriptions are derived from them.
* **Prescription-first:** The medication overview is assembled by aggregating prescriptions, dispenses, and other medication data from the patient's records into treatment lines.
* **Hybrid:** Some treatment lines are clinician-authored (e.g. hospital treatments), while others are derived from existing prescriptions (e.g. community prescriptions).

All three patterns are supported by this profile. How the overview is assembled is an implementation choice — this profile specifies how it is **queried, retrieved, and exchanged**, not how it is built.

### Objectives

The main objectives of this profile are:

* **Exchange, not definition** — provide a common structure and transactions for exchanging medication overview content, without prescribing the rules for how that content is compiled or maintained.
* **Support multiple flavours** — accommodate different kinds of medication lists (active, reconciled, discharge, etc.) and the underlying source data, using the same building blocks.
* **Inclusivity** — accommodate information from different sources: prescriptions, dispenses, hospital administrations, OTC products, and patient-reported medications.
* **Traceability** — each treatment line can link back to the source data it was derived from.
* **Interoperability** — suitable for exchange between systems, organisations, and countries, and for feeding into broader patient summary documents.

-------

### Scope

**In scope:**

* The **Medication Overview** as a queryable set of resources (PHARM-11) and as a document (PHARM-12).
* The **Medication Treatment Line** — the core unit of the overview, profiled on MedicationStatement.
* The **Medication Treatment** — optional grouping of related treatment lines, profiled on CarePlan.
* Links to related **prescriptions** (MedicationRequest), **dispenses** (MedicationDispense), and **administrations** (MedicationAdministration).
* **Medicinal product** information with enough detail to be understandable by a recipient system that may not share the same product catalogue.
* Transactions for querying and retrieving the overview.

**Out of scope:**

* How the overview is assembled, reconciled, or maintained internally — this is an implementation concern.
* Reimbursement information.
* Clinical decision support mechanisms.
* Detailed patient and practitioner demographics (referenced, not profiled).

-------

### Related profiles

This profile is:

* Designed to work with the [IHE Pharmacy Medication Prescription and Delivery (MPD)](https://profiles.ihe.net/PHARM/MPD) profile — MPD defines the prescription and dispense workflows; MEOW provides the exchange of medication overview content.
* A functional successor to the IHE Pharmacy PML (Patient Medication List) profile and the CDA Medication Treatment Plan, evolved for FHIR-based architectures.
* Aligned with the [HL7 FHIR IPS specification](https://hl7.org/fhir/uv/ips/), so that treatment lines can feed into the IPS Medication Summary section, while retaining the richer detail needed in a specialised medication scheme.
* Supporting the different national patterns that are globally common: 
* Medication lists created from prescriptions and/or dispenses.
* Medication lists created from treatment plans, from which prescriptions are then derived.
 

-------

Date: 31 January 2020

Author: IHE Pharmacy Technical Committee

Email: [pharmacy@ihe.net](mailto:pharmacy@ihe.net)



## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "ihe.pharm.meow",
  "url" : "http://profiles.ihe.net/PHARM/MEOW/ImplementationGuide/ihe.pharm.meow",
  "version" : "0.1.0",
  "name" : "IHE_PHARM_MEOW",
  "title" : "IHE Pharmacy Medication Overview",
  "status" : "active",
  "date" : "2026-04-07T21:03:28+00:00",
  "publisher" : "Integrating the Healthcare Enterprise (IHE)",
  "contact" : [{
    "name" : "Integrating the Healthcare Enterprise (IHE)",
    "telecom" : [{
      "system" : "url",
      "value" : "http://ihe.net"
    },
    {
      "system" : "email",
      "value" : "secretary@ihe.net"
    }]
  },
  {
    "name" : "Jose Costa Teixeira",
    "telecom" : [{
      "system" : "email",
      "value" : "jose.a.teixeira@gmail.com",
      "use" : "work"
    }]
  }],
  "description" : "ImplementationGuide for IHE Pharmacy Medication Overview",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "001"
    }]
  }],
  "copyright" : "IHE http://www.ihe.net/Governance/#Intellectual_Property",
  "packageId" : "ihe.pharm.meow",
  "license" : "CC-BY-4.0",
  "fhirVersion" : ["5.0.0"],
  "dependsOn" : [{
    "id" : "hl7tx",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
    }],
    "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
    "packageId" : "hl7.terminology.r5",
    "version" : "7.1.0"
  },
  {
    "id" : "hl7ext",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
    }],
    "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
    "packageId" : "hl7.fhir.uv.extensions.r5",
    "version" : "5.2.0"
  },
  {
    "id" : "ihe_pharm_mpd",
    "uri" : "https://profiles.ihe.net/PHARM/MPD/ImplementationGuide/ihe.pharm.mpd",
    "packageId" : "ihe.pharm.mpd",
    "version" : "current"
  }],
  "definition" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
      "valueCode" : "hl7.fhir.uv.tools.r5#1.1.2"
    }],
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/01A-Cefuroxime1500GenericExplicit"
      },
      "name" : "01A-Cefuroxime1500GenericExplicit",
      "description" : "1A. Cefuroxime 1500mg (1.5g) powder for solution in a vial. Generic product, defined by attributes.",
      "isExample" : true,
      "profile" : ["http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/IHEMedication"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/01B-Cefuroxime1500GenericConcept"
      },
      "name" : "01B-Cefuroxime1500GenericConcept",
      "description" : "1B. Cefuroxime 1500mg (1.5g) powder for solution in a vial. Generic product, defined by a code system (receiving system is expected to have access to the code system for additional attributes or display names).",
      "isExample" : true,
      "profile" : ["http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/IHEMedication"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/01C-Cefuroxime1500Branded"
      },
      "name" : "01C-Cefuroxime1500Branded",
      "description" : "1C. Cefuroxime 1500mg (1.5g) powder for solution in a vial. Branded packaged product, defined by attributes.",
      "isExample" : true,
      "profile" : ["http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/IHEMedication"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/02A-ClotrimazoleCanifugCremolum"
      },
      "name" : "02A-ClotrimazoleCanifugCremolum",
      "description" : "2A. Clotrimazole cream 10mg/g and 6 pessaries 100g. Branded packaged product, consisting of different medication items. Defined by attributes.",
      "isExample" : true,
      "profile" : ["http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/IHEMedication"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/02A1-CanifugCremolumCreamItem"
      },
      "name" : "02A1-CanifugCremolumCreamItem",
      "description" : "2A2. Clotrimazole cream (10mg/g, 1 tube of 20g) as part of Canifug Cremolum product (ISO IDMP manufactured item)",
      "isExample" : true,
      "profile" : ["http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/IHEMedication"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/02A2-CanifugCremolumPessaryItem"
      },
      "name" : "02A2-CanifugCremolumPessaryItem",
      "description" : "2A1. Clotrimazole pessary (6 pessaries of 100mg) as part of Canifug Cremolum product (ISO IDMP manufactured item)",
      "isExample" : true,
      "profile" : ["http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/IHEMedication"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/03B-VitaminBComplexBranded"
      },
      "name" : "03B-VitaminBComplexBranded",
      "description" : "3B. Milgamma N, B-vitamin complex. Branded packaged product, defined by attributes.",
      "isExample" : true,
      "profile" : ["http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/IHEMedication"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/ihe-cs-clinicalintenttype"
      },
      "name" : "Clinical Intent Type CodeSystem",
      "description" : "Codes for the clinical intent type of medication use.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/ihe-vs-clinicalintenttype"
      },
      "name" : "Clinical Intent Type ValueSet",
      "description" : "The clinical intent type of the medication use - therapeutic, prophylactic, or self-medication.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/DosagingInformation"
      },
      "name" : "Dosaging (model)",
      "description" : "Logical model for usage instructions for administring the requested product. Based on FHIR Dosage complex data type.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ihe-ext-medication-classification"
      },
      "name" : "Medication - Classification",
      "description" : "Medication classification/category. Allows the product to be classified by various systems, e.g ATC, narcotic class, legal status of supply, etc..",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ihe-ext-medication-device"
      },
      "name" : "Medication - Device",
      "description" : "Device, typically an administration device, included in the medicinal product.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ihe-ext-medication-productname"
      },
      "name" : "Medication - Product Name",
      "description" : "Name of the medicinal product. Optionally the type of name (Full official name, prescribing name, invented name) and language of the name can be specified. The extension is a simplified approach of what is used in MedicinalProductDefinition resource.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ihe-ext-medication-sizeofitem"
      },
      "name" : "Medication - Size of Item",
      "description" : "Size of a manufactured item or unit of presentation. For example, size of one vial in a package that may contain several vials.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/MedicationOverviewLM"
      },
      "name" : "Medication Overview (model)",
      "description" : "Logical model for the whole medication overview (medication schema)",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/MedicationOverview"
      },
      "name" : "Medication Overview Bundle",
      "description" : "The profile for the full Medication overview as a Bundle type Document",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/MedicationOverviewComposition"
      },
      "name" : "Medication Overview Composition",
      "description" : "The profile for how to organize the information in a medication overview",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CapabilityStatement"
      }],
      "reference" : {
        "reference" : "CapabilityStatement/MedicationOverviewConsumer"
      },
      "name" : "Medication Overview Consumer",
      "description" : "CapabilityStatement for the Medication Overview Consumer actor in the IHE PHARM MEOW profile.\n\nThe Consumer is a client that queries a Medication Overview Repository or Creator to retrieve\na patient's medication overview. It supports PHARM-11 (Query Medication Resources) as a\nrequired capability, and optionally PHARM-12 (Retrieve Medication Document) when the\nDocument Option is declared.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CapabilityStatement"
      }],
      "reference" : {
        "reference" : "CapabilityStatement/MedicationOverviewResponder"
      },
      "name" : "Medication Overview Responder",
      "description" : "CapabilityStatement for the Medication Overview Responder actor in the IHE PHARM MEOW profile.\n\nThe Responder is a server that stores and/or assembles medication overview data for patients\nand serves it in response to Consumer requests. It supports PHARM-11 (Query Medication\nResources) as a required capability, and optionally PHARM-12 (Retrieve Medication Document)\nwhen the Document Option is declared.\n\nHow the Responder obtains its data (continuous store, on-demand aggregation, document\nassembly) is an implementation concern outside the scope of this profile.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/MedicationTreatment"
      },
      "name" : "Medication Treatment",
      "description" : "The profile for Medication Treatment in a Medication Record - a set of treatment lines/items",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/MedicationTreatmentLM"
      },
      "name" : "Medication Treatment (model)",
      "description" : "Logical model for subgroups of treatment lines that are somehow related to eachother (the same purpose, other)",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/MedicationTreatmentLine"
      },
      "name" : "Medication Treatment Line",
      "description" : "The profile for Medication Treatment Line - a single recorded item/line of a medication treatment",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/MedicationTreatmentLineLM"
      },
      "name" : "Medication Treatment Line (model)",
      "description" : "Logical model for representing one line/medication in medication overview.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ihe-ext-medicationstatement-clinicalintenttype"
      },
      "name" : "MedicationStatement - Clinical Intent Type",
      "description" : "The clinical intent type of the medication use - whether the medication is for therapeutic, prophylactic, or self-medication purposes.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ihe-ext-medicationstatement-offlabel"
      },
      "name" : "MedicationStatement - Off-Label Use",
      "description" : "Indication that the medication is being used off-label (outside of approved indication, age group, dosage, or route) and the reason for such use. When isOffLabelUse is true, a reason SHALL be provided.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ihe-ext-medicationstatement-recorder"
      },
      "name" : "MedicationStatement - Recorder",
      "description" : "The person who entered the medication information into the system. The recorder may be different from the clinical author (informationSource) who made the clinical decision.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ihe-ext-medicationstatement-substitution"
      },
      "name" : "MedicationStatement - Substitution",
      "description" : "Whether and which type of substitution is allowed for this medication treatment line",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ihe-ext-medicationstatement-verificationinformation"
      },
      "name" : "MedicationStatement - Verification Information",
      "description" : "Verification of medication line. The overview is verified as a whole, but each line is equipped with the information. The actual functional meaning and impact of this validation depends on the implementation.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/IHEMedication"
      },
      "name" : "Medicinal product",
      "description" : "Medication for clinical use cases. This could be a branded product or a generic concept, also allowing describing pack size and components of complex products.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/MedicinalProductLM"
      },
      "name" : "Medicinal product (model)",
      "description" : "Logical model for prescribed/dispensed medication. The model is shared by statements, requests, dispensations, and treatment lines. Each of those may have different restrictions in FHIR profile.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/PatientLM"
      },
      "name" : "Patient (model)",
      "description" : "Logical model for patient (basic data relevant for this use case)",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/PractitionerLM"
      },
      "name" : "Practitioner (model)",
      "description" : "Logical model for practitioner (basic data relevant for this use case)",
      "isExample" : false
    }],
    "page" : {
      "sourceUrl" : "toc.html",
      "name" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [{
        "sourceUrl" : "index.html",
        "name" : "index.html",
        "title" : "MeOw Home",
        "generation" : "markdown"
      },
      {
        "sourceUrl" : "volume1.html",
        "name" : "volume1.html",
        "title" : "Volume 1 Overview",
        "generation" : "markdown",
        "page" : [{
          "sourceUrl" : "usecases.html",
          "name" : "usecases.html",
          "title" : "Use Case overview",
          "generation" : "markdown",
          "page" : [{
            "sourceUrl" : "usecase-1.html",
            "name" : "usecase-1.html",
            "title" : "Use Case 1 - ...",
            "generation" : "markdown"
          }]
        },
        {
          "sourceUrl" : "glossary.html",
          "name" : "glossary.html",
          "title" : "Glossary",
          "generation" : "markdown"
        },
        {
          "sourceUrl" : "medication_concepts.html",
          "name" : "medication_concepts.html",
          "title" : "Medication Concepts",
          "generation" : "markdown"
        },
        {
          "sourceUrl" : "medication_treatment_lifecycle.html",
          "name" : "medication_treatment_lifecycle.html",
          "title" : "Medication Treatment Lifecycle",
          "generation" : "markdown"
        },
        {
          "sourceUrl" : "aggregation_and_medication_reconcilliation.html",
          "name" : "aggregation_and_medication_reconcilliation.html",
          "title" : "Aggregation and Medication Reconcilliation",
          "generation" : "markdown"
        },
        {
          "sourceUrl" : "data_models.html",
          "name" : "data_models.html",
          "title" : "Data Models",
          "generation" : "markdown"
        },
        {
          "sourceUrl" : "actors-transactions.html",
          "name" : "actors-transactions.html",
          "title" : "Actors and Transactions",
          "generation" : "markdown"
        },
        {
          "sourceUrl" : "actor_options.html",
          "name" : "actor_options.html",
          "title" : "Actor Options",
          "generation" : "markdown"
        },
        {
          "sourceUrl" : "actor_required_grouping.html",
          "name" : "actor_required_grouping.html",
          "title" : "Actor Required Grouping",
          "generation" : "markdown"
        },
        {
          "sourceUrl" : "security_considerations.html",
          "name" : "security_considerations.html",
          "title" : "Security Considerations",
          "generation" : "markdown"
        },
        {
          "sourceUrl" : "cross_profile_considerations.html",
          "name" : "cross_profile_considerations.html",
          "title" : "Cross Profile Considerations",
          "generation" : "markdown"
        }]
      },
      {
        "sourceUrl" : "volume2.html",
        "name" : "volume2.html",
        "title" : "Volume 2: Transactions",
        "generation" : "markdown",
        "page" : [{
          "sourceUrl" : "PHARM-11.html",
          "name" : "PHARM-11.html",
          "title" : "PHARM-11 Retrieve Medication Overview",
          "generation" : "markdown"
        },
        {
          "sourceUrl" : "PHARM-12.html",
          "name" : "PHARM-12.html",
          "title" : "PHARM-12 Query Medication Resources",
          "generation" : "markdown"
        }]
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
          "valueCode" : "informative"
        }],
        "sourceUrl" : "issues.html",
        "name" : "issues.html",
        "title" : "Issues",
        "generation" : "markdown"
      }]
    },
    "parameter" : [{
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "copyrightyear"
      },
      "value" : "2022+"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "releaselabel"
      },
      "value" : "ci-build"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/resources"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "fsh-generated/resources"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/examples"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-pages"
      },
      "value" : "input/pagecontent"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-pages"
      },
      "value" : "fsh-generated/includes"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-contact"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-jurisdiction"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-version"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "usage-stats-opt-out"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "autoload-resources"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/capabilities"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/extensions"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/models"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/operations"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/profiles"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/vocabulary"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/testing"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/history"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-pages"
      },
      "value" : "template/config"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-pages"
      },
      "value" : "input/images"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-liquid"
      },
      "value" : "template/liquid"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-liquid"
      },
      "value" : "input/liquid"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-qa"
      },
      "value" : "temp/qa"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-temp"
      },
      "value" : "temp/pages"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-output"
      },
      "value" : "output"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-tx-cache"
      },
      "value" : "input-cache/txcache"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-suppressed-warnings"
      },
      "value" : "input/ignoreWarnings.txt"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-history"
      },
      "value" : "http://profiles.ihe.net/PHARM/MEOW/history.html"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "template-html"
      },
      "value" : "template-page.html"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "template-md"
      },
      "value" : "template-page-md.html"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-context"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-copyright"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-license"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-publisher"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-wg"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "active-tables"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "fmm-definition"
      },
      "value" : "http://hl7.org/fhir/versions.html#maturity"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "propagate-status"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "excludelogbinaryformat"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "tabbed-snapshots"
      },
      "value" : "true"
    }]
  }
}

```
