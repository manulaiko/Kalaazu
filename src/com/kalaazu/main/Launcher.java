package com.kalaazu.main;

import com.kalaazu.eventsystem.EventManager;
import com.kalaazu.eventsystem.EventManagerBuilder;
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
     * Application settings.
     */
    public static final Settings settings = new Settings();

    /**
     * The event manager.
     */
    private static EventManager eventManager;

    /**
     * Main method.
     *
     * @param args Command line arguments.
     */
    public static void main(String[] args) {
        CommandLine.populateCommand(Launcher.settings, args);

        Launcher.startEventManager();
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
}
