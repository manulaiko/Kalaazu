package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.galaxygates_stages_spawns.generated.GeneratedGalaxygatesStagesSpawns;

/**
 * The main interface for entities of the {@code
 * galaxygates_stages_spawns}-table in the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface GalaxygatesStagesSpawns extends GeneratedGalaxygatesStagesSpawns, Entity<Integer> {
    /**
     * Returns the stage.
     *
     * @return The stage.
     */
    GalaxygatesStages getStage();

    /**
     * Returns the spawn.
     *
     * @return The spawn.
     */
    GalaxygatesSpawns getSpawn();
}