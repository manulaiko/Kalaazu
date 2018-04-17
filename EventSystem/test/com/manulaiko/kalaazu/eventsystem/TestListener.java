package com.manulaiko.kalaazu.eventsystem;

/**
 * Test listener.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class TestListener extends EventListener {
    /**
     * Initializes the event handlers.
     */
    @Override
    public void initialize() {
        Handler<TestEvent> handler = e -> System.out.println(e.getMessage());
        this.addHandler(TestEvent.class, handler);
    }
}
