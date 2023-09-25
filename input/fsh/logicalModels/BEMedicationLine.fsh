Logical: BEMedicationLine
Title: "Medication Treatment Line - logical model"
Description: "A model for representing a Treatment Line."

* ^extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/logical-target"
* ^extension[=].valueBoolean = true

* identifier 1..1 Identifier "Unique identifier" "A unique identifier for the medication line"
* version 1..1 string "Version identifier - e.g. timestamp" "A unambiguous version identifier"
* status 1..1 code "Status of the treatment line entry"
* statusReason 0..1 CodeableConcept "Reason for the status" 
* assertedDate 0..1 dateTime "Date the medication line was first asserted"
* recordedDate 1..1 dateTime "Date the medication line was recorded or updated"
* recorder 1..1 Reference(Practitioner) "Recorder"
* patient 1..1 Reference(Patient) "Patient"
* category 0..1 BackboneElement
  * originType 0..1 CodeableConcept "The origin..."
  
* product 1..1 BackboneElement "The product or substance"
  * product 1..1 Reference(MedProduct) "Product reference, identifier or name"
  * type 1..1 CodeableConcept "Type of medication - magistral, medicinal product, non-medicinal product"
  * exposure 0..1 CodeableConcept "Therapeutic, Prophylactic"
* reason 0..* BackboneElement "Reason for the medication treatment"
  * reference 0..1 Reference "Reference to existing condition or reason"
  * code 0..1 CodeableConcept "Code of the condition, or free text" 
* effectivePeriod 1..1 BackboneElement "Period of medication treatment"
  * start 1..1 dateTime "The begin of the medication line"
  * start 0..1 dateTime "The end of the medication line"
* adherence 0..1 BackboneElement "Whether the patient is known to be taking the medication"
  * code 1..1 CodeableConcept "The status - taking, not taking,..."
  * adherenceStatusReason 0..1 CodeableConcept "Reason for the adherence status" 

* dosage 0..1 BackboneElement "Dosage"
  * dosageDetails 0..1 Dosage "Structure Dosage"
  * dosageOverride 0..1 boolean "Dosage Override"
  * dosageOverrideReason 1..1 CodeableConcept "Dosage Override reason"
  
* note 0..* Annotation "A note captured by a professional"

// TO DO: Reaction??

/*  |_ Dosage
    |_ dosageOverride
    |_ dosageOverrideReason
    |_ dosageDetails
      |_ text
      |_ timing
        |_ event
        |_ repeat
          |_ duration
          |_ period
          |_ dayOfWeek
            |_ when
              |_ BePeriod
      |_ route
      |_ doseQuantity
        |_ value
        |_ unit
      |_ patientInstruction
*/
/*
  |_ <i>originType
  |_ DispenseRequestNeeded?   
  |_ Visible
*/



Logical: MedProduct
Title: "Medicinal Product"
Description: "A model for representing a medicinal product."

* ^extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/logical-target"
* ^extension[=].valueBoolean = true
* identifier 0..* Identifier "Unique identifier" "A unique identifier for the medication line"
* name 0..1 string "The name or designation of the product"
* description 0..1 string "The text description of the product when not coded"
* ingredient 0..* BackboneElement "The ingredients or components of the product"
  * product 1..1 CodeableConcept "The product or substance"
  * strength 0..1 SimpleQuantity "The quantity or amount of ingredient in the parent product"
* doseForm 0..1 CodeableConcept "The dose form of the product"

// TO DO:  dose form - which one? - e.g. solution for injection? or injection?
