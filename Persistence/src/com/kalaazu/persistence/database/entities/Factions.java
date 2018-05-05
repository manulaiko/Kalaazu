package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.factions.generated.GeneratedFactions;

/**
 * The main interface for entities of the {@code factions}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Factions extends GeneratedFactions, Entity<Byte> {
    /**
     * Returns the home low map.
     *
     * @return Low map.
     */
    Maps getLowMap();

    /**
     * Returns the home high map.
     *
     * @return High map.
     */
    Maps getHighMap();
}