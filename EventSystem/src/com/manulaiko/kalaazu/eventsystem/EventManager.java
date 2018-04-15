package com.manulaiko.kalaazu.eventsystem;

import lombok.Builder;
import lombok.NonNull;
import org.greenrobot.eventbus.EventBus;

/**
 * Event manager.
 * ==============
 *
 * Provides a facade to easily use the module.
 *
 * To instantiate the class you need to use the builder class:
 *
 * ```java
 * EventManager manager = EventManager.builder()
 *                                    .logExceptions(true)
 *                                    //...
 *                                    .build();
 * manager.initialize();
 * ```
 *
 * A list of the possible build options is available at
 * [EventBusBuilder documentation](http://greenrobot.org/files/eventbus/javadoc/3.0/org/greenrobot/eventbus/EventBusBuilder.html)
 *
 * After that, you can subscribe event listeners with
 * the `EventManager.subscribe(listener)` method, to unsubscribe
 * a listener use the `EventManager.unsubscribe(listener)` method.
 *
 * In order to publish an event, call the `EventManager.publish(event)`
 * method which will send the event through all listeners.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class EventManager {
    ////////////////////////////////
    // Start configuration values //
    ////////////////////////////////

    private boolean logSubscriberExceptions;
    private boolean logNoSubscriberMessages;
    private boolean sendNoSubscriberEvent;
    private boolean sendSubscriberExceptionEvent;

    //////////////////////////////
    // End configuration values //
    //////////////////////////////

    /**
     * Event bus.
     *
     * The bus on which listeners will be registered
     * and events will be published.
     */
    private EventBus bus;

    /**
     * Constructor.
     *
     * @param logSubscriberExceptions      Log exceptions produced in the subscribers.
     * @param logNoSubscriberMessages      Log messages when an event has no subscriber.
     * @param sendNoSubscriberEvent        Send event when an event has no subscriber.
     * @param sendSubscriberExceptionEvent Send event when an exception occurs.
     */
    @Builder
    public EventManager(
            boolean logSubscriberExceptions,boolean logNoSubscriberMessages,
            boolean sendNoSubscriberEvent, boolean sendSubscriberExceptionEvent
    ) {
        this.logSubscriberExceptions      = logSubscriberExceptions;
        this.logNoSubscriberMessages      = logNoSubscriberMessages;
        this.sendNoSubscriberEvent        = sendNoSubscriberEvent;
        this.sendSubscriberExceptionEvent = sendSubscriberExceptionEvent;
    }

    /**
     * Initializes the event manager.
     *
     * It will build the default event bus.
     */
    public void initialize() {
        // Don't install the bus in order to force the use of this facade.
        this.bus = EventBus.builder()
                           .logNoSubscriberMessages(this.logNoSubscriberMessages)
                           .logSubscriberExceptions(this.logSubscriberExceptions)
                           .sendNoSubscriberEvent(this.sendNoSubscriberEvent)
                           .sendSubscriberExceptionEvent(this.sendSubscriberExceptionEvent)
                           .build();
    }

    /**
     * Publishes an event in the bus.
     *
     * @param event Event to publish.
     */
    public void publish(@NonNull Event event) {
        this.bus.post(event);
    }

    /**
     * Subscribes a listener to the bus.
     *
     * @param listener Listener to subscribe.
     */
    public void subscribe(@NonNull EventListener listener) {
        listener.manager(this);
        this.bus.register(listener);
    }

    /**
     * Unsubscribes an event from the bus.
     *
     * @param listener Listener to unsubscribe.
     */
    public void unsubscribe(@NonNull EventListener listener) {
        listener.manager(this);
        this.bus.unregister(listener);
    }
}
