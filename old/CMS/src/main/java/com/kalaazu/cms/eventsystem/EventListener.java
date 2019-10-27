package com.kalaazu.cms.eventsystem;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Event listener.
 * ===============
 *
 * Subscribes to the event bus and listens for events.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class EventListener extends com.kalaazu.eventsystem.EventListener {
    private String domain = "cms";

    @Override
    public void initialize() {

    }
}
