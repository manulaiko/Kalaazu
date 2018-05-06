package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.galaxygates_gg_waves.generated.GeneratedGalaxygatesGgWaves;

/**
 * Galaxygates to waves table.
 * ===========================
 *
 * Maps each wave to their galaxygate.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface GalaxygatesGgWaves extends GeneratedGalaxygatesGgWaves, Entity<Short> {
    /**
     * Returns the galaxygate.
     *
     * @return The galaxygate.
     */
    Galaxygates getGalaxygate();

    /**
     * Returns the wave.
     *
     * @return The wave.
     */
    GalaxygatesWaves getWave();
}