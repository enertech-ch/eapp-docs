---
title: "Dokumente"
date: 2020-01-02T13:00:00
lastmod: 2020-02-02T13:00:00
weight: 0201
draft: false
keywords: ["verwaltung", "templates", "vorlagen", "pdf"]
---

### Ordner
Dokumente sind in Ordnern organisiert. Ausserdem können Benutzerberechtigungen über einen Ordner gesteuert werden.

#### Erstellen
Um einen Ordner zu erstellen, klicken Sie in der Ordnerleiste auf der linken Seite in das Feld {{<lga-lbl text="Text eingeben um hinzuzufügen">}} und geben Sie den Namen des Ordners ein. Mit einem Klick auf den Button {{<lga-btn type="negative" icon="add">}} kann der Ordner nun erstellt werden.

#### Verwalten
Ordner können mit einem Klick auf das neben dem Namen angezeigten {{<lga-btn type="negative" icon="edit">}}-Icons bearbeitet werden.

Unter dem Tab {{<lga-tab text="Benutzer">}} können weitere berechtigte Benutzer hinzugefügt werden. Beachten Sie, dass Benutzer mit der Rolle "Betrachter" (Viewer) weder den Ordner noch die darin befindlichen Dokumente bearbeiten können.

### Dokumente

#### Erstellen
Dokumente werden in Lexgate automatisch erstellt. Diese können nicht "händisch" erstellt und ausgefüllt werden. In dieser Dokumentation finden Sie unter [Projektverwaltung → Abrechnungen erstellen]({{<relref "/project-management/utility-bill">}}) eine Anleitung, wie Abrechnungen erstellt werden können.

#### Filtern
Dokumente können nach diversen Inhalten gefiltert werden, abhängig von ihrer Art. Dies geschieht mit den Eingabefeldern im Listenkopf.

Sollen hingegen nur Dokumente aus einem Ordner angezeigt werden, kann der Ordner auf der linken Seite ausgewählt werden. Wird nach Ordner gefiltert, wird der ausgewählte Ordner grau hinterlegt. Der Filter kann mit einem zweiten Klick wieder aufgehoben werden.

#### Verwalten
Gewisse Eigenschaften von Dokumenten können bearbeitet werden:
* {{<lga-lbl text="Status">}}: Mit dem Status-Feld können Sie einfach den aktuellen Status des Dokuments festlegen und prüfen.
* {{<lga-lbl text="Entwurf">}}: Solange ein Dokument im "Entwurf" ist, kann der Inhalt bearbeitet werden. Zum Drucken muss der "Entwurf" entfernt werden, das Dokument kann anschliessend aber auch nicht mehr verändert werden.
* {{<lga-lbl text="Name">}}: Ein beliebiger Name für das Dokument; wird nur innerhalb von Lexgate verwendet.
* {{<lga-lbl text="Art">}}: Die Art des Dokuments; diese wird beim Generieren festgelegt und kann nicht verändert werden.
* {{<lga-lbl text="Vorlage">}}: Die Vorlage, welche das Erscheinungsbild des Dokuments festlegt. Siehe auch [Dokumentverwaltung → Dokumentvorlagen]({{<relref "../document-templates">}}).
* {{<lga-lbl text="Sprache">}}: Die Sprache des Dokuments. Damit eine Sprache ausgewählt werden kann, muss diese in der Dokumentvorlage festgelegt sein.
* {{<lga-lbl text="Empfänger">}}: Der Empfänger des Dokuments. Wird normalerweise im Adressfenster verwendet.
* {{<lga-lbl text="Kreditor">}}: Wird nur benötigt, wenn es sich um eine Rechnung handelt: Der Zahlungsempfänger für den Einzahlungsschein.
* {{<lga-lbl test="Absender">}}: Der Absender des Dokuments. Wird normalerweise oben rechts angezeigt.

Desweiteren kann auch der Inhalt des Dokuments angepasst werden. Welche Inhalte dabei anpassbar sind hängt vom Typ und vo der Vorlage ab.

#### Aktionen
Für ein Dokument gibt es mehrere Aktionen:
* {{<lga-btn icon="edit" text="Aktualisieren">}}: Speichert die vorgenommenen Änderungen.
* {{<lga-btn icon="visibility" text="Vorschau">}}: Zeigt das Dokument mit den veränderten Inhalten, jedoch ohne zu speichern.
* {{<lga-btn icon="download" text="Export">}}: Speichert die vorgenommen Änderungen und lädt das Dokument als PDF-Datei herunter.

#### Drucken
Die Dokumente aus Lexgate können als PDF exportiert und anschliessend gedruckt werden.

Wechseln Sie zur Dokumentliste und gehen Sie wie folgt vor:
* Wählen Sie die zu druckenden Dokumente aus.
* Klicken Sie den Button {{<lga-btn type="negative" icon="download" text="Export">}} in der Aktionsliste oben.
* Drücken Sie {{<lga-btn icon="download" text="Export">}} im sich öffnenden Dialog.
    * Falls Dokumente noch im Entwurf sind, können diese automatisch finalisiert werden. Setzen Sie dazu das entsprechende Häckchen.
    * Falls Sie mit dem Export den Dokument-Status ändern möchten, können Sie den neuen Status im Feld {{<lga-lbl text="Status">}} tun.
* Es wird nun eine ZIP-Datei heruntergeladen, in welcher sich die PDF-Dokumente befinden.
* Öffnen Sie ein PDF-Datei und wählen Sie "Drucken". Wählen Sie ihren Drucker aus und setzen versichern Sie sich, dass sie in "Tatsächliche Grösse" drucken.

Falls Sie eine grosse Anzahl Dokumente drucken müssen, und nicht jedes einzelne Dokument öffnen wollen, können Sie unter Windows wie folgt vorgehen:
* Kopieren Sie alle Deteien aus der Zip-Datei in einen neuen Order, zum Beispiel auf Ihren Desktop.
* Wählen Sie bis zu 15 Dateien aus, machen Sie einen Rechtsklick auf die ausgewählten Dateien und klicken Sie im Kontextmenü auf *Drucken*.