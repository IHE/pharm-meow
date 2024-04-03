// Extension: BusinessVersion
// Description: "Business Version of the resource"
// * extension contains
//     version 1..1 MS and
//     versiondate 0..1 MS 
// * extension[version].value[x] only positiveInt or string
// * extension[versiondate].value[x] only dateTime
// * ^context[+]
//   * type = #element
//   * expression = "DomainResource"

/*Extension: TreatmentStatus
Description: "The status of the actual treatment - ongoing, temporarily stopped, etc"
* extension contains
    status 1..1 MS and
    reason 0..1 MS 
* extension[status].value[x] only CodeableConcept
* extension[reason].value[x] only CodeableConcept
*/

Extension: VerificationInformation
Description: "Verification of medication line. The overview is verified as a whole, but each line is equipped with the information. The actual functional meaning and impact of this validation depends on the implementation."
* extension contains
    verifier 1..1 MS and
    verificationTime 1..1 MS 
* extension[verifier].value[x] only Reference
* extension[verificationTime].value[x] only dateTime
* ^context[+].type = #element
* ^context[=].expression = "MedicationStatement"


Extension: Substitution
Description: "Whether and which type of substitution is allowed for this medication treatment line"
* extension contains
    allowed 1..1 and
    reason 0..1
* extension[allowed].value[x] only CodeableConcept
* extension[reason].value[x] only CodeableConcept
* ^context[+].type = #element
* ^context[=].expression = "MedicationStatement"
* ^context[+].type = #element
* ^context[=].expression = "MedicationRequest"

