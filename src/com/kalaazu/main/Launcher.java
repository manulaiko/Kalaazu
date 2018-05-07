package com.kalaazu.main;

import com.kalaazu.eventsystem.EventManager;
import com.kalaazu.eventsystem.EventManagerBuilder;
import com.kalaazu.persistence.Persistence;
import com.kalaazu.persistence.PersistenceBuilder;
import com.kalaazu.persistence.database.entities.Items;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import picocli.CommandLine;

/**
 * Launcher class.
 * ===============
 *
 * The starting point of the application.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Launcher {
    /**
     * Console logger.
     */
    public static Logger logger;

    /**
     * Application settings.
     */
    public static final Settings settings = new Settings();

    /**
     * The event manager.
     */
    private static EventManager eventManager;

    /**
     * The persistence.
     */
    private static Persistence persistence;

    /**
     * Main method.
     *
     * @param args Command line arguments.
     */
    public static void main(String[] args) {
        CommandLine.populateCommand(Launcher.settings, args);

        Launcher.setLogger();

        Launcher.logger.info("Starting event manager...");
        Launcher.startEventManager();
        Launcher.logger.debug("Event manager started!");

        Launcher.logger.info("Starting persistence...");
        Launcher.startPersistence();
        Launcher.logger.debug("Persistence started!");
    }

    /**
     * Configures the loggers.
     */
    public static void setLogger() {
        System.setProperty("org.slf4j.simpleLogger.defaultLogLevel", Launcher.settings.logLevel);
        Launcher.logger  = LoggerFactory.getLogger(Launcher.class);
    }

    /**
     * Starts the event manager.
     */
    public static void startEventManager() {
        var builder = new EventManagerBuilder();

        builder.setLogNoSubscriberMessages(Launcher.settings.eventSystem_logNoSubscriberMessages)
               .setLogSubscriberExceptions(Launcher.settings.eventSystem_logSubscriberExceptions)
               .setSendNoSubscriberEvent(Launcher.settings.eventSystem_sendNoSubscriberEvent)
               .setSendSubscriberExceptionEvent(Launcher.settings.eventSystem_sendSubscriberExceptionEvent);

        Launcher.eventManager = builder.build();
    }

    /**
     * Starts the persistence.
     */
    public static void startPersistence() {
        var builder = new PersistenceBuilder();

        builder.setEventManager(Launcher.eventManager)
               .setHost(Launcher.settings.persistence_host)
               .setPort(Launcher.settings.persistence_port)
               .setDatabase(Launcher.settings.persistence_database)
               .setUsername(Launcher.settings.persistence_username)
               .setPassword(Launcher.settings.persistence_password);

        Launcher.settings.persistence_logTypes.forEach(builder::addLogType);

        Launcher.persistence = builder.build();
    }
}
