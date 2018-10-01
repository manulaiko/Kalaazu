package com.kalaazu.persistence.eventsystem;

import com.kalaazu.persistence.eventsystem.handlers.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Event listener.
 * ===============
 *
 * Registers the event handlers.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class EventListener extends com.kalaazu.eventsystem.EventListener {
    private final String domain = "persistence";

    @Override
    public void initialize() {
        super.addHandler("find", new FindHandler());
        super.addHandler("all", new AllHandler());
        super.addHandler("create", new CreateHandler());
        super.addHandler("update", new UpdateHandler());
        super.addHandler("delete", new DeleteHandler());
        super.addHandler("register", new RegisterHandler());
        super.addHandler("create_account", new CreateAccountHandler());
    }
}
