package com.kalaazu.persistence.eventsystem.events;

import com.kalaazu.persistence.database.entities.Entity;

/**
 * Delete event.
 * =============
 *
 * Deletes an entity from the database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class DeleteEvent extends CRUDEvent {
    public DeleteEvent(Entity entity) {
        super(entity);
    }
}
