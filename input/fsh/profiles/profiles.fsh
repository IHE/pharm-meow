
Profile: MedicationTreatmentLine
Title: "Medication Treatment Line"
Description: "The profile for Medication Treatment Line - a single recorded item/line of a medication treatment"
Parent: MedicationStatement

* identifier MS //identifier
* derivedFrom MS //derivedFrom
* subject MS //medicationOverview.patient
* informationSource MS //recordingMetadata //possible extension for all the elements in the LM?
* dateAsserted MS //recordedTime+authoringTime
* effective[x] only Period
* effectivePeriod MS //effectivePeriod
* status MS //status

* medication[x] MS //medication
* dosage MS //usageInstructions
* category MS //category

//* extension contains http://hl7.org/fhir/StructureDefinition/event-basedOn named treatmentPlan 0..1 MS 
//* extension[treatmentPlan].valueReference only Reference(CarePlan) //medicationTreatment (any for the time being ISSUE-39)

* extension contains http://hl7.org/fhir/StructureDefinition/artifact-version named version 0..1 MS //version+timestamp
//* extension contains TreatmentStatus named TreatmentStatus 0..1 MS //treatmentStatus+treatmentStatusReasonCode+treatmentStatusReasonText
// removed TreatmentStatus as it appears to map to adherence

* extension contains VerificationInformation named verificationInformation 0..1 MS //treatmentStatus+treatmentStatusReasonCode+treatmentStatusReasonText
* extension contains
    Substitution named substitution 0..1 MS and
    http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationStatement.adherence named adherence 1..1 MS

* reasonCode MS //indication + indicationtext + intendedUse
* reasonReference MS //indication + indicationtext + intendedUse
* dosage.text MS //preparationInstructions
* note MS //comment
// adherence is an R5 element, preadopted here as a cross-version extension (see extension[adherence] below)
* status = #unknown

* extension[adherence].extension[code] MS
* extension[adherence].extension[code] ^short = "Indicates whether the medication is or is not being consumed or administered"
* extension[adherence].extension[code] ^comment = """This is a FHIR R5 element, preadopted as an extension in this FHIR R4 specification.
For the full definition see here: [http://hl7.org/fhir/R5/medicationstatement-definitions.html#MedicationStatement.adherence](http://hl7.org/fhir/R5/medicationstatement-definitions.html#MedicationStatement.adherence)"""

Profile: MedicationTreatment
Title: "Medication Treatment"
Description: "The profile for Medication Treatment in a Medication Record - a set of treatment lines/items"
Parent: CarePlan

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


Profile: MedicationOverviewComposition
Title: "Medication Overview Composition"
Description: "The profile for how to organize the information in a medication overview"
Parent: Composition
Id: MedicationOverviewComposition

* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code.coding.code"
* section ^slicing.rules = #open
* section contains
    MedRecordTreatment 0..* MS and
    MedRecordTreatmentLine 0..* MS and
    MedRecordMedicationSummaryView 0..* MS and
    detailsRecord 0..1 MS 
* section[MedRecordTreatment].entry only Reference(MedicationTreatment)
* section[MedRecordTreatmentLine].entry only Reference(MedicationTreatmentLine)
* section[detailsRecord].entry only Reference(MedicationStatement or MedicationRequest or MedicationDispense or MedicationAdministration )


Profile: MedicationOverviewBundle
Parent: Bundle
Id: MedicationOverview
Title: "Medication Overview Bundle"
Description: "The profile for the full Medication overview as a Bundle type Document"

* ^version = "1.0.0"
* identifier 0..1 MS
* type = #document (exactly)
* type ^short = "document"
* type ^definition = "Bundle is a document"
* total 0..0
* link 0..0 SU
// Discriminate by resource TYPE, not by declared profile: this lets a producer's
// entries slice correctly without stamping meta.profile on every resource (mirrors
// hl7.fhir.uv.ips Bundle-uv-ips). Every slice below now has a unique resource type,
// so #type alone is unambiguous. (A #profile leg was intentionally NOT added: it
// would re-require meta.profile on instances, which is what we are avoiding here.)
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slicing based on the resource type of the sliced element"
* entry contains
    Composition 1..1 and
    Patient 1..1 and
    MedRecordTreatment 0..* and
    MedRecordTreatmentLine 0..* and
    MedRecordOrder 0..* and
    MedRecordDispense 0..* and
    MedRecordAdministration 0..*
* entry[Composition] ^short = "Composition"
* entry[Composition].resource 1.. MS
* entry[Composition].resource only MedicationOverviewComposition

* entry[Patient] ^short = "Patient for whom the record is concerned"
* entry[Patient].resource 1.. MS
* entry[Patient].resource only Patient

* entry[MedRecordTreatment] ^short = "Treatments associated with the patient"
* entry[MedRecordTreatment].resource 1.. MS
* entry[MedRecordTreatment].resource only MedicationTreatment

* entry[MedRecordTreatmentLine] ^short = "Treatment lines associated with the patient"
* entry[MedRecordTreatmentLine].resource 1.. MS
* entry[MedRecordTreatmentLine].resource only MedicationTreatmentLine



* entry[MedRecordOrder] ^short = "Medication summaries associated with the patient"
* entry[MedRecordOrder].resource 1.. MS
* entry[MedRecordOrder].resource only MedicationRequest

* entry[MedRecordDispense] ^short = "Medication summaries associated with the patient"
* entry[MedRecordDispense].resource 1.. MS
* entry[MedRecordDispense].resource only MedicationDispense

* entry[MedRecordAdministration] ^short = "Medication summaries associated with the patient"
* entry[MedRecordAdministration].resource 1.. MS
* entry[MedRecordAdministration].resource only MedicationAdministration

// MedRecordUsage (bare MedicationStatement) removed: it is the supertype of
// MedRecordTreatmentLine (a MedicationStatement profile), so any treatment line
// also matched Usage → unresolvable "matches more than one slice". Raw usage
// MedicationStatements, if needed, are still permitted by the open slicing and
// can be referenced from the Composition detailsRecord section.
