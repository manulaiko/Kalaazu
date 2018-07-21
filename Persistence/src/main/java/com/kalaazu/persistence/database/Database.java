package com.kalaazu.persistence.database;

import com.kalaazu.persistence.database.entities.Entity;
import com.speedment.runtime.core.ApplicationBuilder;
import com.speedment.runtime.core.component.transaction.Transaction;
import com.speedment.runtime.core.component.transaction.TransactionComponent;
import com.speedment.runtime.core.component.transaction.TransactionHandler;
import com.speedment.runtime.field.ComparableField;
import io.vertx.core.json.JsonArray;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.Setter;

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
@Data
@Builder
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
    @Setter(AccessLevel.NONE)
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
     * Log types.
     */
    private JsonArray logTypes;

    /**
     * Initializes the connection with the database.
     */
    public void initialize() {
        if (this.db() != null) {
            return;
        }

        try {
            var url     = "jdbc:mariadb://" + this.host() + ":" + this.port() + "/" + this.database();
            var builder = new KalaazuApplicationBuilder();

            builder.withConnectionUrl(url)
                   .withUsername(this.username())
                   .withParam("db.mysql.collationName", "utf8mb4_general_ci")
                   .withParam("db.mysql.binaryCollationName", "utf8mb4_bin")
                   .withPassword(this.password());

            this.logTypes()
                .forEach(
                        l -> builder.withLogging(ApplicationBuilder.LogType.valueOf(l.toString()))
                );

            this.db = builder.build();

            this.db()
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
        return (Stream<T>) this.db()
                               .manager(type)
                               .stream();
    }

    /**
     * Find and returns all entities with the given field.
     *
     * @param field Field instance.
     * @param value Field value.
     * @param type  Entity type.
     *
     * @return Stream of entities.
     */
    public <T extends Entity> Stream<T> all(ComparableField field, Comparable value, Class<T> type) {
        return (Stream<T>) this.db()
                               .manager(type)
                               .stream()
                               .filter(field.equal(value));
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
        return (Optional<T>) this.db()
                                 .manager(type)
                                 .byId(id);
    }

    /**
     * Finds and returns an entity by the specified field.
     *
     * @param field Field type.
     * @param value Field value.
     * @param type  Entity type.
     *
     * @return Entity with `id`.
     */
    public <T extends Entity> Optional<T> find(ComparableField field, Comparable value, Class<T> type) {
        return this.all(field, value, type)
                   .findFirst();
    }

    /**
     * Inserts a new entity.
     *
     * @param entity Entity to create.
     * @param type   Entity type.
     *
     * @return Inserted entity.
     */
    public <T extends Entity> T create(T entity, Class<T> type) {
        return (T) this.db()
                       .manager(type)
                       .persist(entity);
    }

    /**
     * Updates an entity.
     *
     * @param entity Entity to save.
     * @param type   Entity type.
     *
     * @return Updated entity.
     */
    public <T extends Entity> T update(T entity, Class<T> type) {
        return (T) this.db()
                       .manager(type)
                       .update(entity);
    }

    /**
     * Deletes an entity.
     *
     * @param entity Entity to delete.
     */
    public void delete(Entity entity) {
        this.db()
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
        return this.db()
                   .getOrThrow(TransactionComponent.class)
                   .createTransactionHandler();
    }
}