package com.kalaazu.persistence.eventsystem.events;

import com.kalaazu.eventsystem.Event;
import com.kalaazu.persistence.database.entities.Entity;

/**
 * CRUD event.
 * ===========
 *
 * As all CRUD actions needs an entity, this serves as what
 * inheritance was made for, code reuse.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class CRUDEvent implements Event {
    /**
     * The entity.
     */
    private Entity entity;

    public CRUDEvent(Entity entity) {
        this.entity = entity;
    }

    public Entity getEntity() {
        return entity;
    }

    public void setEntity(Entity entity) {
        this.entity = entity;
    }
}
