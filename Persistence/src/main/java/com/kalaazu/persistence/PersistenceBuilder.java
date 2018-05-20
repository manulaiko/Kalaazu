package com.kalaazu.persistence;

import com.kalaazu.eventsystem.EventManager;
import com.speedment.runtime.core.ApplicationBuilder;

import java.util.ArrayList;
import java.util.List;

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
 *        .setHost("localhost")
 *        .setPort(3306)
 *        .setDatabase("kalaazu")
 *        .setUsername("manulaiko")
 *        .setPassword("");
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

    private List<ApplicationBuilder.LogType> logType = new ArrayList<>();

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
                this.password,
                this.logType
        );

        return persistence;
    }

    //<editor-fold desc="Setters">
    public PersistenceBuilder setEventManager(EventManager eventManager) {
        this.eventManager = eventManager;

        return this;
    }

    public PersistenceBuilder setHost(String host) {
        this.host = host;

        return this;
    }

    public PersistenceBuilder setPort(int port) {
        this.port = port;

        return this;
    }

    public PersistenceBuilder setDatabase(String database) {
        this.database = database;

        return this;
    }

    public PersistenceBuilder setUsername(String username) {
        this.username = username;

        return this;
    }

    public PersistenceBuilder setPassword(String password) {
        this.password = password;

        return this;
    }

    public PersistenceBuilder addLogType(ApplicationBuilder.LogType logType) {
        this.logType.add(logType);

        return this;
    }

    public PersistenceBuilder addLogType(String logType) {
        this.logType.add(ApplicationBuilder.LogType.valueOf(logType));

        return this;
    }
    //</editor-fold>
}
