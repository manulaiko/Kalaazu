package com.kalaazu.persistence.eventsystem;

import com.kalaazu.persistence.eventsystem.events.FindEvent;
import com.kalaazu.persistence.eventsystem.handlers.FindHandler;

/**
 * Event listener.
 * ===============
 *
 * Registers the event handlers.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class EventListener extends com.kalaazu.eventsystem.EventListener {
    /**
     * Initializes the event handlers.
     */
    @Override
    public void initialize() {
        super.addHandler(FindEvent.class, new FindHandler());
    }
}
