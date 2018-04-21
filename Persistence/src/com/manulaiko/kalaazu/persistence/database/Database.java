package com.manulaiko.kalaazu.persistence.database;

import com.manulaiko.kalaazu.persistence.database.entities.Entity;
import com.manulaiko.kalaazu.persistence.database.entities.Map;
import org.sql2o.Sql2o;


/**
 * Database class.
 * ===============
 *
 * Communicates with the database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Database {
    public static void main(final String[] args) {
        Database db = new Database();
        db.setDatabase("kalaazu")
          .setUsername("manulaiko")
          .setPassword("")
          .setPort(3306)
          .setHost("localhost")
          .initialize();

        db.find(1, Map.class);
    }

    /**
     * Session factory.
     */
    private Sql2o sql2o;

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
     * Initialzes the connection with the database.
     */
    public void initialize() {
        if (this.sql2o != null) {
            return;
        }

        try {
            var url = "jdbc:mariadb://" + this.getHost() + ":" + this.getPort() + "/" + this.getDatabase();

            this.sql2o = new Sql2o(
                    url,
                    this.getUsername(),
                    this.getPassword()
            );
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
    public <T extends Entity> T find(int id, Class<T> clazz) {
        try (var connection = this.sql2o.open()) {
            var table = this.parseTable(clazz);

            return connection.createQuery("SELECT * FROM "+ table +" WHERE id=:id")
                    .addParameter("id", id)
                    .executeAndFetch(clazz)
                    .get(0);
        }
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
                        .replaceAll("([A-Z]+)","\\_$1")
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