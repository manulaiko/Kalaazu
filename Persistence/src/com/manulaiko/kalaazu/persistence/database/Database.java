package com.manulaiko.kalaazu.persistence.database;

import com.manulaiko.kalaazu.persistence.database.entities.Entity;
import com.speedment.runtime.core.manager.Manager;

import java.util.Optional;


/**
 * Database class.
 * ===============
 *
 * Communicates with the database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Database {
    /**
     * Speedment db instance.
     */
    public KalaazuApplication db;

    /**
     * Server host.
     */
    private String host;

    /**
     * Server port.
     */
    private int port;

    /**
     * Database user.
     */
    private String username;

    /**
     * User password.
     */
    private String password;

    /**
     * Database name.
     */
    private String database;

    /**
     * Initializes the connection with the database.
     */
    public void initialize() {
        if (this.db != null) {
            return;
        }

        try {
            var url     = "jdbc:mariadb://" + this.getHost() + ":" + this.getPort() + "/" + this.getDatabase();
            var builder = new KalaazuApplicationBuilder();

            this.db = builder.withConnectionUrl(url)
                             .withUsername(this.getUsername())
                             .withPassword(this.getPassword())
                             .build();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    /**
     * Finds a record in the database.
     *
     * @param id    Record id.
     * @param clazz Entity class.
     *
     * @return Record from the database.
     */
    public <T extends Entity> Optional<T> find(int id, Class<? extends Manager<T>> clazz) {
        return this.db.getOrThrow(clazz)
                      .stream()
                      .filter(t -> t.getId() == id)
                      .findFirst();
    }

    /**
     * Parses a class name to a table name.
     *
     * @param clazz Class to parse.
     *
     * @return Table name for clazz
     */
    private String parseTable(Class clazz) {
        var name = clazz.getSimpleName()
                        .replaceAll("([A-Z]+)", "\\_$1")
                        .toLowerCase();

        if (name.endsWith("y")) {
            return name.substring(0, name.length() - 1) + "ies";
        }

        return name + "s";
    }

    //<editor-fold desc="Getters and setters">
    public String getHost() {
        return host;
    }

    public Database setHost(String host) {
        this.host = host;

        return this;
    }

    public int getPort() {
        return port;
    }

    public Database setPort(int port) {
        this.port = port;

        return this;
    }

    public String getUsername() {
        return username;
    }

    public Database setUsername(String username) {
        this.username = username;

        return this;
    }

    public String getPassword() {
        return password;
    }

    public Database setPassword(String password) {
        this.password = password;

        return this;
    }

    public String getDatabase() {
        return database;
    }

    public Database setDatabase(String database) {
        this.database = database;

        return this;
    }
    //</editor-fold>
}