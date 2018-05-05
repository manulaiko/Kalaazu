package com.kalaazu.eventsystem;

import static org.junit.jupiter.api.Assertions.*;

class EventManagerTest {
    @org.junit.jupiter.api.Test
    void publish() {
        TestEvent event = new TestEvent("test");
        EventManager manager = new EventManagerBuilder().build();

        manager.subscribe(new TestListener());

        manager.publish(event);
    }

    @org.junit.jupiter.api.Test
    void subscribe() {
        EventManager manager = new EventManagerBuilder().build();
        manager.subscribe(new TestListener());
    }

    @org.junit.jupiter.api.Test
    void unsubscribe() {
        TestListener listener = new TestListener();
        EventManager manager  = new EventManagerBuilder().build();

        manager.subscribe(listener);
        manager.unsubscribe(listener);
    }

    @org.junit.jupiter.api.Test
    void builder() {
        EventManager manager = new EventManagerBuilder().setLogNoSubscriberMessages(true)
                                                        .setLogSubscriberExceptions(true)
                                                        .setSendNoSubscriberEvent(true)
                                                        .setSendSubscriberExceptionEvent(true)
                                                        .build();

        assertNotNull(manager);
    }
}