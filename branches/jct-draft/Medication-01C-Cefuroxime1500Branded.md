# 01C-Cefuroxime1500Branded - IHE Pharmacy Medication Overview v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **01C-Cefuroxime1500Branded**

## Example Medication: 01C-Cefuroxime1500Branded

Profile: [Medicinal product](StructureDefinition-IHEMedication.md)

**Medication - Classification**: cefuroxime

> **Medication - Product Name**
* name: Cefuroxime MIP 1500 mg, süste-/infusioonilahuse pulber
* language: Estonian (Estonia)

**identifier**: `https://www.ravimiregister.ee`/1529962

**marketingAuthorizationHolder**: MIP Pharma GmbH

**doseForm**: Powder for solution for injection or infusion

**totalVolume**: 10 Vial (Details: EDQM Standard Terms code15060000 = 'Vial')

> **ingredient**

### Items

| | |
| :--- | :--- |
| - | **Concept** |
| * | Cefuroxime |

**isActive**: true**strength**: 1500 milligram (Details: UCUM codemg = 'mg')/1 Vial (Details: EDQM Standard Terms code15060000 = 'Vial')



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "01C-Cefuroxime1500Branded",
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
  },
  {
    "extension" : [{
      "url" : "name",
      "valueString" : "Cefuroxime MIP 1500 mg, süste-/infusioonilahuse pulber"
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
    "value" : "1529962"
  }],
  "marketingAuthorizationHolder" : {
    "display" : "MIP Pharma GmbH"
  },
  "doseForm" : {
    "coding" : [{
      "system" : "http://standardterms.edqm.eu",
      "code" : "50053000",
      "display" : "Powder for solution for injection or infusion"
    }]
  },
  "totalVolume" : {
    "value" : 10,
    "unit" : "Vial",
    "system" : "http://standardterms.edqm.eu",
    "code" : "15060000"
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
