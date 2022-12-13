---
title: "Create Utility Bills"
date: 2020-02-03T13:00:00
lastmod: 2020-02-03T13:00:00
weight: 301
draft: false
keywords: ["utility", "bill", "create", "costs", "items", "contract", "contracts", "period", "periods", "billing"]
---

In Lexgate you can create periodic Utility Bills with a few steps.

### Requirements
It's required that your Project has its Cost Centres set up. How to set up Cost Centres is described [here]({{<relref "/project-creation/accounting-structure">}}).

### Billing Period
A Billing Period defines the period which should be used for a Utility Bill. 

You can create one in {{<lga-nav text="Billing Period">}} by clicking the {{<lga-btn type="negative" icon="add">}}-Icon and filling in the general information:
* {{<lga-lbl text="Name">}}: A user defined name for the Billing Period.
* {{<lga-lbl text="Automatically create subsequent period">}}: If checked, the period is automatically renewed. See [details]({{<relref "#billing-period-renewal">}})
* {{<lga-lbl text="Start date">}}: First day of the period. Should be the day after the previous period ended (mostly first of month).
* {{<lga-lbl text="Start date">}}: Last day of the period. Should be the day before the next period starts (mostly last of month).

In the list after, you can narrow down the Cost Centers which should be used for the Utility Bill:
* **Provider**: Select whether the Cost Centre should show up as Provider on Documents.
* **Consumer**: Select whether there should be a Document generated for the Cost Centre.
* **On Account**: Fill the *On Account* value in the document with the given amount.

#### Automatically created subsequent periods {#billing-period-renewal}
If the {{<lga-lbl text="Automatically create subsequent period">}}-checkbox is checked, the subsequent period is created automatically on the first day ofter the current period ended.
All information of the current period is copied over, and the name is suffixed with the ⎘-icon.

If the {{<lga-lbl text="Name">}} is contains one or multiple of those patterns, it is automatically updated:
* **Year** [nnnn] (*2017* or *2019*):    If the length of the billing period is longer than 188 days, any number between 2001 and 2099 is increased by 1.
* **Year-Offset** [nnnn-n|nnnn.n] (*2018-1* or *2019.4*):   If the length of the billing period is between 1 and 187 days, the offset in this pattern is increased by 1. 
  The upper limit for the offset is determined by the length of the period. For example, if the period is 3 months long, which can be contained in a year 4 times, the upper limit is 4.
  After the upper limit is reached, the offset is reset to 1, and the year is increased by 1. For example, 2019-4 will be set to 2020-1 with the next subsequent creation.
* **Count** [#n] (*#1* or *#3456*):   If a *#*-character followed by any number is found in the name, the number is increased by 1 automatically. 
 This is also default behaviour, if no increasable value is found in the name.

The name can also contain characters beside the mentioned patterns. The pattern must be segregated by a space character.
Examples:
* *"Utility Bill 2019"* → *"Utility Bill 2020 ⎘"* (if length of the Billing Period is 1 year)
* *"Electricity Bill 2019-4 | Building West"* → *"Electricity Bill 2020-1 | Building West ⎘"* (if the length of the Billing Period is 3 months)
* *"My very customized #13 bill"* → *"My very customized #14 bill ⎘"*


### Cost Items
Furthermore, Lexgate requires information about the costs to consider. You can record Invoices in {{<lga-nav text="Cost Items">}} like this:
* {{<lga-lbl text="Title">}}: A user defined title for the costs.
* {{<lga-lbl text="Date">}}: The date for an Invoice (not used in Lexgate).
* {{<lga-lbl text="Amount">}}: The costs amount. If it's a credit, enter the amount with a leading minus ({{<lga-inp text="-25.50">}}).
* {{<lga-lbl text="Billing Period">}}: The Billing Period, in which the amount should be distributed.

### Contracts
It's possible to store Contracts for Cost Centres which receive an Utility Bill. With this functionality you don't need to enter the information when generating new Bills.

* {{<lga-lbl text="Start">}}: The first day of a contract period.
* {{<lga-lbl text="End">}}: The day when the contract ends. Usually the previous day of the succeeding contracts start. You can leave this field empty when the contract does not have a defined end date yet.
* {{<lga-lbl text="Cost Center">}}: The Cost Center, which is the base for the contract. For example the owned flat or the rented parking lot.
* {{<lga-lbl text="Contact">}}: The Contact which represents the contracting party. For example the owner or tenant of a flat.
* {{<lga-lbl text="Set group authorization">}}: Create permission for the contact on the corresponding Group automatically. Users assigned to the Contact can access the Analysis with this permission.

### Create Utility Bills
You have finished all preparations to generate an Utility Bill. Switch to {{<lga-nav text="Consumption Accounting">}} and parameterize for the resulting Documents:

* {{<lga-lbl text="Type">}}: The Type of the Document to be generated:
    * {{<lga-inp text="Consumption Receipt">}}: A detailed overview of all consumptions, but without costs assigned.
    * {{<lga-inp text="Consumption Bill">}}: A bill with the costs according to the Cost Centre structure.
* {{<lga-lbl text="Billing Period">}}: The desired Billing Period
* {{<lga-lbl text="Template">}}: The Template of the Document to be generated.
* {{<lga-lbl text="Folder">}}: The Folder, in which the Documents to be generated should be stored.
* {{<lga-lbl text="Sender">}}: If selected, this Sender will be set to all Documents to be generated.
* {{<lga-lbl text="Creditor">}}: If selected, this Creditor will be set to all Documents to be generated.
* {{<lga-lbl text="Consumption periods from contracts">}}: If selected, the consumption periods are set automatically depending on the assigned Contracts. If there is no contract for a Cost Center defined, no Document is generated.

Below the Input fields a table is generated which shows all Contracts, the assigned Cost Centres and the calculated Costs. Please check the Calculations.

If all Costs are determined correctly, you can create all Documents by clicking on {{<lga-btn text="Generate">}}. The generation process can take up to 3 Seconds per Document. Further infomration how to process the generated Documents are described [here]({{<relref "/document-management/documents">}}).
