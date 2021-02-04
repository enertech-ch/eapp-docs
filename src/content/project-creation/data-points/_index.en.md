---
title: "Data points"
date: 2020-02-03T13:00:00
lastmod: 2020-02-03T13:00:00
weight: 1002
draft: false
keywords: ["data", "point", "group", "groups", "tariff", "tariffs", "meter", "meters", "unit", "units"]
---

As soon as your Lexgate project succesfully receives Transmissions, you can start to set up your data points.

### Logical Structure
Groups and Meters should represent a logical structure of the property. This structure usually matches the physical structure, but sometimes it's easier to deviate in some details.

#### Groups
A Group is a collection of other Groups and Meters. The simplest example for what a group could represent is a Flat. A Flat usually contains multiple Meters. Superordinate to a a "Flat" could be another Group "Building".

A Group structure for a simple property could look like this:
{{<lga-struct type="group" name="Property Example Street">}}
    {{<lga-struct type="group" name="Example Street 1">}}
        {{<lga-struct type="group" name="Flat 11" />}}
        {{<lga-struct type="group" name="Flat 12" />}}
    {{</lga-struct>}}
    {{<lga-struct type="group" name="Example Street 2">}}
        {{<lga-struct type="group" name="Flat 21" />}}
        {{<lga-struct type="group" name="Flat 22" />}}
    {{</lga-struct>}}
    {{<lga-struct type="group" name="Example Street 3">}}
        {{<lga-struct type="group" name="Flat 31" />}}
        {{<lga-struct type="group" name="Flat 32" />}}
    {{</lga-struct>}}
{{</lga-struct>}} 

#### Meter
The physical measuring devices for the property are represented in Lexgate as "Meter". For each measuring device a Meter must be created in Lexgate. The name of this Meter is user defined, but should be unique within a group.
{{<lga-struct type="group" name="Property Example Street">}}
    {{<lga-struct type="group" name="Example Street 1">}}
        {{<lga-struct type="group" name="Flat 11">}}
            {{<lga-struct type="meter" name="Heating" />}}
            {{<lga-struct type="meter" name="Hot Water" />}}
        {{</lga-struct>}}
        {{<lga-struct type="group" name="Flat 12">}}
            {{<lga-struct type="meter" name="Heating" />}}
            {{<lga-struct type="meter" name="Hot Water" />}}
        {{</lga-struct>}}
    {{</lga-struct>}}
{{</lga-struct>}}

### Meter Units
Meter Units create a connection between data gathering and structure. For each measured unit a Meter Unit must be created and assigned to a Meter. The parser exports values from Transmissions with a customizable filter. This recored values are called Records.

#### Structure
For the structure Meter Units get a customizable name, for example:
{{<lga-struct type="group" name="Property Example Street">}}
    {{<lga-struct type="group" name="Example Street 1">}}
        {{<lga-struct type="group" name="Flat 11">}}
            {{<lga-struct type="meter" name="Heizung">}}
                {{<lga-struct type="unit" name="Energy Consumption" />}}
                {{<lga-struct type="unit" name="Flow Temperature" />}}
                {{<lga-struct type="unit" name="Return Temperature" />}}
                {{<lga-struct type="unit" name="Flow" />}}
            {{</lga-struct>}}    
        {{</lga-struct>}}
    {{</lga-struct>}}
{{</lga-struct>}}

#### Data Source
For Meter Units it's required to configure a Data Source. It gets configured with multiple parameters:
* {{<lga-lbl text="Source">}}: The Source which Transmissions should be filtered.
* {{<lga-lbl text="Source Filter type">}}: There are three types available:
    * {{<lga-inp text="JsonPath">}}: for Transmission in JSON format
    * {{<lga-inp text="XPath">}}: for Transmission in XML format
    * {{<lga-inp text="Regex">}}: Expers only. Filters with [Regular Expression](https://en.wikipedia.org/wiki/Regular_expression)
* {{<lga-lbl text="Source Filter path">}}: The filter string to apply. Check the examples for [JsonPath]({{<relref "./filterstrings">}}) and [XPath]({{<relref "./filterstrings">}}).

It's also necessary to configure the scale of the incoming data. The scale must match the one that is used for Accounting later on. It's best if the gateway already sends the data in the correct scale; but if that's not possible, the Normalization Factor must be adjusted accordingly:
* {{<lga-lbl text="Symbol">}}: The unit symbol of the transmitted unit, for example {{<lga-inp text="kWh">}} or {{<lga-inp text="m³/h">}}.
* {{<lga-lbl text="Symbol Name">}}: The written out name of the unit symbol, for example {{<lga-inp text="Kilowatt-hours">}} or {{<lga-inp text="Cubic Meters">}}.
* {{<lga-lbl text="Normalization factor">}}: The factor which is applied to the matched value of the Transmission, before this value is written to the database. An example: if the gateway sends water consumption in liters, but the tariff for water consumption is in m³, insert {{<lga-inp text="0.001">}} here.
*{{<lga-lbl text="Is monitored">}}: Choose if the Meter Unit is considered for the Health-Check.

### Display information
The analysis feature can display recorded values. It's possible, that the scale of the record does not match the desired scale to display the information. For this reason, it's possible to set scaling information for display purposes. All features related to accounting ignore this setting.

* {{<lga-lbl text="Value type">}}:
    * {{<lga-inp text="Accumulated">}}: The default setting for meters. In charts, differences are displayed (energy consumption, water consmption).
    * {{<lga-inp text="Absolute">}}: In charts, absolut values are displayed (tempertures, flow).
* {{<lga-lbl text="Display Symbol">}}: The unit symbol after applying the display factor.
* {{<lga-lbl text="Display Symbol Name">}}: The unit symbol name after applying the display factor.
* {{<lga-lbl text="Display Factor">}}: The factor to apply when showing values from the database. Is not applied in account related functionality.

An important function of Lexgate is to show Records in charts. The charts can also be parameterized:

* {{<lga-lbl text="Type">}}: Type of the chart series.
* {{<lga-lbl text="Color">}}: Primary color of the Meter Unit in the chart.
* {{<lga-lbl text="Fill Color">}}: Fill color of the Meter Unit (only for Area, Areaspline and Column).

#### Meter Units with multiple Tariffs
Lexgate supports Meter Units, which use a defined Tariff per unit. It's also possible to configure multiple Tariffs on the same Unit, for example a normal tariff and a peak tariff for an electricity meter.

First, create one or multiple Tariffs in {{<lga-nav text="Tariffs">}}.

Then, create a Meter Unit as described above. Now change to the tab {{<lga-tab text="Tariffs">}} in the Meter Unit detail view. Select a {{<lga-lbl text="Tarif">}} and configure a filter. Repeat this for every Tariff that should be recorded.

#### Records
As soon as a Meter Unit is created, the Filter is applied for each newly received Transmission. A list of the Meter Unit Records are displayed in the tab {{<lga-tab text="Records">}} in every Meter Unit.

If you have to record values from previous Transmission, you can order Lexgate to reprocess these Transmissions. To do this, change to {{<lga-nav text="Meter Units">}}, select the desired Meter Units and click {{<lga-btn type="negative" icon="update" text="Reprocess Transmissions">}}.

#### Replace Meters
Physical measure devices require replacements and some point. Lexgate provides functionality for this process in the tab {{<lga-tab text="Life Cycle">}} on every Meter and Meter Unit.

Usually, you want to replace a Meter with a new, not yet added replacement. Proceed like this: 
* Fill in the input fields {{<lga-inp text="Effective at">}} for *Set successor*.
* Select the Meter Units which should be available for the Successor.
* Click {{<lga-btn  icon="add" text="Create">}}
* The successor was created. You can move to the newly created record by clicking it's name under *Predecessor*.

{{<notice warning>}}Meters and Meter Units, which have a predecessor configured, are excluded from most lists. But they are still listen in the {{<lga-tab text="Life Cycle">}}-tab of the successor.{{</notice>}}