package com.kalaazu.persistence.eventsystem.handlers;

import com.kalaazu.eventsystem.Handler;
import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Entity;
import io.vertx.core.json.JsonObject;

/**
 * Update handler.
 * ===============
 *
 * Updates an entity in the database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class UpdateHandler extends Handler {
    @Override
    public void handle() throws ClassNotFoundException {
        String     entity = super.get("entity");
        JsonObject data   = super.get("data");

        var type   = (Class<? extends Entity>) Class.forName(entity);
        var insert = data.mapTo(type);

        var r = Database.getInstance()
                        .update(insert, (Class<Entity>) type);

        super.reply(JsonObject.mapFrom(r));
    }
}
