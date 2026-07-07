# Clinical Intent Type ValueSet - IHE Pharmacy Medication Overview v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Clinical Intent Type ValueSet**

## ValueSet: Clinical Intent Type ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://profiles.ihe.net/PHARM/MEOW/ValueSet/ihe-vs-clinicalintenttype | *Version*:0.1.0 |
| Active as of 2026-04-07 | *Computable Name*:ClinicalIntentTypeVS |
| **Copyright/Legal**: IHE http://www.ihe.net/Governance/#Intellectual_Property | |

 
The clinical intent type of the medication use - therapeutic, prophylactic, or self-medication. 

 **References** 

* [MedicationStatement - Clinical Intent Type](StructureDefinition-ihe-ext-medicationstatement-clinicalintenttype.md)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R5/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ihe-vs-clinicalintenttype",
  "url" : "http://profiles.ihe.net/PHARM/MEOW/ValueSet/ihe-vs-clinicalintenttype",
  "version" : "0.1.0",
  "name" : "ClinicalIntentTypeVS",
  "title" : "Clinical Intent Type ValueSet",
  "status" : "active",
  "experimental" : false,
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
  "description" : "The clinical intent type of the medication use - therapeutic, prophylactic, or self-medication.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "001"
    }]
  }],
  "copyright" : "IHE http://www.ihe.net/Governance/#Intellectual_Property",
  "compose" : {
    "include" : [{
      "system" : "http://profiles.ihe.net/PHARM/MEOW/CodeSystem/ihe-cs-clinicalintenttype"
    }]
  }
}

```
