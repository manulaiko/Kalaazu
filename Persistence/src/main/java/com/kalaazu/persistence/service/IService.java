package com.kalaazu.persistence.service;

import java.util.List;

/**
 * Service interface.
 * ==================
 *
 * Base interface for all services.
 *
 * @param <T> Entry type.
 * @param <P> Primary Key type.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface IService<T, P> {
    /**
     * Creates an entry in the table.
     *
     * @param entity Entry to create.
     *
     * @return Whether the entry was created or not.
     */
    T create(T entity);

    /**
     * Retrieves an entry from the table.
     *
     * @param id Entry primary key.
     *
     * @return The entry from the table.
     */
    T find(P id);

    /**
     * Retrieves all entries from the table.
     *
     * @return All entries from the table.
     */
    List<T> findAll();

    /**
     * Updates an entry in the table.
     *
     * @param entity Entry to update.
     *
     * @return Whether the entry was update or not.
     */
    T update(T entity);

    /**
     * Deletes an entry from the table.
     *
     * @param id Entity primary key.
     */
    boolean delete(P id);
}