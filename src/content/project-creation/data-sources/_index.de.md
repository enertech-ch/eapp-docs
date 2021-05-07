---
title: "Datenquellen konfigurieren"
date: 2020-01-26T13:00:00
lastmod: 2021-05-07T14:24:00
weight: 1001
draft: false
keywords: ["datenpunkt", "quelle", "quellen", "gateway", "quellenadapter", "übertragung", "übertragungen"]
---


### HTTP-Quelle
Die einfachste Form der Übermittlung an Lexgate ist eine einfache HTTP-Anfrage. HTTP-Anfragen werden zum Beispiel von einem Browser an einen Server geschickt, um eine Webseite anzuzeigen. Aber auch die Datenübermittlung via HTTP ist möglich, im Browser zum Beispiel mit einem Formular. Ein HTTP-Gateway macht sich diese Eigenschaften zu nutzen und generiert eine solche "Formulareingabe" aus Zählerdaten, welche er sammelt. Mit einem oder mehreren HTTP-Anfragen werden die gesammelten Daten übermittelt.

{{<techexplain>}}
Lexgate unterstützt keine unverschlüsselten HTTP-Anfragen. Alle Anfragen müssen als verschlüsselt (HTTPS) ausgeführt werden.
{{</techexplain>}}

#### Eine HTTP-Quelle erstellen und testen
Fügen Sie eine neue Quelle mit einem beliebigen Namen und der {{<lga-lbl text="Art">}} {{<lga-inp text="http">}} hinzu. Wenn die Quelle erstellt ist, klicken Sie auf den Namen um Detailseite der Quelle anzuzeigen. Im {{<lga-lbl text="Hinweise">}}-Feld finden Sie die URL des Endpunkt, die wie folgt aussieht:  
`https://api.lexgate-stage.ch/v1/sources/{authentifizierungs-id}`

Die einfachste Möglichkeit, eine Quelle zu testen, besteht darin, eine Anfrage durch Ihren Browser zu senden. Ergänzen Sie im folgendes Beispiel die `{authentifizierungs-id}` und rufen Sie die URL in ihrem Browser auf.

```
https://api.lexgate.ch/v1/sources/{authentifizierungs-id}/?parameter_eins=1&parameter_zwei=2
```

{{<techexplain>}}
HTTP-Quellen unterstützen GET- und POST-Methoden. Mehrere GET-Anfragen innerhalb eines definierten Zeitraums werden dabei zu einer Übertragung zusammengefasst. GET-Anfragen können jedoch den Rate-Limiter auslösen.

Verwenden Sie möglichst immer POST-Anfragen.
{{</techexplain>}}

### FTP-Quelle
Eine weitere Form der Datenübermittlung stellt die FTP-Quelle dar. Lexgate erstellt pro Quelle ein neues passwortgeschütztes Verzeichnis auf dem Server, das einmal pro Minute auf neue Dateien überprüft wird. Wird eine Datei hochgeladen, erstellt Lexgate aus dem Inhalt eine Übertragung. Ein FTP-Gateway erzeugt eine Datei aus Zählerdaten, welche er anschliessend in das Verzeichnis hochlädt.

{{<techexplain>}}
Lexgate unterstützt unverschlüsseltes und verschlüsseltes FTP. Bei der verschlüsselten Variante wird nur FTPS (FTP over TLS) unterstützt. Wenn immer möglich sollte das verschlüsselte Protokol verwendet werden.
{{</techexplain>}}


#### Eine FTP-Quelle erstellen und testen
Fügen Sie eine neue Quelle mit einem beliebigen Namen und der Art "ftp" hinzu. Wenn die Quelle erstellt ist, klicken Sie auf den Namen um Detailseite der Quelle anzuzeigen. Im {{<lga-lbl text="Hinweise">}}-Feld finden Sie die Login-Daten für den FTP-Client. Sie können sich nun mit einem FTP-Client (z.B. [FileZilla](https://filezilla-project.org/)) verbinden und eine Text-Datei in das Hauptverzeichnis hochladen.

{{<techexplain>}}
Für Dateien, die via FTP hochgeladen werden, gibt es kein eindeutiges Indiz ob der der Upload noch im Gang oder bereits abgeschlossen ist. Lexgate verwendet deshalb den `last modified`-Timestamp um zu bestimmen, ob die Datei importiert werden soll. `last modified` muss mindestens 60 Sekunden zurückliegen, damit eine Datei importiert wird. Gleichzeitig wird `last modified` auch als Zeitpunkt der Übertragung festgelegt. Falls der Client nach dem Upload das ursprüngliche `last modified` setzt, stellen Sie sicher dass der Gateway über die korrekte Uhrzeit verfügt, da ansonsten Übertragungen mit einem falschen Zeitpunkt registriert werden.
{{</techexplain>}}


### Gateways
#### Auswahl
An Lexgate können mit jedem Gerät, der entweder HTTPS oder FTP-Upload unterstützt, Daten übertragen werden. Das heisst, neben konventionellen Buszentralen sind auch Datenübertragungen mit intelligenten Zählern, programmierbaren Steuerungen (SPS, Gebäudeleitsystem, etc.) oder von PCs aus realisierbar.

Hier eine Auswahl von Geräten, die bereits mit Lexgate in Betrieb sind:
* [Engelmann Gateway](https://www.engelmann.de/de/gateway/)
* [EMU M-Bus Center](https://www.emuag.ch/produkte/emu-m-bus-datenlogger/)
* [JC Elektronika EthMBus-XL Smart](http://www.prevodniky.sk/product-EthMBus-XL-en.html)
* [Wago PFC100/PFC200](https://www.wago.com/ch-de/automatisierungstechnik/sps-entdecken)
* [Loxone Miniserver](https://shop.loxone.com/dech/miniserver.html)


#### HTTP-Gateway konfigurieren
Generell gilt für HTTP-Clients:
* Achten Sie darauf, dass der Client die Uhrzeit korrekt nachführt, da ansonsten Probleme mit der Verschlüsselung auftreten können.
* Übertragungen sind nur verschlüsselt (HTTPS) möglich; achten Sie darauf, die Verschlüsselung zu aktivieren wenn nötig.
* Ein Übermittlungsinterval von 60-120 Minuten ist optimal. Kürzere Intervalle können Plattformseitig nicht ausgewertet werden.
* Sofern möglich sollten Übertragungen immer zum vollen Intervall (z.b. volle Stunde) stattfinden.
* Übertragen Sie, wenn möglich, alle Daten in einem Aufruf, um die Leistung zu optimieren.
* Wählen Sie JSON oder XML als Datenformat.

Die URL zum Aufruf muss folgendes Format aufweisen: `https://api.lexgate.ch/v1/sources/{authentifizierungs-id}/`

#### FTP-Gateway konfigurieren
Generell gilt für FTP-Clients:
* Achten Sie darauf, dass der Client die Uhrzeit korrekt nachführt, da ansonsten Probleme mit der Verschlüsselung und der Übertragungszeit auftreten können.
* Ein Übermittlungsinterval von 60-120 Minuten ist optimal. Kürzere Intervalle können Plattformseitig nicht ausgewertet werden.
* Sofern möglich sollten Übertragungen immer zum vollen Intervall (z.b. volle Stunde) stattfinden.
* Wenn immer möglich, verwenden Sie das verschlüsselte Protokoll (FTPS).
* Übertragen Sie, wenn möglich, alle Daten in einer Datei, um die Leistung zu optimieren.
* Wählen Sie JSON oder XML als Datenformat.

Tragen Sie auf Ihrem Client als FTP-Server `ftp.lexgate.ch` ein. Die Logindaten finden Sie auf der Detailseite der Quelle unter {{<lga-lbl text="Hinweise">}}.


### Quellenadapter
Quellenadapter erlauben es, Geräte in Lexgate einzubinden, die eine serverseitige Logik erwarten. Zur Zeit stehen die folgenden Quellenadapter zur Verfügung:
* Akkumulierer: summiert eingehende Differenzwerte auf einen Zähler
* Session-Akkumulierer *ALPHA*: Autorisierung und akkumulierung mit einem einfachen Session-Protokoll.
* Zaptec Ladestation: Autorisierung und akkumulierung einer Ladestation von [Zaptec](https://novavolt.ch/ladesysteme-von-zaptec/)

Quellenadapter verarbeiten eingehende Anfragen und antworten darauf gemäss Herstellerprotokoll. Bei der Verarbeitung werden Zustände erzeugt oder aktualisiert, welche einen Zählerstand wiedergeben.

Diese Zustände werden immer zur vollen Stunde in einer Übertragung gespeichert, und können so ganz normal mit einer Zählereinheit erfasst werden.

#### Akkumulierer konfigurieren
Fügen Sie einen neuen Quellenadapter mit einem beliebigen Namen und dem {{<lga-lbl text="Typ">}} {{<lga-inp text="generic-accumulator">}} hinzu. 

Akkumulierer erwarten eine POST-Anfrage an den Endpunkt `https://api.lexgate.ch/v1/source-adapters/{authentifizierungs-id}`. Auf den Inhalt der Anfrage werden anschliessend die konfigurierten Filter angewandt. Findet der Filter einen Treffer, wird der {{<lga-lbl text="Tag">}}-Wert um den gefunden Wert erhöht.

Die Filtermuster sind gleich wie diejenigen für Zählereinheiten, welche [hier]({{<relref "../data-points#datenquelle">}}) detailiert erklärt werden.

#### Session-Akkumulierer konfigurieren
{{<notice info>}}
Session-Akkumulierer befinden sich zurzeit im ALPHA-Stadium und können jederzeit ohne Vorwarnung angepasst werden.
{{</notice>}}

Fügen Sie einen neuen Quellenadapter mit einem beliebigen Namen und dem {{<lga-lbl text="Typ">}} {{<lga-inp text="generic-session-accumulator">}} hinzu.

In der *ALPHA*-phase kann diese Art von Quellenadapter nur über die JSON-Konfiguration konfiguriert werden. Wechseln
Sie dazu zum Tab {{<lga-tab text="JSON">}}. Die Konfiguration verwendet folgendes Schema:
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

* Zum Starten einer Session erwartet der Session-Akkumulierer eine POST-Anfrage an folgenden Endpunkt: `https://api.lexgate.ch/v1/source-adapters/{authentifizierungs-id}/start`
* Während der Session können die Werte nachgeführt werden, damit der Verbrauch korrekt über die Zeit aufgezeichnet werden kann. Dazu empfängt der Session-Akkumulierer eine POST-Anfrage an: `https://api.lexgate.ch/v1/source-adapters/{authentifizierungs-id}/update`
* Zum Abschliessen der Session erwartet der Session-Akkumulierer eine POST-Anfrage an folgenden Endpunkt: `https://api.lexgate.ch/v1/source-adapters/{authentifizierungs-id}/end`

Das Protokoll ist [hier]({{< relref path="./generic-session-accumulator" lang="en" >}}) (englisch) ausführlich beschrieben.

#### Zaptec Ladestation konfigurieren
Fügen Sie einen neuen Quellenadapter mit einem beliebigen Namen und dem {{<lga-lbl text="Typ">}} {{<lga-inp text="zaptec-ev-charger">}} hinzu. Setzen Sie im Zaptec Portal unter Installationen > Ihre Installation > Einstellungen > Authentifizierung folgende Konfiguration:
* Auswahl: `Web hooks Authentifizierung`
* URL-Authentifizierung: ` ` (leer)
* Nutzdaten-Authentifizierung: ` ` (leer)
* URL Start Ladevorgang: `https://api.lexgate.ch/v1/source-adapters/{authentifizierungs-id}/start`
* URL Ende Ladevorgang: `https://api.lexgate.ch/v1/source-adapters/{authentifizierungs-id}/end`

Konfigurieren Sie nun die Ladestationen, welche eine Freigabe erwarten. Klicken Sie auf {{<lga-btn icon="add" text="Hinzufügen">}} in der obersten Zeile und setzen Sie {{<lga-lbl text="Ladestation-ID">}} (Zaptec Portal > Ladestationen > Ihre Ladestion > Einstellungen > ID (unterhalb von Name)) sowie einen beliebigen {{<lga-lbl text="Tag">}} und klicken Sie {{<lga-btn icon="add" text="Erstellen">}}. Der Verbrauch dieser Ladestation wird nun auf den Tag akkumuliert.

Konfigurieren Sie als nächstes die Badges, welchen Sie die Freigabe erteilen möchten. Klicken Sie auf {{<lga-btn icon="add" text="Hinzufügen">}} in der Spalte ganz Links und setzen Sie {{<lga-lbl text="Token">}} (die UID des Badges, ohne `:`) sowie einen beliebigen {{<lga-lbl text="Tag">}} und klicken Sie {{<lga-btn icon="add" text="Erstellen">}}. Der Verbrauch dieses Badges wird nun auf den Tag akkumuliert.

Setzen Sie nun jeweils ein Häckchen in den Zellen, um dem entsprechenden Badge auf der Ladestation die Berechtigung zu erteilen. Falls Sie keine Badge-Authorisierung wünschen, können Sie das Häckchen beim `*` setzen. Damit werden alle Ladeanfragen authorisiert und nur auf den Ladestation-Tag rapportiert.

### Übertragungen prüfen
Sobald die ersten Übertragungen ihrer Quellen oder Quellenadapter eintreffen, werden diese unter {{<lga-nav text="Übertragungen">}} angezeigt.

Der Tab {{<lga-tab text="Allgemeine Informationen">}} zeigt Ihnen Metadaten zur entsprechenden Übertragung an. Unter {{<lga-tab text="Übertragungsdaten">}} sehen Sie den Inhalt der Übertragung.