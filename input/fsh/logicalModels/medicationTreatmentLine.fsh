Logical: MedicationTreatmentLine
Title: "Medication Treatment Line"
Description: "A model for representing a Treatment Line."
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^name = "MedicationTreatmentLine"
* ^status = #active

* identifier 0..* II "Unique business identifier(s) for the medication treatment line"
* medication[x] 1..1 Reference(MedicinalProduct) or CD "Medicinal product for which the treatment line refers to. Identification or sufficient description of the product."
* status 1..1 CD "Status of the treatment line entry" "Status of the record, not the status of the treatment."
* version 0..1 ST "Business version of the treatment line"
* timestamp 0..1 TS "Timestamp of the version of the treatment line"

//* statusReason 0..1 CD "The reason for the current entry status"


* treatmentStatus 0..1 CD "The state of the actual treatment - taking, not taken..."
* treatmentStatusReasonCode 0..1 CD "The reason - coded - for the treatment status - i.e. adverse events, refusal..."
* treatmentStatusReasonText 0..1 ST "The reason - free text - for the treatment status - i.e. adverse events, refusal..."

* effectivePeriod 0..1 Class "The period of time the treatment is in effect"

* verificationInformation 0..* BackboneElement "Verification of medication line" "Verification of medication line. The overview is verified as a whole, but each line is equipped with the information. The actual functional meaning and impact of this validation depends on the implementation."
  * verifier 1..1 Reference "HCP (or device, if authorized) verifying the treatments/overview"
  * verificationTime 1..1 DT "The date and time when this medication treatment line was verified"

* category 0..* CD "Whatever category for the treatment line. Categorisation of treatment lines is implementation-specific."

* medicationTreatment 0..* Reference(MedicationTreatment) "Reference or identifier of the group of lines that belong together"

* indication 0..* CD "Reason why the product has been prescribed to the patient, or why the patient claims to be taking it"
* indicationText 0..1 string "Textual explanation for why the medication has been prescribed or why the patient is taking it. This might not be allowed by some implementations."

* intendedUse 0..1 CD "Intended Use of the medication - prophylaxis, therapy..."
// This is also the way it is done in the eHN Guidelines

* usageInstructions 0..* DosagingInformation "Instructions about administration of the product" "Instructions about requested or actual administration of the product. This is repeatable to support complex or concurrent dosage instructions. e.g. take 1 per day for 3 weeks; 2x PRN"

* preparationInstructions 0..* string "Additional instructions about preparation or dispense" 

* comment 0..* BackboneElement "Comment on the individual line"
  * author 1..1 Reference "Author of the comment (Pharmacist, doctor, social carer, patient, device, related person)"
  * date 1..1 DT "time of comment"
  * commentText 1..1 ST "content of the comment"

* substitution 0..1 class "Whether and which type of substitution is allowed for this medication treatment line" 
  * substitutionType 1..1 CD "The type of substitution that is allowed."
  * substitutionTypeReason 0..1 CD "Coded reason for the substitution requirement"
  * substitutionTypeReasonText 0..1 ST "Textual reason for the substitution requirement"

* recordingMetadata 1..1 Class "Metadata about reporting/authoring of the treatment line"
  * recorder 1..1 Reference "Person entering the statement by initiating a treatment or documenting a statement by a patient or another professional. The recorder may be different from the author."
  * recordedTime 1..1 DT "Time of creation of the treatment line"
  * patientReported 0..1 BL "The treatment line has been documented according to patient's statement"

  * responsibleAuthor 0..1 Reference(Practitioner) "HCP who takes the clinical decision for the medication treatment line. If an author is not present, the responsibility of the medication line is with the recorder."
  * authoringTime 0..1 DT "The time the clinical decision was made by the responsibleAuthor. Normally, the same time as recording time when it's the same person."


//
* derivedFrom 0..* Class "Any data object that this treatment line is derived from"
  * request 0..* Reference "Prescriptions that have been the source for creating the unverified treatment line"
  * statement 0..* Reference "Medication-related statements from patients, pharmacists, or other HCPs, that are the source for creating the unverified treatment line"
  * dispensation 0..* Reference "Related dispensations that are not necessarily related to existing prescriptions/requests/statements."
  * administration 0..* Reference "Related administrations that are not necessarily related to existing prescriptions/requests/statements."
  * other 0..* Reference "Other related sources of information - CarePlan, Immunizations, Documents (e.g. Discharge letters)..."


