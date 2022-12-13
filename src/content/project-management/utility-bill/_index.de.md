---
title: "Abrechnungen erstellen"
date: 2020-01-26T13:00:00
lastmod: 2020-01-26T13:00:00
weight: 301
draft: false
keywords: ["nebenkosten", "abrechnung", "erstellen", "kosten", "position", "vertrag", "verträge", "periode"]
---

In Lexgate können Sie mit wenigen Schritten die periodische Nebenkostenabrechnung generieren.

### Voraussetzungen

Voraussetzung dafür ist, dass die Kostenstellen im Projekt korrekt eingerichtet sind. Weitere Informationen zum Einrichten der Kostenstellen sind [hier]({{<relref "/project-creation/accounting-structure">}}) zu finden.

### Abrechnungsperiode
Eine Abrechnungsperiode definiert die Zeitdauer, die für eine Abrechnung berücksichtigt werden soll.

Diese kann im Menüpunkt {{<lga-nav text="Abrechnungsperiode">}} erstellt werden, indem auf den {{<lga-btn type="negative" icon="add">}}-Button geklickt wird und die benötigten Angaben ausgefüllt werden:
* {{<lga-lbl text="Name">}}: Ein frei wählbarer Name für die Abrechnungsperiode.
* {{<lga-lbl text="Nachfolgende Periode automatisch erstellen">}}: Wenn angewählt, wird die nachfolgende Abrechnungsperiode automatisch erstellt. Siehe [Details]({{<relref "#abrechnungsperiode-erneuern">}})
* {{<lga-lbl text="Start date">}}: Erster Tag der Abrechnungsperiode. Dies sollte der erste Tag sein, nachdem die vorherige Periode geendet hat (normalerweise der Erste des Monats).
* {{<lga-lbl text="Start date">}}: Letzter Tag der Abrechnungsperiode. Dies sollte der letzte Tag sein, bevor die nächste Periode beginnt (normalerweise der Letzte des Monats).

In der nachfolgenden Liste kann eingeschränkt werden, welche Kostenstellen für die Abrechnungen verwendet werden sollen:
* **Versorger**: Anwählen, wenn die Kostenstelle in Dokumenten als Versorger aufgeführt werden soll. 
* **Verbraucher**: Anwählen, wenn für die Kostenstelle ein Dokument generiert werden soll.
* **Akonto**: Eingeben, welcher Wert im Dokument in das *Akonto*-Feld eingefüllt werden soll.

#### Nachfolgende Perioden automatisch erstellen {#abrechnungsperiode-erneuern}
Wenn das Kästchen {{<lga-lbl text="Nachfolgende Periode automatisch erstellen">}} angewählt ist, wird die Folgeperiode am ersten Tag nach der gültigen Periode erstellt.
Dabei werden alle Angaben kopiert und der Name mit einem ⎘-Symbol ergänzt.

Wenn der {{<lga-lbl text="Name">}} eines oder mehrere der folgenden Muster enthält, wird er automatisch aktualisiert:
* **Jahr** [nnnn] (*2017* oder *2019*):    Sofern die Periode länger als 188 Tage ist, wird jede Zahl zwischen 2001 und 2099 um 1 erhöht.
* **Jahr-Versatz** [nnnn-n|nnnn.n] (*2018-1* oder *2019.4*):   Sofern die Periode zwischen 1 und 187 Tagen lang ist, wird der Versatz um 1 erhöht.
  Dabei wird das obere Limit des Versatz aus der Periodenlänge festgestellt. Beispiel: Wenn die Periode 3 Monate lang ist, welche somit 4 mal Platz hat in einem Jahr, ist das obere Limit 4.
  Wenn das obere Limit erreicht ist, wird bei der nächsten Erhöhung der Versatz auf 1 gesetzt, und die Jahrzahl um 1 erhöht. Beispiel: Aus *2019-4* wird *2020-1*.
* **Zähler** [#n] (*#1* oder *#3456*):   Wenn das *#*-Zeichen, gefolgt von einer beliebigen Nummer, im Namen erkannt wird, wird die Nummer um 1 erhöht.
  Dies entspricht dem Standartverhalten, falls im Namen kein zählbarer Wert gefunden wird.


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
