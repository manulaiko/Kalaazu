package com.kalaazu.persistence.eventsystem.handlers;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.eventsystem.events.AllEvent;
import io.vertx.core.Handler;
import io.vertx.core.eventbus.Message;

/**
 * All handler.
 * ============
 *
 * Finds and returns all entities from a table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class AllHandler implements Handler<Message<AllEvent>> {
    @Override
    public void handle(Message<AllEvent> event) {
        try {
            event.reply(
                    Database.getInstance()
                            .all(
                                    event.body()
                                         .getEntity()
                            )
            );
        } catch (Exception e) {
            event.fail(0, e.getMessage());
        }
    }
}
