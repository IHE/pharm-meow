Extension: BusinessVersion
Description: "Business Version of the resource"
* extension contains
    version 1..1 MS and
    versiondate 0..1 MS 
* extension[version].value[x] only positiveInt or string
* extension[versiondate].value[x] only dateTime

Extension: TreatmentStatus
Description: "The state of the actual treatment - taking, not taken..."
* extension contains
    status 1..1 MS and
    reason 0..1 MS 
* extension[status].value[x] only CodeableConcept
* extension[reason].value[x] only CodeableConcept

Extension: VerificationInformation
Description: "Verification of medication line. The overview is verified as a whole, but each line is equipped with the information. The actual functional meaning and impact of this validation depends on the implementation."
* extension contains
    verifier 1..1 MS and
    verificationTime 1..1 MS 
* extension[verifier].value[x] only Reference
* extension[verificationTime].value[x] only dateTime

Extension: Substitution
Id: med-substitution
Description: "Whether and which type of substitution is allowed for this medication treatment line"
* extension contains
    Type 1..1 and
    TypeReason 0..1
* extension[Type].value[x] only CodeableConcept
* extension[TypeReason].value[x] only CodeableConcept



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

* medication MS //medication
* dosage MS //usageInstructions
* category MS //category

//* extension contains http://hl7.org/fhir/StructureDefinition/event-basedOn named treatmentPlan 0..1 MS 
//* extension[treatmentPlan].valueReference only Reference(CarePlan) //medicationTreatment (any for the time being ISSUE-39)

* extension contains BusinessVersion named version 0..1 MS //version+timestamp
* extension contains TreatmentStatus named TreatmentStatus 0..1 MS //treatmentStatus+treatmentStatusReasonCode+treatmentStatusReasonText
* extension contains VerificationInformation named verificationInformation 0..1 MS //treatmentStatus+treatmentStatusReasonCode+treatmentStatusReasonText
* extension contains Substitution named substitution 0..1 MS //substitution

* reason MS //indication + indicationtext + intendedUse
* dosage.text MS //preparationInstructions
* note MS //comment




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
* section ^slicing.discriminator.path = "type.coding.code"
* section ^slicing.rules = #open
* section contains
    MedRecordTreatment 0..* MS and
    MedRecordTreatmentLine 0..* MS and
    MedRecordMedicationSummaryView 0..* MS and
    detailsRecord 0..1 MS 
* section[MedRecordTreatment].entry only Reference(MedicationTreatment)
* section[MedRecordTreatmentLine].entry only Reference(MedicationTreatmentLine)
* section[detailsRecord].entry only Reference(MedicationStatement or MedicationRequest or MedicationDispense or MedicationAdministration )


Profile: MedicationOverview
Parent: Bundle
Id: MedicationOverview
Title: "Medication overview"
Description: "The profile for the full Medication overview"

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


* entry[MedRecordUsage] ^short = "Medication summaries associated with the patient"
* entry[MedRecordUsage].resource 1.. MS
* entry[MedRecordUsage].resource only MedicationStatement
