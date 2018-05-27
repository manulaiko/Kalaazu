package com.kalaazu.persistence.eventsystem.handlers;

import com.kalaazu.persistence.eventsystem.events.RegisterEvent;
import io.vertx.core.Handler;
import io.vertx.core.eventbus.Message;

/**
 * Register handler.
 * =================
 *
 * Registers an user in the database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class RegisterHandler implements Handler<Message<RegisterEvent>> {
    @Override
    public void handle(Message<RegisterEvent> event) {
        event.reply("{\"isError\":true,\"message\":\"Yep\"}");
    }
}
