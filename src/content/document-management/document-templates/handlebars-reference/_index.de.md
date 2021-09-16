---
title: "Handlebars Referenz"
date: 2020-01-02T13:00:00
lastmod: 2021-09-16T08:33:00
weight: 0299
draft: false
keywords: ["function", "reference", "mustache"]
---  

## Syntax 
Document Templates use [Handlebars](https://handlebarsjs.com/guide/) Templating Language. You can write a Template in HTML with Handlebars Expressions to reference dynamic content.

### Variables
Each documents has it's variables available directly in context. To access a variable, use the following syntax:
```handlebars
{{NameOfTheVariable}}
```

Some variables my be nested within objects. You can navigate through objects by using dot-notation:
```handlebars
{{Object.Subobject.Name}}
```

### Context
Documents have two contexts: the primary context, and nested within, the Meta context.

#### Primary context
The primary context holds all variables of a document. They can be modified by using [inputs](#input) in the template. For most documents, a lot of variables are predefined during generation. Depending on the document type, some variables may be locked, which means they are immutable. This applies for example for monetary amounts.

#### Meta context
Each Document also has a Meta context. It's available in the Main context as property called `Document`. It holds all meta data of the document, like the relations and other directly assigned attributes. For example, you can access the Documents Creditor Name by using:
```handlebars
{{Document.creditor.name}}
```

### Example
For starters, here is a quick example of how a simple Document Template could look like. 

If you have trouble reading this, you might be better of by contacting your Lexgate Integrator.

```html
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style>
      body {
        font-size: 3mm;
        margin: 0;
        max-width: none;
      }
      @page{
        size: A4;
        margin: 10mm;
        margin-left: 20mm;
        margin-top: 27mm;
      }
      @media only screen {
        body {
      	  margin: 10mm;
          margin-left: 20mm;
      	  margin-top: 27mm;
          box-sizing: border-box;
        }
      }

      /** Add your styles here */
    </style>
  </head>
  <body>
    <div class="your-document-header">
      {{translate "Document ID"}}: {{Document.id}}
    </div>
    <div class="your-document-body">
      <table>
        <tr>
          <th>{{translate "Name"}}</th>
          <th>{{translate "Address"}}</th>
        </tr>

      {{#each Persons}}
        <tr>
          <td>{{Name}}</td>
          <td>{{Address}}</td>
        </tr>
      {{/each}}
    </div>
  </body>
</html>
```



## Default Functions:

  [if](https://handlebarsjs.com/guide/builtin-helpers.html#if): conditionally render  
  [unless](https://handlebarsjs.com/guide/builtin-helpers.html#unless): inverted `if`  
  [each](https://handlebarsjs.com/guide/builtin-helpers.html#each): iterate over a list  
  [with](https://handlebarsjs.com/guide/builtin-helpers.html#with): change context  
  [lookup](https://handlebarsjs.com/guide/builtin-helpers.html#lookup): dynamic paramter resolution   
  [length](#length): count items in a list  

### length
To count items in a list, you can use the `length`-attribute:
```handlebars
{{Object.lengt}}
```

## Lexgate-Specific Functions

  [translate](#translate): translates a key  
  [input](#input): allows custom text in an input-element  
  [textarea](#textarea): allows custom text in a textarea-element  
  [image](#image): display am image from the same template library  
  [datetime](#datetime): display a field containing a date in a specified format  
  [number](#number): display a field containing a number in a specified format  
  [calculate](#calculate): display a custom calculated value  
  [payment-slip](#payment-slip): display a payment slip block  

### translate  
Translate a key depending on the document language.  
   
#### parameters  
|parameter|content|examples  
|--|--|--|  
|**1**|string or variable|`Date` or `Invoice`|  
  
#### examples  
```handlebars  
{{translate "Date"}}
{{translate "Invoice"}} for {{translate type}}
```  
  
### input  
Show the user in edit mode an input field, where he can put custom text.  
In display mode, this text is then rendered.  
  
#### parameters  
|parameter|content|optional|examples  
|--|--|--|--|  
|**1**|reference||`greetings` or `customer_reference`|  
|style|string|yes|`height: 100%` or `color: white; background-color: red;`  
|type|string|yes, default `text`|`text` or `number`
|raw-output|bool|yes, default `false`|`true` or `false`
  
#### examples  
```handlebars  
{{input "greetings"}}
{{input "customer_reference" style="height:100%;color:white;background-color:red;" type="number" raw-output=true}}
```  
  
### textarea  
Show the user in edit mode an textarea field, where he can put custom multiline text.  
In display mode, this text is then rendered.  
  
#### parameters  
|parameter|content|optional|examples  
|--|--|--|--|  
|**1**|reference||`address` or `description`|  
|style|string|yes|`height: 100%` or `color: white; background-color: red;`  
  
#### examples
```handlebars  
{{textarea "address"}}
{{textarea "description" style="height:100%;color:white;background-color:red;"}}
```  

### image  
Adds an image to the document template.
Images from the same template library as template are only allowed.
  
#### parameters  
|parameter|content|optional|examples  
|--|--|--|--|  
|**1**|Image ID (string)||`1mag6d1d`|  
|style|string|yes|`height: 100%` or `width:200px; border: 2px solid black`|

#### Examples  
```handlebars  
{{image "1mag6d1d"}}
{{image "abcd1234" style="width:200px; border: 2px solid black"}}
```    

### datetime  
Displays a date in a specified format and in the documents locale.
  
#### Parameters  
|parameter|content|optional|examples  
|--|--|--|-|
|**1** or *content*|ISO8601 date string||`2000-01-01T00:00:01` or `{{var_with_date}}`
|date-format|`none`, `full`, `long`, `medium`, `short`|yes, default `long`|  
|time-format|`none`, `full`, `long`, `medium`, `short`|yes, default `none`|  
  
#### Examples  
```handlebars  
{{datetime invoice_date}}
{{#datetime}}2000-01-01T00:00:01{{/datetime}}
{{datetime "2000-01-01T00:00:01" date-format="short" time-format="short"}}
```  
  
### number  
Displays a number in a specified format and in the documents locale.  
  
#### Parameters  
|parameter|content|optional|examples  
|--|--|--|--|  
|**1** or *content*|numeric||`123456` or `amount`|  
|precision|`min` or `min,max`|yes (default: `2`)|`1` or `2,4`
|rounding-mode|`down` or `up`|yes (default: `nearest`)|
|rounding-increment|string|yes (default: `0`)|`0.2` or `0.05`
|format|`none`, `decimal` or `currency`|yes (default: `decimal`)
|currency|ISO4217 currency string|yes (default: `eur`)|`usd` or `gbp`
|currency-display|`none`, `symbol`, `code`, `name`|yes (default: `symbol`)

#### Examples  
```handlebars
{{number amount}}
{{#number}}1234.67{{/number}}
{{number "1234.6789" precision="2,4" rounding-mode="down" rounding-increment="0.0002" format="currency" currency="usd" currency-display="none"}}
{{#number}}{{#calculate}}10+15{{/calculate}}{{/number}}
```
  
### calculate  
Displays a field containing a cusomizable calculated value.

Note: The Output of a calculations is always a raw number. They can be formatted by wrapping it in the [number-function](#number)
  
#### Parameters  
|parameter|content|optional|examples  
|--|--|--|--|
|*content*|string||See examples below
  
#### Examples  
```handlebars
{{#calculate}}{{amount}}+10{{/calculate}}
{{#calculate}}{{amount}}*{{vat_rate}}{{/calculate}}
```  

#### Supported Symbols
|Symbol|Description|Example
|--|--|--
|+|Addition Operator|`2+3` = `5`
|-|Subtraction Operator|`2-3` = `-1`
|*|Multiplication Operator|`2*3` = `6`
|/|Division Operator|`3/2` = `1.5`
|Mod|Modulus Operator|`3 Mod 2` = `1`
|^|Power Operator|`2^3` = `8`
|root|Sqare Root Function|`root 4` = `2`
|( ) | Parenthesis|`2*(3+4)` = `14`
|pi|Math Constant pi|`pi` = `3.14...`

### payment-slip  
Displays a field containing a dynamic value, optionally in a specified format.  
All parameters except type are renderable with Mustache template syntax and use document variables.   
  
#### Parameters  
|parameter|content|optional|default  
|--|--|--|--|--|  
|**1**|Payment slip type||`ch-qr` - only Swiss QR bill is available for now|  
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
|reference-type|Reference Type. Allowed are `SCOR` and `NON`|yes|`SCOR`|
|reference|Reference String|yes|`{{Document.id}}`|  
  
#### Examples  
```handlebars  
{{payment-slip "ch-qr"}}
{{payment-slip "ch-qr" creditor-name="Other Name" creditor-addressline-1="Other Address" creditor-addressline-2="4545 Other Town" creditor-country="DE" creditor-iban="DE93 0076 2011 6238 5295 1" debtor-name="Third name" debtor-addressline-1="Third address" debtor-addressline-2="6767 Third Town" debtor-country="CH" payment-amount="245.35" payment-currency="EUR" reference="CustomReference"}}
```  