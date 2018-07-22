package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.galaxygates_spins.generated.GeneratedGalaxygatesSpins;

/**
 * Galaxygates' spins table.
 * =========================
 *
 * Contains the spin results of each galaxygate.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface GalaxygatesSpins extends GeneratedGalaxygatesSpins, Entity<Byte> {
    /**
     * Returns the item.
     *
     * @return The item.
     */
    Items item();
}