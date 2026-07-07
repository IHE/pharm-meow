# 02A1-CanifugCremolumCreamItem - IHE Pharmacy Medication Overview v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **02A1-CanifugCremolumCreamItem**

## Example Medication: 02A1-CanifugCremolumCreamItem

Profile: [Medicinal product](StructureDefinition-IHEMedication.md)

**Medication - Size of Item**: 20 gram (Details: UCUM codeg = 'g')

**doseForm**: Vaginal cream

**totalVolume**: 1 Tube (Details: EDQM Standard Terms code15058000 = 'Tube')

> **ingredient**

### Items

| | |
| :--- | :--- |
| - | **Concept** |
| * | Clotrimazole |

**isActive**: true**strength**: 10 milligram (Details: UCUM codemg = 'mg')/1 gram (Details: UCUM codeg = 'g')



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "02A1-CanifugCremolumCreamItem",
  "meta" : {
    "profile" : ["http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/IHEMedication"]
  },
  "extension" : [{
    "url" : "http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/ihe-ext-medication-sizeofitem",
    "valueQuantity" : {
      "value" : 20,
      "unit" : "gram",
      "system" : "http://unitsofmeasure.org",
      "code" : "g"
    }
  }],
  "doseForm" : {
    "coding" : [{
      "system" : "http://standardterms.edqm.eu",
      "code" : "10901000",
      "display" : "Vaginal cream"
    }]
  },
  "totalVolume" : {
    "value" : 1,
    "unit" : "Tube",
    "system" : "http://standardterms.edqm.eu",
    "code" : "15058000"
  },
  "ingredient" : [{
    "item" : {
      "concept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "387325003",
          "display" : "Clotrimazole"
        }]
      }
    },
    "isActive" : true,
    "strengthRatio" : {
      "numerator" : {
        "value" : 10,
        "unit" : "milligram",
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      },
      "denominator" : {
        "value" : 1,
        "unit" : "gram",
        "system" : "http://unitsofmeasure.org",
        "code" : "g"
      }
    }
  }]
}

```
