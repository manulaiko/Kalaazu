package com.kalaazu.persistence.eventsystem.events;

import com.kalaazu.persistence.database.entities.Entity;

/**
 * Update event.
 * =============
 *
 * Updates an entity in the database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class UpdateEvent extends CRUDEvent {
    public UpdateEvent(Entity entity) {
        super(entity);
    }
}
