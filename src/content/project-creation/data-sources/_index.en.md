---
title: "Configure Data Sources"
date: 2020-02-03T13:00:00
lastmod: 2021-05-07T14:24:00
weight: 1001
draft: false
keywords: ["data", "datapoint", "source", "sources", "gateway", "source", "adapter", "transmission", "transmissions"]
---

### HTTP Source
The simplest type of Transmission to Lexgate is a simple HTTP request. HTTP requests are also used in browsers to load a website from a server. But it's also possible to send data via HTTP, in your browser for example by filling a form. A HTTP gateway uses this by generating a "form input" from metering data, which it collects. With one or multiple HTTP requests it transmits the collected data.

{{< techexplain >}}
Lexgate does not support unencrypted HTTP requests. All requests must be encrypted (HTTPS).
{{</ techexplain >}}

#### Create and test a HTTP source
Create a new Source by entering a name, selecting the {{<lga-lbl text="Type">}} {{<lga-inp text="http">}} and clicking {{<lga-btn type="negative" icon="add">}}. When the source is created, click on it's name to show more details for this source. The input {{<lga-lbl text="Notices">}} contains the URL of the endpoint, which looks like this:
`https://api.lexgate.ch/v1/sources/{authentication-id}`

The simplest method to check a source is by sending data from your browser. For this, modify the `{authentication-id}` in this example and call it in your browser:

```
https://api.lexgate.ch/v1/sources/{authentication-id}/?parameter_one=1&parameter_two=2
```

{{<techexplain>}}
HTTP sources support GET and POST methods. Multiple GET requests within short time are combined in one Transmission.
GET request can trigger the Rate-Limiter.

Always use POST requests if possible.
{{</techexplain>}}

### FTP-Source
Another type of Datatransmission is the FTP source. Lexgate creates a fresh, password protected directory on it's servers, which is checked once per minute for new files. If a new file is uploaded, Lexgate creates a fresh Transmission from it's content. A FTP gateway creates a file from the metering data and uploads it to the directory.

{{<techexplain>}}
Lexgate supports unencrypted and encrypted FTP. For the encrypted variant, only FTPS (FTP over TLS) is supported.

Always use encryption if possible.
{{</techexplain>}}

#### Create and test a FTP source
Create a new Source by entering a name, selecting the {{<lga-lbl text="Type">}} {{<lga-inp text="http">}} and clicking {{<lga-btn type="negative" icon="add">}}. When the source is created, click on it's name to show more details for this source. The input {{<lga-lbl text="Notices">}} contains the login for the FTP client. You can connect with an FTP client (e.g. [FileZilla](https://filezilla-project.org/)) and upload a text file to the root directory.

{{<techexplain>}}
Files which are uploaded via ftp lack in indication whether it's upload is in progress or already finished. Lexgate uses the `last modified`-timestamp to determine whether the file should be imported. If `last modified` was more than 60 seconds ago, the file is imported. `last modified` is also used to set the timestamp of the Transmission. If the gateway updates `last modified` after the file upload, make sure your gateway has set the current time correctly.
{{</techexplain>}}

### Gateways
#### Choice
It's possible the send data to Lexgate with every device which supports either HTTPS or FTP. This means, it's also possible to upload data from Smart Meters, programmable Controllers (PLC, Building Management System, etc) or from PCs besides of conventional Bus Concentrators  

Here is a list of devices, which are already in use with Lexgate:
* [Engelmann Gateway](https://www.engelmann.de/en/gateway/)
* [EMU M-Bus Center](https://www.emuag.ch/produkte/emu-m-bus-datenlogger/)
* [JC Elektronika EthMBus-XL Smart](http://www.prevodniky.sk/product-EthMBus-XL-en.html)
* [Wago PFC100/PFC200](https://www.wago.com/global/automation-technology/discover-plcs)
* [Loxone Miniserver](https://shop.loxone.com/dech/miniserver.html)

#### Configure a HTTP Gateway
Generally for HTTP gateways appliable:
* Check if the Client has the correct date-time set to make sure encryption works as expected.
* Transmissions are only possible with encryption enabled (HTTPS).
* A Transmission interval of 60-120 minutes is recommended. Shorter intervals can not be processed.
* If possible, always transmit at a predefined time (e.g. on the hour) rather than a simple intervall.
* If possible, transmit all data in one request to achieve best performance.
* Use JSON or XML as data format.

#### Configure a FTP Gateway
Generally for FTP gateways appliable:
* Check if the Client has the correct date-time set to make sure encryption works as expected and the receive time is read correctly.
* A Transmission interval of 60-120 minutes is recommended. Shorter intervals can not be processed.
* If possible, always transmit at a predefined time (e.g. on the hour) rather than a simple intervall.
* If possible, always use the encrypted protocol.
* If possible, transmit all data in one File to achieve best performance.
* Use JSON or XML as data format.

Use the credentials from the Source's {{<lga-lbl text="notices">}} to connect to the protected upload directory.

### Source Adapters
Source Adapters allow to use devices, which require server side logic. Lexgate has this Source Adapters implemented:
* Accumulator: sums up difference values to a counter.
* Session Accumulator *ALPHA*: Authorization and accumulation with a simple session protocol.
* Zaptec EV Charger: Authorization and accumulation of charging stations from [Zaptec](https://zaptec.com/en/).

Source Adapters process incoming requests and send a reponse according to the manufacturers protocol. During the processing, internal states are created or updated, to simulate a meter.

This states are stored once on the hour as a Transmission, so they can be used in Meter Units exactly the same way other metering data is used.

#### Configure an Accumulator
Add a Source Adapter with the {{<lga-lbl text="Type">}} {{<lga-inp text="generic-accumulator">}}.

Accumulators expect a POST request to the endpoint `https://api.lexgate.ch/v1/source-adapters/{authentication-id}`. Lexgate applies the configured filters on the content. If the filter matches a value, the {{<lga-lbl text="Tag">}}-values is increased by the matched value.

Filter patterns similar to the ones for Meter Units, which are explained in detail [here]({{<relref "../data-points#data-source">}}).

#### Configure a Session Accumulator
{{<notice info>}}
Session Accumulators are currently in ALPHA-phase and can be changed at any time.
{{</notice>}}

Add a Source Adapter with the {{<lga-lbl text="Type">}} {{<lga-inp text="generic-session-accumulator">}}.

During *ALPHA*-phase, this type of Source Adapter can be configured via JSON-configuration only. 
Change to the tab {{<lga-tab text="JSON">}} for this. The configuration follows this schema:
```json
{
  "tokens": [
    {
      "tag": "My token",
      "token": "904A0C13",
      "notices": ""
    }
  ],
  "devices": [
    {
      "tag": "My Device",
      "id": "my.device.id",
      "tokens": [
        "My token"
      ],
      "notices": ""
    }
  ]
}
```

*
* To start a session, the Session Accumulator expects a POST-Request to this endpoint: `https://api.lexgate.ch/v1/source-adapters/{authentication-id}/start`
* It's possible to update values during to session, to track consumption over time. The Session Accumulator accepts POST-Requests to this update-endpoint: `https://api.lexgate.ch/v1/source-adapters/{authentication-id}/update`
* To end a session, the Session Accumulator expects a POST-Request to this endpoint: `https://api.lexgate.ch/v1/source-adapters/{authentifizierungs-id}/end`

The protocol is described [here]({{< relref path="./generic-session-accumulator" >}}).

#### Configure Zaptec EV Charger
Add a Source Adapter with the {{<lga-lbl text="Type">}} {{<lga-inp text="generic-accumulator">}}. Update the configuration in the Zaptec Portal > Your Installation > Settings > Authentication like this:
* Select: `Web hooks authentication`
* Authentication URL: ` ` (empty)
* Authentication payload: ` ` (empty)
* Session start URL: `https://api.lexgate.ch/v1/source-adapters/{authentication-id}/start`
* Session end URL: `https://api.lexgate.ch/v1/source-adapters/{authentication-id}/end`

Configure the charging station, which is expecting a charging permission. Click on {{<lga-btn icon="add" text="Add">}} in the top row and configure {{<lga-lbl text="Charger ID">}} (Zaotec Portal > Chargers > Your Charger > Settings > ID (below "Name")) aswell as a custom {{<lga-lbl text="Tag">}} and click {{<lga-btn icon="add" text="Create">}}. All consumption of this charger gets now accumulated on the Tag.

Now configure the Badges, which should receive charging permnission. Click on {{<lga-btn icon="add" text="Add">}} in the leftmost column and configure {{<lga-lbl text="Token">}} (the UID of the badge, without `:`) as well as a custom {{<lga-lbl text="Tag">}} and click {{<lga-btn icon="add" text="Create">}}. All consumption of this badge gets now accumulated on the Tag.

Select the Checkbox in the cells, to grant the given badge access to the given charging station. If you do not need badge authorization, you can select the checkbox for the `*` wildcard badge. With this setting, all charging requests are authorized and consumption is only reported on the charging station.

### Check Transmissions
As soon as the project recorded the first Transmission, the Transmissions are shown in {{<lga-nav text="Transmissions">}}.

The tab {{<lga-tab text="General Information">}} shows meta data for the Transmission. {{<lga-tab text="Transmission Data">}} shows the received content.