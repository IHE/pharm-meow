// ╭──────────────────────────────────────────────────────────────────────╮
// │  MEOW CapabilityStatements                                           │
// │  Current actors (v1):                                                │
// │    - MedicationOverviewConsumer                                      │
// │    - MedicationOverviewResponder                                     │
// │  Future actors (when PHARM-13 is defined):                          │
// │    - MedicationOverviewSource                                        │
// │    - MedicationOverviewReceiver                                      │
// ╰──────────────────────────────────────────────────────────────────────╯


// ─────────────────────────────────────────────────────────────────────────────
// Medication Overview Consumer
// ─────────────────────────────────────────────────────────────────────────────

Instance: MedicationOverviewConsumer
InstanceOf: CapabilityStatement
Usage: #definition
Title: "Medication Overview Consumer"
Description: """
CapabilityStatement for the Medication Overview Consumer actor in the IHE PHARM MEOW profile.

The Consumer is a client that queries a Medication Overview Repository or Creator to retrieve
a patient's medication overview. It supports PHARM-11 (Query Medication Resources) as a
required capability, and optionally PHARM-12 (Retrieve Medication Document) when the
Document Option is declared.
"""

* name = "MedicationOverviewConsumer"
* status = #active
* experimental = false
* date = "2025-01-01"
* publisher = "IHE Pharmacy"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+json
* format[+] = #application/fhir+xml

// ── PHARM-11: Query Medication Resources (required) ──────────────────────────
* rest[+]
  * mode = #client
  * documentation = """
    The Consumer initiates PHARM-11 queries to retrieve MedicationTreatmentLine resources
    and optionally related resources for a given patient.
    The Consumer optionally initiates PHARM-12 requests to retrieve MedicationOverviewBundle
    documents (Document Option).
  """

  // MedicationStatement (MedicationTreatmentLine) — PHARM-11
  * resource[+]
    * type = #MedicationStatement
    * supportedProfile[+] = "https://profiles.ihe.net/PHARM/MEOW/StructureDefinition/MedicationTreatmentLine"
    * documentation = "The Consumer searches for MedicationTreatmentLine resources (PHARM-11)."
    * interaction[+].code = #search-type
    * interaction[+].code = #read
    * searchParam[+]
      * name = "patient"
      * type = #reference
      * documentation = "Required. The patient whose medication overview is requested."
    * searchParam[+]
      * name = "status"
      * type = #token
      * documentation = "Filter by treatment line status (e.g. active, completed, stopped)."
    * searchParam[+]
      * name = "effective"
      * type = #date
      * documentation = "Filter by effective period of the treatment line."
    * searchParam[+]
      * name = "category"
      * type = #token
      * documentation = "Filter by medication list category / list type."
    * searchParam[+]
      * name = "_lastUpdated"
      * type = #date
      * documentation = "Filter resources updated since a given instant (incremental sync)."
    * searchInclude[+] = "MedicationStatement:medication"
    * searchInclude[+] = "MedicationStatement:derivedFrom"
    * searchInclude[+] = "MedicationStatement:partOf"
    * searchRevInclude[+] = "MedicationDispense:prescription"
    * searchRevInclude[+] = "MedicationAdministration:request"

  // Bundle (MedicationOverviewBundle) — PHARM-12 Document Option
  * resource[+]
    * type = #Bundle
    * supportedProfile[+] = "https://profiles.ihe.net/PHARM/MEOW/StructureDefinition/MedicationOverview"
    * documentation = """
      Document Option (PHARM-12). The Consumer retrieves MedicationOverviewBundle documents
      by logical id or by searching with patient, type, and date parameters.
    """
    * interaction[+].code = #read
    * interaction[+].code = #search-type
    * searchParam[+]
      * name = "type"
      * type = #token
      * documentation = "Filter by document type / medication list category."
    * searchParam[+]
      * name = "patient"
      * type = #reference
      * documentation = "Required for patient-scoped document search."
    * searchParam[+]
      * name = "date"
      * type = #date
      * documentation = "Filter by document creation date."


// ─────────────────────────────────────────────────────────────────────────────
// Medication Overview Responder
// ─────────────────────────────────────────────────────────────────────────────

Instance: MedicationOverviewResponder
InstanceOf: CapabilityStatement
Usage: #definition
Title: "Medication Overview Responder"
Description: """
CapabilityStatement for the Medication Overview Responder actor in the IHE PHARM MEOW profile.

The Responder is a server that stores and/or assembles medication overview data for patients
and serves it in response to Consumer requests. It supports PHARM-11 (Query Medication
Resources) as a required capability, and optionally PHARM-12 (Retrieve Medication Document)
when the Document Option is declared.

How the Responder obtains its data (continuous store, on-demand aggregation, document
assembly) is an implementation concern outside the scope of this profile.
"""

* name = "MedicationOverviewResponder"
* status = #active
* experimental = false
* date = "2025-01-01"
* publisher = "IHE Pharmacy"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+json
* format[+] = #application/fhir+xml

* rest[+]
  * mode = #server
  * documentation = """
    The Responder responds to PHARM-11 search queries with searchset Bundles containing
    MedicationTreatmentLine resources. With the Document Option, it also responds to
    PHARM-12 requests with MedicationOverviewBundle documents.
  """

  // MedicationStatement (MedicationTreatmentLine) — PHARM-11 (required)
  * resource[+]
    * type = #MedicationStatement
    * supportedProfile[+] = "https://profiles.ihe.net/PHARM/MEOW/StructureDefinition/MedicationTreatmentLine"
    * documentation = """
      The Repository SHALL support search on MedicationStatement using the defined
      search parameters. The patient parameter is required on all searches.
    """
    * interaction[+].code = #search-type
    * interaction[+].code = #read
    * searchParam[+]
      * name = "patient"
      * type = #reference
      * documentation = "Required. Patient whose treatment lines are requested."
    * searchParam[+]
      * name = "status"
      * type = #token
      * documentation = "Filter by treatment line status."
    * searchParam[+]
      * name = "effective"
      * type = #date
      * documentation = "Filter by effective period."
    * searchParam[+]
      * name = "category"
      * type = #token
      * documentation = "Filter by list category / type."
    * searchParam[+]
      * name = "_lastUpdated"
      * type = #date
      * documentation = "Filter by last update time (incremental sync support)."
    * searchInclude[+] = "MedicationStatement:medication"
    * searchInclude[+] = "MedicationStatement:derivedFrom"
    * searchInclude[+] = "MedicationStatement:partOf"
    * searchRevInclude[+] = "MedicationDispense:prescription"
    * searchRevInclude[+] = "MedicationAdministration:request"

  // CarePlan (MedicationTreatment) — returned via _include
  * resource[+]
    * type = #CarePlan
    * supportedProfile[+] = "https://profiles.ihe.net/PHARM/MEOW/StructureDefinition/MedicationTreatment"
    * documentation = "Returned as an _include of MedicationStatement:partOf when MedicationTreatment grouping is present."
    * interaction[+].code = #read

  // MedicationRequest — returned via _include (optional)
  * resource[+]
    * type = #MedicationRequest
    * documentation = "Optionally returned as _include of MedicationStatement:derivedFrom (prescriptions)."
    * interaction[+].code = #read

  // MedicationDispense — returned via _revinclude (optional)
  * resource[+]
    * type = #MedicationDispense
    * documentation = "Optionally returned as _revinclude of MedicationDispense:prescription."
    * interaction[+].code = #read

  // MedicationAdministration — returned via _revinclude (optional)
  * resource[+]
    * type = #MedicationAdministration
    * documentation = "Optionally returned as _revinclude of MedicationAdministration:request."
    * interaction[+].code = #read

  // Medication — returned via _include (optional)
  * resource[+]
    * type = #Medication
    * supportedProfile[+] = "https://profiles.ihe.net/PHARM/MEOW/StructureDefinition/IHEMedication"
    * documentation = "Optionally returned as _include of MedicationStatement:medication."
    * interaction[+].code = #read

  // Bundle (MedicationOverviewBundle) — PHARM-12 Document Option
  * resource[+]
    * type = #Bundle
    * supportedProfile[+] = "https://profiles.ihe.net/PHARM/MEOW/StructureDefinition/MedicationOverview"
    * documentation = """
      Document Option (PHARM-12). The Repository stores and serves MedicationOverviewBundle
      documents. Supports retrieval by logical id and by patient/type/date search.
    """
    * interaction[+].code = #read
    * interaction[+].code = #search-type
    * searchParam[+]
      * name = "type"
      * type = #token
      * documentation = "Filter by document type / medication list category."
    * searchParam[+]
      * name = "patient"
      * type = #reference
      * documentation = "Required for patient-scoped document search."
    * searchParam[+]
      * name = "date"
      * type = #date
      * documentation = "Filter by document creation date."


// ─────────────────────────────────────────────────────────────────────────────
// Future actors — deferred until PHARM-13 (push transaction) is defined
// ─────────────────────────────────────────────────────────────────────────────
//
// MedicationOverviewSource  — initiates push of MedicationTreatmentLine resources
// MedicationOverviewReceiver — accepts pushed MedicationTreatmentLine resources
//
// These actor CapabilityStatements will be added when PHARM-13 is designed.
// See actors-transactions.md and cross_profile_considerations.md.
