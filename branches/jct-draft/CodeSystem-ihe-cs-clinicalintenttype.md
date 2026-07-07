# Clinical Intent Type CodeSystem - IHE Pharmacy Medication Overview v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Clinical Intent Type CodeSystem**

## CodeSystem: Clinical Intent Type CodeSystem 

| | |
| :--- | :--- |
| *Official URL*:http://profiles.ihe.net/PHARM/MEOW/CodeSystem/ihe-cs-clinicalintenttype | *Version*:0.1.0 |
| Active as of 2026-04-07 | *Computable Name*:ClinicalIntentTypeCS |
| **Copyright/Legal**: IHE http://www.ihe.net/Governance/#Intellectual_Property | |

 
Codes for the clinical intent type of medication use. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ClinicalIntentTypeVS](ValueSet-ihe-vs-clinicalintenttype.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "ihe-cs-clinicalintenttype",
  "url" : "http://profiles.ihe.net/PHARM/MEOW/CodeSystem/ihe-cs-clinicalintenttype",
  "version" : "0.1.0",
  "name" : "ClinicalIntentTypeCS",
  "title" : "Clinical Intent Type CodeSystem",
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
  "description" : "Codes for the clinical intent type of medication use.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "001"
    }]
  }],
  "copyright" : "IHE http://www.ihe.net/Governance/#Intellectual_Property",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 3,
  "concept" : [{
    "code" : "therapeutic",
    "display" : "Therapeutic",
    "definition" : "Medication used for treatment of a condition"
  },
  {
    "code" : "prophylactic",
    "display" : "Prophylactic",
    "definition" : "Medication used for prevention of a condition"
  },
  {
    "code" : "self-medication",
    "display" : "Self-medication",
    "definition" : "Medication taken by the patient on their own initiative, without a prescription"
  }]
}

```
