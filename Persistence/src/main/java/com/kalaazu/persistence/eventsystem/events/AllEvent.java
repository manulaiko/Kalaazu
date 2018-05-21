package com.kalaazu.persistence.eventsystem.events;

import com.kalaazu.eventsystem.Event;
import com.kalaazu.persistence.database.entities.Entity;

/**
 * All event.
 * ==========
 *
 * Finds and returns all entities from a table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class AllEvent implements Event {
    /**
     * Entity entity.
     */
    private Class<? extends Entity> entity;

    public AllEvent(Class<? extends Entity> type) {
        this.entity = type;
    }

    public Class<? extends Entity> getEntity() {
        return entity;
    }

    public void setEntity(Class<? extends Entity> entity) {
        this.entity = entity;
    }
}
