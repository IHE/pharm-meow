Logical: PatientLM
Title: "Patient"
Description: "Basic patient data relevant for this use case"
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^name = "Patient"
* ^status = #active

* identifier 1..* II "Patient identifier"
* name 1..* EN "Patient's name, incl first name, last name, or any other relevant name parts"
* relatedHealthInformation 0..* ANY "Related health information, such as allergies, conditions, recent procedures, or certain lab results are not part of patient or medication overview core data. IPS specification can be used for use-case-specific patient summary."