Logical: MedicationTreatment
Title: "Medication Treatment"
Description: "Grouping of treatment lines that are somehow related to eachother (the same purpose, other)"
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^name = "MedicationTreatment"
* ^status = #active

* comment 0..* BackboneElement "Comment"
* treatmentPeriod 0..1 Period "The intended or effective treatment period"
* identifier 0..* II "Unique identifier of the treatment"
* indication 0..* CD "Reason why the treatment has been prescribed to the patient, or why the patient claims to be taking it"

// This is starting to look like the prescription, which is good...
// Example: end of treatment NOT defined by medication - 
// chemotherapy treatment may start X days before the first medication and end y days after the last medication. 
// For example for surveillance, lab tests,.. 

