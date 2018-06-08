package com.kalaazu.eventsystem;

import io.vertx.core.Handler;
import io.vertx.core.Vertx;
import io.vertx.core.eventbus.Message;
import io.vertx.core.json.JsonObject;

import java.util.HashMap;
import java.util.Map;

/**
 * Event listener.
 * ===============
 *
 * Subscribes to the event bus and listens for events.
 *
 * The method `handle` will be called when an event is published.
 *
 * Usage:
 *
 * ```java
 * var listener = new EventListener() {
 * public void initialize() {
 * this.addHandler(LoginEvent.class, new LoginEventHandler());
 * }
 * };
 * listener.addHandler(Event.class, new EventHandler());
 * ```
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public abstract class EventListener {
    /**
     * Initializes the event handlers.
     */
    public abstract void initialize();

    /**
     * Returns the listener domain name.
     *
     * @return Listener domain name.
     */
    public abstract String getDomain();

    /**
     * Adds a new handler to the list.
     *
     * @param event   Event name.
     * @param handler Handler to call.
     */
    public void addHandler(String event, Handler<Message<JsonObject>> handler) {
        Vertx.currentContext()
             .owner()
             .eventBus()
             .consumer(this.getDomain() + "." + event, handler);
    }
}
