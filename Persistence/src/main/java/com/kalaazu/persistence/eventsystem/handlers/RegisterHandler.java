package com.kalaazu.persistence.eventsystem.handlers;

import com.kalaazu.eventsystem.Handler;
import io.vertx.core.json.JsonObject;

/**
 * Register handler.
 * =================
 *
 * Registers an user in the database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class RegisterHandler extends Handler {
    @Override
    public void handle() {
        super.reply(new JsonObject("{\"isError\":true,\"message\":\"Yep\"}"));
    }
}
