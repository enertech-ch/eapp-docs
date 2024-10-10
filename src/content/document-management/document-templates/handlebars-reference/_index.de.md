---
title: "Handlebars Referenz"
date: 2020-01-02T13:00:00
lastmod: 2021-09-16T08:33:00
weight: 0299
draft: false
keywords: ["function", "reference", "mustache"]
---  

## Syntax 
Dokumentvorlagen verwenden die [Handlebars](https://handlebarsjs.com/guide/) Templating-Sprache. Sie können eine Vorlage in HTML schreiben, indem Sie Handlebars-Ausdrücke verwenden, um auf dynamische Inhalte zu verweisen.

### Variablen
Jedes Dokument hat seine Variablen direkt im Kontext verfügbar. Um auf eine Variable zuzugreifen, verwenden Sie die folgende Syntax:
```handlebars
{{NameOfTheVariable}}
```

Some variables my be nested within objects. You can navigate through objects by using dot-notation:
```handlebars
{{Object.Subobject.Name}}
```

### Kontext
Dokumente haben zwei Kontexte: den Hauptkontext und darin verschachtelt den Metakontext.

#### Hauptkontext
Der Hauptkontext enthält alle Variablen eines Dokuments. Diese können durch die Verwendung von [inputs](#input) in der Vorlage modifiziert werden. Bei den meisten Dokumenten sind viele Variablen während der Generierung vordefiniert. Je nach Dokumenttyp können einige Variablen gesperrt sein, was bedeutet, dass sie unveränderlich sind. Dies gilt beispielsweise für Geldbeträge.

#### Metakontext
Jedes Dokument hat auch einen Metakontext. Er ist im Hauptkontext als Eigenschaft namens Document verfügbar. Er enthält alle Metadaten des Dokuments, wie z. B. die Beziehungen und andere direkt zugewiesene Attribute. Zum Beispiel können Sie auf den Namen des Gläubigers des Dokuments zugreifen, indem Sie Folgendes verwenden:
```handlebars
{{Document.creditor.name}}
```

### Beispiel
Hier ein kurzes Beispiel, wie eine einfache Dokumentvorlage aussehen könnte.

Wenn Sie Probleme beim Lesen haben, ist es möglicherweise besser, Ihren Lexgate-Integrator zu kontaktieren.

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

      /** Fügen Sie hier Ihre Styles hinzu */  
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



## Standardfunktionen:

  [if](https://handlebarsjs.com/guide/builtin-helpers.html#if): bedingte Darstellung
  [unless](https://handlebarsjs.com/guide/builtin-helpers.html#unless): invertiertes `if`  
  [each](https://handlebarsjs.com/guide/builtin-helpers.html#each): iIteration über eine Liste
  [with](https://handlebarsjs.com/guide/builtin-helpers.html#with): Kontext wechseln  
  [lookup](https://handlebarsjs.com/guide/builtin-helpers.html#lookup): dynamische Parameterauflösung
  [length](#length): Anzahl der Elemente in einer Liste 

### length
Um die Anzahl der Elemente in einer Liste zu zählen, können Sie das `length`-Attribut verwenden:
```handlebars
{{Object.lengt}}
```

## Lexgate-Specific Functions

  [translate](#translate): übersetzt einen Schlüssel  
  [input](#input): erlaubt benutzerdefinierten Text in einem Eingabefeld  
  [textarea](#textarea): erlaubt benutzerdefinierten Text in einem mehrzeiligen Textfeld  
  [image](#image): zeigt ein Bild aus derselben Vorlagenbibliothek an  
  [datetime](#datetime): zeigt ein Feld mit einem Datum in einem bestimmten Format an  
  [number](#number): zeigt ein Feld mit einer Zahl in einem bestimmten Format an  
  [calculate](#calculate): zeigt einen benutzerdefinierten berechneten Wert an  
  [payment-slip](#payment-slip): zeigt einen Zahlungsblock an
  [match](#match): ermöglicht das Filtern eines bestimmten Objekts im Inhalt  

### translate  
Übersetzt einen Schlüssel abhängig von der Sprache des Dokuments.  
   
#### parameters  
|parameter|inhalt|beispiele  
|--|--|--|  
|**1**|string or variable|`Date` oder `Invoice`|  
  
#### Beispiele  
```handlebars  
{{translate "Date"}}
{{translate "Invoice"}} for {{translate type}}
```  
  
### input  
Zeigt dem Benutzer im Bearbeitungsmodus ein Eingabefeld, in das er benutzerdefinierten Text eingeben kann.
Im Anzeigemodus wird dieser Text dann gerendert.  
  
#### parameters  
|parameter|inhalt|optional|beispiele  
|--|--|--|--|  
|**1**|reference||`greetings` oder `customer_reference`|  
|style|string|ja|`height: 100%` oder `color: white; background-color: red;`  
|type|string|ja, standart `text`|`text` oder `number`
|raw-output|bool|ja, standart `false`|`true` oder `false`
  
#### beispiele  
```handlebars  
{{input "greetings"}}
{{input "customer_reference" style="height:100%;color:white;background-color:red;" type="number" raw-output=true}}
```  
  
### textarea  
Zeigt dem Benutzer im Bearbeitungsmodus ein mehrzeiliges Textfeld an, in das er benutzerdefinierten Text eingeben kann.
Im Anzeigemodus wird dieser Text dann gerendert. 
  
#### parameters  
|parameter|inhalt|optional|beispiele  
|--|--|--|--|  
|**1**|reference||`address` oder `description`|  
|style|string|ja|`height: 100%` oder `color: white; background-color: red;`  
  
#### beispiele
```handlebars  
{{textarea "address"}}
{{textarea "description" style="height:100%;color:white;background-color:red;"}}
```  

### image  
Fügt ein Bild zur Dokumentvorlage hinzu.
Es dürfen nur Bilder aus derselben Vorlagenbibliothek wie die Vorlage verwendet werden.
  
#### parameters  
|parameter|inhalt|optional|beispiele  
|--|--|--|--|  
|**1**|Image ID (string)||`1mag6d1d`|  
|style|string|ja|`height: 100%` oder `width:200px; border: 2px solid black`|

#### beispiele  
```handlebars  
{{image "1mag6d1d"}}
{{image "abcd1234" style="width:200px; border: 2px solid black"}}
```    

### datetime  
Zeigt ein Datum in einem bestimmten Format und in der Lokalisierung des Dokuments an.
  
#### Parameters  
|parameter|Inhalt|optional|beispiele  
|--|--|--|-|
|**1** or *content*|ISO8601 date string||`2000-01-01T00:00:01` oder `{{var_with_date}}`
|date-format|`none`, `full`, `long`, `medium`, `short`|ja, standart `long`|  
|time-format|`none`, `full`, `long`, `medium`, `short`|ja, standart `none`|  
  
#### beispiele  
```handlebars  
{{datetime invoice_date}}
{{#datetime}}2000-01-01T00:00:01{{/datetime}}
{{datetime "2000-01-01T00:00:01" date-format="short" time-format="short"}}
```  
  
### number  
Zeigt eine Zahl in einem bestimmten Format und in der Lokalisierung des Dokuments an.  
  
#### Parameters  
|parameter|Inhalt|optional|Beispiele  
|--|--|--|--|  
|**1** oder *content*|numeric||`123456` oder `amount`|  
|precision|`min` oder `min,max`|ja (standart: `2`)|`1` oder `2,4`
|rounding-mode|`down` oder `up`|ja (standart: `nearest`)|
|rounding-increment|string|ja (standart: `0`)|`0.2` oder `0.05`
|format|`none`, `decimal` oder `currency`|ja (standart: `decimal`)
|currency|ISO4217 currency string|ja (standart: `eur`)|`usd` oder `gbp`
|currency-display|`none`, `symbol`, `code`, `name`|ja (standart: `symbol`)

#### beispiele  
```handlebars
{{number amount}}
{{#number}}1234.67{{/number}}
{{number "1234.6789" precision="2,4" rounding-mode="down" rounding-increment="0.0002" format="currency" currency="usd" currency-display="none"}}
{{#number}}{{#calculate}}10+15{{/calculate}}{{/number}}
```
  
### calculate  
Zeigt ein Feld mit einem benutzerdefinierten berechneten Wert an.

Hinweis: Das Ergebnis einer Berechnung ist immer eine Rohzahl. Diese kann formatiert werden, indem sie in die [number-function](#number) eingebettet wird.
#### Parameters  
|parameter|content|optional|beispiel  
|--|--|--|--|
|*content*|string||Siehe Beispiele unten
  
#### beispiele  
```handlebars
{{#calculate}}{{amount}}+10{{/calculate}}
{{#calculate}}{{amount}}*{{vat_rate}}{{/calculate}}
```  

#### Unterstützte Symbole
|Symbol|Beschreibung|Beispiel
|--|--|--
|+|Additionsoperator|`2+3` = `5`
|-|Subtraktionsoperator|`2-3` = `-1`
|*|Multiplikationsoperator|`2*3` = `6`
|/|Divisionsoperator|`3/2` = `1.5`
|Mod|Modulusoperator|`3 Mod 2` = `1`
|^|Potenzoperator|`2^3` = `8`
|root|Quadratwurzelfunktion|`root 4` = `2`
|( ) | Klammern|`2*(3+4)` = `14`
|pi|Mathematische Konstante pi|`pi` = `3.14...`

### payment-slip  
Zeigt ein Feld mit einem dynamischen Wert an, optional in einem bestimmten Format.
Alle Parameter außer dem Typ sind mit Mustache-Templating-Syntax renderbar und verwenden Dokumentvariablen.   
  
#### Parameters  
|parameter|Inhalt|optional|Standardwert  
|--|--|--|--|--|  
|**1**|Zahlungsschein-Typ||`ch-qr` - only Swiss QR bill is available for now|  
|creditor-name|Name des Gläubigers|ja|`{{Document.creditor.name}}`|  
|creditor-addressline-1|Erste Zeile der Gläubigeradresse|ja|`{{Document.creditor.address}}`|  
|creditor-addressline-2|Zweite Zeile der Gläubigeradresse|ja|`{{Document.creditor.address_zip}} {{Document.creditor.address_town}}`|  
|creditor-country|Land des Gläubigers|ja|`{{Document.creditor.address_country_code}}`|  
|creditor-iban|IBAN des Gläubigers|ja|`{{Document.creditor.iban}}`|  
|debtor-name|Name des Schuldners|ja|`{{Document.receiver.name}}`|  
|debtor-addressline-1|Erste Zeile der Schuldneradresse|ja|`{{Document.receiver.address}}`|  
|debtor-addressline-2|Zweite Zeile der Schuldneradresse|ja|`{{Document.receiver.address_zip}} {{Document.receiver.address_town}}`|  
|debtor-country|Land des Schuldners|ja|`{{Document.creditor.name}}`|  
|payment-amount|Zahlungsbetrag|ja|`{{BalanceOutstanding}}`|  
|payment-currency|Währung der Zahlung|ja|`{{CurrencySymbol}}`|
|reference-type|Referenztyp. Erlaubt sind `SCOR` und `NON`|ja|`SCOR`|
|reference|Referenznummer|ja|`{{Document.id}}`|  
  
#### beispiele  
```handlebars  
{{payment-slip "ch-qr"}}
{{payment-slip "ch-qr" creditor-name="Other Name" creditor-addressline-1="Other Address" creditor-addressline-2="4545 Other Town" creditor-country="DE" creditor-iban="DE93 0076 2011 6238 5295 1" debtor-name="Third name" debtor-addressline-1="Third address" debtor-addressline-2="6767 Third Town" debtor-country="CH" payment-amount="245.35" payment-currency="EUR" reference="CustomReference"}}
```  
### match
Der MatchHelper bietet eine Funktion zum Abgleichen von Zeichenfolgen in Handlebars-Vorlagen mithilfe regulärer Ausdrücke. Dieser Helfer kann verwendet werden, um bestimmte Muster in Inhalten zu filtern oder zu suchen.

#### parameters
|parameter|inhalt|optional|beispiele  
|--|--|--|-|
|**1** |Referenz|| `Invoice`|
|pattern|Reguläres Ausdrucksmuster|nein| `""\\d+" für Zahlenabgleich`|
|flag|Optionale Regex-Flags|ja| `"g" für globalen Abgleich`|
#### beispiele
```handlebars 
{{#if (match Invoice pattern="12345")}}
  Enthält eine Zahl!
{{else}}
  Keine Zahl gefunden. 
{{/if}}

{{#if (match Invoice pattern="12345" flags="g")}}
  Enthält eine Zahl!
{{else}}
  Keine Zahl gefunden. 
{{/if}}
``` 