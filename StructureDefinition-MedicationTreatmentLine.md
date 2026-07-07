# Medication Treatment Line - IHE Pharmacy Medication Overview v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Medication Treatment Line**

## Resource Profile: Medication Treatment Line 

| | |
| :--- | :--- |
| *Official URL*:http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/MedicationTreatmentLine | *Version*:0.1.0 |
| Active as of 2026-05-14 | *Computable Name*:MedicationTreatmentLine |
| **Copyright/Legal**: IHE http://www.ihe.net/Governance/#Intellectual_Property | |

 
The profile for Medication Treatment Line - a single recorded item/line of a medication treatment 

**Usages:**

* Use this Profile: [Medication Overview Bundle](StructureDefinition-MedicationOverview.md)
* Refer to this Profile: [Medication Overview Composition](StructureDefinition-MedicationOverviewComposition.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ihe.pharm.meow|current/StructureDefinition/MedicationTreatmentLine)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-MedicationTreatmentLine.csv), [Excel](StructureDefinition-MedicationTreatmentLine.xlsx), [Schematron](StructureDefinition-MedicationTreatmentLine.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "MedicationTreatmentLine",
  "url" : "http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/MedicationTreatmentLine",
  "version" : "0.1.0",
  "name" : "MedicationTreatmentLine",
  "title" : "Medication Treatment Line",
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
  "description" : "The profile for Medication Treatment Line - a single recorded item/line of a medication treatment",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "001"
    }]
  }],
  "copyright" : "IHE http://www.ihe.net/Governance/#Intellectual_Property",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 V2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "MedicationStatement",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/MedicationStatement",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "MedicationStatement.extension",
      "path" : "MedicationStatement.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "MedicationStatement.extension:version",
      "path" : "MedicationStatement.extension",
      "sliceName" : "version",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/artifact-version"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.extension:verificationInformation",
      "path" : "MedicationStatement.extension",
      "sliceName" : "verificationInformation",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/ihe-ext-medicationstatement-verificationinformation"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.extension:substitution",
      "path" : "MedicationStatement.extension",
      "sliceName" : "substitution",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/ihe-ext-medicationstatement-substitution"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.identifier",
      "path" : "MedicationStatement.identifier",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.status",
      "path" : "MedicationStatement.status",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.category",
      "path" : "MedicationStatement.category",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.medication",
      "path" : "MedicationStatement.medication",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.subject",
      "path" : "MedicationStatement.subject",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.effective[x]",
      "path" : "MedicationStatement.effective[x]",
      "type" : [{
        "code" : "Period"
      }],
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.dateAsserted",
      "path" : "MedicationStatement.dateAsserted",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.informationSource",
      "path" : "MedicationStatement.informationSource",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.derivedFrom",
      "path" : "MedicationStatement.derivedFrom",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.reason",
      "path" : "MedicationStatement.reason",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.note",
      "path" : "MedicationStatement.note",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.dosage",
      "path" : "MedicationStatement.dosage",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.dosage.text",
      "path" : "MedicationStatement.dosage.text",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.adherence",
      "path" : "MedicationStatement.adherence",
      "mustSupport" : true
    }]
  }
}

```
