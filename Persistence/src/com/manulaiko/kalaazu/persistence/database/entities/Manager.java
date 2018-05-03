package com.manulaiko.kalaazu.persistence.database.entities;

import java.util.Optional;

/**
 * Entity interface.
 * =================
 *
 * Base interface for all entities.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Manager<T extends Entity> extends com.speedment.runtime.core.manager.Manager<T> {
    /**
     * Returns the entity ID.
     *
     * @return Entity ID.
     */
    default Optional<T> byId(int id) {
        return this.stream().filter(a -> (int)a.getId() == id).findFirst();
    }
}
