Logical: ModelMedicationRecordTreatmentLine
Title: "Medication Record Treatment Line - logical model"
Description: "A model for representing a Treatment Line."

* identifier 0..1 Identifier "The business identifier(s) for the medication treatment Line" "The business identifier(s) for the medication treatment Line"
* basedOn 0..1 Reference(ModelMedicationRecordTreatment) "The identifier of the treatment from which this line stems" "The identifier of the treatment from which this line stems" 
* subject 1..1 Reference(Patient) "For whom this treatment line was created" "For whom this treatment line was created"
* recorder 1..1 Reference(Practitioner or Organization) "Who created this treatment line" "Who created this treatment line"
* recordDate 1..1 dateTime "Datetime that the treatment line was created or updated" "Datetime that the treatment line was created or updated"
* startMedicationDate 1..1 dateTime "Start date of the medication" "Start date of the medication"
* endMedicationDate 0..1 dateTime "End date, if exists, for stopping the medication" "End date, if exists, for stopping the medication"
* originType 1..1 CodeableConcept "From what context this treatment line stems" "From what context this treatment line stems, whether is ambulatory prescription, patient request, etc"
* reaction 0..* CodeableConcept "Reaction to this treatment line" "Reaction to this treatment line"
* product[x] 1..1 Reference(Medication) or CodeableConcept "Product for which the treatment line refers to" "Product for which the treatment line refers to"
* medicationType 0..* CodeableConcept "What type of medication the product is: hospital, community, preparation, etc"  "What type of medication the product is: hospital, community, preparation, etc"
* instructionForUse 0..* string "Full representation of the dosage instructions" "Full representation of the dosage instructions"
* dosageAmount 0..1 CodeableConcept "Quantity to be consumed" "Quantity to be consumed"
* periodicity 0..1 CodeableConcept "Scheduling for the consumption" "Scheduling for the consumption"
* route 1..1 CodeableConcept "Route through which the product should consumed" "Route through which the product should consumed"
* dayPeriod 0..* CodeableConcept "Period of the day for consuming the product" "Period of the day for consuming the product"
* lifecycleStatus 1..1 CodeableConcept "Status of the treatment line" "Status of the treatment line"
* statusReason 0..* CodeableConcept "Reason the status" "Reason the status"
* treatmentPlan 0..1 Reference "Link to the 'parent' treatment - i.e the treatment that this order is derived from, or contriburing to" "Link to the 'parent' treatment - i.e the treatment that this order is derived from, or contriburing to" //extra
* indication 0..* CodeableConcept "Why the treatment exists" "Why the treatment exists"  //extra


Logical: ModelMedicationRecordTreatment
Title: "Medication Record - Medication Treatment"
Description: "A model for the Medication Treatment."

* identifier 0..1 BackboneElement "The business identifier(s) for the medication treatment" "The business identifier(s) for the medication treatment" 
  * treatmentGuid 0..1 Identifier "The Global Unique identifier(s) for the medication treatment" "The Global Unique identifier(s) for the medication treatment" 
* subject 1..1 Reference(Patient) "The subject of the medication treatment" "The subject of the medication treatment"
* status 1..1 code "Status of the medication treatment" "Status of the medication treatment"
* intent 1..1 code "" ""
* category 0..* CodeableConcept "Category(ies) of the medication treatment" "Category(ies) of the medication treatment"
* title 0..1 string "Short title of the medication treatment" "Short title of the medication treatment"
* description 0..1 string "Textual description of the treatment" "Textual description of the medication treatment"
* encounter 0..1 Reference(Encounter) "The encounter in which the medication treatment was created or updated" "The encounter in which the medication treatment was created or updated"
* period 0..1 Period "The duration of the treatment" "The duration of the treatment" 
* created 0..1 dateTime "When the treatment record was created" "When the treatment record was created"
* author 0..1 Reference(Patient or Practitioner or PractitionerRole or Device or RelatedPerson or Organization or CareTeam) "The current author/responsible for the medication treatment plan" "The current author/responsible for the medication treatment plan"
* note  0..* Annotation "Comments about the plan" "Comments about the plan"




Logical: ModelMedicationRecord
Title: "Medication Record logical model"
Description: "A model for a structure collection of a patient's medication history."

* identifier 0..1 Identifier "The business identifier(s) for the Medication Record" "The business identifier(s) for the Medication Record" 
* patient 1..1 Reference "The subject of the medication record" "The subject of the medication record"
* treatments 0..* ModelMedicationRecordTreatment "The treaments that are included in this record" "The treaments that are included in this record"
* treatmentLines 0..* ModelMedicationRecordTreatmentLine "The treatment lines that are included in this record" "The treatment lines that are included in this record"
* summaryView 0..* ModelMedicationRecordSummaryView "The summary views that are produced from this record or entered into it" "The summary views that are produced from this record or entered into it"
* detailedRecords 0..* BackboneElement  "Detailed records" "Detailed records - the most granular interactions" 
  * orders 0..* ModelMedicationRecordOrder  "Explicit or implicit order for medication use or changes" "Explicit or implicit order for medication use or changes" 
  * schedule 0..* ModelMedicationScheduledAdministration  "Scheduled administrations of the medication" "Scheduled administrations of the medication" 
  * dispenses 0..*  ModelMedicationRecordDispense "Registered or reported dispenses" "Registered or reported dispenses"
  * administrations 0..*  ModelMedicationRecordAdministration "Registered or reported single administrations" "Registered or reported single administrations"
  * usageReports 0..*  ModelMedicationRecordUsage "Reported statements of medication usage" "Reported statements of medication usage"
* changeRecord 0..* Provenance  "Change records and provenance for the medication record components" "Change records and provenance for the medication record components" 