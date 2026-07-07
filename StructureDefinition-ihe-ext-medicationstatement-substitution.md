# MedicationStatement - Substitution - IHE Pharmacy Medication Overview v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MedicationStatement - Substitution**

## Extension: MedicationStatement - Substitution 

| | |
| :--- | :--- |
| *Official URL*:http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/ihe-ext-medicationstatement-substitution | *Version*:0.1.0 |
| Active as of 2026-05-14 | *Computable Name*:Substitution |
| **Copyright/Legal**: IHE http://www.ihe.net/Governance/#Intellectual_Property | |

Whether and which type of substitution is allowed for this medication treatment line

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Medication Treatment Line](StructureDefinition-MedicationTreatmentLine.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ihe.pharm.meow|current/StructureDefinition/ihe-ext-medicationstatement-substitution)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ihe-ext-medicationstatement-substitution.csv), [Excel](StructureDefinition-ihe-ext-medicationstatement-substitution.xlsx), [Schematron](StructureDefinition-ihe-ext-medicationstatement-substitution.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ihe-ext-medicationstatement-substitution",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/ihe-ext-medicationstatement-substitution",
  "version" : "0.1.0",
  "name" : "Substitution",
  "title" : "MedicationStatement - Substitution",
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
  "description" : "Whether and which type of substitution is allowed for this medication treatment line",
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
      "short" : "MedicationStatement - Substitution",
      "definition" : "Whether and which type of substitution is allowed for this medication treatment line"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "min" : 1
    },
    {
      "id" : "Extension.extension:allowed",
      "path" : "Extension.extension",
      "sliceName" : "allowed",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:allowed.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:allowed.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "allowed"
    },
    {
      "id" : "Extension.extension:allowed.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "Extension.extension:reason",
      "path" : "Extension.extension",
      "sliceName" : "reason",
      "min" : 0,
      "max" : "1"
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
      "fixedUri" : "http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/ihe-ext-medicationstatement-substitution"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
