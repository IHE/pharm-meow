This section defines the actors and transactions in this implementation guide.

The figure below shows the actors directly involved in the MEOW Profile and the relevant transactions between them.

```plantuml
@startuml
skinparam backgroundColor transparent
skinparam rectangle {
  roundCorner 15
}

rectangle "Medication Overview\nCreator" as Cr #Application
rectangle "Medication Overview\nRepository" as R #Application
rectangle "Medication Overview\nConsumer" as C #Application

Cr -right- R : Submit Medication Overview [PHARM-y]
R -right- C : Get Medication Overview [PHARM-x]
@enduml
```

Table 1:33.1-1 lists the transactions for each actor directly involved in the MEOW Implementation Guide. To claim compliance with this guide, an actor shall support all required transactions (labeled "R") and may support the optional transactions (labeled "O").

<table border="1" borderspacing="0" style='border: 1px solid black; border-collapse: collapse'>
<caption>
<b>
Table 1:33.1-1: MEOW Implementation Guide - Actors and Transactions
</b>
</caption>
<thead>
<tr class="odd" style='background: gray;'>
<th>Actors</th>
<th>Transactions</th>
<th>Optionality</th>
</tr>
</thead>
<tbody>

<tr class="even">
<td rowspan="1"><a href="actors-transactions.html#133113-medication-overview-creator">Medication Overview Creator</a></td>
<td><a href='PHARM-y.html'>Submit Medication Overview [PHARM-y]</a></td>
<td align='center'>R</td></tr>

<tr class="odd">
<td rowspan="2"><a href="actors-transactions.html#133112-medication-overview-repository">Medication Overview Repository</a></td>
<td><a href='PHARM-y.html'>Submit Medication Overview [PHARM-y]</a></td>
<td align='center'>R</td></tr>
<tr class="odd">
<td><a href='PHARM-x.html'>Get Medication Overview [PHARM-x]</a></td>
<td align='center'>R</td></tr>

<tr class="even">
<td rowspan="1"><a href="actors-transactions.html#133111-medication-overview-consumer">Medication Overview Consumer</a></td>
<td><a href='PHARM-x.html'>Get Medication Overview [PHARM-x]</a></td>
<td align='center'>R</td></tr>

</tbody>
</table>



### 1:33.1.1 Actor Descriptions and Actor Profile Requirements
The actors in this profile are described in more detail in the sections below.


#### 1:33.1.1.1 Medication Overview Consumer

The Medication Overview Consumer queries a Medication Overview Repository to retrieve an existing Medication Overview for a patient. It is the actor that pulls already-recorded medication information for viewing or further processing.


#### 1:33.1.1.2 Medication Overview Repository

The Medication Overview Repository stores the Medication Overviews submitted by Medication Overview Creators and responds to queries from Medication Overview Consumers. It is the actor that holds the medication information and makes it available for retrieval.


#### 1:33.1.1.3 Medication Overview Creator

The Medication Overview Creator assembles a Medication Overview - the set of medication treatment lines summarizing the patient's medication - and submits it to a Medication Overview Repository.


### 1:33.1.2 Transaction Descriptions
The transactions in this profile are summarized in the sections below.

#### 1:33.1.2.1 Get Medication Overview [PHARM-x]

The Get Medication Overview transaction is used by a Medication Overview Consumer to query a Medication Overview Repository and retrieve an existing Medication Overview.

This is a pull transaction: the Consumer requests the information held by the Repository.

For more details see the detailed [PHARM-x transaction description](PHARM-x.html).

#### 1:33.1.2.2 Submit Medication Overview [PHARM-y]

The Submit Medication Overview transaction is used by a Medication Overview Creator to submit a Medication Overview to a Medication Overview Repository.

This is a push transaction: the Creator provides the medication information to be stored by the Repository.

For more details see the detailed [PHARM-y transaction description](PHARM-y.html).
