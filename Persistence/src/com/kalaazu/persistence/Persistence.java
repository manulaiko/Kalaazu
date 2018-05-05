package com.kalaazu.persistence;

import com.kalaazu.eventsystem.EventManager;
import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Entity;
import com.kalaazu.persistence.eventsystem.EventListener;

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
        var db = new Database();

        db.setHost(host)
          .setPort(port)
          .setDatabase(database)
          .setUsername(username)
          .setPassword(password);

        db.initialize();

        Database.setInstance(db);

        var listener = new EventListener();

        this.eventManager.subscribe(listener);
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
        return Database.getInstance()
                       .find(id, type);
    }

    /**
     * Find and returns all entities.
     *
     * @param type Entity type.
     *
     * @return Stream of entities.
     */
    public <T extends Entity> Stream<T> all(Class<T> type) {
        return Database.getInstance()
                       .all(type);
    }
}
