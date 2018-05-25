package com.kalaazu.persistence;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.eventsystem.EventListener;
import io.vertx.core.AbstractVerticle;
import io.vertx.core.Future;
import io.vertx.core.json.JsonArray;
import io.vertx.core.logging.Logger;
import io.vertx.core.logging.LoggerFactory;

/**
 * Persistence class.
 * ==================
 *
 * Initializes and connects to the database.
 *
 * Use the events under the domain `persistence` to communicate
 * with the database and perform certain actions.
 *
 * See `com.kalaazu.persistence.eventsystem.EventListener` for a list
 * of the available events.
 *
 * Example:
 *
 * ```java
 * vertx.eventBus()
 * .send(
 * "persistence",
 * new FindEvent(Accounts.class, 1),
 * r -> {
 * var account = (Optional<Accounts>)r.result();
 * }
 * );
 * ```
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Persistence extends AbstractVerticle {
    public static final Logger logger = LoggerFactory.getLogger(Persistence.class);

    @Override
    public void start(Future<Void> startFuture) {
        var host     = config().getString("persistence.host", "localhost");
        var port     = config().getInteger("persistence.port", 3306);
        var database = config().getString("persistence.database", "kalaazu");
        var username = config().getString("persistence.username", "manulaiko");
        var password = config().getString("persistence.password", "");
        var logTypes = config().getJsonArray("persistence.logTypes", new JsonArray());

        Persistence.logger.info("Initializing database...");
        var db = new Database();

        db.setHost(host)
          .setPort(port)
          .setDatabase(database)
          .setUsername(username)
          .setPassword(password)
          .setLogTypes(logTypes)
          .initialize();

        Database.setInstance(db);

        Persistence.logger.info("Initializing event listener...");
        var listener = new EventListener();

        vertx.eventBus()
             .consumer("persistence", listener);

        Persistence.logger.info("Persistence initialize!");

        startFuture.complete();
    }
}
