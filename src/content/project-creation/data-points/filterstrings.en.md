---
title: "Filter String Examples"
date: 2020-02-04T13:00:00
lastmod: 2024-05-15T12:00:00
weight: 10021
draft: false
keywords: ["filter", "string", "example", "meter", "unit"]
---

### by Device

#### JC Elektronika EthMBus-XL Smart

XPath: `//unit[@sn={{meter.serialNumber}}]/energy[@tariff=1]`

* Device with the serial number which is assigned to the parent meter
* Value of *Energy* with Tariff *1*

#### Engelmann Gateway

XPath: `//Data[@attr='ID']/value[text()={{meter.serialNumber}}]/../../Data[contains(@attr, 'FlowTemp')]/value`

* Device with the serial number which is assigned to the parent meter
* Value of *Flow Temperature*

#### Lexgate HTTP-Get Wrapper

JsonPath: `$.data[?(@.meter_id=='{{meter.serialNumber}}')].energy_t1_kWh`
* Device with the serial number which is assigned to the parent meter
* Value of *Energy* with Tariff 1*

#### Lexgate Source Adapter

JsonPath: `$[?(@.tag=='token#YourTokenTag:OptionalNestedId')].value`
* Value of State with Tag *token#YourTokenTag:OptionalNestedId*

#### EMU M-Bus Center

JsonPath: `$[?(@.Serial=='{{meter.serialNumber}}')].ValueDescs[?(@.DescriptionStr=='Energy' and @.Tariff==1)].LoggerLastValue`

* Device with the serial number which is assigned to the parent meter
* Value of *Energy* with Tariff *1*

#### Solvimus MUC.easplus / MUCxxx

JsonPath: `$.muc.meter[?(@.METER_ID=='{{meter.serialNumber}}')].data[?(@.DESCRIPTION=='Energy')].entry[-1].VAL`
* Device with the serial number which is assigned to the parent meter
* Last read value (`[-1].VAL`) of *Energy*
