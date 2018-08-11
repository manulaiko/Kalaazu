package com.kalaazu.persistence.database.entities;

/**
 * Entity interface.
 * =================
 *
 * Base interface for all entities.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Entity<T> {
    /**
     * Returns the entity ID.
     *
     * @return Entity ID.
     */
    T id();
}
