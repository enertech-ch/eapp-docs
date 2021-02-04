---
title: "Documents"
date: 2020-01-03T13:00:00
lastmod: 2020-02-03T13:00:00
weight: 0201
draft: false
keywords: ["Manage", "documents", "templates", "pdf"]
---

### Folders
Documents are organized in Folders. Users can be granted access to manage Folders and Documents.

#### Create
To Create  Folder, click the field {{<lga-lbl text="Start typing to add">}} in the Folders bar on the left side and fill in the name of the Folder.

#### Manage
Folder can be changed by clicking the {{<lga-btn type="negative" icon="edit">}}-icon next to the name.

Switch to tab {{<lga-tab text="Users">}} to add permitted Users. Please note, that Users with the Role "Viewer" can not change the Folder or Documents within it.

### Documents

#### Create
Documents are created automatically within Lexgate. They can not be created and filled manually. In this documentation you can find a manual how to create Utility Bills in [Project Management → Create Utility Bill]({{<relref "/project-management/utility-bill">}}).

#### Filter
Documents can be filtered by various fields, depending on it's type. You can Filter with the Inputs on the top of the list.

#### Manage
Several properties of Documents can be changed:
* {{<lga-lbl text="Status">}}: With the Status field you can set and check the current status.
* {{<lga-lbl text="Draft">}}: While a Document is a Draft, it's content can be changed. To print a Document it's neccessary to remove the "Draft".
* {{<lga-lbl text="Name">}}: A user definied name for the Document; is only used within Lexgate.
* {{<lga-lbl text="Type">}}: The Type of the Document; the type is set when generating a Document and immutable.
* {{<lga-lbl text="Template">}}: The Template, which defines the appearance for the Document. See [Document Management → Document Templates]({{<relref "../document-templates">}}).
* {{<lga-lbl text="Language">}}: The Language of the Document. Only Languages, which are defined in the Document Template, are available.
* {{<lga-lbl text="Receiver">}}: The Documents receiver. This is usually used for the address windows.
* {{<lga-lbl text="Creditor">}}: Only for invoices: The payment receiver for the payment slip.
* {{<lga-lbl text="Sender">}}: The Documents sender. Is usually shown in the top left corner.

It's also possible to change contents of the Document. Which content is changeable depends on it's Type and Template.

#### Actions
There are multiple actions for a Document:
* {{<lga-btn icon="edit" text="Update">}}: Save the changes.
* {{<lga-btn icon="visibility" text="Preview">}}: Show the document with the updated content, but without saving it.
* {{<lga-btn icon="download" text="Export">}}: Save the changes and downloads the Document as PDF file.

#### Print
Documents from Lexgate can be exported as PDF and then printed.

Change to the Documents list and follow this steps:
* Select the Documents to print.
* Click the button {{<lga-btn type="negative" icon="download" text="Export">}} in the action list on the top.
* Click {{<lga-btn icon="download" text="Export">}} in the dialog.
    * If some Documents currently are Drafts, you can finalize them by checking the option.
    * If you want to update the Status of all selected Documents, you can set the new Status in the {{<lga-lbl text="Status">}}-Input.
* The download of a ZIP-File starts, which contains the PDF-documents.
* Once the download is finished, open a PDF and click "Print". Select your Printer and make sure you print in "Actual Size".

If you need to print multiple Documents, you can print mutliple at once without opening every single PDF like this:
* Copy all files from the ZIP-File to a new Folderm for example on your desktop.
* Select up to 15 Files, click the right mouse button and select *Print* from the context menu.