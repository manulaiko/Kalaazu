package com.kalaazu.eventsystem;

/**
 * Event manager builder.
 * ======================
 *
 * Builds event managers and initializes them.
 *
 * Usage:
 *
 * ```java
 * EventManagerBuilder builder = new EventManagerBuilder();
 *
 * EventManager manager = builder.logExceptions(true)
 *                               // ...
 *                               .build();
 * ```
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class EventManagerBuilder {
    private boolean logSubscriberExceptions = true;
    private boolean logNoSubscriberMessages = true;
    private boolean sendNoSubscriberEvent;
    private boolean sendSubscriberExceptionEvent;

    /**
     * Initializes the instance and returns it.
     *
     * @return Build instance.
     */
    public EventManager build() {
        return new EventManager(
                this.logSubscriberExceptions,
                this.logNoSubscriberMessages,
                this.sendNoSubscriberEvent,
                this.sendSubscriberExceptionEvent
        );
    }

    //<editor-fold desc="Setters" defaultState="collapsed">
    public EventManagerBuilder setLogSubscriberExceptions(boolean logSubscriberExceptions) {
        this.logSubscriberExceptions = logSubscriberExceptions;

        return this;
    }

    public EventManagerBuilder setLogNoSubscriberMessages(boolean logNoSubscriberMessages) {
        this.logNoSubscriberMessages = logNoSubscriberMessages;

        return this;
    }

    public EventManagerBuilder setSendNoSubscriberEvent(boolean sendNoSubscriberEvent) {
        this.sendNoSubscriberEvent = sendNoSubscriberEvent;

        return this;
    }

    public EventManagerBuilder setSendSubscriberExceptionEvent(boolean sendSubscriberExceptionEvent) {
        this.sendSubscriberExceptionEvent = sendSubscriberExceptionEvent;

        return this;
    }
    //</editor-fold>
}
