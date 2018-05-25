package com.kalaazu.persistence.eventsystem.handlers;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.eventsystem.events.CreateEvent;
import io.vertx.core.Handler;
import io.vertx.core.eventbus.Message;

/**
 * Create handler.
 * ===============
 *
 * Saves an entity in the database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class CreateHandler implements Handler<Message<CreateEvent>> {
    @Override
    public void handle(Message<CreateEvent> event) {
        try {
            event.reply(
                    Database.getInstance()
                            .create(
                                    event.body()
                                         .getEntity()
                            )
            );
        } catch (Exception e) {
            event.fail(0, e.getMessage());
        }
    }
}
