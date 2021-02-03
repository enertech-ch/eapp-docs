---
title: "Datenpunkte"
date: 2020-01-26T13:00:00
lastmod: 2020-01-26T13:00:00
weight: 1002
draft: false
keywords: ["datenpunkt", "gruppe", "gruppen", "tarif", "tarife", "zähler", "zählereinheit","zählereinheiten"]
---
Sobald Ihr Lexgate-Projekt erfolgreich Übertragungen empfängt, können Sie damit beginnen, Ihre Datenpunkte einzurichten.


### Logische Struktur
Gruppen und Zähler sollen die logische Struktur der Liegenschaft abbilden. Diese soll grösstenteils der physikalischen Struktur entsprechen, aber in einigen Sonderfällen kann es auch Sinn machen, leicht von dieser abzuweichen.


#### Gruppen
Eine Gruppe stellt eine Sammlung von anderen Gruppen und Zählern dar. Das einfachste Beispiel für eine Gruppe ist eine Wohnung. Eine Wohnung beinhaltet in der Regel mehrere Zähler. Der Gruppe "Wohnung" übergeordnet könnte eine weitere Gruppe "Gebäude" sein.

Eine Gruppenstruktur für eine einfache Liegenschaft könnte also wie folgt aussehen:
{{<lga-struct type="group" name="Liegenschaft Musterstrasse">}}
    {{<lga-struct type="group" name="Musterstrasse 1">}}
        {{<lga-struct type="group" name="Wohnung 11" />}}
        {{<lga-struct type="group" name="Wohnung 12" />}}
    {{</lga-struct>}}
    {{<lga-struct type="group" name="Musterstrasse 2">}}
        {{<lga-struct type="group" name="Wohnung 21" />}}
        {{<lga-struct type="group" name="Wohnung 22" />}}
    {{</lga-struct>}}
    {{<lga-struct type="group" name="Musterstrasse 3">}}
        {{<lga-struct type="group" name="Wohnung 31" />}}
        {{<lga-struct type="group" name="Wohnung 32" />}}
    {{</lga-struct>}}
{{</lga-struct>}} 


#### Zähler
Die physikalischen Messeinrichtungen im Objekt werden in Lexgate als Zähler bezeichnet. Pro Messeinrichtungen muss ein Zähler-Equivalent in Lexgate erfasst werden. Den Namen des Zählers können Sie frei wählen, dieser sollte aber innerhalb der Gruppe eindeutig sein.
{{<lga-struct type="group" name="Liegenschaft Musterstrasse">}}
    {{<lga-struct type="group" name="Musterstrasse 1">}}
        {{<lga-struct type="group" name="Wohnung 11">}}
            {{<lga-struct type="meter" name="Heizung" />}}
            {{<lga-struct type="meter" name="Warmwasser" />}}
        {{</lga-struct>}}
        {{<lga-struct type="group" name="Wohnung 12">}}
            {{<lga-struct type="meter" name="Heizung" />}}
            {{<lga-struct type="meter" name="Warmwasser" />}}
        {{</lga-struct>}}
    {{</lga-struct>}}
{{</lga-struct>}}


### Zählereinheiten
Zählereinheiten verbinden Datenerfassung und Struktur. Für jede zu messende Einheit muss eine Zählereinheit erstellt werden und dem Zähler zugeordnet werden. Mit einem definierbaren Filter werden die Werte jeweils aus der Übertragung exportiert. Diese exportieren Werte werden in Lexgate Aufzeichnungen genannt.


#### Struktur
Für die Struktur werden Zählereinheiten mit einem passenden Namen versehen, zum Beispiel:
{{<lga-struct type="group" name="Liegenschaft Musterstrasse">}}
    {{<lga-struct type="group" name="Musterstrasse 1">}}
        {{<lga-struct type="group" name="Wohnung 11">}}
            {{<lga-struct type="meter" name="Heizung">}}
                {{<lga-struct type="unit" name="Energiebezug" />}}
                {{<lga-struct type="unit" name="Vorlauftemperatur" />}}
                {{<lga-struct type="unit" name="Rücklauftemperatur" />}}
                {{<lga-struct type="unit" name="Durchfluss" />}}
            {{</lga-struct>}}    
        {{</lga-struct>}}
    {{</lga-struct>}}
{{</lga-struct>}}


#### Datenquelle
Bei Zählereinheiten muss die Datenquelle angegeben werden. Diese wird mit mehrerer Parametern konfiguriert:

* {{<lga-lbl text="Quelle">}}: Die Quelle, aus der die Übertragungen gefiltert werden sollen.

* {{<lga-lbl text="Filtertyp Quelle">}}: Als Filtertypen stehen drei Einstellungen zur Verfügung:
    * JsonPath: für Übertragungen im JSON-Format 
    * XPath: für Übertragungen im XML-Format
    * Regex: Nur für Experten. Erlaubt das Filtern mittels [Regular Expression](https://de.wikipedia.org/wiki/Regul%C3%A4rer_Ausdruck).

* {{<lga-lbl text="Filterstring Quelle">}}: Der anzuwendene Filterstring. Siehe Beispiele für [JsonPath]() und [XPath]()

Als nächstes muss konfiguriert werden, in welcher Einheit die eingehenden Daten skaliert sind. Diese Skalierung muss derjenigen entsprechen, die später für die Abrechnung verwendet werden soll. Im Optimalfall schickt der Gateway die Daten bereits korrekt skaliert; sollte dies nicht der Fall sein, muss der Normalisierungsfaktor entsprechend angepasst werden.

* {{<lga-lbl text="Symbol">}}: Das Einheitssymbol der übermittelten Zählereinheit, zum Beispiel {{<lga-inp text="kWh">}} oder {{<lga-inp text="m³/h">}}.

* {{<lga-lbl text="Symbolname">}}: Der ausgeschriebene Name des Einheitssymbols, zum Beispiel {{<lga-inp text="Kilowattstunden">}} oder {{<lga-inp text="Kubikmeter">}}.

* {{<lga-lbl text="Normalisierungsfaktor">}}: Der Faktor, welcher auf den in der Übertragung gefundenen Wert angewandt wird, bevor dieser in der Datenbank abgelegt wird. Falls der Gateway zum Beispiel den Wasserbrauch in Litern verschickt, Sie diesen aber in Kubikmetern abrechnen möchten, geben Sie hier {{<lga-inp text="0.001">}} ein.

* {{<lga-lbl text="Wird überwacht">}}: Einstellung, ob die Zählereinheit im Health-Check berücksichtigt werden soll.


#### Darstellung
In der Analyse werden die aufgezeichneten Zählerdaten angezeigt. Möglicherweise entspricht die Skalierung der Aufzeichnung aber nicht der gewünschten Skalierung für die Darstellung. Deshalb kann nun eine Skalierung für die Darstellung auf der Plattform gesetzt werden. Abrechnungsrelevante Funktionen ignorieren diese Einstellung.

* {{<lga-lbl text="Werttyp">}} {{<lga-inp text="Akkumuliert">}}: Die Standarteinstellung für Zähler. In den Diagrammen werden Differenzen angezeigt (Energiebezug, Wasserbezug). {{<lga-inp text="Absolut">}}: In den Diagrammen werden die absoluten Werte angezeigt (Temperaturen, Durchfluss).

* {{<lga-lbl text="Anzeigesymbol">}}: Das Einheitssymbol nach Anwendung des Anzeigefaktors.

* {{<lga-lbl text="Anzeigesymbol">}}: Der ausgeschriebene Name des Einheitssymbols nach Anwendung des Anzeigefaktors.

* {{<lga-lbl text="Anzeigefaktor">}}: Der Faktor, welcher angewendet werden soll wenn der in der Datenbank gespeicherte Wert angezeigt wird. Wird nicht auf abrechnungsrelevante Anzeigen angewandt.

Eine zentrale Funktion von Lexgate ist die Darstellung von Aufzeichnungen in Statistiken. Hierfür können ebenfalls einige Parameter gesetzt werden:

* {{<lga-lbl text="Art">}}: Anzeigeart der Aufzeichnung.

* {{<lga-lbl text="Farbe">}}: Primäre Farbe der Zählereinheit im Diagramm.

* {{<lga-lbl text="Füllfarbe">}}: Füllfarbe der Zählereinheit im Diagramm (nur für Arten Fläche, Splinefläche und Säule)


#### Zählereinheiten mit mehreren Tarifen
Lexgate unterstützt Zählereinheiten, welche zur Abrechnung einen festgelegten Tarif pro Einheit verwenden. Dabei können derselben Zählereinheit auch mehrere Tarife konfiguriert werden, zum Beispiel ein Normal- und ein Spitzentarif bei einem Elektrozähler.

Erstellen Sie zuerst einen oder mehrere Tarife unter dem Menüpunkt {{<lga-nav text="Tarife">}}.

Erfassen Sie dann eine Zählereinheit wie oben beschrieben. Wechseln Sie nach der Erstellung der Zählereinheit auf den Tab {{<lga-tab text="Tarife">}}. Wählen Sie nun einen {{<lga-lbl text="Tarif">}} aus und konfigurieren Sie den dazugehörigen Filter. Wiederholen Sie dies für jeden Tarif, welcher bei der ausgewählten Zählereinheit aufgezeichnet werden soll.


#### Aufzeichnungen
Sobald eine Zählereinheit erstellt ist, wird deren Filter auf jede neu eintreffende Übertragung angewandt. Auf der Detailansicht der Zählereinheit finden Sie den Tab {{<lga-tab text="Zählereinheiten">}}, in welcher Sie eine Liste mit allen aufgezeichneten Werten finden.

Falls Sie Werte aus Übertragungen, die bereits vor der Erstellung der Einheit eingengangen sind, ebenfalls benötigen, können Sie Lexgate anweisen, für die entsprechenden Einheiten die Übertragungen erneut zu verarbeiten. Klicken Sie dazu in der Projektnavigation auf {{<lga-nav text="Zählereinheiten">}}, wählen Sie die erneut zu verarbeitenden Zählereinheiten an und klicken Sie auf {{<lga-btn type="negative" icon="update" text="Übertragungen erneut verarbeiten">}}.


### Zähler ersetzen
Messgeräte im Feld müssen gelegentlich ersetzt werden, zum Beispiel bei einem Defekt oder einer Erneuerung. Lexgate stellt Ihnen dazu für Zähler und Zählereinheiten unter dem Tab {{<lga-tab text="Lebenszyklus">}} entsprechende Funktionalität zur Verfügung. Damit sind Zählerwechsel auch während einer Abrechnungsperiode möglich.

Im Normalfall ersetzen Sie einen Zähler mit einem neuen, noch nicht in Lexgate erfassten Pendant. Dann können Sie wie folgt vorgehen:
* Füllen Sie die Eingabefelder {{<lga-inp text="Inkrafttreten">}} unter *Nachfolger setzen* aus.
* Wählen Sie diejenigen Zählereinheiten aus, welche auch beim Nachfolger verfügbar sein sollen.
* Klicken Sie {{<lga-btn  icon="add" text="Erstellen">}}
* Passen Sie im Formular die geänderten Daten für den Nachfolger an und klicken Sie {{<lga-btn icon="add" text="Erstellen">}}
* Der Nachfolger wurde nun erstellt. Mit einem Klick auf den Eintrag unter *Nachfolger* gelangen Sie direkt zum neuen Zählereintrag.

{{<notice warning>}}Zähler und Zählereinheiten, bei welchen ein Nachfolger registriert wurde, werden an den meisten Stellen nicht mehr aufgelistet. Sie können auf diese aber weiterhin im Tab {{<lga-tab text="Lebenszyklus">}} des Nachfolgers zugreifen. {{</notice>}}
