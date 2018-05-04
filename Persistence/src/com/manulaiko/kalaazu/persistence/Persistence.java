package com.manulaiko.kalaazu.persistence;

import com.manulaiko.kalaazu.eventsystem.EventManager;
import com.manulaiko.kalaazu.persistence.database.Database;
import com.manulaiko.kalaazu.persistence.database.entities.Entity;

import java.util.Optional;
import java.util.stream.Stream;

/**
 * Persistence class.
 * ==================
 *
 * Serves as the module's facade.
 *
 * Use `PersistenceBuilder` to instantiate this class.
 *
 * Once instantiated you can use the `find` method to retrieve
 * entities by their ID.
 *
 * To insert/update entities you must fire an event and the listener
 * will automatically update it.
 *
 * Example:
 *
 * ```java
 * var account = persistence.find(1, Accounts.class);
 *
 * account.setName("newName");
 *
 * eventManager.publish(new AccountUpdateEvent(account));
 * ```
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Persistence {
    /**
     * Event manager.
     */
    private EventManager eventManager;

    /**
     * Database instance.
     */
    private Database database;

    /**
     * Constructor.
     *
     * @param eventManager Event manager.
     */
    public Persistence(EventManager eventManager) {
        this.eventManager = eventManager;
    }

    /**
     * Initializes the module.
     *
     * @param host     Database server host.
     * @param port     Database server port.
     * @param database Database name.
     * @param username User name.
     * @param password User password.
     */
    public void initialize(String host, int port, String database, String username, String password) {
        this.database = new Database();

        this.database.setHost(host)
                     .setPort(port)
                     .setDatabase(database)
                     .setUsername(username)
                     .setPassword(password);

        this.database.initialize();
    }

    /**
     * Finds and returns an entity by its id.
     *
     * @param id   Entity id.
     * @param type Entity type.
     *
     * @return Entity of `type` with `id`.
     */
    public <T extends Entity> Optional<T> find(int id, Class<T> type) {
        return this.database.find(id, type);
    }

    /**
     * Find and returns all entities.
     *
     * @param type Entity type.
     *
     * @return Stream of entities.
     */
    public <T extends Entity> Stream<T> all(Class<T> type) {
        return this.database.all(type);
    }
}
