Classes
=======

![diagram](uml/Classes.png)

There are 4 main classes:

 * `com.kalaazu.persistence.Persistence`.
 * `com.kalaazu.persistence.PersistenceBuilder`.
 * `com.kalaazu.persistence.eventsystem.EventListener`.
 * `com.kalaazu.persistence.Database`.

Persistence
-----------

It's the package facade, it provides the necessary functionality.

The `initialize` method will instantiate the `Database` class and initialize
the event system classes.

PersistenceBuilder
--------------

Builds and initializes `Persistence` objects.

EventListener
-------------

Registers the event handlers in the event system package.

Database
--------

Manages the hibernate session.
