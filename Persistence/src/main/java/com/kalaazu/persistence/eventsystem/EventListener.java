package com.kalaazu.persistence.eventsystem;

import com.kalaazu.persistence.eventsystem.events.*;
import com.kalaazu.persistence.eventsystem.handlers.*;

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
        super.addHandler(AllEvent.class, new AllHandler());
        super.addHandler(CreateEvent.class, new CreateHandler());
        super.addHandler(UpdateEvent.class, new UpdateHandler());
        super.addHandler(DeleteEvent.class, new DeleteHandler());
    }
}
