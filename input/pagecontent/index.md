<div>
<span style="text-align:center">

<p style="text-align:center"><strong>IHE Pharmacy</strong></p>
<p style="text-align:center"><strong>{{site.data.profile.profile.name}}</strong></p>
<p style="text-align:center"><strong>({{site.data.profile.profile.acronym}})</strong></p>
</span>

</div>

The IHE Medication Overview profile describes the content and transactions for consistent capture and exchange of patient's medication overviews - also referred as medication lists, or medication schemes.

scope

background

### Navigation


### Dependencies

{% include dependency-table.xhtml %}


### IP statements

{% include ip-statements.xhtml %}


This profile 
* Articulated with the [Pharmacy Medication Prescription and Dispense](insert-mpd-link-here) workflows.
* Supporting the different cases that are globally common: 
  * Medication lists being created from prescriptions (and/or dispenses) - evolving the IHE Pharmacy PML approach.
  * Medication lists being created from "treatment plans" and from which prescriptions are created.

* Aligned with the [HL7 FHIR IPS specification](https://hl7.org/fhir/uv/ips/), so that the MedicationOverview can be a part of a larger, modular summary, while retaining the necessary capabilities and details that are needed in a specialized medication scheme.


Date: {{site.data.publication.publication.date}}   

Author: {{site.data.publication.publisher.name}}  

Email: [{{site.data.publication.publisher.mail}}](mailto:{{site.data.publication.publisher.mail}})