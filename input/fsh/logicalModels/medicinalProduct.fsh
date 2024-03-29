Logical: MedicinalProduct
Title: "Medicinal product"
Description: "Medication information. The model is shared by statements, requests, dispensations, and treatment lines. Each of those may have different restrictions in FHIR profile."
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^name = "MedicinalProduct"
* ^status = #active

* identifier 0..* Class "The identifier(s) of the product, independently of the level of product. If several identifiers are specified, they shall not have conflicting meanings." 
  * medicinalProductIdentifier 0..* II "Identifier at the product level - can be MPID or national identifier" 
  * packagedProductIdentifier 0..* II "Identifier at the package level - can be PCID or national"
  * pharmaceuticalProductIdentifier 0..* II "Identifier at the virtual or administrable product level - can be PhPID or national virtual/administrable product code"
* productCode 0..1 CD "Code for the product that is actually being specified, in established terminologies" // To do: challenge this with examples. Do  we want one code or more? 
//* atc 0..* CD "ATC code"
* classification 0..* CD "Classification (e.g. ATC; narcotic/psychotropic; orphan drug; etc.)"

* packSize 0..* PQ "Overall amount of product in one package (100ml; 20 tablets; 1 creme & 6 pessaries)"

* productName 0..* Class "Name of the product (full name, invented name, other)"
  * name 1..1 ST "Name of type and language that is relevant for the users"
  * language 0..1 CD "Language of the name"
  * type 0..1 CD "Type of the name (full name, common name, etc)"
* doseForm 0..1 CD "Dose form(s) on a product level. Dose form for a single package item is defined below."
// 20-11-2023
// Do we need a dose form type?

* item 0..* Class "A medication item. For combination packs, this can be manufactured items with each item having its own dose form and ingredients+strengths defined"
  * doseForm 0..1 CD "Dose form"
  * ingredient 1..* Class "Ingredients"
    * role 0..1 CD "Role (active ingredient, excipient). Typically excipients are not needed, so by default active ingredients are expected."
    * substance 1..1 CD "Substance"
    * strengthInfo 0..* Class "Concentration or presentation strength"
      * strength 1..1 RTO "Concentration or presentation strength of the precise active ingredient"
      * strengthType 0..1 CD "Type of strength that is expressed"
      * strengthSubstance 0..1 CD "Substance that the strength refers to, if different from the main substance"
  * unitOfPresentation 0..1 CD "Unit of presentation for the manufactured item (tablet, vial, tube). Typically, the smallest countable object in the package."
  * containedQuantity 0..1 PQ "Manufactured item quantity for liquids (3ml/vial)"
  * amount 0..1 PQ "Number of such manufactured items in this product (5 vials)"
* device 0..* Class "Administration device included in the product"
  * deviceQuantity 1..1 PQ "Number of such devices"
  * device 1..1 CD "Device coded"

// * marketingAuthorisationHolder 0..1 ST "MAH name - do we need more?"
// 20-11-2023: MAH is removed. We don't need that explicitly 
// To do: do we want to accommodate for Manufacturer / supplier / ??
// 20-11-2023: removed routeOfAdministration. This will also be present in the dosage information, so we don't need it here
// * routeOfAdministration 0..* CD "Route of Administration as defined for the product"


// TO DO RL: Do we have a new model for Magistral/Officinal Formulations? Or is the same model reusable?
