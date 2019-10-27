package com.kalaazu.persistence.eventsystem.handlers;

import com.kalaazu.eventsystem.Handler;

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
    public void handle() throws ClassNotFoundException {/*
        int    id     = super.get("id");
        String entity = super.get("entity");

        var type = (Class<? extends Entity>) Class.forName(entity);

        var r = Database.instance()
                        .find(id, type);

        super.reply(JsonObject.mapFrom(r));*/
    }
}
