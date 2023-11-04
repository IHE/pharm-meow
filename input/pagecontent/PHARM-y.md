This section corresponds to transaction [PHARM-yyyy] of the IHE Technical Framework. Transaction [PHARM-yyy] is used by x and x actors.


**Begin treatment with line**

This is a normal case, where the medication line is the trigger for prescriptions

1. Psychiatrist decides that patient should initiate treatment for depression, indicating bupropion. They create a treatment line for that patient. No prescription is necessarily authorized yet.
   * At this moment, querying a patient’s current medications should return this line, with status “????”
2. After checking contraindications, psychiatrist decides to the treat patient with fluoxetine instead. The prescription is finally issued for 1 box of 30 tablets
   * At this moment, querying a patient’s current medications should return this line, with status “????”
3. When medication is dispensed, the medicationline is not updated but the medication may be added the link

<div>
<img alt="Figure: MEOW Workflow overview" src="pharm-y-1.png" width="100%">
</div>


**Treatments from prescriptions**

This is the other normal case, where the medication line is derived from existing prescriptions

1. Patient visits the GP who issues a prescription
2. From the prescription, a medication line is created (or updated if one already exists)

<div>
<img alt="Figure: MEOW Workflow overview" src="pharm-y-2.png" width="100%">
</div>