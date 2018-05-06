package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.galaxygates_stages.generated.GeneratedGalaxygatesStages;

import java.util.List;

/**
 * Galaxygates' stages table.
 * ==========================
 *
 * Contains all stages of a wave.
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