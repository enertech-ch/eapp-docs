---
title: "Abrechnungen erstellen"
date: 2020-01-26T13:00:00
lastmod: 2020-01-26T13:00:00
weight: 301
draft: false
keywords: ["nebenkosten", "abrechnung", "erstellen", "kosten", "position", "vertrag", "verträge", "periode"]
---

In Lexgate können Sie mit wenigen Schritten die periodischen Nebenkostenabrechnung generieren. Voraussetzung dafür ist, dass die Kostenstellen im Projekt korrekt eingerichtet sind. Weitere Informationen zum Einrichten der Kostenstellen sind [hier]({{<relref "/project-creation/accounting-structure">}}) zu finden.

### Abrechnungsperiode
Eine Abrechnungsperiode definiert die Zeitdauer, die für eine Abrechnung berücksichtgt werden soll. Diese kann im Menüpunkt {{<lga-nav text="Abrechungsperiode">}} erstellt werden.

Sobald eine Abrechnungsperiode für eine Nebenkostenabrechnung verwendet wurde, kann diese nicht mehr verändert werden.

### Kostenpositionen
Als nächstes muss Lexgate wissen, welche Kosten es für die Abrechnung berücksichtigen soll. Dazu können Sie Rechnungen unter {{<lga-nav text="Kostenpositionen">}} auf eine Kostenstelle buchen:
* {{<lga-lbl text="Titel">}}: Ein frei wählbarer Titel für die Rechnung.
* {{<lga-lbl text="Datum">}}: Das Datum der Rechnung (für Lexgate irrelevant).
* {{<lga-lbl text="Betrag">}}: Der Rechnungsbetrag; falls es sich um eine Gutschrift handelt, geben Sie den Betrag mit einem Minus davor ein ({{<lga-inp text="-25.50">}}).
* {{<lga-lbl text="Kostenstelle">}}: Die Kostenstelle, über welche der Betrag verteilt werden soll.
* {{<lga-lbl text="Abrechnungsperiode">}}: Die Abrechnungsperiode, in welcher der Betrag verteilt werden soll.

### Verträge
Für Kostenstellen, welche Abrechnungen erhalten sollen, können Sie Verträge hinterlegen. Das erspart ihnen die wiederkehrende Eingabe von Hand beim generieren der Abrechnung.

* {{<lga-lbl text="Beginn">}}: Der Tag, ab dem ein Vertrag gültig ist.
* {{<lga-lbl text="Ende">}}: Der Tag, an dem der Vertrag ausläuft. Normalerweise der Vortag zum Beginn des nachfolgenden Vertrags. Kann auch leer gelassen werden, falls der Vertrag auf unbestimmte Zeit läuft.
* {{<lga-lbl text="Kostenstelle">}}: Die Kostenstelle, welche als Grundlage für den Vertrag dienen soll. Zum Beispiel die bewohne Wohnung oder der gemietete Parkplatz.
* {{<lga-lbl text="Kontakt">}}: Der Kontakt, welcher den Vertragspartner darstellt. Zum Beispiel der Eigentümer oder Mieter des Objekts.
* {{<lga-lbl text="Gruppenberechigung setzen">}}: Automatisch eine die Berechtigung für den Kontakt auf die Gruppe erteilen. An den Kontakt angehängte Benutzer können mit dieser Berechtigung die Analyse einsehen.

### Abrechnungen generieren
Nun haben Sie alle Vorbereitungen für das Erstellen der Abrechnung abgeschlossen. Wechseln Sie nun in zum Menüpunkt {{<lga-nav text="Verbrauchsabrechnung">}} und setzen Sie die Parameter zur Abrechnung:

* {{<lga-lbl text="Art">}}: Die Art des zu generierenden Dokuments:
    * {{<lga-inp text="Verbrauchsmeldung">}}: Eine detailierte Übersicht des Verbrauchs, jedoch ohne Kostenstellenaufschlüsselung.
    * {{<lga-inp text="Verbrauchsabrechnung">}}: Eine Abrechnung der Kosten gemäss Kostenstellenstruktur.
* {{<lga-lbl text="Abrechnungsperiode">}}: Die gewünschte Abrechnungsperiode.
* {{<lga-lbl text="Vorlage">}}: Die zu verwendente Dokumentvorlage.
* {{<lga-lbl text="Ordner">}}: Der Ordner, in welchem die neuen Dokumente abgelegt werden.
* {{<lga-lbl text="Absender">}}: Der Absender wird automatisch beim Dokument gesetzt, falls ausgewählt.
* {{<lga-lbl text="Kreditor">}}: Der Kreditor wird automatisch beim Dokument gesetzt, falls ausgewählt.
* {{<lga-lbl text="Verbrauchsperiode aus Verträgen">}}: Falls gewählt, werden die Verbrauchsperioden automatisch den eingegeben Verträgen entnommen. Ist für eine Kostenstelle in der gewählten Periode kein Vertrag vorhanden, wird auch keine Abrechnung generiert.

Unterhalb der Eingabefelder wird eine Tabelle erzeugt, welche alle Verträge, die dazugehörige Kostenstelle und die ermittelten Kosten aufzeigt. Anhand dieser Übersicht können Sie die berechneten Kosten überprüfen.

Falls die Kosten korrekt verteilt wurden, können Sie nun die Dokumente mit dem Button {{<lga-btn text="Generieren">}} erzeugen. Dies kann pro Dokument bis zu 3 Sekunden dauern. Weitere Informationen, wie Sie die Dokumente weiterverarbeiten können, finden Sie unter [Dokumentverwaltung]({{<relref "/document-management/documents">}}).