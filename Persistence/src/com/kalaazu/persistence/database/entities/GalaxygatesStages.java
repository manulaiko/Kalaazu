package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.galaxygates_stages.generated.GeneratedGalaxygatesStages;

import java.util.List;

/**
 * The main interface for entities of the {@code galaxygates_stages}-table in
 * the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface GalaxygatesStages extends GeneratedGalaxygatesStages, Entity<Integer> {
    /**
     * Returns the wave.
     *
     * @return The wave.
     */
    GalaxygatesWaves getWave();

    /**
     * Returns the spawns of this stage.
     *
     * @return Npc spawns.
     */
    List<GalaxygatesSpawns> getSpawns();
}