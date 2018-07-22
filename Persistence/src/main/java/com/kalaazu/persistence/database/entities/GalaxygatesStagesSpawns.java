package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.galaxygates_stages_spawns.generated.GeneratedGalaxygatesStagesSpawns;

/**
 * Galaxygates' spawns to stages table.
 * ====================================
 *
 * Maps the spawns with their stages.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface GalaxygatesStagesSpawns extends GeneratedGalaxygatesStagesSpawns, Entity<Integer> {
    /**
     * Returns the stage.
     *
     * @return The stage.
     */
    GalaxygatesStages stage();

    /**
     * Returns the spawn.
     *
     * @return The spawn.
     */
    GalaxygatesSpawns spawn();
}