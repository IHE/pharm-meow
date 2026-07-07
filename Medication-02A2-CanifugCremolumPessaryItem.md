# 02A2-CanifugCremolumPessaryItem - IHE Pharmacy Medication Overview v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **02A2-CanifugCremolumPessaryItem**

## Example Medication: 02A2-CanifugCremolumPessaryItem

Profile: [Medicinal product](StructureDefinition-IHEMedication.md)

**doseForm**: Pessary

**totalVolume**: 6 Pessary (Details: EDQM Standard Terms code15039000 = 'Pessary')

> **ingredient**

### Items

| | |
| :--- | :--- |
| - | **Concept** |
| * | Clotrimazole |

**isActive**: true**strength**: 100 milligram (Details: UCUM codemg = 'mg')/1 Pessary (Details: EDQM Standard Terms code15039000 = 'Pessary')



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "02A2-CanifugCremolumPessaryItem",
  "meta" : {
    "profile" : ["http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/IHEMedication"]
  },
  "doseForm" : {
    "coding" : [{
      "system" : "http://standardterms.edqm.eu",
      "code" : "10909000",
      "display" : "Pessary"
    }]
  },
  "totalVolume" : {
    "value" : 6,
    "unit" : "Pessary",
    "system" : "http://standardterms.edqm.eu",
    "code" : "15039000"
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
        "value" : 100,
        "unit" : "milligram",
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      },
      "denominator" : {
        "value" : 1,
        "unit" : "Pessary",
        "system" : "http://standardterms.edqm.eu",
        "code" : "15039000"
      }
    }
  }]
}

```
