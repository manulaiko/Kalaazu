package com.kalaazu.persistence.eventsystem.handlers;

import com.kalaazu.eventsystem.Handler;
import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Entity;
import io.vertx.core.json.JsonObject;

/**
 * Delete handler.
 * ===============
 *
 * Deletes an entity from the database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class DeleteHandler extends Handler {
    @Override
    public void handle() throws ClassNotFoundException {
        String     entity = super.get("entity");
        JsonObject data   = super.get("data");

        var type   = (Class<? extends Entity>) Class.forName(entity);
        var insert = data.mapTo(type);

        Database.getInstance()
                .delete(insert);

        super.reply(JsonObject.mapFrom(true));
    }
}
