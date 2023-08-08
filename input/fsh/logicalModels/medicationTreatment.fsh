Logical: MedicationTreatment
Title: "Medication Treatment - logical model"
Description: "Grouping of treatment lines that are somehow related to eachother (the same purpose, other)"

* advice 0..* BackboneElement "Advice"
* comment 0..* BackboneElement "Comment"
* indication 0..* code "Reason why the product has been prescribed to the patient, or why the patient claims to be taking it"
// * medicationTreatmentLine 1..* "Medication treatment line"
