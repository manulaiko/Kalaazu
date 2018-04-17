package com.manulaiko.kalaazu.eventsystem;

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
    /**
     * Building instance.
     */
    private EventManager _instance = new EventManager();

    /**
     * Initializes the instance and returns it.
     *
     * @return Build instance.
     */
    public EventManager build() {
        this._instance.initialize();

        return this._instance;
    }

    //<editor-fold desc="Setters" defaultState="collapsed">
    public EventManagerBuilder setLogSubscriberExceptions(boolean logSubscriberExceptions) {
        this._instance.setLogSubscriberExceptions(logSubscriberExceptions);

        return this;
    }

    public EventManagerBuilder setLogNoSubscriberMessages(boolean logNoSubscriberMessages) {
        this._instance.setLogNoSubscriberMessages(logNoSubscriberMessages);

        return this;
    }

    public EventManagerBuilder setSendNoSubscriberEvent(boolean sendNoSubscriberEvent) {
        this._instance.setSendNoSubscriberEvent(sendNoSubscriberEvent);

        return this;
    }

    public EventManagerBuilder setSendSubscriberExceptionEvent(boolean sendSubscriberExceptionEvent) {
        this._instance.setSendSubscriberExceptionEvent(sendSubscriberExceptionEvent);

        return this;
    }
    //</editor-fold>
}
