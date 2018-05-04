package com.manulaiko.kalaazu.persistence;

import com.manulaiko.kalaazu.eventsystem.EventManager;

/**
 * Persistence builder.
 * ====================
 *
 * Builds and initializes `Persistence` instances.
 *
 * Usage:
 *
 * ```java
 * var builder = new PersistenceBuilder();
 *
 * builder.setEventManager(eventManager)
 * .setHost("localhost")
 * .setPort(3306)
 * .setDatabase("kalaazu")
 * .setUsername("manulaiko")
 * .setPassword("");
 *
 * var persistence = builder.build();
 * ```
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class PersistenceBuilder {
    private EventManager eventManager;
    private String       host     = "localhost";
    private int          port     = 3306;
    private String       database = "kalaazu";
    private String       username = "manulaiko";
    private String       password = "";

    /**
     * Builds and initializes the persistence.
     *
     * @return Initialized persistence instance.
     */
    public Persistence build() {
        if (this.eventManager == null) {
            throw new ExceptionInInitializerError("Event manager can't be null!");
        }

        var persistence = new Persistence(this.eventManager);

        persistence.initialize(
                this.host,
                this.port,
                this.database,
                this.username,
                this.password
        );

        return persistence;
    }

    //<editor-fold desc="Setters">
    public void setEventManager(EventManager eventManager) {
        this.eventManager = eventManager;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public void setDatabase(String database) {
        this.database = database;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    //</editor-fold>
}
