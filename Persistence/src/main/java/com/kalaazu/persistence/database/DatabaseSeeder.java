package com.kalaazu.persistence.database;

import com.kalaazu.util.Logger;
import com.kalaazu.util.LoggingCategory;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

/**
 * Service for seeding the database with initial data from dump.sql files.
 */
@Service
@RequiredArgsConstructor
public class DatabaseSeeder implements Logger {
    @Getter
    private final LoggingCategory category = LoggingCategory.PERSISTENCE;

    private final JdbcTemplate jdbcTemplate;

    /**
     * Seeds the database with initial data from all dump.sql files.
     *
     * @param scriptsPath Path to the database scripts directory
     */
    @Transactional
    public void seed(String scriptsPath) {
        var basePath = Path.of(scriptsPath);

        if (!Files.exists(basePath)) {
            error("Database scripts path does not exist: " + basePath.toAbsolutePath());
            throw new IllegalStateException("Database scripts path not found: " + scriptsPath);
        }

        info("Seeding database from scripts in: " + basePath.toAbsolutePath());

        var tableDirs = getTableDirectories(basePath);
        info("Found " + tableDirs.size() + " table directories");

        jdbcTemplate.execute("SET FOREIGN_KEY_CHECKS = 0");

        try {
            runDumpScripts(tableDirs);
        } finally {
            jdbcTemplate.execute("SET FOREIGN_KEY_CHECKS = 1");
        }

        info("Database seeding completed successfully");
    }

    /**
     * Runs all dump.sql scripts to insert initial data.
     */
    private void runDumpScripts(List<Path> tableDirs) {
        info("Running dump scripts...");
        var count = 0;
        var insertCount = 0;

        for (var dir : tableDirs) {
            var dumpFile = dir.resolve("dump.sql");
            if (Files.exists(dumpFile)) {
                insertCount += runSqlFile(dumpFile);
                count++;
            }
        }

        info("Executed " + count + " dump scripts with " + insertCount + " insert statements");
    }

    /**
     * Gets all table directories from the scripts path.
     */
    private List<Path> getTableDirectories(Path basePath) {
        var dirs = new ArrayList<Path>();

        try (Stream<Path> stream = Files.list(basePath)) {
            stream.filter(Files::isDirectory)
                    .sorted()
                    .forEach(dirs::add);
        } catch (IOException e) {
            error("Failed to list table directories", e);
            throw new RuntimeException("Failed to list table directories", e);
        }

        return dirs;
    }

    /**
     * Executes a SQL file against the database.
     *
     * @return Number of statements executed
     */
    private int runSqlFile(Path sqlFile) {
        try {
            var sql = Files.readString(sqlFile);
            if (sql.isBlank()) {
                return 0;
            }

            var statements = parseSqlStatements(sql);
            var executed = 0;

            for (var statement : statements) {
                if (!statement.isBlank()) {
                    try {
                        jdbcTemplate.execute(statement);
                        executed++;
                    } catch (Exception e) {
                        warn("Failed to execute statement from " + sqlFile.getFileName() + ": " + e.getMessage());
                    }
                }
            }

            return executed;
        } catch (IOException e) {
            error("Failed to read SQL file: " + sqlFile, e);
            throw new RuntimeException("Failed to read SQL file: " + sqlFile, e);
        }
    }

    /**
     * Parses SQL content into individual statements.
     * Handles comments and statement delimiters.
     */
    private List<String> parseSqlStatements(String sql) {
        var statements = new ArrayList<String>();
        var lines = sql.lines().toList();
        var currentStatement = new StringBuilder();

        for (var line : lines) {
            var trimmed = line.trim();

            if (trimmed.isEmpty() || trimmed.startsWith("--")) {
                continue;
            }

            currentStatement.append(line).append("\n");

            if (trimmed.endsWith(";")) {
                var statement = currentStatement.toString().trim();
                if (!statement.isEmpty()) {
                    statements.add(statement.substring(0, statement.length() - 1));
                }
                currentStatement = new StringBuilder();
            }
        }

        var remaining = currentStatement.toString().trim();
        if (!remaining.isEmpty()) {
            statements.add(remaining);
        }

        return statements;
    }
}
