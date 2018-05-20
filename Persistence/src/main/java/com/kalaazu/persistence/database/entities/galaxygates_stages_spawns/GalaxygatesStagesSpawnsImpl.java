package com.kalaazu.persistence.database.entities.galaxygates_stages_spawns;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.GalaxygatesSpawns;
import com.kalaazu.persistence.database.entities.GalaxygatesStages;
import com.kalaazu.persistence.database.entities.GalaxygatesStagesSpawns;
import com.kalaazu.persistence.database.entities.galaxygates_stages_spawns.generated.GeneratedGalaxygatesStagesSpawnsImpl;

/**
 * The default implementation of the {@link
 * GalaxygatesStagesSpawns}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class GalaxygatesStagesSpawnsImpl
        extends GeneratedGalaxygatesStagesSpawnsImpl
        implements GalaxygatesStagesSpawns {
    /**
     * The stage.
     */
    private GalaxygatesStages stage;

    /**
     * The spawn.
     */
    private GalaxygatesSpawns spawn;

    @Override
    public GalaxygatesStages getStage() {
        if (this.stage != null) {
            return this.stage;
        }

        this.stage = super.findGalaxygatesStagesId(
                Database.getInstance()
                        .getDb()
                        .manager(GalaxygatesStages.class)
        );

        return this.stage;
    }

    @Override
    public GalaxygatesSpawns getSpawn() {
        if (this.spawn != null) {
            return this.spawn;
        }

        this.spawn = super.findGalaxygatesSpawnsId(
                Database.getInstance()
                        .getDb()
                        .manager(GalaxygatesSpawns.class)
        );

        return this.spawn;
    }
}