package com.manulaiko.kalaazu.eventsystem;

/**
 * Handler interface.
 * ==================
 *
 * Base interface for all event handlers.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Handler<T extends Event> {
    /**
     * Handles the received event.
     */
    void handle(T event);
}
