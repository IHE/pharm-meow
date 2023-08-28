Logical: MedicationTreatment
Title: "Medication Treatment - logical model"
Description: "Grouping of treatment lines that are somehow related to eachother (the same purpose, other)"

* comment 0..* BackboneElement "Comment"
* treatmentPeriod 0..1 Period
* identifier 0..* II "Unique identifier of the treatment"
* indication 0..* CD "Reason why the treatment has been prescribed to the patient, or why the patient claims to be taking it"

// This is starting to look like the prescription, which is good...
// Example: end of treatment NOT defined by medication - 
chemotherapy treatment may start X days before the first medication and end y days after the last medication. 
// For example for surveillance, lab tests,.. 

