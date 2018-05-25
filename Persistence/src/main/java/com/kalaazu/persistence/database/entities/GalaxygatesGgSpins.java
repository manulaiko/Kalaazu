package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.galaxygates_gg_spins.generated.GeneratedGalaxygatesGgSpins;

/**
 * Galaxygates to spins table.
 * ===========================
 *
 * Maps each spin to their galaxygate.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface GalaxygatesGgSpins extends GeneratedGalaxygatesGgSpins, Entity<Short> {
    /**
     * Returns the galaxygate.
     *
     * @return The galaxygate.
     */
    Galaxygates getGalaxygate();

    /**
     * Returns the spin.
     *
     * @return The spin.
     */
    GalaxygatesSpins getSpin();
}