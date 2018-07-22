package com.kalaazu.cms.eventsystem;

import lombok.Data;

/**
 * Event listener.
 * ===============
 *
 * Subscribes to the event bus and listens for events.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Data
public class EventListener extends com.kalaazu.eventsystem.EventListener {
    private String domain = "cms";

    @Override
    public void initialize() {

    }
}
