package com.kalaazu.persistence.eventsystem.handlers;

import com.kalaazu.eventsystem.Handler;

/**
 * Create handler.
 * ===============
 *
 * Saves an entity in the database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class CreateHandler extends Handler {
    @Override
    public void handle() throws ClassNotFoundException {/*
        String     entity = super.get("entity");
        JsonObject data   = super.get("data");

        var type   = (Class<? extends Entity>) Class.forName(entity);
        var insert = data.mapTo(type);

        var r = Database.instance()
                        .create(insert, (Class<Entity>) type);

        super.reply(JsonObject.mapFrom(r));*/
    }
}
