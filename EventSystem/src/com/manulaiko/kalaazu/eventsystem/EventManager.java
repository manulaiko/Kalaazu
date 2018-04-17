package com.manulaiko.kalaazu.eventsystem;

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
 * EventManagerBuilder builder = new EventManagerBuilder();
 *
 * EventManager manager = builder.logExceptions(true)
 *                               // ...
 *                               .build();
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
    public EventManager(
            boolean logSubscriberExceptions,boolean logNoSubscriberMessages,
            boolean sendNoSubscriberEvent, boolean sendSubscriberExceptionEvent
    ) {
        this.bus = EventBus.builder()
                           .logNoSubscriberMessages(logNoSubscriberMessages)
                           .logSubscriberExceptions(logSubscriberExceptions)
                           .sendNoSubscriberEvent(sendNoSubscriberEvent)
                           .sendSubscriberExceptionEvent(sendSubscriberExceptionEvent)
                           .build();
    }

    /**
     * Publishes an event in the bus.
     *
     * @param event Event to publish.
     */
    public void publish(Object event) {
        this.bus.post(event);
    }

    /**
     * Subscribes a listener to the bus.
     *
     * @param listener Listener to subscribe.
     */
    public void subscribe(EventListener listener) {
        listener.initialize();

        this.bus.register(listener);
    }

    /**
     * Unsubscribes an event from the bus.
     *
     * @param listener Listener to unsubscribe.
     */
    public void unsubscribe(EventListener listener) {
        this.bus.unregister(listener);
    }
}
