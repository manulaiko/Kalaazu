package com.kalaazu.persistence.eventsystem.events;

import com.kalaazu.persistence.database.entities.Entity;

/**
 * Create event.
 * =============
 *
 * Saves an entity in the database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class CreateEvent extends CRUDEvent {
    public CreateEvent(Entity entity) {
        super(entity);
    }
}
