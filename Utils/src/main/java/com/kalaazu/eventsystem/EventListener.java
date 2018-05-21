package com.kalaazu.eventsystem;

import io.vertx.core.Handler;
import io.vertx.core.eventbus.Message;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
    private Map<Class<? extends Event>, List<Handler>> handlers = new HashMap<>();

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
        var handlers = this.handlers.getOrDefault(
                event.body()
                     .getClass(),
                null
        );

        if (handlers == null) {
            event.fail(-1, "No handler registered for this event!");

            return;
        }

        //noinspection unchecked
        handlers.parallelStream()
                .forEach(h -> h.handle(event));
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

        var handlers = this.findHandlers(clazz);
        handlers.add(handler);

        this.handlers.put(clazz, handlers);
    }

    /**
     * Removes a handler from the list.
     *
     * @param clazz   Event type that can be handled.
     * @param handler Handler to remove.
     */
    public void removeHandler(Class<? extends Event> clazz, Handler handler) {
        var handlers = this.findHandlers(clazz);
        handlers.remove(handler);

        this.handlers.put(clazz, handlers);
    }

    /**
     * Returns all handlers registered for the class.
     *
     * If no handler is registered, an empty list will be returned.
     *
     * @param clazz Event type.
     *
     * @return List of registered handlers.
     */
    private List<Handler> findHandlers(Class<? extends Event> clazz) {
        return this.handlers.getOrDefault(clazz, new ArrayList<>());
    }
}
