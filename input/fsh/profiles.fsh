//based on R4
Extension: RelatedTreatmentLine
Id:        related-tl
Title:    "Based On Extension"
Description: "Extension for connecting several resources to a single Treatment Line"
* value[x] only Reference(MedicationStatement)

Profile: MedRecordDispense
Title: "BeMedRecord Dispense profile"
Description: "The profile for Medication Dispense in a Medication Record - a record of a single administration event"
Parent: MedicationDispense
* identifier MS
* subject MS // dispense.patient
* performer MS
//* performer.actor only Reference($be-organization or $be-practitioner)
* whenHandedOver MS
* authorizingPrescription MS
* status MS
* statusReasonCodeableConcept MS
* medicationCodeableConcept MS
* medicationReference MS
* quantity MS
* dosageInstruction MS
* substitution.reason MS
* type MS
* extension contains http://hl7.org/fhir/StructureDefinition/event-basedOn named treatmentPlan 0..1 MS
* extension[treatmentPlan].valueReference only Reference(CarePlan)
* extension contains RelatedTreatmentLine named basedOn 0..1 MS