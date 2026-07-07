# Use Case overview - IHE Pharmacy Medication Overview v0.1.0

* [**Table of Contents**](toc.md)
* [**Volume 1 Overview**](volume1.md)
* **Use Case overview**

## Use Case overview

This section defines the actors and transactions in this implementation guide.

Table 1:33.1-1 lists the transactions for each actor directly involved in the MEOW Implementation Guide. To claim compliance with this guide, an actor shall support all required transactions (labeled "R") and may support the optional transactions (labeled "O").

Table 1:33.1-1: MEOW Implementation Guide - Actors and Transactions

| | | |
| :--- | :--- | :--- |
| [Medication Overview Consumer](actors-transactions.md#133111-medication-overview-consumer) | [Get medication Overview [PHARM-xx]](PHARM-x.md) | R |
| [Medication Overview Repository](actors-transactions.md#133112-medication-overview-repository) | [Get medication Overview [PHARM-xx]](PHARM-x.md) | R |
| [Medication Overview Creator](actors-transactions.md#133113-medication-overview-creator) | [Submit Medication Overview [PHARM-y]](PHARM-y.md) | R |
| [Medication Overview Repository](actors-transactions.md#133112-medication-overview-repository) | [Submit Medication Overview [PHARM-y]](PHARM-y.md) | R |

### 1:33.1.1 Actor Descriptions and Actor Profile Requirements

The actors in this profile are described in more detail in the sections below.

#### 1:33.1.1.1 Medication Overview Consumer

xxxxx

#### 1:33.1.1.2 Medication Overview Creator

xxxxx

#### 1:33.1.1.2 Medication Overview Repository

The Medication Treatment Repository is intended to capture the information about the overall treatment, including advices, comments.

### 1:33.1.2 Transaction Descriptions

The transactions in this profile are summarized in the sections below.

#### 1:33.1.2.1 Get Medication overview

This is a transaction that relates with getting the medication overview from a "Medication overview Creator".

This is a pull transaction where we get the information from this actor.

It is related with medication workflow artifacts (prescriptions, dispenses, administrations and statements) being summarized with a certain logic into medication treatment lines.

For more details see the detailed [PHARM-x transaction description](PHARM-x.md).

#### 1:33.1.2.2 Creating treatment lines

Transaction so and so, used for this and this.

For more details see the detailed [PHARM-y transaction description](PHARM-y.md).

