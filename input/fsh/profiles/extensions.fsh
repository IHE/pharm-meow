Extension: BusinessVersion
Description: "Business Version of the resource"
* extension contains
    version 1..1 MS and
    versiondate 0..1 MS 
* extension[version].value[x] only positiveInt or string
* extension[versiondate].value[x] only dateTime

Extension: TreatmentStatus
Description: "The status of the actual treatment - ongoing, temporarily stopped, etc"
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
Description: "Whether and which type of substitution is allowed for this medication treatment line"
* extension contains
    allowed 1..1 and
    reason 0..1
* extension[allowed].value[x] only CodeableConcept
* extension[reason].value[x] only CodeableConcept

Extension: Classification
Description: "Medication classification/category. Allows the product to be classified by various systems, e.g ATC, narcotic class, legal status of supply, etc."
* value[x] only CodeableConcept

Extension: MedicinalProductName
Description: "Name of the medicinal product. Optionally the type of name (Full official name, prescribing name, invented name) and language of the name can be specified. The extension is a simplified approach of what is used in MedicinalProductDefinition resource."
* extension contains
    name 1..1 and
    nameType 0..1 and
    language 0..1
* extension[name].value[x] only string
* extension[name] ^short = "Product name"
* extension[nameType].value[x] only CodeableConcept
* extension[nameType] ^short = "Type of product name"
* extension[language].value[x] only CodeableConcept
* extension[language].valueCodeableConcept from AllLanguages
* extension[language] ^short = "Language code of this name. A code with a combination of country and name can be used."

    