---
title: "Mustache Functions Reference"
date: 2020-01-02T13:00:00
lastmod: 2020-02-02T13:00:00
weight: 0299
draft: false
keywords: ["function", "reference", "mustache"]
---

## Functions  
 [tran](#tran): translates a key  
 [count](#count): count number of items in a loopable object  
 [input](#input): allows custom text in an input-element  
 [textarea](#textarea): allows custom text in a textarea-element  
 [wysiwyg](#wysiwyg): allows custom input in a wysiwyg-editor  
 [date](#date): display a field containing a date in a specified format  
 [number](#number): display a field containing a number in a specified format  
 [eval](#eval): display a dynamic field  
 [calc](#calc): display a custom calculated value  
 [payment-slip](#payment-slip): display a payment slip block  
 [image](#image): display am image from the same template library  
   
### tran  
Translate a key depending on the document language.  
   
#### parameters  
|parameter|content|examples  
|--|--|--|  
|key|string|`Date` or `Invoice`|  
  
#### examples  
```html  
{{#fn_tr}}Date{{/fn_tr}}  
{{#fn_tr}}Invoice{{/fn_tr}}  
{{#fn}}<translate key="Date">{{#fn}}  
```  
  
### input  
Show the user in edit mode an input field, where he can put custom text.  
In display mode, this text is then rendered.  
  
#### parameters  
|parameter|content|optional|examples  
|--|--|--|--|  
|field|reference||`greetings` or `customer_reference`|  
|style|string|yes|`height: 100%` or `color: white; background-color: red;`  
|format|[NumberFormat](#numberformats)|yes, default `none`|See content section  
  
#### examples  
```html  
{{#fn_in}}greetings{{/fn_in}}  
{{#fn}}<input field="greetings">{{/fn}}  
{{#fn}}<input field="customer_reference" style="height:100%;color:white;background-color:red;">{{#fn}}  
```  
  
### textarea  
Show the user in edit mode an textarea field, where he can put custom multiline text.  
In display mode, this text is then rendered.  
  
#### parameters  
See [input](#input)  
  
#### examples
```html  
{{#fn_ta}}address{{/}}  
{{#fn}}<textarea field="address" style="height:75%">{{#fn}}  
```  
  
### wysiwyg  
Show the user in edit mode an wysiwyg field, where he can put custom html formatted text.  
In display mode, this text is then rendered.  
  
#### parameters  
See [input](#input)  
  
#### examples  
```html  
{{#fn_wy}}letter_content{{#fn_wy}}  
{{#fn}}<wysiwyg field="letter_content" style="height:75%">{{#fn}}  
```  
  
  
### count  
Count the number of items in a loopable object.  
  
#### parameters  
|parameter|content|examples  
|--|--|--|  
|field|reference|`attachements` or `receivers`|  
  
#### examples  
```html  
{{#fn_ct}}attachements{{/fn_ct}}  
{{#fn_ct}}receivers{{/fn_ct}}  
{{#fn}}<count field="attachements">{{#fn}}  
```  
  
### date  
Displays a field containing a date in a specified format.  
  
#### Parameters  
|parameter|content|optional|examples  
|--|--|--|-|  
|field|reference||`invoice_date` or `print_date`|  
|date-format|`none`, `full`, `medium`, `short`|yes, default `long`|  
|time-format|`none`, `full`, `medium`, `short`|yes, default `none`|  
  
#### Examples  
```html  
{{#fn_dt}}invoice_date{{/fn_dt}}  
{{#fn_dt}}print_date|long{{/fn_dt}}  
{{#fn}}<datetime field="print_date" date-format="long" time-format="medium">{{/fn}}  
```  
  
### number  
Displays a field containing a number in a specified format.  
  
#### Parameters  
|parameter|content|optional|examples  
|--|--|--|--|  
|field|reference|`units` or `amount`|  
|format|[NumberFormat](#numberformats)|yes, default `none`|See content section  
  
#### Examples  
```html  
{{#fn_nu}}units{{/fn_nu}}  
{{#fn}}<number field="amount" format="currency" format-currency="EUR">{{/fn}}  
```  
  
### eval  
Displays a field containing a dynamic value, optionally in a specified format.  
  
#### Parameters  
|parameter|content|optional|examples  
|--|--|--|--|--|  
|field|reference||`sum` or `total`|  
|format|[NumberFormat](#numberformats)|yes, default `none`|See content section  
  
#### Examples  
```html  
{{#fn_ev}}sum{{/fn_ev}}  
{{#fn_ev}}sum|decimal{{/fn_ev}}  
{{#fn}}<evaluate field="amount" format="currency" format-currency="doc_currency" format-precision="2,4">{{/fn}}  
```  
  
### calc  
Displays a field containing a cusomizable calculated value, optionally in a specified format.  
  
#### Parameters  
|parameter|content|optional|examples  
|--|--|--|--|--|  
|calculation|[NumericCalculation](#numericcalculations)||See content section  
|format|[NumberFormat](#numberformats)|yes, default `none`|See content section  
  
#### Examples  
```html  
{{#fn_ca}}total-discount{{/fn_ca}}  
{{#fn}}<calculate calculation="total-discount" format="currency" format-currency="currency" format-symbol="$">{{/fn}}  
```  
  
## Parameters  
### NumberFormats  
Apply a number formatter based on the document locale.  
  
#### None  
Does not change the number format; used as default.  
  
#### Decimal  
|parameter|content|optional|examples  
|--|--|--|--|--|  
|format-precision|`min` or `min-max`|yes (default: `1`)|`2` or `2,4`|  
  
```html  
{{#fn_nu}}units|decimal{{/fn_nu}}  
{{#fn}}<number field="units" format="decimal" format-precision="3">{{/fn}}  
{{#fn}}<number field="units" format="decimal" format-precision="2,4">{{/fn}}  
```  
  
#### Currency  
|parameter|content|optional|examples  
|--|--|--|--|--|  
|format-precision|`min` or `min-max`|yes|`2` or `2,4`|  
|format-currency|a code or a currency-field||`EUR` or `doc_currency`  
|format-symbol|string|yes|` `(no symbol), `euro` or `â‚¬`|  
  
  
```html  
{{#fn}}<number field="amount" format="currency" format-currency="doc_currency">{{/fn}}  
{{#fn}}<number field="amount" format="currency" format-currency="doc_currency" format-precision="2,4">{{/fn}}  
{{#fn}}<number field="amount" format="currency" format-currency="EUR" format-symbol="Euro">{{/fn}}  
```  
  
#### Percent  
```html  
{{fn_nu}}vat|percent{{fn_nu}}  
{{#fn}}<number field="vat" format="percent">{{/fn}}  
```  
  
#### Permille  
```html  
{{fn_nu}}proportion|permille{{fn_nu}}  
{{#fn}}<number field="proportion" format="permille">{{/fn}}  
```  
  
### Calculation  
Calculate the result of a given calculation.   
Allowed operators are: `+`,`-`, `*`, `/`, `()`  
Allowed variables are all fields of the document  
  
#### examples  
```js  
sum - discount
```  
```js  
(sum - discount) * unit  
```

### payment-slip  
Displays a field containing a dynamic value, optionally in a specified format.  
All parameters except type are renderable with Mustache template syntax and use document variables.   
  
#### Parameters  
|parameter|content|optional|default  
|--|--|--|--|--|  
|type|Payment slip type||`ch-qr` - only Swiss QR bill is available for now|  
|creditor-name|Creditor Name|yes|`{{Document.creditor.name}}`|  
|creditor-addressline-1|Creditor Address First Line|yes|`{{Document.creditor.address}}`|  
|creditor-addressline-2|Creditor Address Second Line|yes|`{{Document.creditor.address_zip}} {{Document.creditor.address_town}}`|  
|creditor-country|Creditor Country|yes|`{{Document.creditor.address_country_code}}`|  
|creditor-iban|Creditor Iban|yes|`{{Document.creditor.iban}}`|  
|debtor-name|Debtor Name|yes|`{{Document.receiver.name}}`|  
|debtor-addressline-1|Debtor Address First Line|yes|`{{Document.receiver.address}}`|  
|debtor-addressline-2|Debtor Address Second Line|yes|`{{Document.receiver.address_zip}} {{Document.receiver.address_town}}`|  
|debtor-country|Debtor Country|yes|`{{Document.creditor.name}}`|  
|payment-amount|Payment Amount|yes|`{{BalanceOutstanding}}`|  
|payment-currency|Payment Currency|yes|`{{CurrencySymbol}}`|  
|reference-number|Reference Number|yes|`{{Document.id}}`|  
  
#### Examples  
```html  
{{#fn_ps}}ch-qr{{/fn_ps}}
{{#fn}}<payment-slip type="ch-qr">{{/fn}}
```  

### image  
Adds an image to the document template.
Images from the same template library as template are only allowed.
  
#### parameters  
|parameter|content|optional|examples  
|--|--|--|--|  
|reference|Image ID||`1mag6d1d`|  
|style|string|yes|`height: 100%` or `color: white; background-color: red;`|

#### Examples  
```html  
{{#fn_im}}h6sh6d1d{{/fn_im}}
{{#fn}}<image reference="1mag6d1d">{{/fn}}
```  