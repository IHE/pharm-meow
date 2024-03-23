This section defines the actors and transactions in this implementation guide.

Figure below shows the actors directly involved in the MEOW Profile and the relevant transactions between them.





Table 1:33.1-1 lists the transactions for each actor directly involved in the MEOW Implementation Guide. To claim compliance with this guide, an actor shall support all required transactions (labeled "R") and may support the optional transactions (labeled "O").

Table 1:33.1-1: MEOW Implementation Guide - Actors and Transactions


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
<td rowspan="1"><a href="1331_actors_and_transactions.html#133111-medication-overview-consumer">Medication Overview Consumer</a></td>               
<td><a href='PHARM-x.html'>Get medication Overview [PHARM-xx]</a></td>
<td align='center'>R</td></tr>

<tr class="odd">           
<td rowspan="1"><a href="1331_actors_and_transactions.html#133112-medication-overview-repository">Medication Overview Repository</a></td>            
<td><a href='PHARM-x.html'>Get medication Overview [PHARM-xx]</a></td>
<td align='center'>R</td></tr>    


<tr class="even">           
<td rowspan="1"><a href="1331_actors_and_transactions.html#133112-medication-overview-creator">Medication Overview Creator</a></td>            
<td><a href='PHARM-x.html'>Get medication Overview [PHARM-xx]</a></td>
<td align='center'>R</td></tr>    

<tr class="odd">           
<td rowspan="1"><a href="1331_actors_and_transactions.html#133112-medication-overview-repository">Medication Overview Repository</a></td>            
<td><a href='PHARM-y.html'> [PHARM-yy]</a></td>
<td align='center'>R</td></tr>    

<!-- 
<tr class="even">
<td rowspan="3"><a href="1331_actors_and_transactions.html#133112-document-consumer">Document Consumer</a></td>        
<td><a href='ITI-66.html'>Find Document Lists [ITI-66]</a></td>
<td align='center'>R</td></tr>   


<tr class="odd">
<td><a href='ITI-67.html'>Find Document References [ITI-67]</a></td>
<td align='center'>R</td></tr>



<tr class="even">
<td><a href='ITI-68.html'>Retrieve Document [ITI-68]</a></td>
<td align='center'>R</td></tr>



<tr class="odd">
<td rowspan="3"><a href="1331_actors_and_transactions.html#133114-document-responder">Document Responder</a></td>        
<td><a href='ITI-66.html'>Find Document Lists [ITI-66]</a></td>
<td align='center'>R</td></tr>


<tr class="even">
<td><a href='ITI-67.html'>Find Document References [ITI-67]</a></td>
<td align='center'>R</td></tr>


<tr class="odd">      
<td><a href='ITI-68.html'>Retrieve Document [ITI-68]</a></td>
<td align='center'>R</td></tr>   
-->


</tbody>
</table>

       

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


For more details see the detailed [PHARM-x transaction description](PHARM-x.html).

#### 1:33.1.2.2 Creating treatment lines

Transaction so and so, used for this and this.

For more details see the detailed [PHARM-y transaction description](PHARM-y.html).
