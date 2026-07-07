# 01A-Cefuroxime1500GenericExplicit - IHE Pharmacy Medication Overview v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **01A-Cefuroxime1500GenericExplicit**

## Example Medication: 01A-Cefuroxime1500GenericExplicit

Profile: [Medicinal product](StructureDefinition-IHEMedication.md)

**Medication - Classification**: cefuroxime

**doseForm**: Powder for solution for injection or infusion

> **ingredient**

### Items

| | |
| :--- | :--- |
| - | **Concept** |
| * | Cefuroxime |

**isActive**: true**strength**: 1500 milligram (Details: UCUM codemg = 'mg')/1 Vial (Details: standardterms.edqm.eu code15060000 = 'Vial')



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "01A-Cefuroxime1500GenericExplicit",
  "meta" : {
    "profile" : ["http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/IHEMedication"]
  },
  "extension" : [{
    "url" : "http://profiles.ihe.net/PHARM/MEOW/StructureDefinition/ihe-ext-medication-classification",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.whocc.no/atc",
        "code" : "J01DC02",
        "display" : "cefuroxime"
      }]
    }
  }],
  "doseForm" : {
    "coding" : [{
      "system" : "http://standardterms.edqm.eu",
      "code" : "50053000",
      "display" : "Powder for solution for injection or infusion"
    }]
  },
  "ingredient" : [{
    "item" : {
      "concept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "372833007",
          "display" : "Cefuroxime"
        }]
      }
    },
    "isActive" : true,
    "strengthRatio" : {
      "numerator" : {
        "value" : 1500,
        "unit" : "milligram",
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      },
      "denominator" : {
        "value" : 1,
        "unit" : "Vial",
        "system" : "http://standardterms.edqm.eu",
        "code" : "15060000"
      }
    }
  }]
}

```
