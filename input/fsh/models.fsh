Logical: MedicationOverview
Title: "NEW | Medication Overview - logical model"
Description: "NEW | A model for the whole medication overview (medication schema)"
* patient 1..1 Reference(Patient) "Patient"
* medicationTreatmentLine 0..* Reference(MedicationTreatmentLine) "List item in the list of all current medication based treatments. Each line can be verified or unverified."
* verification 0..1 BackboneElement "Verification of overview"
  * practicioner 1..1 Reference "HCP verifying the treatments/overview"
  * verificationTime 1..1 dateTime ""
* comment 0..* BackboneElement "Comment on the full overview"
  * author 1..1 Reference "author of the comment (pharmacist, doctor, social carer)"
  * date 1..1 dateTime "time of comment"
  * commentText 1..1 string "content of the comment"
  * subject 0..* Reference "What the comment is about. It can reference either a treatment line, treatment, or full overview"


Logical: MedicationTreatment
Title: "NEW | Medication Treatment - logical model"
Description: "NEW | Grouping of treatment lines that are somehow related to eachother (the same purpose, other)"

* advice 0..* BackboneElement "Advice"
* comment 0..* BackboneElement "Comment"
// * medicationTreatmentLine 1..* "Medication treatment line"

Logical: MedicationTreatmentLine
Title: "NEW | Medication Treatment Line - logical model"
Description: "NEW | A model for representing a Treatment Line."
* medication[x] 1..1 Reference(Medication) or CodeableConcept "Medicinal product for which the treatment line refers to. Identification or sufficient description of the product."
* status 1..1 code "Status of the treatment line"
* category 0..* code "Whatever category for the treatment. Categorisation of treatment lines is implementation-specific."
* reasonIndication 0..* code "Reason why the product has been prescribed to the patient, or why the patient claims to be taking it"
* usageInstructions 0..* BackboneElement "Instructions about requested administration of the product"
  * timing 0..1 BackboneElement "Time-related attributes related to administration"
    * startMedicationDate 1..1 dateTime "Start date of the medication" "Start date of the medication"
    * endMedicationDate 0..1 dateTime "End date, if exists, for stopping the medication" "End date, if exists, for stopping the medication"
    * duration 0..1 Quantity "Duration of the treatment"
  * dosage 0..1 BackboneElement "strength, amount. Can be complex model, one dosage for odd days, another for even days"
    * dose 0..1 Quantity "A dose to be administered at one time"
    * frequency 0..1 Ratio "Administered amount per time unit"
  * routeOfAdministration 0..1 code "Route of administration for this particular treatment"
* medicationTreatment 0..1 Reference(MedicationTreatment) "Grouper of lines that belong together, lines are parts of the same treatment"
* verificationStatus 1..1 BackboneElement "Verification information - what is needed to create a verified version of the overview, and maintain it"

* preparationInstructions 0..* string "Additional instructions about preparation or dispense" 
* relatedRequest 0..* Reference "Reference to any related source that gives additional information/context for this treatment line"
* informationSource 0..* Reference "Other data object that this treatment line is derived from - !!!!!!possible a duplicate to relatedRequest"

* reportingMetadata 1..1 BackboneElement ""
  * reporter 1..1 Reference "Person authoring/cancelling the treatment line, either by requesting a treatment or documenting a patient's statement. Typically a doctor, nurse, or pharmacist."
  * reporting 1..1 dateTime "Time of creation of the treatment line"
  * patientReported 1..1 boolean "The treatment line has been documented according to patient's statement"


Logical: ModelMedicationRecordTreatmentLine
Title: "OLD Medication Record Treatment Line - logical model"
Description: "OLD A model for representing a Treatment Line."

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
Title: "OLD Medication Record - Medication Treatment"
Description: "OLD A model for the Medication Treatment."

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
Title: "OLD Medication Record logical model"
Description: "OLD A model for a structure collection of a patient's medication history."

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