package com.kalaazu.persistence.database;

import io.vertx.mysqlclient.MySQLConnectOptions;
import io.vertx.mysqlclient.MySQLPool;
import io.vertx.sqlclient.PoolOptions;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

/**
 * Database class.
 * ===============
 *
 * Represents the connection with the database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Builder
@Data
public class Database {
    /**
     * Global instance.
     */
    @Getter
    @Setter
    private static Database instance;

    /**
     * Database host.
     */
    private String host;

    /**
     * Database port.
     */
    private int port;

    /**
     * Database name.
     */
    private String database;

    /**
     * Database username.
     */
    private String username;

    /**
     * Database password.
     */
    private String password;

    /**
     * MySQL client pool.
     */
    private MySQLPool client;

    /**
     * Initializes the database.
     *
     * Loads the data from the database into memory.
     */
    public void initialize() {
        var connectOptions = new MySQLConnectOptions()
                .setPort(3306)
                .setHost("the-host")
                .setDatabase("the-db")
                .setUser("user")
                .setPassword("secret");

        // Pool options
        var poolOptions = new PoolOptions()
                .setMaxSize(5);

        // Create the client pool
        this.client(MySQLPool.pool(connectOptions, poolOptions));
    }
}
