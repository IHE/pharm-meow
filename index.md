# MeOw Home - IHE Pharmacy Medication Overview v0.1.0

* [**Table of Contents**](toc.md)
* **MeOw Home**

## MeOw Home

| | |
| :--- | :--- |
| *Official URL*:http://profiles.ihe.net/PHARM/MEOW/ImplementationGuide/ihe.pharm.meow | *Version*:0.1.0 |
| Active as of 2026-05-14 | *Computable Name*:IHE_PHARM_MEOW |
| **Copyright/Legal**: IHE http://www.ihe.net/Governance/#Intellectual_Property | |

 
**IHE Pharmacy** 
**MedicationOverview** 
**(MEOw)** 

The IHE Medication Overview profile describes the content and transactions for consistent capture and exchange of patient's medication overviews - also referred as medication lists, or medication schemes.

### Background

Medication Overview is a list of patient's medication related treatments. The actual rules for composing and maintaining such lists can vary. IHE Medication Overview profile addresses multiple use cases and implementation patterns, including two opposite ways of creating the Medication Overview:

* Medication Overview is the source of truth, and the basis of creating medication requests;
* Medication Overview is an aggregation of medication information available in patient's medical records (usually prescriptions).

The main objectives of a Medication Overview are:

* better overview of ongoing treatments (multiple prescriptions aggregated into one row);
* possibility to use different information sources (for example, add OTC products or patient stated medications);
* suitable for feeding into Medications section in patient summary.

### Scope

**In scope:**

* Medication Overview / Medication List, which can be delivered as a document or a list.
* Description of each line in Medication Overview, and explanation of grouping mechanisms.
* Medicinal product information with enough details to be understandable in a recepient system that may not have access to the same medicinal product library.
* Transactions for retrieving Medication Overview.

**Out of scope:**

* Exact assembling and updating mechanism of the medication overview as similar result can be achieved with various implementation choices,
* Reimbursement information,
* Decision support mechanisms,
* Practitioner and patient details.

This profile

* Articulated with the [Pharmacy Medication Prescription and Dispense](insert-mpd-link-here) workflows.
* Supporting the different cases that are globally common: 
* Medication lists being created from prescriptions (and/or dispenses) - evolving the IHE Pharmacy PML approach.
* Medication lists being created from "treatment plans" and from which prescriptions are created.
 
* Aligned with the [HL7 FHIR IPS specification](https://hl7.org/fhir/uv/ips/), so that the MedicationOverview can be a part of a larger, modular summary, while retaining the necessary capabilities and details that are needed in a specialized medication scheme.

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
  "date" : "2026-05-14T05:50:16+00:00",
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
        "title" : "Volume 2",
        "generation" : "markdown",
        "page" : [{
          "sourceUrl" : "PHARM-x.html",
          "name" : "PHARM-x.html",
          "title" : "PHARM xxx",
          "generation" : "markdown"
        },
        {
          "sourceUrl" : "PHARM-y.html",
          "name" : "PHARM-y.html",
          "title" : "PHARM yyy",
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
