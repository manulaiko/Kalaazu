package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.galaxygates_spins.generated.GeneratedGalaxygatesSpins;

/**
 * The main interface for entities of the {@code galaxygates_spins}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface GalaxygatesSpins extends GeneratedGalaxygatesSpins, Entity<Byte> {
    /**
     * Returns the item.
     *
     * @return The item.
     */
    Items getItem();
}