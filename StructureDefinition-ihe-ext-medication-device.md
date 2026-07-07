# Medication - Device - IHE Pharmacy Medication Overview v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Medication - Device**

## Extension: Medication - Device 

| | |
| :--- | :--- |
| *Official URL*:http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/ihe-ext-medication-device | *Version*:0.1.0 |
| Active as of 2026-05-14 | *Computable Name*:MedicationDevice |
| **Copyright/Legal**: IHE http://www.ihe.net/Governance/#Intellectual_Property | |

Device, typically an administration device, included in the medicinal product.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Medicinal product](StructureDefinition-IHEMedication.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ihe.pharm.meow|current/StructureDefinition/ihe-ext-medication-device)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ihe-ext-medication-device.csv), [Excel](StructureDefinition-ihe-ext-medication-device.xlsx), [Schematron](StructureDefinition-ihe-ext-medication-device.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ihe-ext-medication-device",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/ihe-ext-medication-device",
  "version" : "0.1.0",
  "name" : "MedicationDevice",
  "title" : "Medication - Device",
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
  "description" : "Device, typically an administration device, included in the medicinal product.",
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
    "expression" : "Element"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Medication - Device",
      "definition" : "Device, typically an administration device, included in the medicinal product."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "min" : 2
    },
    {
      "id" : "Extension.extension:device",
      "path" : "Extension.extension",
      "sliceName" : "device",
      "short" : "Coded or referenced device",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:device.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:device.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "device"
    },
    {
      "id" : "Extension.extension:device.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "CodeableReference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Device",
        "http://hl7.org/fhir/StructureDefinition/DeviceDefinition"]
      }]
    },
    {
      "id" : "Extension.extension:quantity",
      "path" : "Extension.extension",
      "sliceName" : "quantity",
      "short" : "Number of defined devices in te package",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:quantity.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:quantity.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "quantity"
    },
    {
      "id" : "Extension.extension:quantity.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/ihe-ext-medication-device"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
