package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.factions.generated.GeneratedFactions;

/**
 * Factions table.
 * ===============
 *
 * Contains all the factions of the server.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Factions extends GeneratedFactions, Entity<Byte> {
    /**
     * Returns the home low map.
     *
     * @return Low map.
     */
    Maps lowMap();

    /**
     * Returns the home high map.
     *
     * @return High map.
     */
    Maps highMap();
}