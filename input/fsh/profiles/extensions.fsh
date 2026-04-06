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
Id:        ihe-ext-medicationstatement-verificationinformation
Title:     "MedicationStatement - Verification Information"
Description: "Verification of medication line. The overview is verified as a whole, but each line is equipped with the information. The actual functional meaning and impact of this validation depends on the implementation."
* extension contains
    verifier 1..1 MS and
    verificationTime 1..1 MS 
* extension[verifier].value[x] only Reference
* extension[verificationTime].value[x] only dateTime
* ^context[+].type = #element
* ^context[=].expression = "MedicationStatement"


Extension: Substitution
Id:        ihe-ext-medicationstatement-substitution
Title:     "MedicationStatement - Substitution"
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

Extension: ClinicalIntentType
Id:        ihe-ext-medicationstatement-clinicalintenttype
Title:     "MedicationStatement - Clinical Intent Type"
Description: "The clinical intent type of the medication use - whether the medication is for therapeutic, prophylactic, or self-medication purposes."
* ^context[+].type = #element
* ^context[=].expression = "MedicationStatement"
* value[x] only CodeableConcept
* valueCodeableConcept from ClinicalIntentTypeVS (preferred)


Extension: OffLabel
Id:        ihe-ext-medicationstatement-offlabel
Title:     "MedicationStatement - Off-Label Use"
Description: "Indication that the medication is being used off-label (outside of approved indication, age group, dosage, or route) and the reason for such use. When isOffLabelUse is true, a reason SHALL be provided."
* ^context[+].type = #element
* ^context[=].expression = "MedicationStatement"
* ^context[+].type = #element
* ^context[=].expression = "MedicationRequest"
* obeys offlabel-reason-required
* extension contains
    isOffLabelUse 1..1 and
    reason 0..*
* extension[isOffLabelUse].value[x] only boolean
* extension[isOffLabelUse] ^short = "Whether the medication is being used off-label"
* extension[reason].value[x] only CodeableConcept
* extension[reason] ^short = "The reason for off-label use or dosage override"

Invariant: offlabel-reason-required
Description: "If isOffLabelUse is true, at least one reason must be provided"
Severity: #error
Expression: "extension.where(url='isOffLabelUse').value.ofType(boolean).where(true).exists() implies extension.where(url='reason').exists()"


Extension: Recorder
Id:        ihe-ext-medicationstatement-recorder
Title:     "MedicationStatement - Recorder"
Description: "The person who entered the medication information into the system. The recorder may be different from the clinical author (informationSource) who made the clinical decision."
* ^context[+].type = #element
* ^context[=].expression = "MedicationStatement"
* value[x] only Reference(Practitioner or PractitionerRole or Patient or RelatedPerson or Organization or Device)


Extension: MedicationClassification
Id:        ihe-ext-medication-classification
Title:     "Medication - Classification"
Description: "Medication classification/category. Allows the product to be classified by various systems, e.g ATC, narcotic class, legal status of supply, etc.."
// Extension on Medication
* ^context[+].type = #element
* ^context[=].expression = "Medication"
* value[x] only CodeableConcept  // 0 or more


Extension: MedicationProductName
Id:        ihe-ext-medication-productname
Title:     "Medication - Product Name"
Description: "Name of the medicinal product. Optionally the type of name (Full official name, prescribing name, invented name) and language of the name can be specified. The extension is a simplified approach of what is used in MedicinalProductDefinition resource."
// Extension on Medication
* extension contains
    name 1..1 and
    nameType 0..1 and
    language 0..1
* extension[name].value[x] only string
* extension[name] ^short = "Product name"
* extension[nameType].value[x] only CodeableConcept
* extension[nameType] ^short = "Type of product name (full name, common name, prescription name, etc)"
* extension[language].value[x] only CodeableConcept
* extension[language].valueCodeableConcept from AllLanguages
* extension[language] ^short = "Language code of this name. A code with a combination of country and name can be used."


Extension: MedicationSizeOfItem
Id:        ihe-ext-medication-sizeofitem
Title:     "Medication - Size of Item"
Description: "Size of a manufactured item or unit of presentation. For example, size of one vial in a package that may contain several vials."
// Extension on Medication
* value[x] only Quantity


Extension: MedicationDevice
Id:        ihe-ext-medication-device
Title:     "Medication - Device"
Description: "Device, typically an administration device, included in the medicinal product."
// Extension on Medication
* extension contains
    device 1..1 and
    quantity 1..1
* extension[device].value[x] only CodeableReference(Device or DeviceDefinition)
* extension[device] ^short = "Coded or referenced device"
* extension[quantity].value[x] only Quantity
* extension[quantity] ^short = "Number of defined devices in te package"

