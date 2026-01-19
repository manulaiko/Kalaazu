package com.kalaazu.util;

/**
 * Defines distinct categories for logging across the application, allowing for
 * organized and filterable log output. Each category represents a specific
 * functional area of the server, such as networking, database interactions,
 * or game logic. This helps in debugging and monitoring by providing context
 * to log messages.
 *
 * @example
 * ```java
 * // In a class that implements the Logger interface
 * public class MyService implements Logger {
 *
 *     @Getter
 *     private final LoggingCategory category = LoggingCategory.SERVER;
 *
 *     public void start() {
 *         info("Starting the service...");
 *     }
 * }
 * ```
 *
 * @see com.kalaazu.util.Logger
 *
 * @author manulaiko
 */
public enum LoggingCategory {
    SERVER,
    NETWORK,
    UI,
    CMS,
    DATABASE,
    USER,
    MAP,
    SECURITY,
    AUTH,
    PAYMENT,
    CONFIG,
    SCHEDULER,
    GAME_LOOP,
    CACHE,
    PERSISTENCE
}
