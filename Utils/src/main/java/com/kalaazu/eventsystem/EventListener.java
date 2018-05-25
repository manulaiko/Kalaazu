package com.kalaazu.eventsystem;

import io.vertx.core.Handler;
import io.vertx.core.eventbus.Message;

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
public abstract class EventListener implements Handler<Message<Object>> {
    /**
     * Events that this listener can handle.
     */
    private Map<Class<? extends Event>, Handler> handlers = new HashMap<>();

    /**
     * Constructor.
     */
    public EventListener() {
        this.initialize();
    }

    /**
     * Initializes the event handlers.
     */
    public abstract void initialize();

    @Override
    public void handle(Message<Object> event) {
        var handler = this.handlers.getOrDefault(
                event.body()
                     .getClass(),
                null
        );

        if (handler == null) {
            event.fail(-1, "No handler registered for this event!");

            return;
        }

        //noinspection unchecked
        handler.handle(event);
    }

    /**
     * Adds a new handler to the list.
     *
     * @param clazz   Event type that can be handled.
     * @param handler Handler to call.
     */
    public void addHandler(Class<? extends Event> clazz, Handler handler) {
        if (!clazz.isInstance(handler)) {
            return;
        }

        this.handlers.put(clazz, handler);
    }

    /**
     * Removes a handler from the list.
     *
     * @param clazz   Event type that can be handled.
     * @param handler Handler to remove.
     */
    public void removeHandler(Class<? extends Event> clazz, Handler handler) {
        this.handlers.remove(clazz);
    }
}
