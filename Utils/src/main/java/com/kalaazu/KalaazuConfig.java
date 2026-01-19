package com.kalaazu;

import com.kalaazu.model.Version;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * Represents the main application configuration, loaded from properties files.
 *
 * This class is a Spring component that uses `@ConfigurationProperties` to map
 * all properties prefixed with `app` (e.g., in `application.yml`) into a
 * type-safe, hierarchical object. It provides easy access to all server
 * settings, including game logic, network ports, and startup behavior.
 *
 * @author manulaiko
 * @example ```java
 * // In a Spring service or component
 * @Service public class MyService {
 *
 * private final KalaazuConfig config;
 * @Autowired public MyService(KalaazuConfig config) {
 * this.config = config;
 * }
 *
 * public void someMethod() {
 * int tickRate = config.getGame().getTickRate();
 * System.out.println("Game tick rate is: " + tickRate);
 *
 * if (config.isAutoStart()) {
 * System.out.println("Server is configured to auto-start.");
 * }
 * }
 * }
 * ```
 * @see org.springframework.boot.context.properties.ConfigurationProperties
 * @see org.springframework.stereotype.Component
 */
@Component
@ConfigurationProperties("app")
@Data
public class KalaazuConfig {
    private boolean autoStart;
    private GameConfig game;
    private Port port;
    private DatabaseConfig database;

    /**
     * Holds all game-specific configuration properties.
     *
     * This nested class encapsulates settings directly related to the game simulation,
     * such as the client version, packet logging flags, entity render distance,
     * and the frequency of the game loop (tick rate).
     *
     * @author manulaiko
     */
    @Data
    public static class GameConfig {
        private Version version;
        private Packets packets;

        private int renderDistance;
        private int tickRate;

        /**
         * Configuration for logging network packets.
         *
         * This class provides flags to enable or disable the printing of incoming
         * and outgoing game packets to the console, which is useful for debugging
         * client-server communication.
         *
         * @author manulaiko
         */
        @Data
        public static class Packets {
            private boolean printOut;
            private boolean printIn;
        }
    }

    /**
     * Defines the network ports for various server components.
     *
     * This class holds the port numbers for the main game server, the Flash
     * policy server (required for Flash clients to connect), and the chat server.
     *
     * @author manulaiko
     */
    @Data
    public static class Port {
        private int server;
        private int chat;
        private int cms;
        private int policy;
    }

    /**
     * Database initialization configuration.
     *
     * Controls how the database schema and data are managed on startup.
     * When enabled, this bypasses JPA's auto-DDL in favor of explicit SQL scripts.
     */
    @Data
    public static class DatabaseConfig {
        /**
         * When true, drops all tables and recreates the schema from SQL scripts on startup.
         */
        private boolean wipe = false;

        /**
         * When true, seeds the database with initial data after schema creation.
         */
        private boolean seed = false;

        /**
         * When true, runs the SQL initialization scripts (structure + relations).
         * This is automatically enabled when wipe is true.
         */
        private boolean initialize = false;

        /**
         * Path to the database scripts directory.
         * Defaults to "Persistence/database" relative to working directory.
         */
        private String scriptsPath = "Persistence/database";
    }
}
