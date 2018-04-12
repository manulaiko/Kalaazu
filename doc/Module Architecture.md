Module architecture
===================

Here is specified the architecture of the modules and their interactions.

![diagram](uml/Module%20architecture.png)

The private server is composed by 4 main modules:

 * The emulator.
 * The CMS.
 * The persistence layer.
 * The event system.
 
The emulator
------------

It's the in-game module, it will handle the connections from the client and act upon them.

The CMS
-------

It's the website, it provides the user with a web page to perform certain actions that can't be done in-game.

The persistence layer
---------------------

It's the database representation.
It abstracts the database server from the rest of the modules providing a more solid and scalable system.

The event system
----------------

This module provides a scalable architecture on which new modules can be added upon existing others while keeping the integration between all of them.

The main example is the CMS -> Emulator communication, if the user buys something on the website, the emulator has no apparent way of know what he bough.
So the common solution would be to send a message from the CMS to the emulator saying what he bough.

The event system would be the pathway to send that message.