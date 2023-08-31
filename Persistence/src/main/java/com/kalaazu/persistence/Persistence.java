package com.kalaazu.persistence;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;

/**
 * Persistence class.
 * ==================
 * <p>
 * Initializes and connects to the database.
 * <p>
 * Use the events under the domain `persistence` to communicate
 * with the database and perform certain actions.
 * <p>
 * See `com.kalaazu.persistence.eventsystem.EventListener` for a list
 * of the available events.
 * <p>
 * Example:
 * <p>
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
@Controller
public class Persistence {
}
