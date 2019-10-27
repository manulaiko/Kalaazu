Package structure
=================

![diagram](uml/Package%20structure.png)

There are 4 packages:

 * `com.kalaazu.cms`.
 * `com.kalaazu.cms.events`.
 * `com.kalaazu.cms.mvc`.
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

MVC
===

The HMV(VM)C extends the MVC pattern by adding the ViewModel (presenter)
component which parses the model data so the view can present it directly.

On top of that, it also adds a hierarchy tree on which a triad (MV(VM)C) can
have multiple child triads.

The base components are located in `com.kalaazu.cms.mvc`.

Pages
-----

A page is the top-level triad in the hierarchy tree, they're located
in the `com.kalaazu.cms.mvc.pages` package.

Modules
-------

A module is a triad with a parent triad, they can have children modules
associated to them, they're locaked under `com.kalaazu.cms.mvc.modules`.


Controllers
-----------

The controllers handles the incomming HTTP requests and
are located at `com.kalaazu.cms.mvc.(pages|modules).controllers`.

Models
------

The models contains the data associated to a page and
are located at `com.kalaazu.cms.mvc.(pagse|modules).models`.

Presenters
----------

The presenters parses the model data and sends them to
the view and are located at `com.kalaazu.cms.mvc.(pages|modules).presenters`.

Views
-----

The views are the HTML templates and are located
in the `www/views` directory.
The static assets are located at `www/public_html`.