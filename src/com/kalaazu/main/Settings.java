package com.kalaazu.main;

import picocli.CommandLine.Option;

/**
 * Settings class.
 * ===============
 *
 * Contains the application's settings.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Settings {
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
}
