---
title: "Dokumentvorlagen"
date: 2020-01-02T13:00:00
lastmod: 2021-09-16T13:21:00
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
Dokumentvorlagen werden in sogenanntem [HTML-Code](https://de.wikipedia.org/wiki/Hypertext_Markup_Language) (Hypertext Markup Language) geschrieben. In dieser Anleitung wird davon ausgegangen, dass Sie Grundlegende HTML-Kentnisse beherrschen. Sollte dies nicht der Fall sein, können Sie zum Erstellen und Anpassen von Vorlagen Ihren Integrator kontaktieren.
{{</notice>}}

#### Erstellen
Eine neue Dokumentvorlage kann mit dem Button {{<lga-btn type="negative" icon="add" text="Hinzufügen">}} angelegt werden.

#### Inhalt
Der Inhalt einer Vorlage wird in HTML erstellt. Als Template Engine wird [Handlebars](https://handlebarsjs.com/guide/) verwendet. Handlebars füllt den eigentlichen Inhalt in die erstellte Vorlage ab. Der Inhalt hängt von der Dokumentart ab. Es wird empfohlen, dass Sie sich beim Erstellen einer Vorlage an den vorgegeben Standartvorlagen orientieren.

Um zu lernen, wie Sie mit der Template Engine arbeiten können, sehen Sie sich die [Mustache Funktionsreferenz (en)]({{<relref "/document-management/document-templates/handlebars-reference">}}) an.

#### Lokalisierung
Vorlagen unterstützen Mehrsprachigkeit mit einer Mustache-Funktion. Dies funktioniert wie folgt:

* Im Inhalt wird ein Aufruf zur Lokalisierungsfunktion mit dem lokalisierenden Schlüssel gemacht, zum Beispiel:
```handlebars
{{translate "Date"}}  
```

* Der Schlüssel wird erkannt und im Tab {{<lga-tab text="Lokalisierung">}} aufgeführt. Für die benötigen Sprachen kann nun eine Übersetzung hinzugefügt werden.

