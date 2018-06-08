package com.kalaazu.persistence.eventsystem.handlers;

import com.kalaazu.eventsystem.Handler;
import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Entity;
import io.vertx.core.json.JsonObject;

/**
 * All handler.
 * ============
 *
 * Finds and returns all entities from a table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class AllHandler extends Handler {
    @Override
    public void handle() throws ClassNotFoundException {
        String entity = super.get("entity");

        var type = (Class<? extends Entity>) Class.forName(entity);

        var r = Database.getInstance()
                        .all(type);

        super.reply(JsonObject.mapFrom(r));
    }
}
