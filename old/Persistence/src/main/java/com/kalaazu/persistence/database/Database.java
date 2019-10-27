package com.kalaazu.persistence.database;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.jooq.DSLContext;
import org.jooq.impl.DSL;
import org.mariadb.jdbc.MariaDbDataSource;

import java.sql.SQLException;
import java.util.function.Function;

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
@Slf4j
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
     * Database connection pool.
     */
    private HikariDataSource ds;

    /**
     * Initializes the database.
     *
     * Loads the data from the database into memory.
     */
    public void initialize() {
        var config = new HikariConfig();
        config.setJdbcUrl(String.format("jdbc:mariadb://%s:%s/%s", this.host, this.port, this.database));
        config.setDataSourceClassName(MariaDbDataSource.class.getName());
        config.setUsername(this.username);
        config.setPassword(this.password);

        this.ds(new HikariDataSource(config));
    }

    /**
     * Executes a query.
     *
     * @param handler Query handler.
     */
    public void query(Function<DSLContext, Void> handler) {
        try {
            handler.apply(DSL.using(this.ds().getConnection()));
        } catch (SQLException e) {
            log.warn("Couldn't execute query!", e);
        }
    }
}
