---
title: "Document Templates"
date: 2020-01-03T13:00:00
lastmod: 2021-09-16T13:21:00
weight: 0202
draft: false
keywords: ["templates", "document"]
---

### Template Libraries
Document Templates are organized in Template Libraries. Users can be granted access to manage a Library and it's Templates.

#### Manage
Template Libraries can be changed by clicking the {<lga-btn type="negative" icon="edit">}}-icon next to the name.

Switch to tab {{<lga-tab text="Users">}} to add permitted Users. Please note, that Users with the Role “Viewer” can not change the Library or Templates within it.

### Document
{{<notice info>}}
Document Templates are written as [HTML-Code](https://en.wikipedia.org/wiki/Hypertext_Markup_Language) (Hypertext Markup Language). In this manual we assume that you know the basics of HTML-Coding.
If you do not, you can contact your Integrator to create and change Templates.
{{</notice>}}

#### Create
A new Document Template can be created with the Button {{<lga-btn type="negative" icon="add" text="Add">}}.

#### Content
The content is defined as HTML code. [Handlebars](https://handlebarsjs.com/guide/) is used as template engine. Handlebars fills the content to the Template. The available content depends on the Documents Type. You should adapt one of the default templates rather than create a fresh one.

To learn how to work with the Template Engine, check the [Handlebars Reference]({{<relref "/document-management/document-templates/handlebars-reference">}}).

#### Localization
Templates have support for multiple languages, which is provided by a Mustache-function. You can create a translatable string like this:

* In the Template content call the localization function with the localization key, for example:
```handlebars
{{translate "Date"}}  
```

* The key is detected and listed in {{<lga-tab text="Localization">}}. You can add the translation for the required languages.