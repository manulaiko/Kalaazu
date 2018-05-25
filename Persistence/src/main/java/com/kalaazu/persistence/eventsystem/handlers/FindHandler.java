package com.kalaazu.persistence.eventsystem.handlers;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.eventsystem.events.FindEvent;
import io.vertx.core.Handler;
import io.vertx.core.eventbus.Message;

/**
 * Find handler.
 * =============
 *
 * Finds and returns something in the database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class FindHandler implements Handler<Message<FindEvent>> {
    @Override
    public void handle(Message<FindEvent> event) {
        try {
            event.reply(
                    Database.getInstance()
                            .find(
                                    event.body()
                                         .getId(),
                                    event.body()
                                         .getEntity()
                            )
            );
        } catch (Exception e) {
            event.fail(0, e.getMessage());
        }
    }
}
