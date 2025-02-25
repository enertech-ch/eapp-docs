---
title: "Lansen Bridge MQTT"
date: 2025-02-25T13:00:00
lastmod: 2025-02-25T13:00:00
weight: 10031
draft: false
keywords: ["lansen", "bridge", "mqtt", "adapter"]
aliases:
  - /de/
---

Here we describe how to conntect with a Lansen MQTT-Bridge and the management tool.

### Source Adapter
First you need to create a new Source Adapter. The fresh adapter will have a default configuration in the {{<lga-tab text="JSON">}} tab, which you need to update according to your devices first:

Example:
```
Type            :  Lansen Bridge Webhook

Authentication  :  zCR3QrmOj59uGWgK7YPRTdjMiHQ3xsHN

Config:
```
```json
{
    "devices": [
        {
            "title": "Primary",
            "serial": "LAS.00123456.11.11",
            "notices": "",
            "password": "NewRandomPassword6"
        },
        {
            "title": "Another",
            "serial": "LAS.00123459.11.11",
            "notices": "",
            "password": "NewRandomPassword9"
        }
    ],
    "encryptionKeys": [
        "FIRSTMETERHEXENCRYPTIONKEY000000",
        "SECONDMETERHEXENCRYPTIONKEY00000"
    ],
    "configurationPassword": "AnotherRandomPassword"
}
```

#### Devices
For each Lansen MQTT-Bridge, you need to create one _Device_. Note, that serial and password must match the config for each bridge. Use exactly the full serial printed on the Gateway label!

Now configure your Lansen Gatway with the Lansen Configurator:
Connect via Dongle → Config Repeater / Bridge → Bridge
| Parameter       | Value                                                              |
|-----------------|--------------------------------------------------------------------|
| MQTT host       | mqtt.eapp.ai                                                       |
| MQTT port       | 8883                                                               |
| MQTT username   | {SourceAdapter→Authentication [zCR3QrmOj59uGWgK7YPRTdjMiHQ3xsHN]}  |
| MQTT password   | {SourceAdapter→Config→Devices→...→password [NewRandomPassword6]}   |
| MQTT prefix     | {empty}                                                            |
| TLS             | TLS 1.2                                                            |
| APN             | {empty}                                                            |
| NTP             | pool.ntp.org                                                       |
| Modem Upload    | check 00:00 24h Mo Tu We Th Fr Sa Su                               |
| MQTT always     | YES  

#### Encryption Keys
For each encryption key used on one or more meters, add one string-item to the array `encryptionKeys`. The decryption will try each key until it finds the correct one. A lot of keys therefore make the decryption process slower, so it's recommended to use not more than 10 keys per installation. 

But in case it's required, it's totally possible to add one encryption key per meter, even for multiple hundret meter. However, if there are multiple Lansen Bridges in use in a setup like this, it's recommendet to setup one Source Adapter per Bridge (= configuring only one Device and it's connected meters encryption keys per Source Adapater).


#### Configuration through MQTT
It's possible to remotly configure Lansen Bridges through MQTT, usually the desired approach.

Start the Lansen Configurator and switch to tab _MQTT_. Configure the connection like this:

| Parameter  | Value                                                              |
|------------|--------------------------------------------------------------------|
| Host       | mqtt.eapp.ai                                                      |
| Port       | 8883                                                               |
| TLS        | TLS 1.2                                                            |
| QoS        | 1                                                                  |
| Serial     | {6-Digit-Serial of Bridge [00123456]}                             |
| Username   | {SourceAdapter→Authentication [zCR3QrmOj59uGWgK7YPRTdjMiHQ3xsHN]} |
| Password   | {SourceAdapter→Config→configurationPassword [AnotherRandomPassword]} |

### Recommendet Bridge Configuration:
| Parameter                    | Value                      |
|------------------------------|----------------------------|
| **Basic**                    |                            |
| Encryption                   | no encryption enabled      |
| MBUS input mode              | TC                         |
| MBUS output mode             | C                          |
| Min install RSSI             | 0                          |
| **Timers**                   |                            |
| Supression timer             | 1 Minutes                  |
| Start time                   | disabled                   |
| Listen/pause timers          | 1 / 0                      |
| Magnet/reed timer            | 60                         |
| Monthly reading start time   | disabled                   |
| Monthly reading listen time  | not used                   |
| **Routing**                  |                            |
| Accepted Manufacturer IDs    | empty or project dependant |
| Route messages               | Route only OMS messages    |
| **Meters**                   |                            |
| Automatic meter installation | yes                        |
| **Clock**                    |                            |
| must corretly auto-update    |                            |
| **Bridge**                   |                            |
| See above under _Devices_    |                            |
  


### Troubleshooting
#### Connection without TLS
For test purposes, it's possible to connect to `Port: 1883` with `TLS: off` for the Bridge (devices) as well the Configurator. Do not use this as permanent solution for customer data, as the data is not encrypted when sent over the Internet this way.

#### Investigate Traffic
The Lansen Configurator allows to investigate into packages using the tab _Packet Sniffer_. In case you need to know in real time what happens over WMBUS, this is the easiest method to look into traffic. It displays valuable information like: `Meter Serial`, `Meter Type`, `WMBUS Signal Strength` and `Last Hop`.

The _Packet Sniffer_ is available for Dongle and MQTT connections.