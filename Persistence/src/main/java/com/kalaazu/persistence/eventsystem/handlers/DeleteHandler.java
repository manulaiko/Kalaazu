package com.kalaazu.persistence.eventsystem.handlers;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.eventsystem.events.DeleteEvent;
import io.vertx.core.Handler;
import io.vertx.core.eventbus.Message;

/**
 * Delete handler.
 * ===============
 *
 * Deletes an entity from the database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class DeleteHandler implements Handler<Message<DeleteEvent>> {
    @Override
    public void handle(Message<DeleteEvent> event) {
        try {
            Database.getInstance()
                    .delete(
                            event.body()
                                 .getEntity()
                    );
            event.reply(true);
        } catch (Exception e) {
            event.fail(0, e.getMessage());
        }
    }
}
