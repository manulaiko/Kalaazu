Package structure
=================

![diagram](uml/Package%20structure.png)

There are 3 main packages:

 * `com.kalaazu.persistence`.
 * `com.kalaazu.persistence.eventsystem`.
 * `com.kalaazu.persistence.database`.

There are 3 public packages that can be accessed by other modules:

 * `com.kalaazu.persistence`.
 * `com.kalaazu.persistence.eventsystem.events`.
 * `entities`.

Persistence
-----------

The `com.kalaazu.persistence` package is the main package and contains
facade classes used to manage the whole module (fetching entities, registering
event listeners...).

Event system
------------

The `com.kalaazu.persistence.eventsystem` package contains the
event listeners and publishers that will be registered to the *Event System* module.

The events that can be published will be stored in the `events` package, the
handlers for the event listeners will be stored in the `handlers` package.

Database
--------

The `com.kalaazu.persistence.database` package contains the necessary classes
required to read/write to the database.
The `entities` package contains the POJO types (domain model).
