package com.kalaazu.persistence.eventsystem.handlers;

import com.kalaazu.eventsystem.Handler;
import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Entity;
import io.vertx.core.json.JsonObject;

/**
 * Find handler.
 * =============
 *
 * Finds and returns something in the database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class FindHandler extends Handler {
    @Override
    public void handle() throws ClassNotFoundException {
        int    id     = super.get("id");
        String entity = super.get("entity");

        var type = (Class<? extends Entity>) Class.forName(entity);

        var r = Database.getInstance()
                        .find(id, type);

        super.reply(JsonObject.mapFrom(r));
    }
}
