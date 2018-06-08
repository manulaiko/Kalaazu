package com.kalaazu.eventsystem;

import io.vertx.core.eventbus.Message;
import io.vertx.core.json.JsonObject;

/**
 * Abstract handler.
 * =================
 *
 * Base class for all event handlers.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public abstract class Handler implements io.vertx.core.Handler<Message<JsonObject>> {
    /**
     * The event to handle.
     */
    private Message<JsonObject> event;

    /**
     * Handles the event.
     */
    protected abstract void handle() throws Exception;

    @Override
    public void handle(Message<JsonObject> event) {
        this.event = event;

        try {
            this.handle();
        } catch (Exception e) {
            this.onFail(e);
        }
    }

    /**
     * Executed when the handler throws an exception.
     *
     * @param exception Fired exception.
     */
    protected void onFail(Exception exception) {
        var message = exception.getMessage();
        if (exception.getCause() != null) {
            message += " ( " + exception.getCause()
                                        .getMessage() + " )";
        }

        this.event.fail(0, message);
    }

    /**
     * Replies the event.
     *
     * @param response Response to send.
     */
    protected void reply(JsonObject response) {
        this.event.reply(response);
    }

    /**
     * Returns a param from the event.
     *
     * @param name Param name.
     *
     * @return Param from event.
     */
    protected <T> T get(String name) {
        try {
            return (T) this.event.body()
                                 .getValue(name);
        } catch (Exception e) {
            return null;
        }
    }

    public Message<JsonObject> getEvent() {
        return event;
    }
}
