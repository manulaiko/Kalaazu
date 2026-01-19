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
 * Service for initializing the database schema from SQL scripts.
 * Reads structure.sql and relations.sql files from each table directory.
 */
@Service
@RequiredArgsConstructor
public class DatabaseInitializer implements Logger {
    @Getter
    private final LoggingCategory category = LoggingCategory.PERSISTENCE;

    private final JdbcTemplate jdbcTemplate;

    /**
     * Initializes the database schema by running all structure.sql and relations.sql files.
     *
     * @param scriptsPath Path to the database scripts directory
     */
    @Transactional
    public void initialize(String scriptsPath) {
        var basePath = Path.of(scriptsPath);

        if (!Files.exists(basePath)) {
            error("Database scripts path does not exist: " + basePath.toAbsolutePath());
            throw new IllegalStateException("Database scripts path not found: " + scriptsPath);
        }

        info("Initializing database from scripts in: " + basePath.toAbsolutePath());

        var tableDirs = getTableDirectories(basePath);
        info("Found " + tableDirs.size() + " table directories");

        runStructureScripts(tableDirs);
        runRelationsScripts(tableDirs);

        info("Database initialization completed successfully");
    }

    /**
     * Runs all structure.sql scripts to create tables.
     */
    private void runStructureScripts(List<Path> tableDirs) {
        info("Running structure scripts...");
        var count = 0;

        for (var dir : tableDirs) {
            var structureFile = dir.resolve("structure.sql");
            if (Files.exists(structureFile)) {
                runSqlFile(structureFile);
                count++;
            }
        }

        info("Executed " + count + " structure scripts");
    }

    /**
     * Runs all relations.sql scripts to create foreign keys.
     */
    private void runRelationsScripts(List<Path> tableDirs) {
        info("Running relations scripts...");
        var count = 0;

        for (var dir : tableDirs) {
            var relationsFile = dir.resolve("relations.sql");
            if (Files.exists(relationsFile)) {
                runSqlFile(relationsFile);
                count++;
            }
        }

        info("Executed " + count + " relations scripts");
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
     */
    private void runSqlFile(Path sqlFile) {
        try {
            var sql = Files.readString(sqlFile);
            if (sql.isBlank()) {
                return;
            }

            var statements = parseSqlStatements(sql);
            for (var statement : statements) {
                if (!statement.isBlank()) {
                    try {
                        jdbcTemplate.execute(statement);
                    } catch (Exception e) {
                        warn("Failed to execute statement from " + sqlFile.getFileName() + ": " + e.getMessage());
                    }
                }
            }
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
