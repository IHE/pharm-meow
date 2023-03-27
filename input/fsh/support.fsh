//based on R4
Extension: RelatedTreatmentLine
Id:        related-tl
Title:    "Based On Extension"
Description: "Extension for connecting several resources to a single Treatment Line"
* value[x] only Reference(MedicationUsage)

Profile: MedRecordDispense
Title: "[Profile] - Dispense"
Description: "The profile for Medication Dispense in a Medication Record - a record of a single administration event"
Parent: MedicationDispense


Profile: MedRecordOrder
Title: "[Profile] - Prescription"
Description: "The profile for Medication Prescription in a Medication Record - a record of a order or request for a medication or a change of medication, implicit or explicit"
Parent: MedicationRequest



Profile: MedRecordUsage
Title: "[Profile] - Usage"
Description: "The profile for Medication Usage in a Medication Record - a record of a single administration event"
Parent: MedicationUsage


Profile: MedRecordAdministration
Title: "[Profile] - Administration"
Description: "The profile for Medication Administration in a Medication Record - a record of a single administration event"
Parent: MedicationAdministration


Profile: MedRecordMedicationScheduledAdministration
Title: "[Profile] - Scheduled Administration"
Description: "The profile for Medication Scheduled Administration in a Medication Record - a set of schedules takes for a certain drug, based on a previous prescription"
Parent: MedicationRequest

Profile: MedRecordMedicationSummaryView
Title: "[Profile] - Summary View"
Description: "The profile for Medication Summary view in a Medication Record"
Parent: CarePlan





Logical: ModelMedicationRecordDispense
Title: "[Logical Model] - Dispense"
Description: "A model for representing a product dispense."


Logical: ModelMedicationRecordOrder
Title: "[Logical Model] - Prescription"
Description: "A model for representing a product order."


Logical: ModelMedicationRecordUsage
Title: "[Logical Model] - Usage"
Description: "A model for representing medication usage."



Logical: ModelMedicationRecordAdministration
Title: "[Logical Model] - Administration"
Description: "A model for representing and reporting an administration of a product."

Logical: ModelMedicationScheduledAdministration
Title: "[Logical Model] - Scheduled Administration"
Description: "A model for a record of a single planned administration event."





Logical: ModelMedicationRecordSummaryView
Title: "[Logical Model] - Summary View"
Description: "A model for representing a summary view of a patient's medication."







