Logical: MedicinalProduct
Title: "Medication for clinical workflows"
Description: "Medication information. The model is shared by statements, requests, dispensations, and treatment lines. Each of those may have different restrictions in FHIR profile."

* identifier 0..* class "The identifier(s) of the product, independently of the level of product. If several identifiers are specified, they shall not have conflicting meanings." 
  * medicinalProductIdentifier 0..* II "Identifier at the product level - can be MPID or national identifier" 
  * packagedProductIdentifier 0..* II "Identifier at the package level - can be PCID or national"
  * pharmaceuticalProductIdentifier 0..* II "Identifier at the virtual or administrable product level - can be PhPID or national virtual/administrable product code"
* productCode 0..1 CD "Code for the product that is actually being specified, in established terminologies" // To do: challenge this with examples. Do  we want one code or more? 
* atc 0..* CD "ATC code"
* classification 0..* CD "Classification (narcotic/psychotropic; orphan drug; etc) - other than ATC"

* packSize 0..* PQ "Overall amount of product in one virtual or real package (100ml; 20 tablets; 1 creme & 6 pessaries)"
* productName 0..* Class "Name of the product (full name, invented name, other)"
  * name 1..1 ST "Name of type and language that is relevant for the users"
  * language 0..1 CD "Language of the name"
  * type 0..1 CD "Type of the name (full name, common name, etc)"
* doseForm 0..* Class "Dose form(s) on a product level. Dose form for a single package item is defined below."
  * formCode 1..1 CD "Coded dose form"
  * type 0..1 CD "The type of dose form (combined, authorised, administrable...)" 

* item 0..* Class "A medication item. For combination packs, this can be manufactured items with each item having its own dose form and ingredients+strengths defined"
  * doseForm 0..1 Class "Dose form of single item"
    * formCode 1..1 CD "Dose form"
    * type 0..1 CD "The type of dose form (typically manufactured dose form)" 
  * ingredient 1..* Class "Ingredients"
    * role 0..1 CD "Role (active ingredient, excipient). Typically excipients are not needed, so by default active ingredients are expected."
    * substance 1..1 CD "Substance"
    * strengthInfo 1..* Class "Concentration or presentation strength"
      * strength 1..1 RTO "Concentration or presentation strength of the precise active ingredient"
      * strengthType 1..1 CD "Type of strength that is expressed"
      * strengthSubstance 0..1 CD "Substance that the strength refers to, if different from the main substance"
  * unitOfPresentation 0..* CD "Unit of presentation for the manufactured item (tablet, vial, tube). Typically, the smallest countable object in the package."
  * containedQuantity 0..1 PQ "Manufactured item quantity for liquids (3ml/vial)"
  * manufacturedItemQuantity 0..1 PQ "Number of such manufactured items in this product (5 vials)"
* device 0..* Class "Administrative device included in the product"
  * deviceQuantity 1..1 PQ "Number of such devices"
  * device 1..1 CD "Device coded"
* marketingAuthorisationHolder 0..1 ST "MAH name - do we need more?"
* routeOfAdministration 0..* CD "Route of Administration - if we need it on product level"
// free text for something?


// TO DO RL: Do we have a new model for Magistral/Officinal Formulations? Or is the same model reusable?