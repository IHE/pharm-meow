Profile: MedRecordTreatmentLine
Title: "[Profile] - Treatment Line"
Description: "The profile for Medication Treatment Line - a single recorded item/line of a medication treatment"
Parent: MedicationStatement
* meta.profile 1..*
* identifier MS
* derivedFrom MS
* subject MS 
* informationSource MS //recorder
* dateAsserted MS //recordDate
* effectiveDateTime MS //startMedicationDate + endMedicationDate
* effectivePeriod MS //startMedicationDate + endMedicationDate
* status MS //lifecycleStatus
//* statusReason MS //statusReason
* medication MS
* dosage MS //dosageAmmount + peridocity + dayperiod + route + instructionforUse
* category MS //medicationType
* note MS //everything else (origintype, lotnumber and reaction)
* extension contains http://hl7.org/fhir/StructureDefinition/event-basedOn named treatmentPlan 0..1 MS
* extension[treatmentPlan].valueReference only Reference(CarePlan) 


Profile: MedRecordTreatment
Title: "[Profile] - Treatment"
Description: "The profile for Medication Treatment in a Medication Record - a set of treatment lines/items"
Parent: CarePlan
* meta.profile 1..*
* identifier MS
* subject MS 
* contributor MS
* basedOn MS
* created MS 
* period MS 
* intent MS
* status MS
* note MS
* goal MS
* supportingInfo MS
* addresses MS
* contributor MS
* careTeam MS
* title MS
* category MS 
* partOf MS
* encounter MS
* description MS
* instantiatesUri MS
* replaces MS


Profile: MedRecordComposition
Title: "[Profile] - Structure Composition for Medication overview"
Description: "The profile for how to organize the information in a medication overview"
Parent: Composition
Id: MedRecord-comp
* meta.profile 1..*
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "type.coding.code"
* section ^slicing.rules = #open
* section contains
    MedRecordTreatment 0..* MS and
    MedRecordTreatmentLine 0..* MS and
    MedRecordMedicationSummaryView 0..* MS and
    detailsRecord 0..1 MS 
* section[MedRecordTreatment].entry only Reference(MedRecordTreatment)
* section[MedRecordTreatmentLine].entry only Reference(MedRecordTreatmentLine)
* section[detailsRecord].entry only Reference(MedicationStatement or MedicationRequest or MedicationDispense or MedicationAdministration )


Profile: Medoverview
Parent: Bundle
Id: Medoverview
Title: "[Profile] - Medication overview"
Description: "The profile for Medication overview"
* ^version = "1.0.0"
* identifier 0..1 MS
* type = #document (exactly)
* type ^short = "document"
* type ^definition = "Bundle is a document"
* total 0..0
* link 0..0 SU
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slicing based on the profile conformance of the sliced element"
* entry contains
    Composition 1..1 and
    Patient 1..1 and
    MedRecordTreatment 0..* and
    MedRecordTreatmentLine 0..* and 
    MedRecordOrder 0..* and
    MedRecordDispense 0..* and
    MedRecordAdministration 0..* and
    MedRecordUsage 0..* 
* entry[Composition] ^short = "Composition"
* entry[Composition].resource 1.. MS
* entry[Composition].resource only MedRecordComposition

* entry[Patient] ^short = "Patient for whom the record is concerned"
* entry[Patient].resource 1.. MS
* entry[Patient].resource only Patient

* entry[MedRecordTreatment] ^short = "Treatments associated with the patient"
* entry[MedRecordTreatment].resource 1.. MS
* entry[MedRecordTreatment].resource only MedRecordTreatment

* entry[MedRecordTreatmentLine] ^short = "Treatment lines associated with the patient"
* entry[MedRecordTreatmentLine].resource 1.. MS
* entry[MedRecordTreatmentLine].resource only MedRecordTreatmentLine



* entry[MedRecordOrder] ^short = "Medication summaries associated with the patient"
* entry[MedRecordOrder].resource 1.. MS
* entry[MedRecordOrder].resource only MedicationRequest

* entry[MedRecordDispense] ^short = "Medication summaries associated with the patient"
* entry[MedRecordDispense].resource 1.. MS
* entry[MedRecordDispense].resource only MedicationDispense

* entry[MedRecordAdministration] ^short = "Medication summaries associated with the patient"
* entry[MedRecordAdministration].resource 1.. MS
* entry[MedRecordAdministration].resource only MedicationAdministration


* entry[MedRecordUsage] ^short = "Medication summaries associated with the patient"
* entry[MedRecordUsage].resource 1.. MS
* entry[MedRecordUsage].resource only MedicationStatement