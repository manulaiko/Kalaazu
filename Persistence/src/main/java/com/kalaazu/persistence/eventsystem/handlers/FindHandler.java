package com.kalaazu.persistence.eventsystem.handlers;

import com.kalaazu.persistence.eventsystem.events.FindEvent;
import io.vertx.core.Handler;
import io.vertx.core.eventbus.Message;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class FindHandler implements Handler<Message<FindEvent>> {
    /**
     * Something has happened, so handle it.
     *
     * @param event the event to handle
     */
    public void handle(Message<FindEvent> event) {
    }
}
