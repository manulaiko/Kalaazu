Package structure
=================

![diagram](uml/Package%20structure.png)

There are 4 packages:

 * `com.kalaazu.cms`.
 * `com.kalaazu.cms.events`.
 * `com.kalaazu.cms.(controllers|models|presenters)`.
 * `com.kalaazu.cms.server`.

Two of the are public and can be accessed by other modules:

 * `com.kalaazu.cms`.
 * `com.kalaazu.cms.events`.

CMS
===

The `com.kalaazu.cms` package contains the facade classes
used to manage the whole module.

Events
======

The `com.kalaazu.cms.events` contains the events that
can be fired in the event system.

MV(VM)C
=======

The MV(VM)C extends the MVC pattern by adding the ViewModel (presenter)
component which parses the model data so the view can
present it directly.

Controllers
-----------

The controllers handles the incomming HTTP requests and
are located at `com.kalaazu.cms.controllers`.

Models
------

The models contains the data associated to a page and
are located at `com.kalaazu.cms.models`.

Presenters
----------

The presenters parses the model data and sends them to
the view and are located at `com.kalaazu.cms.presenters`.

Views
-----

The views are the HTML templates and are located
in the `www/views` directory.
The static assets are located at `www/public_html`.