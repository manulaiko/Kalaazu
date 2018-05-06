package com.kalaazu.persistence.database.entities;

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
        return this.stream()
                   .filter(a -> {
                       var i = a.getId();
                       int j = 0;

                       if (i instanceof Byte) {
                           j = ((Byte)i).intValue();
                       }
                       if (i instanceof Short) {
                           j = ((Short)i).intValue();
                       }
                       if (i instanceof Integer) {
                           j = (Integer) i;
                       }

                       return id == j;
                   })
                   .findFirst();
    }
}
