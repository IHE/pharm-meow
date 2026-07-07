# Patient (model) - IHE Pharmacy Medication Overview v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Patient (model)**

## Logical Model: Patient (model) 

| | |
| :--- | :--- |
| *Official URL*:http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/PatientLM | *Version*:0.1.0 |
| Active as of 2026-04-07 | *Computable Name*:PatientLM |
| **Copyright/Legal**: IHE http://www.ihe.net/Governance/#Intellectual_Property | |

 
Logical model for patient (basic data relevant for this use case) 

**Usages:**

* Refer to this Logical Model: [Medication Overview (model)](StructureDefinition-MedicationOverviewLM.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ihe.pharm.meow|current/StructureDefinition/PatientLM)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-PatientLM.csv), [Excel](StructureDefinition-PatientLM.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "PatientLM",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-be-target"
  },
  {
    "url" : "http://hl7.org/fhir/tools/StructureDefinition/logical-target",
    "valueBoolean" : true
  }],
  "url" : "http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/PatientLM",
  "version" : "0.1.0",
  "name" : "PatientLM",
  "title" : "Patient (model)",
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
  "description" : "Logical model for patient (basic data relevant for this use case)",
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
  "type" : "http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/PatientLM",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "PatientLM",
      "path" : "PatientLM",
      "short" : "Patient (model)",
      "definition" : "Logical model for patient (basic data relevant for this use case)"
    },
    {
      "id" : "PatientLM.identifier",
      "path" : "PatientLM.identifier",
      "short" : "Patient Identifier ",
      "definition" : "Patient Identifier ",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "PatientLM.name",
      "path" : "PatientLM.name",
      "short" : "Patient's name, incl first name, last name, or any other relevant name parts",
      "definition" : "Patient's name, incl first name, last name, or any other relevant name parts",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "HumanName"
      }]
    },
    {
      "id" : "PatientLM.gender",
      "path" : "PatientLM.gender",
      "short" : "Gender",
      "definition" : "Question: eHDSI prescription emphasisis the biological gender, but I think the reality is that most systems would have administrative gender or somekindof gender",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "PatientLM.dateOfBirth",
      "path" : "PatientLM.dateOfBirth",
      "short" : "Date of birth",
      "definition" : "eHDSI",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "PatientLM.insuranceInformation",
      "path" : "PatientLM.insuranceInformation",
      "short" : "Insurance information",
      "definition" : "Question: shall we go here and how deep?",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    }]
  }
}

```
