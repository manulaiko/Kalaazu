package com.kalaazu.persistence.eventsystem.handlers;

import com.kalaazu.eventsystem.Handler;
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
    public void handle() throws ClassNotFoundException {/*
        String     entity = super.get("entity");
        JsonObject data   = super.get("data");

        var type   = (Class<? extends Entity>) Class.forName(entity);
        var insert = data.mapTo(type);

        Database.instance()
                .delete(insert);

        super.reply(JsonObject.mapFrom(true));*/
    }
}
