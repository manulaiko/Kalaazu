package com.kalaazu.persistence.database;

import com.kalaazu.KalaazuConfig;
import com.kalaazu.util.Logger;
import com.kalaazu.util.LoggingCategory;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * Orchestrates database initialization based on configuration.
 * Manages the wipe, initialize, and seed operations in the correct order.
 */
@Service
@RequiredArgsConstructor
public class DatabaseManager implements Logger {
    @Getter
    private final LoggingCategory category = LoggingCategory.PERSISTENCE;

    private final KalaazuConfig config;
    private final DatabaseWiper wiper;
    private final DatabaseInitializer initializer;
    private final DatabaseSeeder seeder;

    /**
     * Runs database initialization based on configuration.
     * Should be called explicitly during application startup, before UI loads.
     */
    public void runStartupInitialization() {
        var dbConfig = config.getDatabase();
        if (dbConfig == null) {
            info("No database configuration found, skipping initialization");
            return;
        }

        var scriptsPath = dbConfig.getScriptsPath();

        if (dbConfig.isWipe()) {
            info("Database wipe flag is enabled");
            wipeAndReinitialize(scriptsPath, dbConfig.isSeed());
        } else if (dbConfig.isInitialize()) {
            info("Database initialize flag is enabled");
            initializeIfEmpty(scriptsPath, dbConfig.isSeed());
        } else if (dbConfig.isSeed()) {
            info("Database seed flag is enabled (without wipe/initialize)");
            seed(scriptsPath);
        } else {
            info("No database initialization flags enabled");
        }
    }

    /**
     * Wipes the database completely and reinitializes from scripts.
     *
     * @param scriptsPath Path to the SQL scripts directory
     * @param seed        Whether to seed data after initialization
     */
    public void wipeAndReinitialize(String scriptsPath, boolean seed) {
        info("=== Starting full database wipe and reinitialization ===");

        wiper.wipe();
        initializer.initialize(scriptsPath);

        if (seed) {
            seeder.seed(scriptsPath);
        }

        info("=== Database wipe and reinitialization complete ===");
    }

    /**
     * Initializes the database only if it's empty (no tables).
     *
     * @param scriptsPath Path to the SQL scripts directory
     * @param seed        Whether to seed data after initialization
     */
    public void initializeIfEmpty(String scriptsPath, boolean seed) {
        if (wiper.hasAnyTables()) {
            info("Database already has tables, skipping initialization");
            return;
        }

        info("=== Starting database initialization ===");

        initializer.initialize(scriptsPath);

        if (seed) {
            seeder.seed(scriptsPath);
        }

        info("=== Database initialization complete ===");
    }

    /**
     * Seeds the database with initial data.
     *
     * @param scriptsPath Path to the SQL scripts directory
     */
    public void seed(String scriptsPath) {
        info("=== Starting database seeding ===");
        seeder.seed(scriptsPath);
        info("=== Database seeding complete ===");
    }

    /**
     * Programmatic method to wipe the database.
     * Can be called from other services if needed.
     */
    public void wipe() {
        wiper.wipe();
    }

    /**
     * Programmatic method to initialize the database.
     * Can be called from other services if needed.
     *
     * @param scriptsPath Path to the SQL scripts directory
     */
    public void initialize(String scriptsPath) {
        initializer.initialize(scriptsPath);
    }
}
