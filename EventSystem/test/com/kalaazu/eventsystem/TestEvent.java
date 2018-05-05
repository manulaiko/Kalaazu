package com.kalaazu.eventsystem;

/**
 * Test event.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class TestEvent implements Event {
    private String message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public TestEvent(String message) {

        this.message = message;
    }
}
