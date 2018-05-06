package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.galaxygates_waves.generated.GeneratedGalaxygatesWaves;

import java.util.List;

/**
 * The main interface for entities of the {@code galaxygates_waves}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface GalaxygatesWaves extends GeneratedGalaxygatesWaves, Entity<Byte> {
    /**
     * Returns the map.
     *
     * @return The map.
     */
    Maps getMap();

    /**
     * Returns the stages of this wave.
     *
     * @return Spawn stages.
     */
    List<GalaxygatesStages> getStages();
}