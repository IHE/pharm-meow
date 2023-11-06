Logical: MedicationTreatmentLine
Title: "Medication Treatment Line - logical model"
Description: "A model for representing a Treatment Line."

* identifier 0..* II "Unique business identifier(s) for the medication treatment line"
* medication[x] 1..1 Reference(MedicinalProduct) or CodeableConcept "Medicinal product for which the treatment line refers to. Identification or sufficient description of the product."
* status 1..1 code "Status of the treatment line entry" "Status of the record, not the status of the treatment."

* verificationInformation 0..* BackboneElement "Verification of full overview. The overview is verified as a whole, but each lines is equipped with the information"
  * practitioner 1..1 Reference "HCP (or device, if authorized) verifying the treatments/overview"
  * verificationTime 1..1 dateTime "The date and time when this medication treatment line was verified"

* category 0..* code "Whatever category for the treatment line. Categorisation of treatment lines is implementation-specific."

* medicationTreatment 0..* Reference(MedicationTreatment) "Grouper of lines that belong together, lines are parts of the same treatment"

* indication 0..* code "Reason why the product has been prescribed to the patient, or why the patient claims to be taking it"
* indicationText 0..1 string "Textual explanation for why the medication has been prescribed or why the patient is taking it. This might not be allowed by some implementations."

* usageInstructions 0..* DosagingInformation "Instructions about requested administration of the product. Unfinished. See FHIR Dosage for now"
* preparationInstructions 0..* string "Additional instructions about preparation or dispense" 

* comment 0..* BackboneElement "Comment on the individual line"
  * author 1..1 Reference() "Author of the comment (Pharmacist, doctor, social carer, patient, device, related person)"
  * date 1..1 dateTime "time of comment"
  * commentText 1..1 string "content of the comment"

* substitution 0..1 BackboneElement "Whether and which type of substitution is allowed for this medication treatment line" 
  * substitutionType 1..1 code "The type of substitution that is allowed."
  * substitutionTypeReason 0..1 CD "Coded reason for the substitution requirement"
  * substitutionTypeReasonText 0..1 ST "Textual reason for the substitution requirement"

* recordingMetadata 1..1 BackboneElement "Metadata about reporting/authoring of the treatment line"
  * recorder 1..1 Reference() "Person authoring/cancelling the treatment line, either by requesting a treatment or documenting a patient's statement. Typically a doctor, nurse, or pharmacist, or patient..."
  * recordedTime 1..1 dateTime "Time of creation of the treatment line"
  * patientReported 1..1 boolean "The treatment line has been documented according to patient's statement"

  * author 0..1 Reference(Practitioner) "HCP who takes the clinical decision for the medication treatment line. !!Needs a better name, author is too generic."
  * authoringTime 0..1 dateTime "The time the decision was made. Normally, the same time as reporting time when it's the same person."

* relatedRequest 0..* Reference "Prescriptions that have been authored based on the verified treatment line, or which have been the source for creating the unverified treatment line"
* relatedStatement 0..* Reference "Medication-related statements from patients, pharmacists, or other HCPs, that are related to the verified treatment line or are the source for creating the unverified treatment line"
* relatedDispensation 0..* Reference "Related dispensations that are NOT related to existing prescriptions/requests/statements. Allowing this is very implemenation-specific."
* relatedAdministration 0..* Reference "Related administrations that are NOT related to existing prescriptions/requests/statements. This might be relevant for hospital/home nursing use cases."

* informationSource 0..* Reference "Other data object that this treatment line is derived from"

* treatmentStatus 0..1 CD "The state of the actual treatment - taking, not taken..."
* treatmentStatusReasonCode 0..1 CD "The reason - coded - for the treatment status - i.e. adverse events, refusal..."
* treatmentStatusReasonText 0..1 ST "The reason - free text - for the treatment status - i.e. adverse events, refusal..."
