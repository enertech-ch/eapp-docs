---
title: "Dokumentvorlagen"
date: 2020-01-02T13:00:00
lastmod: 2020-02-02T13:00:00
weight: 0202
draft: false
keywords: ["templates", "dokument", "vorlagen"]
---

### Vorlagenbliotheken
Dokumentvorlagen sind in Vorlagenbibliotheken organisiert. Ausserdem können Benutzerberechtigungen über eine Vorlagenbibliothek gesteuert werden.

#### Verwalten
Vorlagenbibliotheken können mit einem Klick auf das neben dem Namen angezeigten {{<lga-btn type="negative" icon="edit">}}-Icons bearbeitet werden.

Unter dem Tab {{<lga-tab text="Benutzer">}} können weitere berechtigte Benutzer hinzugefügt werden. Beachten Sie, dass Benutzer mit der Rolle "Betrachter" (Viewer) weder die Bibliothek noch die darin befindlichen Vorlagen bearbeiten können.

### Dokumentvorlagen
{{<notice info>}} 
Dokumentvorlagen werden in sogenanntem [HTML-Code](https://de.wikipedia.org/wiki/Hypertext_Markup_Language) (Hypertext Markup Language) geschrieben. In dieser Anleitung wird davon ausgegangen, dass Sie Grundlegende HTML-Kentnisse beherschen. Sollte dies nicht der Fall sein, können Sie zum Erstellen und Anpassen von Vorlagen Ihren Integrator kontaktieren.
{{</notice>}}

#### Erstellen
Eine neue Dokumentvorlage kann mit dem Button {{<lga-btn type="negative" icon="add" text="Hinzufügen">}} angelegt werden.

#### Inhalt
Der Inhalt einer Vorlage wird in HTML erstellt. Als Template Engine wird [Mustache](https://mustache.github.io/) verwendet. Mustache füllt den eigentlichen Inhalt in die erstellte Vorlage ab. Der Inhalt hängt von der Dokumentart ab. Es ist stark zu empfehlen, dass Sie sich beim Erstellen einer Vorlage an den vorgegeben Standartvorlagen orientieren.

Dank Mustache können in Dokumenten Variablen ausgegeben sowie über Objekte iteriert werden. Zusätzlich wird mit die Syntax mit einigen Lexgate-spezifischen Funktionen ergänzt. Die detailierte Spezifikation ist hier zu finden:
[Mustache Funktionsreferenz]({{<relref "/document-management/document-templates/mustache-functions-reference">}})

#### Lokalisierung
Vorlagen unterstützen Mehrsprachigkeit mit einer Mustache-Funktion. Dies funktioniert wie folgt:

* Im Inhalt wird ein Aufruf zur Lokalisierungsfunktion mit dem lokalisierenden Schlüssel gemacht, zum Beispiel:
```html
{{#fn}}<translate key="Date">{{#fn}}  
```

* Der Schlüssel wird erkannt und im Tab {{<lga-tab text="Lokalisierung">}} aufgeführt. Für die benötigen Sprachen kann nun eine Übersetzung hinzugefügt werden.

