package com.kalaazu.persistence.eventsystem;

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
    @Override
    public void initialize() {
        super.addHandler("find", new FindHandler());
        super.addHandler("all", new AllHandler());
        super.addHandler("create", new CreateHandler());
        super.addHandler("update", new UpdateHandler());
        super.addHandler("delete", new DeleteHandler());
        super.addHandler("register", new RegisterHandler());
    }

    @Override
    public String getDomain() {
        return "persistence";
    }
}
