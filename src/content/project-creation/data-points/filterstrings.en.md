---
title: "Filter String Examples"
date: 2020-02-04T13:00:00
lastmod: 2022-02-01T12:00:00
weight: 10021
draft: false
keywords: ["filter", "string", "example", "meter", "unit"]
---

### by Device

#### JC Elektronika EthMBus-XL Smart

XPath: `//unit[@sn=123456]/energy[@tariff=1]`

* Unit with the serial *123456*
* Value of *Energy* with Tariff *1*

#### Engelmann Gateway

XPath: `//Data[@attr='ID']/value[text()=123456]/../../Data[contains(@attr, 'FlowTemp')]/value`

* Unit with the serial *123456*
* Value of *Flow Temperature*

#### Lexgate HTTP-Get Wrapper

JsonPath: `$.data[?(@.meter_id=='2.123')].energy_t1_kWh`
* Unit with the ID *2.123*
* Value of *Energy* with Tariff 1*

#### Lexgate Source Adapter

JsonPath: `$[?(@.tag=='token#YourTokenTag:OptionalNestedId')].value`
* Value of State with Tag *token#YourTokenTag:OptionalNestedId*

#### EMU M-Bus Center

JsonPath: `$[?(@.Serial=='123456')].ValueDescs[?(@.DescriptionStr=='Energy' and @.Tariff==1)].LoggerLastValue`

* Device with the serial *123456*
* Value of *Energy* with Tariff *1*

#### Solvimus MUC.easplus / MUCxxx

JsonPath: `$.muc.meter[?(@.METER_ID=='123456')].data[?(@.DESCRIPTION=='Energy')].entry[-1].VAL`
* Device with the serial *123456*
* Last read value (`[-1].VAL`) of *Energy*