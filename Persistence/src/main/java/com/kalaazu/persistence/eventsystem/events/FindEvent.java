package com.kalaazu.persistence.eventsystem.events;

import com.kalaazu.eventsystem.Event;
import com.kalaazu.persistence.database.entities.Entity;

/**
 * Find event.
 * ===========
 *
 * Finds something in the database.
 *
 * Example:
 *
 * ```
 * var event = new FireEvent(Accounts.class, 1);
 * ```
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class FindEvent implements Event {
    /**
     * The entity type.
     */
    private Class<? extends Entity> entity;

    /**
     * The ID of the entity.
     */
    private int id;

    public FindEvent(Class<? extends Entity> entity, int id) {
        this.entity = entity;
        this.id = id;
    }

    public Class<? extends Entity> getEntity() {
        return entity;
    }

    public FindEvent setEntity(Class<? extends Entity> entity) {
        this.entity = entity;

        return this;
    }

    public int getId() {
        return id;
    }

    public FindEvent setId(int id) {
        this.id = id;

        return this;
    }
}
