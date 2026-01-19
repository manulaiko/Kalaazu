package com.kalaazu.persistence.database;

import com.kalaazu.util.Logger;
import com.kalaazu.util.LoggingCategory;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Service for wiping/dropping all tables from the database.
 * This is useful for resetting the database to a clean state before re-initialization.
 */
@Service
@RequiredArgsConstructor
public class DatabaseWiper implements Logger {
    @Getter
    private final LoggingCategory category = LoggingCategory.PERSISTENCE;

    private final JdbcTemplate jdbcTemplate;

    /**
     * Drops all tables in the database.
     * Disables foreign key checks during the operation to avoid constraint violations.
     */
    @Transactional
    public void wipe() {
        info("Starting database wipe...");

        jdbcTemplate.execute("SET FOREIGN_KEY_CHECKS = 0");

        try {
            var tables = getAllTableNames();
            info("Found " + tables.size() + " tables to drop");

            for (var table : tables) {
                info("Dropping table: " + table);
                jdbcTemplate.execute("DROP TABLE IF EXISTS `" + table + "`");
            }

            info("Database wipe completed successfully");
        } finally {
            jdbcTemplate.execute("SET FOREIGN_KEY_CHECKS = 1");
        }
    }

    /**
     * Gets all table names in the current database.
     *
     * @return List of table names
     */
    public List<String> getAllTableNames() {
        return jdbcTemplate.queryForList("SHOW TABLES", String.class);
    }

    /**
     * Checks if the database has any tables.
     *
     * @return true if at least one table exists
     */
    public boolean hasAnyTables() {
        return !getAllTableNames().isEmpty();
    }
}
