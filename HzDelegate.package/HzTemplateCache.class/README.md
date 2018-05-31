TemplateCache is a tree collection of instansiated mustache templates.
The main objective of this class is to cache templates from a directory and provide a path base lookup for templates.
The override of #at: makes it posible to refer to templates using a path like {{ folder/template }}.
#fromDirectory: assumes that template files are saved with the extension .mu

