# MedicationStatement - Off-Label Use - IHE Pharmacy Medication Overview v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MedicationStatement - Off-Label Use**

## Extension: MedicationStatement - Off-Label Use 

| | |
| :--- | :--- |
| *Official URL*:http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/ihe-ext-medicationstatement-offlabel | *Version*:0.1.0 |
| Active as of 2026-04-07 | *Computable Name*:OffLabel |
| **Copyright/Legal**: IHE http://www.ihe.net/Governance/#Intellectual_Property | |

Indication that the medication is being used off-label (outside of approved indication, age group, dosage, or route) and the reason for such use. When isOffLabelUse is true, a reason SHALL be provided.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Medication Treatment Line](StructureDefinition-MedicationTreatmentLine.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ihe.pharm.meow|current/StructureDefinition/ihe-ext-medicationstatement-offlabel)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ihe-ext-medicationstatement-offlabel.csv), [Excel](StructureDefinition-ihe-ext-medicationstatement-offlabel.xlsx), [Schematron](StructureDefinition-ihe-ext-medicationstatement-offlabel.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ihe-ext-medicationstatement-offlabel",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/ihe-ext-medicationstatement-offlabel",
  "version" : "0.1.0",
  "name" : "OffLabel",
  "title" : "MedicationStatement - Off-Label Use",
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
  "description" : "Indication that the medication is being used off-label (outside of approved indication, age group, dosage, or route) and the reason for such use. When isOffLabelUse is true, a reason SHALL be provided.",
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
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "MedicationStatement"
  },
  {
    "type" : "element",
    "expression" : "MedicationRequest"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "MedicationStatement - Off-Label Use",
      "definition" : "Indication that the medication is being used off-label (outside of approved indication, age group, dosage, or route) and the reason for such use. When isOffLabelUse is true, a reason SHALL be provided.",
      "constraint" : [{
        "key" : "offlabel-reason-required",
        "severity" : "error",
        "human" : "If isOffLabelUse is true, at least one reason must be provided",
        "expression" : "extension.where(url='isOffLabelUse').value.ofType(boolean).where(true).exists() implies extension.where(url='reason').exists()",
        "source" : "http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/ihe-ext-medicationstatement-offlabel"
      }]
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "min" : 1
    },
    {
      "id" : "Extension.extension:isOffLabelUse",
      "path" : "Extension.extension",
      "sliceName" : "isOffLabelUse",
      "short" : "Whether the medication is being used off-label",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:isOffLabelUse.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:isOffLabelUse.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "isOffLabelUse"
    },
    {
      "id" : "Extension.extension:isOffLabelUse.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "Extension.extension:reason",
      "path" : "Extension.extension",
      "sliceName" : "reason",
      "short" : "The reason for off-label use or dosage override",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Extension.extension:reason.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:reason.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "reason"
    },
    {
      "id" : "Extension.extension:reason.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/ihe-ext-medicationstatement-offlabel"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
