package com.kalaazu.persistence;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.eventsystem.EventListener;
import io.vertx.core.AbstractVerticle;
import io.vertx.core.Promise;
import lombok.extern.slf4j.Slf4j;

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
@Slf4j
public class Persistence extends AbstractVerticle {
    @Override
    public void start(Promise<Void> startFuture) {
        var host     = config().getString("persistence.host", "localhost");
        var port     = config().getInteger("persistence.port", 3306);
        var database = config().getString("persistence.database", "kalaazu");
        var username = config().getString("persistence.username", "manulaiko");
        var password = config().getString("persistence.password", "");

        log.info("Initializing database...");
        startFuture.complete();

        var db = Database.builder()
                         .host(host)
                         .port(port)
                         .database(database)
                         .username(username)
                         .password(password)
                         .build();

        try {
            db.initialize();
            Database.instance(db);

            log.info("Initializing event listener...");
            var listener = new EventListener();
            listener.initialize();

            log.info("Persistence initialize!");

            startFuture.complete();
        } catch (Exception e) {
            startFuture.fail(e);
        }
    }
}
