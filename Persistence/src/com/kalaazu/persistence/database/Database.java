package com.kalaazu.persistence.database;

import com.kalaazu.persistence.database.entities.Entity;
import com.speedment.runtime.core.ApplicationBuilder;
import com.speedment.runtime.core.component.transaction.Transaction;
import com.speedment.runtime.core.component.transaction.TransactionComponent;
import com.speedment.runtime.core.component.transaction.TransactionHandler;

import java.util.Optional;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.stream.Stream;


/**
 * Database class.
 * ===============
 *
 * Communicates with the database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@SuppressWarnings("unchecked")
public class Database {
    //////////////////////////////////
    // Static methods and properties//
    //////////////////////////////////

    /**
     * Database instance.
     */
    private static Database instance;

    //<editor-fold desc="Getters and Setters">
    public static Database getInstance() {
        return instance;
    }

    public static void setInstance(Database instance) {
        Database.instance = instance;
    }
    //</editor-fold>

    ///////////////////////////////////////
    // Non static methods and properties //
    ///////////////////////////////////////

    /**
     * Speedment db instance.
     */
    private KalaazuApplication db;

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
        if (this.getDb() != null) {
            return;
        }

        try {
            var url     = "jdbc:mariadb://" + this.getHost() + ":" + this.getPort() + "/" + this.getDatabase();
            var builder = new KalaazuApplicationBuilder();

            this.db = builder.withConnectionUrl(url)
                             .withUsername(this.getUsername())
                             .withPassword(this.getPassword())
                             .withLogging(ApplicationBuilder.LogType.APPLICATION_BUILDER)
                             .withLogging(ApplicationBuilder.LogType.CONNECTION)
                             .withLogging(ApplicationBuilder.LogType.PERSIST)
                             .withLogging(ApplicationBuilder.LogType.REMOVE)
                             .withLogging(ApplicationBuilder.LogType.STREAM)
                             .withLogging(ApplicationBuilder.LogType.STREAM_OPTIMIZER)
                             .withLogging(ApplicationBuilder.LogType.TRANSACTION)
                             .withLogging(ApplicationBuilder.LogType.UPDATE)
                             .build();

            this.getDb()
                .initialize();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    /**
     * Find and returns all entities.
     *
     * @param type Entity type.
     *
     * @return Stream of entities.
     */
    public <T extends Entity> Stream<T> all(Class<T> type) {
        return (Stream<T>) this.getDb()
                               .manager(type)
                               .stream();
    }

    /**
     * Finds and returns an entity by its id.
     *
     * @param id   Entity id.
     * @param type Entity type.
     *
     * @return Entity with `id`.
     */
    public <T extends Entity> Optional<T> find(int id, Class<T> type) {
        return (Optional<T>) this.getDb()
                                 .manager(type)
                                 .byId(id);
    }

    /**
     * Inserts a new entity.
     *
     * @param entity Entity to create.
     *
     * @return Inserted entity.
     */
    public <T extends Entity> T create(T entity) {
        return (T) this.getDb()
                       .manager(entity.getClass())
                       .persist(entity);
    }

    /**
     * Updates an entity.
     *
     * @param entity Entity to save.
     *
     * @return Updated entity.
     */
    public <T extends Entity> T update(T entity) {
        return (T) this.getDb()
                       .manager(entity.getClass())
                       .update(entity);
    }

    /**
     * Deletes an entity.
     *
     * @param entity Entity to delete.
     */
    public void delete(Entity entity) {
        this.getDb()
            .manager(entity.getClass())
            .remove(entity);
    }

    /**
     * Accepts a transaction.
     *
     * @param transaction Transaction to execute.
     */
    public void acceptTransaction(Consumer<? super Transaction> transaction) {
        this.transaction()
            .createAndAccept(transaction);
    }

    /**
     * Applies a transaction.
     *
     * @param transaction Transaction to execute.
     *
     * @return Transaction result.
     */
    public <T> T applyTransaction(Function<? super Transaction, T> transaction) {
        return this.transaction()
                   .createAndApply(transaction);
    }

    /**
     * Creates and returns a transaction handler.
     *
     * @return Transaction handler.
     */
    public TransactionHandler transaction() {
        return this.getDb()
                   .getOrThrow(TransactionComponent.class)
                   .createTransactionHandler();
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

    public KalaazuApplication getDb() {
        return db;
    }
    //</editor-fold>
}