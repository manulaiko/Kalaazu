package com.kalaazu.main;

import picocli.CommandLine.Option;

import java.util.Arrays;
import java.util.List;

/**
 * Settings class.
 * ===============
 *
 * Contains the application's settings.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@SuppressWarnings("SpellCheckingInspection")
public class Settings {
    @Option(
            names = {"logLevel", "ll"},
            description = "The log level output (ERROR, WARNING, INFO, DEBUG, TRACE)."
    )
    public String logLevel = "DEBUG";

    ///////////////////////////
    // Event system settings //
    ///////////////////////////
    @Option(
            names = {"eventSystem.logSubscriberExceptions", "es.lse"},
            description = "Logs the exceptions of the subscribers"
    )
    public boolean eventSystem_logSubscriberExceptions = true;

    @Option(
            names = {"eventSystem.logNoSubscriberMessages", "es.lnsm"},
            description = "Logs the events with no subscribers."
    )
    public boolean eventSystem_logNoSubscriberMessages = true;

    @Option(
            names = {"eventSystem.sendNoSubscriberEvent", "es.snse"},
            description = "Fires an event when an even has no subscriber."
    )
    public boolean eventSystem_sendNoSubscriberEvent;

    @Option(
            names = {"eventSystem.sendSubscriberExceptionEvent", "es.ssee"},
            description = "Fires an event when a subscriber encounters an exception."
    )
    public boolean eventSystem_sendSubscriberExceptionEvent;

    //////////////////////////
    // Persistence settings //
    //////////////////////////
    @Option(
            names = {"persistence.password", "p.p"},
            description = "The user password of the database server."
    )
    public String persistence_password = "";

    @Option(
            names = {"persistence.username", "p.u"},
            description = "The username of the database server."
    )
    public String persistence_username = "manulaiko";

    @Option(
            names = {"persistence.database", "p.d"},
            description = "The database name."
    )
    public String persistence_database = "kalaazu";

    @Option(
            names = {"persistence.port", "p.port"},
            description = "Database server port."
    )
    public int persistence_port = 3306;

    @Option(
            names = {"persistence.host", "p.h"},
            description = "Database server host."
    )
    public String persistence_host = "localhost";

    @Option(
            names = {"persistence.logTypes", "p.lt"},
            description = "Events to print to the console."
    )
    public List<String> persistence_logTypes = Arrays.asList(
            "APPLICATION_BUILDER", "CONNECTION", "PERSIST", "REMOVE",
            "STREAM", "STREAM_OPTIMIZER", "TRANSACTION", "UPDATE"
    );
}
