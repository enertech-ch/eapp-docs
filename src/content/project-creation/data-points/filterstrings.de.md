---
title: "Filter String Beispiele"
date: 2020-02-04T13:00:00
lastmod: 2024-05-15T12:00:00
weight: 10021
draft: false
keywords: ["filter", "string", "beispiel", "zähler", "einheit"]
---

### nach Gerät

#### JC Elektronika EthMBus-XL Smart

XPath: `//unit[@sn={{meter.serialNumber}}]/energy[@tariff=1]`

* Gerät mit der Seriennummer welche dem übergeordneten Zähler zugewiesen ist
* Wert von *Energie* mit dem Tarif *1*

#### Engelmann Gateway

XPath: `//Data[@attr='ID']/value[text()={{meter.serialNumber}}]/../../Data[contains(@attr, 'FlowTemp')]/value`

* Gerät mit der Seriennummer welche dem übergeordneten Zähler zugewiesen ist
* Wert von *Vorlauftemperatur*

#### Lexgate HTTP-Get Wrapper

JsonPath: `$.data[?(@.meter_id=='{{meter.serialNumber}}')].energy_t1_kWh`
* Gerät mit der Seriennummer welche dem übergeordneten Zähler zugewiesen ist
* Wert von *Energie* mit dem Tarif *1*

#### Lexgate Source Adapter

JsonPath: `$[?(@.tag=='token#YourTokenTag:OptionalNestedId')].value`
* Wert des Zustands mit dem Tag *token#YourTokenTag:OptionalNestedId*

#### EMU M-Bus Center

JsonPath: `$[?(@.Serial=='{{meter.serialNumber}}')].ValueDescs[?(@.DescriptionStr=='Energy' and @.Tariff==1)].LoggerLastValue`

* Gerät mit der Seriennummer welche dem übergeordneten Zähler zugewiesen ist
* Wert von *Energie* mit dem Tarif *1*

#### Solvimus MUC.easplus / MUCxxx

JsonPath: `$.muc.meter[?(@.METER_ID=='{{meter.serialNumber}}')].data[?(@.DESCRIPTION=='Energy')].entry[-1].VAL`
* Gerät mit der Seriennummer welche dem übergeordneten Zähler zugewiesen ist
* Letzer gelesener Wert (`[-1].VAL`) von *Energie*
