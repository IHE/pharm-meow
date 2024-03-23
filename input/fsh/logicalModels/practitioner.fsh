Logical: PractitionerLM
Title: "Practitioner"
Description: "Basic prescribing/dispensing/caretaking practitioner's data relevant for this use case"
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^name = "Practitioner"
* ^status = #active

* identifier 1..* II "Practitioner's identifier"
* name 1..* EN "Practitioner's name, incl first name, last name, or any other relevant name parts"
* specialty 0..* CD "Specialty of the prescribing practitioner"
* organisation 0..* ANY "Organisation or facility of the practitioner"