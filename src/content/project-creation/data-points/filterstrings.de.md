---
title: "Filter String Beispiele"
date: 2020-02-04T13:00:00
lastmod: 2020-02-04T13:00:00
weight: 10021
draft: false
keywords: ["filter", "string", "beispiel", "zähler", "einheit"]
---

### nach Gerät

#### JC Elektronika EthMBus-XL Smart

XPath: `//unit[@sn=123456]/energy[@tariff=1]`

* Einheit mit der Seriennummer *123456*
* Wert von *Energie* mit dem Tarif *1*

#### Engelmann Gateway

XPath: `//Data[@attr='ID']/value[text()=123456]/../../Data[contains(@attr, 'FlowTemp')]/value`

* Einheit mit der Seriennummer *123456*
* Wert von *Vorlauftemperatur*

#### Lexgate HTTP-Get Wrapper

JsonPath: `$.data[?(@.meter_id=='2.123')].energy_t1_kWh`
* Einheit mit der ID *2.123*
* Wert von *Energie* mit dem Tarif *1*

#### EMU M-Bus Center

JsonPath: `$..*[?(@.Serial=='123456')].ValueDescs[?(@.DescriptionStr=='Energy' and @.Tariff==1)].LoggerLastValue`

* Einheit mit der Seriennummer *123456*
* Wert von *Energie* mit dem Tarif *1*

