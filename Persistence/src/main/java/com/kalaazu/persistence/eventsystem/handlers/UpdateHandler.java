package com.kalaazu.persistence.eventsystem.handlers;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.eventsystem.events.UpdateEvent;
import io.vertx.core.Handler;
import io.vertx.core.eventbus.Message;

/**
 * Update handler.
 * ===============
 *
 * Updates an entity in the database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class UpdateHandler implements Handler<Message<UpdateEvent>> {
    @Override
    public void handle(Message<UpdateEvent> event) {
        try {
            event.reply(
                    Database.getInstance()
                            .update(
                                    event.body()
                                         .getEntity()
                            )
            );
        } catch (Exception e) {
            event.fail(0, e.getMessage());
        }
    }
}
