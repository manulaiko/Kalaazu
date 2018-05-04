package com.manulaiko.kalaazu.persistence.eventsystem;

import com.manulaiko.kalaazu.eventsystem.Event;
import com.manulaiko.kalaazu.persistence.database.Database;

/**
 * Event handler.
 * ==============
 *
 * Base class for all event handlers.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public abstract class Handler<T extends Event> implements com.manulaiko.kalaazu.eventsystem.Handler<T> {
    /**
     * Database.
     */
    private static Database database;

    //<editor-fold desc="Getters and Setters">
    public static Database getDatabase() {
        return database;
    }

    public static void setDatabase(Database database) {
        Handler.database = database;
    }
    //</editor-fold>
}
