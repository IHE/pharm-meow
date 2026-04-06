// ╭──────────────────────────────────────────────────────────────────────╮
// │  MEOW Terminology: CodeSystems and ValueSets                        │
// ╰──────────────────────────────────────────────────────────────────────╯


// ─────────────────────────────────────────────────────────────────────────────
// Clinical Intent Type / Intent
// ─────────────────────────────────────────────────────────────────────────────

CodeSystem: ClinicalIntentTypeCS
Id:         ihe-cs-clinicalintenttype
Title:      "Clinical Intent Type CodeSystem"
Description: "Codes for the clinical intent type of medication use."
* ^caseSensitive = true
* ^status = #active
* ^experimental = false
* #therapeutic     "Therapeutic"       "Medication used for treatment of a condition"
* #prophylactic    "Prophylactic"      "Medication used for prevention of a condition"
* #self-medication "Self-medication"   "Medication taken by the patient on their own initiative, without a prescription"


ValueSet: ClinicalIntentTypeVS
Id:       ihe-vs-clinicalintenttype
Title:    "Clinical Intent Type ValueSet"
Description: "The clinical intent type of the medication use - therapeutic, prophylactic, or self-medication."
* ^status = #active
* ^experimental = false
* include codes from system ClinicalIntentTypeCS
