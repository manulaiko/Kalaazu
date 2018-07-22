package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.galaxygates_waves.generated.GeneratedGalaxygatesWaves;

import java.util.List;

/**
 * Galaxygates' waves table.
 * =========================
 *
 * Contains all the waves of the galaxygates.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface GalaxygatesWaves extends GeneratedGalaxygatesWaves, Entity<Byte> {
    /**
     * Returns the map.
     *
     * @return The map.
     */
    Maps map();

    /**
     * Returns the stages of this wave.
     *
     * @return Spawn stages.
     */
    List<GalaxygatesStages> stages();
}