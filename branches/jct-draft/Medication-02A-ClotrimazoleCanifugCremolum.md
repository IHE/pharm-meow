# 02A-ClotrimazoleCanifugCremolum - IHE Pharmacy Medication Overview v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **02A-ClotrimazoleCanifugCremolum**

## Example Medication: 02A-ClotrimazoleCanifugCremolum

Profile: [Medicinal product](StructureDefinition-IHEMedication.md)

**Medication - Classification**: clotrimazole

> **Medication - Product Name**
* name: Canifug Cremolum
* language: Estonian (Estonia)

**identifier**: `https://www.ravimiregister.ee`/1033692

**doseForm**: Cream + pessary

> **ingredient**

### Items

| | |
| :--- | :--- |
| - | **Reference** |
| * | [Medication: extension = 20 gram; doseForm = Vaginal cream; totalVolume = 1 Tube](Medication-02A1-CanifugCremolumCreamItem.md) |


> **ingredient**

### Items

| | |
| :--- | :--- |
| - | **Reference** |
| * | [Medication: doseForm = Pessary; totalVolume = 6 Pessary](Medication-02A2-CanifugCremolumPessaryItem.md) |




## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "02A-ClotrimazoleCanifugCremolum",
  "meta" : {
    "profile" : ["http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/IHEMedication"]
  },
  "extension" : [{
    "url" : "http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/ihe-ext-medication-classification",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.whocc.no/atc",
        "code" : "G01AF02",
        "display" : "clotrimazole"
      }]
    }
  },
  {
    "extension" : [{
      "url" : "name",
      "valueString" : "Canifug Cremolum"
    },
    {
      "url" : "language",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "urn:ietf:bcp:47",
          "code" : "et-EE",
          "display" : "Estonian (Estonia)"
        }]
      }
    }],
    "url" : "http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/ihe-ext-medication-productname"
  }],
  "identifier" : [{
    "system" : "https://www.ravimiregister.ee",
    "value" : "1033692"
  }],
  "doseForm" : {
    "coding" : [{
      "system" : "http://standardterms.edqm.eu",
      "code" : "14001000",
      "display" : "Cream + pessary"
    }]
  },
  "ingredient" : [{
    "item" : {
      "reference" : {
        "reference" : "Medication/02A1-CanifugCremolumCreamItem"
      }
    }
  },
  {
    "item" : {
      "reference" : {
        "reference" : "Medication/02A2-CanifugCremolumPessaryItem"
      }
    }
  }]
}

```
