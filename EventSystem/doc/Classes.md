Classes
=======

![diagram](uml/Classes.png)

There are 3 main classes:

 * `com.manulaiko.kalaazu.eventsystem.EventManager`.
 * `com.manulaiko.kalaazu.eventsystem.EventListener`.
 * `com.manulaiko.kalaazu.eventsystem.Event`.

EventManager
------------

It's the package facade, it provides the necessary functionality.

The `initialize` method will configure the event bus.

EventListener
-------------

Listens for events and handles them.

It can subscribe and unsubscribe itself from the event bus.

Event
-----

Interface for all events.