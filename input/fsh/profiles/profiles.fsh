
Profile: MedicationTreatmentLine
Title: "Medication Treatment Line"
Description: "The profile for Medication Treatment Line - a single recorded item/line of a medication treatment"
Parent: MedicationStatement

// ── Core identifiers and references ──────────────────────────────────────────
* identifier MS
* derivedFrom MS
* subject MS
* informationSource MS // Clinical author — who made the clinical decision

// ── Timing ───────────────────────────────────────────────────────────────────
* dateAsserted MS
* effective[x] only Period
* effectivePeriod MS
* effectivePeriod.start 1..1 MS // A treatment line must have a start date

// ── Status ───────────────────────────────────────────────────────────────────
// status represents the record lifecycle status (draft, recorded, entered-in-error),
// not the clinical treatment status. Treatment status is captured in adherence.
* status MS

// ── Medication and dosage ────────────────────────────────────────────────────
* medication MS
* dosage MS
* dosage.text MS // Preparation instructions / patient-facing text
* category MS

// ── Adherence (treatment status) ─────────────────────────────────────────────
// Whether the patient is actually taking the medication, and why/why not.
// This replaces the earlier TreatmentStatus extension.
* adherence MS
* adherence.code MS
* adherence.reason MS

// ── Extensions ───────────────────────────────────────────────────────────────

// Business version tracking
* extension contains http://hl7.org/fhir/StructureDefinition/artifact-version named version 0..1 MS

// Verification of the treatment line
* extension contains VerificationInformation named verificationInformation 0..1 MS

// Substitution allowance
* extension contains Substitution named substitution 0..1 MS

// Recorder — who entered the data (may differ from clinical author/informationSource)
* extension contains Recorder named recorder 0..1 MS

// Clinical intent type — therapeutic, prophylactic, self-medication
* extension contains ClinicalIntentType named clinicalIntentType 0..1 MS

// Off-label use reason
* extension contains OffLabel named offLabel 0..1 MS

//* extension contains http://hl7.org/fhir/StructureDefinition/event-basedOn named treatmentPlan 0..1 MS
//* extension[treatmentPlan].valueReference only Reference(CarePlan) //medicationTreatment (any for the time being ISSUE-39)

// ── Clinical context ─────────────────────────────────────────────────────────
* reason MS // Indication (coded or text)
* note MS

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
