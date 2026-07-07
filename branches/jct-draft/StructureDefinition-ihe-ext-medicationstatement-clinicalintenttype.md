# MedicationStatement - Clinical Intent Type - IHE Pharmacy Medication Overview v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MedicationStatement - Clinical Intent Type**

## Extension: MedicationStatement - Clinical Intent Type 

| | |
| :--- | :--- |
| *Official URL*:http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/ihe-ext-medicationstatement-clinicalintenttype | *Version*:0.1.0 |
| Active as of 2026-04-07 | *Computable Name*:ClinicalIntentType |
| **Copyright/Legal**: IHE http://www.ihe.net/Governance/#Intellectual_Property | |

The clinical intent type of the medication use - whether the medication is for therapeutic, prophylactic, or self-medication purposes.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Medication Treatment Line](StructureDefinition-MedicationTreatmentLine.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ihe.pharm.meow|current/StructureDefinition/ihe-ext-medicationstatement-clinicalintenttype)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ihe-ext-medicationstatement-clinicalintenttype.csv), [Excel](StructureDefinition-ihe-ext-medicationstatement-clinicalintenttype.xlsx), [Schematron](StructureDefinition-ihe-ext-medicationstatement-clinicalintenttype.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ihe-ext-medicationstatement-clinicalintenttype",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/ihe-ext-medicationstatement-clinicalintenttype",
  "version" : "0.1.0",
  "name" : "ClinicalIntentType",
  "title" : "MedicationStatement - Clinical Intent Type",
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
  "description" : "The clinical intent type of the medication use - whether the medication is for therapeutic, prophylactic, or self-medication purposes.",
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
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "MedicationStatement - Clinical Intent Type",
      "definition" : "The clinical intent type of the medication use - whether the medication is for therapeutic, prophylactic, or self-medication purposes."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/ihe-ext-medicationstatement-clinicalintenttype"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "http://profiles.ihe.net/PHARM/MEOW/ValueSet/ihe-vs-clinicalintenttype"
      }
    }]
  }
}

```
