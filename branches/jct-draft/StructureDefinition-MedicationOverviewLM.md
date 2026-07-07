# Medication Overview (model) - IHE Pharmacy Medication Overview v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Medication Overview (model)**

## Logical Model: Medication Overview (model) 

| | |
| :--- | :--- |
| *Official URL*:http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/MedicationOverviewLM | *Version*:0.1.0 |
| Active as of 2026-04-07 | *Computable Name*:MedicationOverviewLM |
| **Copyright/Legal**: IHE http://www.ihe.net/Governance/#Intellectual_Property | |

 
Logical model for the whole medication overview (medication schema) 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ihe.pharm.meow|current/StructureDefinition/MedicationOverviewLM)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-MedicationOverviewLM.csv), [Excel](StructureDefinition-MedicationOverviewLM.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "MedicationOverviewLM",
  "extension" : [{
    "url" : "http://hl7.org/fhir/tools/StructureDefinition/logical-target",
    "valueBoolean" : true
  }],
  "url" : "http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/MedicationOverviewLM",
  "version" : "0.1.0",
  "name" : "MedicationOverviewLM",
  "title" : "Medication Overview (model)",
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
  "description" : "Logical model for the whole medication overview (medication schema)",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "001"
    }]
  }],
  "copyright" : "IHE http://www.ihe.net/Governance/#Intellectual_Property",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/MedicationOverviewLM",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "MedicationOverviewLM",
      "path" : "MedicationOverviewLM",
      "short" : "Medication Overview (model)",
      "definition" : "Logical model for the whole medication overview (medication schema)"
    },
    {
      "id" : "MedicationOverviewLM.patient",
      "path" : "MedicationOverviewLM.patient",
      "short" : "Patient",
      "definition" : "Patient",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/PatientLM"]
      }]
    },
    {
      "id" : "MedicationOverviewLM.medicationTreatmentLine",
      "path" : "MedicationOverviewLM.medicationTreatmentLine",
      "short" : "List item in the list of all current medication based treatments. Each line can be verified or unverified.",
      "definition" : "List item in the list of all current medication based treatments. Each line can be verified or unverified.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/MedicationTreatmentLineLM"]
      }]
    },
    {
      "id" : "MedicationOverviewLM.verification",
      "path" : "MedicationOverviewLM.verification",
      "short" : "Verification of overview",
      "definition" : "Verification of overview",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "MedicationOverviewLM.verification.practicioner",
      "path" : "MedicationOverviewLM.verification.practicioner",
      "short" : "HCP verifying the treatments/overview",
      "definition" : "HCP verifying the treatments/overview",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/PractitionerLM"]
      }]
    },
    {
      "id" : "MedicationOverviewLM.verification.verificationTime",
      "path" : "MedicationOverviewLM.verification.verificationTime",
      "short" : "Time of the verification of the overview",
      "definition" : "Time of the verification of the overview",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "MedicationOverviewLM.comment",
      "path" : "MedicationOverviewLM.comment",
      "short" : "Comment on the full overview",
      "definition" : "Comment on the full overview",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "MedicationOverviewLM.comment.author",
      "path" : "MedicationOverviewLM.comment.author",
      "short" : "author of the comment (pharmacist, doctor, social carer)",
      "definition" : "author of the comment (pharmacist, doctor, social carer)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/PractitionerLM"]
      }]
    },
    {
      "id" : "MedicationOverviewLM.comment.date",
      "path" : "MedicationOverviewLM.comment.date",
      "short" : "time of comment",
      "definition" : "time of comment",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "MedicationOverviewLM.comment.commentText",
      "path" : "MedicationOverviewLM.comment.commentText",
      "short" : "content of the comment",
      "definition" : "content of the comment",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "MedicationOverviewLM.comment.subject",
      "path" : "MedicationOverviewLM.comment.subject",
      "short" : "What the comment is about. It can reference either a treatment line, treatment, or full overview",
      "definition" : "What the comment is about. It can reference either a treatment line, treatment, or full overview",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Reference"
      }]
    }]
  }
}

```
