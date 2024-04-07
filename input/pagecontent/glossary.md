
|Term|Description|Reference|Status|
|----|----|----|----|
|Medication Overview||||
|Medication Treatment| |||
|Medication Treatment line||||
|Administrable Product||||
|Medicinal Product||||
|Packaged Product||||

## "Pharmaceutical Advisor" role

In past editions of IHE profiles, an actor "Pharmaceutical advisor" provided the range of possible functionalities about changing a treatment: Changing a prescription before or after dispense, providing non-binding advice like comments on dosage, etc.

1. **As a required actor**: sometimes the “advice” is actually a necessary activity: validating a prescription to make it “dispensable”. Other examples are confirming the dosage, or checking the allowed dispensation while patient is pregnant, or checking the prerequisites for dispensing of controlled medication like narcotics.

2. **As a “parallel” actor** that simply provides feedback or recommendation (e.g. interactions, or overdosages), upon request or automatically. This feedback can be binding or not binding, depending on the implementation options. 

This ambiguity could cause some implementation challenges. This edition of the profiles clarifies the role of advisor:

Update: 
  **The first case above (required actor) now corresponds to an “order placer”** task: The “advice” that changes the order simply becomes an update to the order/plan, and the issuer of that order takes responsibility for the new order/plan.

With this, the “advice” becomes simply the parallel feedback that is not a change to the order, but it is a suggestion to do something with the order, which the order placer can decide to take or not.

## "Advice" on dispensed medication

In the past we had “advice” on dispense - changes after a medication is dispensed. This could be, for instance:
* Change posology 
* Change to another brand
* Stop the treatment

Update: 
  * Those are to be considered changes to the **treatment**, not to the dispense. From a treatment change, there MAY be a issuance of a new dispense document, for example in the case where the dispense document is where the posology is indicated.


## Notes and comments

We also need to add comments to any of these objects: Dispense, Order, Plan, Overview. These are comments that relate to more than one entry in the list.
Examples:

* Comments by dispensing pharmacist: "*Please monitor the kidney function because of medication A and B, and reconsider changing treatment if there are issues.*"
* Comments by physician on patient-reported medication: "*Patient reports usage of medication, and comment is that patient has been strongly advised not to do it.*"
* Comments by advising pharmacist: "*Please note that patient is allergic to lactose and may develop issues with this brand*"

