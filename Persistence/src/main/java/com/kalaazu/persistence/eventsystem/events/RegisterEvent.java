package com.kalaazu.persistence.eventsystem.events;

import com.kalaazu.eventsystem.Event;

/**
 * Register event.
 * ===============
 *
 * Fired when the user wants to register.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class RegisterEvent implements Event {
    /**
     * The username to register.
     */
    private String username;

    /**
     * The password.
     */
    private String password;

    public RegisterEvent(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
